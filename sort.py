import os
import json
import subprocess
import time
from flask import Flask, request, jsonify, send_from_directory, session

app = Flask(__name__)
app.secret_key = "mustelid_selector_secret"

DATA_DIR = "data"
os.makedirs(DATA_DIR, exist_ok=True)

USERS_FILE = os.path.join(DATA_DIR, "users.json")
COMPARISONS_LOG = os.path.join(DATA_DIR, "comparisons_log.txt")
PROBLEMS_FILE = os.path.join(DATA_DIR, "problems.json")
DASHBOARD_FILE = os.path.join(DATA_DIR, "dashboard.txt")

REMOTE_BASE_URL = "https://doggies-galore.github.io/Mustelids"

# Initialize data files
if not os.path.exists(USERS_FILE):
    with open(USERS_FILE, "w") as f: json.dump({}, f)

if not os.path.exists(PROBLEMS_FILE):
    with open(PROBLEMS_FILE, "w") as f: json.dump([], f)

MUSTELIDS_DIR = "Mustelids"

def get_global_completed():
    with open(USERS_FILE, "r") as f:
        users = json.load(f)
    counts = {}
    for user in users.values():
        for cat in user.get("completed", []):
            counts[cat] = counts.get(cat, 0) + 1
    # Lock as soon as ONE user finishes a section, and always lock Size (it's auto-calculated)
    completed = [cat for cat, count in counts.items() if count >= 1]
    if "size" not in completed: completed.append("size")
    return completed

def send_notification(title, message):
    try: subprocess.run(["osascript", "-e", f'display notification "{message}" with title "{title}"'], check=True)
    except: pass

def get_mustelid_list():
    mustelids = []
    if not os.path.exists(MUSTELIDS_DIR): return []
    dirs = sorted([d for d in os.listdir(MUSTELIDS_DIR) if os.path.isdir(os.path.join(MUSTELIDS_DIR, d)) and d != "Mustelid Images"])
    for d in dirs:
        facts_path = os.path.join(MUSTELIDS_DIR, d, "facts.json")
        if os.path.exists(facts_path):
            try:
                with open(facts_path, "r") as f:
                    data = json.load(f)
                    local_asset = os.path.join(MUSTELIDS_DIR, d, "assets", "photo.webp")
                    if os.path.exists(local_asset) and not os.path.exists(os.path.join(MUSTELIDS_DIR, d, ".remote")):
                        img_url = f"/Mustelids/{d}/assets/photo.webp"
                    else:
                        img_url = f"{REMOTE_BASE_URL}/{d}/assets/photo.webp"
                    m = {
                        "id": d,
                        "name": data.get("common_name", d),
                        "scientific_name": data.get("scientific_name", ""),
                        "image": img_url
                    }
                    # Include extra fields for UI
                    m.update({k: v for k, v in data.items() if k not in m})
                    mustelids.append(m)
            except: continue
    return mustelids

def calculate_stats():
    categories = ["noodle", "size", "biome", "sillay", "snoot"]
    stats = {cat: {} for cat in categories}
    files = [f for f in os.listdir(DATA_DIR) if f.startswith("final_") and f.endswith(".json")]
    for f in files:
        parts = f.replace("final_", "").replace(".json", "").split("_")
        if len(parts) < 2: continue
        cat = parts[-1]
        if cat not in stats: continue
        with open(os.path.join(DATA_DIR, f), "r") as r_file:
            ranking = json.load(r_file)
            n = len(ranking)
            for i, m_id in enumerate(ranking):
                val = 1 + (i * (4 / (n - 1))) if n > 1 else 3.0
                if m_id not in stats[cat]: stats[cat][m_id] = []
                stats[cat][m_id].append(val)
    final_stats = {}
    for cat in stats:
        final_stats[cat] = {}
        for m_id, vals in stats[cat].items():
            final_stats[cat][m_id] = round(sum(vals) / len(vals), 2)
    return final_stats

def update_dashboard_file():
    output = []
    output.append("="*80)
    output.append(" 🦦 MUSTELID SORTER 2000 - LIVE DASHBOARD 🦦")
    output.append("="*80)
    try:
        with open(USERS_FILE, "r") as f: users = json.load(f)
        output.append(f"{'User':<15} | {'Progress':<60}")
        output.append("-" * 80)
        for user, data in users.items():
            completed = data.get("completed", [])
            prog_str = ", ".join(completed) if completed else "None"
            output.append(f"{user:<15} | {prog_str:<60}")
    except: pass
    
    global_comp = get_global_completed()
    output.append("\nGLOBAL STATUS: " + (", ".join([c.upper() for c in global_comp]) if global_comp else "Open"))
    
    output.append("\n" + "="*80)
    output.append(" CURRENT MUSTELID LEADERBOARD (Top Ranked / Averaged)")
    output.append("-" * 80)
    stats = calculate_stats()
    mustelids = {m["id"]: m["name"] for m in get_mustelid_list()}
    for cat in stats:
        sorted_m = sorted(stats[cat].items(), key=lambda x: x[1], reverse=True)
        top_str = ", ".join([f"{mustelids.get(m[0], m[0])} ({m[1]})" for m in sorted_m[:2]])
        output.append(f"[{cat.upper():<7}] {top_str if top_str else 'No data yet'}")
    output.append("="*80)
    output.append("\nRecent Activity:")
    try:
        if os.path.exists(COMPARISONS_LOG):
            with open(COMPARISONS_LOG, "r") as f:
                lines = f.readlines()
                for line in lines[-10:]: output.append(line.strip())
    except: pass
    output.append("\n" + "="*80)
    output.append(f"Last Updated: {time.ctime()}")
    with open(DASHBOARD_FILE, "w") as f: f.write("\n".join(output))

