import os
import json
from flask import Flask, jsonify, send_from_directory

app = Flask(__name__)

DATA_DIR = "data"
MUSTELIDS_DIR = "Mustelids"
REMOTE_BASE_URL = "https://doggies-galore.github.io/Mustelids"

@app.route("/")
def index():
    return send_from_directory(".", "mustelid-selector.html")

@app.route("/Crema/<path:path>")
def send_crema(path):
    return send_from_directory("Crema", path)

@app.route("/UX/<path:path>")
def send_ux(path):
    return send_from_directory("UX", path)

@app.route("/Mustelids/<path:path>")
def send_mustelid_asset(path):
    return send_from_directory("Mustelids", path)

@app.route("/api/master_scores")
def master_scores():
    return send_from_directory("data", "mustelid_master_scores.json")

@app.route("/api/mustelids")
def mustelids():
    mustelids_list = []
    if not os.path.exists(MUSTELIDS_DIR):
        return jsonify([])
    
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
                    m.update({k: v for k, v in data.items() if k not in m})
                    mustelids_list.append(m)
            except:
                continue
    return jsonify(mustelids_list)

if __name__ == "__main__":
    app.run(port=4000, host="0.0.0.0", debug=False)
