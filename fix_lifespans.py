import os
import json

UPDATES = {
    "amazon_weasel": "3\u20135 years",
    "back_striped_weasel": "4\u20137 years",
    "european_mink": "6\u201310 years",
    "greater_grison": "10\u201312 years",
    "hairy_nosed_otter": "10\u201312 years",
    "japanese_marten": "8\u201312 years",
    "javan_ferret_badger": "5\u20138 years",
    "marbled_polecat": "8\u201312 years",
    "marine_otter": "10\u201315 years",
    "nilgiri_marten": "12\u201315 years",
    "patagonian_weasel": "1\u20133 years",
    "southern_river_otter": "3\u20135 years",
    "striped_polecat": "5\u20138 years",
    "vietnam_ferret_badger": "5\u20138 years"
}

MUSTELIDS_DIR = "Mustelids"

def apply_updates():
    for m_id, lifespan in UPDATES.items():
        facts_path = os.path.join(MUSTELIDS_DIR, m_id, "facts.json")
        if os.path.exists(facts_path):
            with open(facts_path, "r") as f:
                try:
                    data = json.load(f)
                    data["lifespan"] = lifespan
                    with open(facts_path, "w") as f_out:
                        json.dump(data, f_out, indent=2)
                    print(f"Updated {m_id} lifespan to {lifespan}")
                except Exception as e:
                    print(f"Error updating {m_id}: {e}")
        else:
            print(f"Warning: {facts_path} not found.")

if __name__ == "__main__":
    apply_updates()
