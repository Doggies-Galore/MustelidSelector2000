import os
import json

MUSTELIDS_DIR = "Mustelids"
REQUIRED_KEYS = [
    "common_name", "scientific_name", "subfamily", "genus", 
    "description", "fun_fact", "weight", "lifespan", 
    "wiki_url", "image_url", "habitat",
    "noodle", "size", "biome", "sillay", "snoot"
]

def audit_mustelids():
    problems = []
    
    if not os.path.exists(MUSTELIDS_DIR):
        print(f"Error: {MUSTELIDS_DIR} not found.")
        return

    subdirs = [d for d in os.listdir(MUSTELIDS_DIR) if os.path.isdir(os.path.join(MUSTELIDS_DIR, d))]
    subdirs = [d for d in subdirs if d not in ["Mustelid Images", "assets"]]
    subdirs.sort()

    for subdir in subdirs:
        folder_path = os.path.join(MUSTELIDS_DIR, subdir)
        facts_path = os.path.join(folder_path, "facts.json")
        
        # 1. Check if facts.json exists
        if not os.path.exists(facts_path):
            problems.append(f"[{subdir}] MISSING facts.json")
            continue
            
        try:
            with open(facts_path, "r") as f:
                data = json.load(f)
        except Exception as e:
            problems.append(f"[{subdir}] INVALID JSON: {e}")
            continue

        # 2. Check for required keys
        for key in REQUIRED_KEYS:
            if key not in data:
                problems.append(f"[{subdir}] MISSING KEY: {key}")
            elif not data[key] or str(data[key]).strip().lower() == "unknown":
                problems.append(f"[{subdir}] EMPTY/UNKNOWN VALUE: {key}")
            elif key == "habitat" and data[key] == "Varied":
                problems.append(f"[{subdir}] GENERIC VALUE: habitat is 'Varied'")

        # 3. Check for photo
        photo_path = os.path.join(folder_path, "assets", "photo.webp")
        if not os.path.exists(photo_path):
            problems.append(f"[{subdir}] MISSING ASSET: assets/photo.webp")

    return problems

if __name__ == "__main__":
    print("Mustelid Data Sweep initiated...")
    issues = audit_mustelids()
    
    if not issues:
        print("\n✨ ALL CLEAR! All 66 mustelids have complete data and assets.")
    else:
        print(f"\n⚠️ FOUND {len(issues)} ISSUES:")
        for issue in issues:
            print(f"  - {issue}")
            
    # Save issues to a file for easy review
    with open("data/audit_report.txt", "w") as f:
        f.write("\n".join(issues))
