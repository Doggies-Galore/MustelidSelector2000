import json
import os

MASTER_SCORES = "data/mustelid_master_scores.json"
MUSTELIDS_DIR = "Mustelids"

def main():
    if not os.path.exists(MASTER_SCORES):
        print(f"Error: {MASTER_SCORES} not found.")
        return

    with open(MASTER_SCORES, "r") as f:
        master_data = json.load(f)

    for m_id, m_data in master_data.items():
        facts_path = os.path.join(MUSTELIDS_DIR, m_id, "facts.json")
        if os.path.exists(facts_path):
            with open(facts_path, "r") as f:
                facts = json.load(f)
            
            # Add scores
            scores = m_data.get("scores", {})
            facts["noodle"] = scores.get("noodle", 3.0)
            facts["size"] = scores.get("size", 3.0)
            facts["biome"] = scores.get("biome", 3.0)
            facts["sillay"] = scores.get("sillay", 3.0)
            facts["snoot"] = scores.get("snoot", 3.0)
            
            # Save back
            with open(facts_path, "w") as f:
                json.dump(facts, f, indent=2)
            print(f"Updated {m_id}/facts.json")
        else:
            print(f"Warning: {facts_path} not found.")

if __name__ == "__main__":
    main()
