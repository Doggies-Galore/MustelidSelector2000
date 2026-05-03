import os
import json
import requests
import subprocess
import re
import time
import sys
import argparse
from concurrent.futures import ThreadPoolExecutor
from tqdm import tqdm

import threading

# Configuration
API_KEY = "a10ce6f8b3b94b90833ab594b60bed2d.svdXEnGvd4n3SJLU-49fHrCu"
MUSTELIDS_DIR = "/Users/Mylo/Downloads/MustelidSelector2000/Mustelids"
MODEL = "gemma4:e4b"
SEARCH_URL = "https://ollama.com/api/web_search"
CACHE_FILE = "/Users/Mylo/Downloads/MustelidSelector2000/search_cache.json"

# Tasks to perform
TASKS = [
    {"name": "Fact", "query": "Fun fact about {name}", "prompt": "Identify one interesting fun fact about the {name}. Return ONLY the fact itself. ABSOLUTELY NO introductory text. Do not start with 'The', 'A', 'One', 'Did you know', or the name of the animal. Start immediately with the active part of the fact.", "file": "fact.txt"},
    {"name": "Habitat", "query": "Primary geographic range and habitat of {name}", "prompt": "Identify a notable primary geographic location and biome for the {name}. Respond EXACTLY in the format 'Region, Country - Habitat Type'. Choose the Habitat Type from: Forest, Grassland, Desert, Tundra, Freshwater, or Marine. Example: 'Osaka, Japan - Grassland'.", "file": "habitat.txt"},
    {"name": "Weight", "query": "Average weight of the {name} in kg", "prompt": "Return the average weight of the {name} in kg using the information passed to you. Respond only with the format `number kg`.", "file": "weight.txt"},
    {"name": "Lifespan", "query": "Average Lifespan of the {name}", "prompt": "Return the average lifespan of the {name} in years using the information passed to you. Respond only with the format `number years`.", "file": "lifespan.txt"}
]

# Global cache and lock
search_cache = {}
cache_lock = threading.Lock()

def load_cache():
    global search_cache
    if os.path.exists(CACHE_FILE):
        try:
            with open(CACHE_FILE, "r") as f:
                search_cache = json.load(f)
        except:
            search_cache = {}

def save_cache():
    with cache_lock:
        with open(CACHE_FILE, "w") as f:
            json.dump(search_cache, f, indent=2)

def web_search(query, retries=3):
    # Check cache first
    with cache_lock:
        if query in search_cache:
            return search_cache[query]

    headers = {"Authorization": f"Bearer {API_KEY}"}
    data = {"query": query}
    for i in range(retries):
        try:
            response = requests.post(SEARCH_URL, headers=headers, json=data, timeout=15)
            response.raise_for_status()
            results = response.json()
            context = ""
            if isinstance(results, list):
                context = "\n".join([str(r) for r in results])
            else:
                context = str(results)
            
            # Save to cache
            with cache_lock:
                search_cache[query] = context
            save_cache()
            
            return context
        except Exception as e:
            if i < retries - 1:
                time.sleep(2)
                continue
            return f"Search error: {e}"

def run_ollama(prompt, context):
    # Truncate context to avoid overwhelming the model
    context = context[:10000]
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
        
        # Flatten: replace newlines/tabs with spaces and collapse multiple spaces
        clean_output = re.sub(r'\s+', ' ', clean_output).strip()
        
        return clean_output
    except subprocess.CalledProcessError as e:
        return f"Ollama error: {e.stderr.strip() if e.stderr else 'Status 1'}"
    except Exception as e:
        return f"Error: {e}"

def process_task(mustelid_name, mustelid_dir, task, verbose=True, task_bar=None):
    target_file = os.path.join(mustelid_dir, task["file"])
    
    try:
        if verbose: tqdm.write(f"  [QUERYING] {task['name']}...")
        if task_bar: task_bar.set_description(f"  └─ {task['name']}: [Querying]")
        
        query = task["query"].format(name=mustelid_name)
        context = web_search(query)[:10000]
        
        if verbose:
            tqdm.write(f"  --- Search Results ({len(context)} chars) ---")
            tqdm.write(f"  {context[:200]}...")
            tqdm.write(f"  [PROCESSING] {task['name']} with Ollama...")
        
        if task_bar: task_bar.set_description(f"  └─ {task['name']}: [Processing]")
            
        prompt = task["prompt"].format(name=mustelid_name)
        response = run_ollama(prompt, context)
        
        if verbose:
            tqdm.write(f"  --- Ollama Response ---")
            tqdm.write(f"  {response}")
            tqdm.write(f"  [SAVED] {task['file']}")
        
        if task_bar: task_bar.set_description(f"  └─ {task['name']}: [Done]")

        with open(target_file, "w") as f:
            f.write(response)
            
    except Exception as e:
        msg = f"  [ERROR] {task['name']}: {e}"
        if verbose: tqdm.write(msg)
        if task_bar: task_bar.set_description(msg[:40])

def main():
    parser = argparse.ArgumentParser(description="Generate Mustelid Data")
    parser.add_argument("--multi", action="store_true", help="Run 4 tasks in parallel per species")
    args = parser.parse_args()

    load_cache() # Load persistent cache

    subdirs = [d for d in os.listdir(MUSTELIDS_DIR) if os.path.isdir(os.path.join(MUSTELIDS_DIR, d))]
    subdirs = [d for d in subdirs if d not in ["Mustelid Images", "assets"]]
    subdirs.sort()
    
    print(f"MustelidSelector2000 Data Generation | Model: {MODEL}")
    print(f"Mode: {'PARALLEL (4 tasks)' if args.multi else 'SEQUENTIAL'}")
    print(f"Processing {len(subdirs)} species...\n")
    
    main_bar = tqdm(total=len(subdirs), position=0, desc="Overall Progress")
    
    sub_bars = []
    if args.multi:
        sub_bars = [tqdm(total=1, position=i+1, bar_format='{desc}', leave=True) for i in range(len(TASKS))]

    try:
        for subdir in subdirs:
            display_name = subdir.replace("_", " ").title()
            main_bar.set_description(f"Current: {display_name}")
            mustelid_dir = os.path.join(MUSTELIDS_DIR, subdir)
            
            if args.multi:
                for bar in sub_bars: bar.reset()
                with ThreadPoolExecutor(max_workers=4) as executor:
                    for i, task in enumerate(TASKS):
                        executor.submit(process_task, display_name, mustelid_dir, task, False, sub_bars[i])
            else:
                tqdm.write(f"\n>>> PROCESSING: {display_name}")
                for task in TASKS:
                    process_task(display_name, mustelid_dir, task, True)
            
            main_bar.update(1)
    finally:
        main_bar.close()
        for bar in sub_bars: bar.close()
        if args.multi: print("\n" * len(TASKS))
        print("\nGeneration complete.")

if __name__ == "__main__":
    main()
