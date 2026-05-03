import os
import json
import requests
import subprocess
import re
import time
from tqdm import tqdm

# Configuration
API_KEY = "a10ce6f8b3b94b90833ab594b60bed2d.svdXEnGvd4n3SJLU-49fHrCu"
MUSTELIDS_DIR = "/Users/Mylo/Downloads/MustelidSelector2000/Mustelids"
MODEL = "gemma4:e4b"
SEARCH_URL = "https://ollama.com/api/web_search"
CACHE_FILE = "/Users/Mylo/Downloads/MustelidSelector2000/search_cache.json"

# Load cache
search_cache = {}
if os.path.exists(CACHE_FILE):
    try:
        with open(CACHE_FILE, "r") as f:
            search_cache = json.load(f)
    except:
        pass

def save_cache():
    with open(CACHE_FILE, "w") as f:
        json.dump(search_cache, f, indent=2)

def web_search(query, retries=3):
    if query in search_cache:
        return search_cache[query]
    
    headers = {"Authorization": f"Bearer {API_KEY}"}
    data = {"query": query}
    for i in range(retries):
        try:
            response = requests.post(SEARCH_URL, headers=headers, json=data, timeout=20)
            response.raise_for_status()
            results = response.json()
            context = ""
            if isinstance(results, list):
                context = "\n".join([str(r) for r in results])
            else:
                context = str(results)
            
            search_cache[query] = context
            save_cache()
            return context
        except Exception as e:
            if i < retries - 1:
                time.sleep(2)
                continue
            return f"Search error: {e}"

def run_ollama(prompt, context):
    context = context[:15000] # Increased context slightly
    full_prompt = f"Information:\n{context}\n\nTask: {prompt}"
    try:
        result = subprocess.run(
            ["ollama", "run", MODEL, "--hidethinking", "--nowordwrap"],
            input=full_prompt,
            capture_output=True,
            text=True,
            check=True
        )
        # Strip ANSI escape codes
        ansi_escape = re.compile(r'\x1B(?:[@-Z\\-_]|\[[0-?]*[ -/]*[@-~])')
        clean_output = ansi_escape.sub('', result.stdout.strip())
        return clean_output
    except Exception as e:
        return f"Error: {e}"

def extract_data(name, context):
    prompt = f"""
    Based on the information provided, extract the following for the {name}:
    1. A fun fact (no intro, just the fact).
    2. Average weight in kg (number only, or range like '1.5-2.0').
    3. Average lifespan in years (number only, or range like '5-10').
    4. Average body length in decimeters (dm). Note: 1 dm = 10 cm. (number only, or range).

    Return ONLY a JSON object with these keys: "fun_fact", "weight_kg", "lifespan_years", "body_length_dm".
    """
    response = run_ollama(prompt, context)
    try:
        # Try to find JSON in the response
        match = re.search(r'\{.*\}', response, re.DOTALL)
        if match:
            return json.loads(match.group())
        return None
    except:
        return None

def main():
    subdirs = [d for d in os.listdir(MUSTELIDS_DIR) if os.path.isdir(os.path.join(MUSTELIDS_DIR, d))]
    subdirs = [d for d in subdirs if d not in ["Mustelid Images", "assets"]]
    subdirs.sort()

    for subdir in tqdm(subdirs, desc="Updating facts.json"):
        json_path = os.path.join(MUSTELIDS_DIR, subdir, "facts.json")
        if not os.path.exists(json_path):
            continue
        
        with open(json_path, "r") as f:
            data = json.load(f)
        
        # Check if we need to update
        # If fun_fact is placeholder or keys are missing
        if data.get("fun_fact") == "A fascinating member of the mustelid family." or "weight_kg" not in data:
            name = data.get("common_name", subdir.replace("_", " "))
            search_query = f"fun facts average weight kg lifespan years body length of {name}"
            context = web_search(search_query)
            
            new_data = extract_data(name, context)
            if new_data:
                data.update(new_data)
                
                with open(json_path, "w") as f:
                    json.dump(data, f, indent=2)
                # tqdm.write(f"Updated {name}")
            else:
                tqdm.write(f"Failed to extract data for {name}")

if __name__ == "__main__":
    main()