@app.route("/")
def index(): return send_from_directory(".", "mustelid-sort.html")

@app.route("/selector")
def selector(): return send_from_directory(".", "mustelid-selector.html")

@app.route("/Crema/<path:path>")
def send_crema(path): return send_from_directory("Crema", path)

@app.route("/UX/<path:path>")
def send_ux(path): return send_from_directory("UX", path)

@app.route("/Mustelids/<path:path>")
def send_mustelid_asset(path): return send_from_directory("Mustelids", path)

@app.route("/api/master_scores")
def master_scores(): return send_from_directory("data", "mustelid_master_scores.json")

@app.route("/api/login", methods=["POST"])
def login():
    data = request.json
    username = data.get("username")
    if not username: return jsonify({"error": "Username required"}), 400
    session["username"] = username
    # Load official size ranking
    official_size = []
    if os.path.exists("data/official_size_ranking.json"):
        with open("data/official_size_ranking.json", "r") as f:
            official_size = json.load(f)

    with open(USERS_FILE, "r") as f: users = json.load(f)
    if username not in users:
        users[username] = {"completed": [], "states": {}}
    
    # Auto-complete size for everyone
    if "size" not in users[username]["completed"]:
        users[username]["completed"].append("size")
        # Save a virtual final ranking file for stats
        with open(os.path.join(DATA_DIR, f"final_{username}_size.json"), "w") as f:
            json.dump(official_size, f)
            
    with open(USERS_FILE, "w") as f: json.dump(users, f)
    
    send_notification("Mustelid Sorter", f"User '{username}' logged in!")
    update_dashboard_file()
    return jsonify({
        "username": username, 
        "completed": users[username].get("completed", []), 
        "states": users[username].get("states", {}),
        "global_completed": get_global_completed()
    })

@app.route("/api/logout", methods=["POST"])
def logout():
    username = session.get("username", "Unknown")
    session.pop("username", None)
    send_notification("Mustelid Sorter", f"User '{username}' logged off.")
    update_dashboard_file()
    return jsonify({"success": True})

@app.route("/api/mustelids")
def mustelids(): return jsonify(get_mustelid_list())

@app.route("/api/save_state", methods=["POST"])
def save_state():
    if "username" not in session: return jsonify({"error": "Unauthorized"}), 401
    data = request.json
    username = session["username"]
    category = data.get("category")
    state = data.get("state")
    last_pick = data.get("last_pick")
    undo = data.get("undo")
    
    if not category or not state: return jsonify({"error": "Invalid data"}), 400
    
    if undo:
        log_entry = f"[{time.strftime('%H:%M:%S')}] {username}: UNDO LAST PICK\n"
        with open(COMPARISONS_LOG, "a") as f: f.write(log_entry)
    elif last_pick:
        log_entry = f"[{time.strftime('%H:%M:%S')}] {username}: {last_pick['winner']} > {last_pick['loser']}\n"
        with open(COMPARISONS_LOG, "a") as f: f.write(log_entry)
    with open(USERS_FILE, "r") as f: users = json.load(f)
    if "states" not in users[username]: users[username]["states"] = {}
    users[username]["states"][category] = state
    if state.get("isDone"):
        if "completed" not in users[username]: users[username]["completed"] = []
        if category not in users[username]["completed"]:
            users[username]["completed"].append(category)
            send_notification("Mustelid Sorter", f"User '{username}' completed {category}!")
            # Auto-sync master scores for Selector POC
            try:
                import subprocess
                subprocess.run(["python3", "sync_master_scores.py"], check=True)
            except Exception as e:
                print(f"Sync error: {e}")
    with open(USERS_FILE, "w") as f: json.dump(users, f)
    update_dashboard_file()
    return jsonify({"success": True, "global_completed": get_global_completed()})

@app.route("/api/report_problem", methods=["POST"])
def report_problem():
    data = request.json
    username = session.get("username", "Anonymous")
    message = data.get("message")
    if not message: return jsonify({"error": "Message required"}), 400
    report = {"timestamp": time.ctime(), "user": username, "message": message}
    with open(PROBLEMS_FILE, "r") as f: problems = json.load(f)
    problems.append(report)
    with open(PROBLEMS_FILE, "w") as f: json.dump(problems, f)
    send_notification("Problem Reported", f"User '{username}' reported an issue.")
    update_dashboard_file()
    return jsonify({"success": True})

@app.route("/api/reset_progress", methods=["POST"])
def reset_progress():
    if "username" not in session: return jsonify({"error": "Unauthorized"}), 401
    username = session["username"]
    with open(USERS_FILE, "r") as f: users = json.load(f)
    if username in users:
        users[username] = {"completed": [], "states": {}}
        with open(USERS_FILE, "w") as f: json.dump(users, f)
    update_dashboard_file()
    return jsonify({"success": True})

if __name__ == "__main__":
    update_dashboard_file()
    app.run(port=4000, host="0.0.0.0", debug=False)
