import json
import os
import math

DATA_DIR = "data"
USERS_FILE = os.path.join(DATA_DIR, "users.json")
FACTS_FILE = os.path.join(DATA_DIR, "facts.json")
MASTER_SCORES_FILE = os.path.join(DATA_DIR, "mustelid_master_scores.json")

def get_weight_value(w_str):
    if not w_str or "Unknown" in w_str:
        return None
    try:
        # Clean up string
        s = w_str.lower()
        s = s.replace("kg", "").replace("\u2013", "-").replace("estimated", "").replace("(", "").replace(")", "")
        s = s.replace("<", "").replace(">", "").strip()
        
        # Handle ranges
        if "-" in s:
            nums = [float(x.strip()) for x in s.split("-") if x.strip()]
            if not nums: return None
            return sum(nums) / len(nums)
        else:
            return float(s)
    except:
        return None

def load_mustelids():
    mustelids = {}
    base_dir = "Mustelids"
    if not os.path.exists(base_dir):
        return {}
    for folder in os.listdir(base_dir):
        facts_path = os.path.join(base_dir, folder, "facts.json")
        if os.path.exists(facts_path):
            with open(facts_path, "r") as f:
                data = json.load(f)
                mustelids[folder] = data
    return mustelids

def main():
    # 1. Load data
    with open(USERS_FILE, "r") as f:
        users = json.load(f)
    
    facts = load_mustelids()

    # Initialize master scores with species from facts.json
    master_scores = {}
    for m_id, m_data in facts.items():
        name = m_data.get("name", m_data.get("common_name", m_id.replace("_", " ").title()))
        sci_name = m_data.get("scientific_name", "Unknown")
        image = m_data.get("image", f"https://doggies-galore.github.io/Mustelids/{m_id}/assets/photo.webp")
        
        master_scores[m_id] = {
            "name": name,
            "scientific_name": sci_name,
            "image": image,
            "description": m_data.get("description", ""),
            "fun_fact": m_data.get("fun_fact", ""),
            "weight": m_data.get("weight", ""),
            "lifespan": m_data.get("lifespan", ""),
            "habitat": m_data.get("habitat", ""),
            "scores": {
                "noodle": 3.0,
                "size": 3.0,
                "biome": 3.0,
                "sillay": 3.0,
                "snoot": 3.0
            }
        }

    categories = ["noodle", "biome", "sillay", "snoot"]
    
    # 2. Process manual categories from users.json
    for cat in categories:
        rank_sums = {} # m_id -> sum of normalized ranks
        rank_counts = {} # m_id -> number of users
        
        found_data = False
        for user, data in users.items():
            state = data.get("states", {}).get(cat)
            if state and state.get("isDone") and state.get("sortedList"):
                found_data = True
                sorted_list = state["sortedList"]
                count = len(sorted_list)
                for i, item in enumerate(sorted_list):
                    m_id = item["id"]
                    # Normalize rank (0 to count-1) to (1 to 5)
                    # 0 -> 1, count-1 -> 5
                    norm_rank = 1 + (i / (count - 1) * 4) if count > 1 else 3.0
                    rank_sums[m_id] = rank_sums.get(m_id, 0) + norm_rank
                    rank_counts[m_id] = rank_counts.get(m_id, 0) + 1
        
        if found_data:
            print(f"Aggregating {cat} from user rankings...")
            for m_id in master_scores:
                if m_id in rank_sums:
                    master_scores[m_id]["scores"][cat] = round(rank_sums[m_id] / rank_counts[m_id], 2)
        else:
            print(f"No completed data found for {cat}")

    # 3. Size Refinement: Log-scale value-based normalization
    species_weights = []
    for m_id, m_data in facts.items():
        w = get_weight_value(m_data.get("weight"))
        if w is not None and w > 0:
            species_weights.append((m_id, w))
    
    if species_weights:
        print("Calculating refined size scores (Log-Scale Weight)...")
        # Log values for normalization
        log_weights = [(m_id, math.log10(w)) for m_id, w in species_weights]
        min_log = min(lw[1] for lw in log_weights)
        max_log = max(lw[1] for lw in log_weights)
        log_range = max_log - min_log
        
        for m_id, lw in log_weights:
            # Map log value to 1-5
            norm_size = 1 + (4 * (lw - min_log) / log_range)
            master_scores[m_id]["scores"]["size"] = round(norm_size, 2)
            
        # Handle any species without weight (use median)
        all_sizes = [m["scores"]["size"] for m in master_scores.values() if m["scores"]["size"] != 3.0]
        if all_sizes:
            median_size = sum(all_sizes) / len(all_sizes) # or actual median
            for m_id in master_scores:
                if m_id not in [sw[0] for sw in species_weights]:
                    master_scores[m_id]["scores"]["size"] = round(median_size, 2)

    # 4. Save results
    with open(MASTER_SCORES_FILE, "w") as f:
        json.dump(master_scores, f, indent=2)
    
    print(f"Successfully synced master scores to {MASTER_SCORES_FILE}")

    # 5. Propagate to individual facts.json files
    print("Propagating scores to species folders...")
    for m_id, m_data in master_scores.items():
        facts_path = os.path.join("Mustelids", m_id, "facts.json")
        if os.path.exists(facts_path):
            try:
                with open(facts_path, "r") as f:
                    facts = json.load(f)
                
                scores = m_data.get("scores", {})
                for key in ["noodle", "size", "biome", "sillay", "snoot"]:
                    facts[key] = scores.get(key, 3.0)
                
                with open(facts_path, "w") as f:
                    json.dump(facts, f, indent=2)
            except Exception as e:
                print(f"Error updating {m_id}: {e}")

if __name__ == "__main__":
    main()
