import os
import json
import re

def escape_sql(val):
    if val is None:
        return "NULL"
    if isinstance(val, str):
        return "'" + val.replace("'", "''") + "'"
    return str(val)

def main():
    # Use the current directory's parent to find Mustelids if not provided
    # but the user requested to ask for a path.
    mustelids_path = input("Enter path to Mustelids folder: ")
    if not os.path.isdir(mustelids_path):
        print(f"Error: {mustelids_path} is not a directory.")
        return

    mustelids_data = []
    all_traits = set()
    all_habitats = set()

    print("Scanning directory...")
    # Walk through Mustelids directory
    for root, dirs, files in os.walk(mustelids_path):
        if "facts.json" in files:
            with open(os.path.join(root, "facts.json"), 'r') as f:
                try:
                    data = json.load(f)
                    # Add directory name as a fallback or for relative pathing if needed
                    data["_dir"] = os.path.basename(root)
                    mustelids_data.append(data)
                except Exception as e:
                    print(f"Error parsing {root}/facts.json: {e}")

    if not mustelids_data:
        print("No mustelid data found.")
        return

    # Identify traits and habitats
    # Based on schema.sql and research
    trait_keys = ["biome", "noodle", "sillay", "size", "snoot"]
    stat_keys = ["weight", "lifespan"]
    mustelid_fields = ["common_name", "scientific_name", "subfamily", "genus", "description", "fun_fact", "image_url", "wiki_url"]

    for m in mustelids_data:
        # Habitats
        if "habitat" in m:
            # Split by &, ,, and "and"
            h_str = m["habitat"]
            h_list = re.split(r'[,&]|\band\b', h_str)
            for h in h_list:
                h_name = h.strip()
                if h_name:
                    all_habitats.add(h_name)
        
        # Traits (only those present and numeric)
        for k in trait_keys:
            if k in m and isinstance(m[k], (int, float)):
                all_traits.add(k)

    # Sort for consistent IDs
    sorted_traits = sorted(list(all_traits))
    sorted_habitats = sorted(list(all_habitats))

    trait_to_id = {name: i+1 for i, name in enumerate(sorted_traits)}
    habitat_to_id = {name: i+1 for i, name in enumerate(sorted_habitats)}

    # Generate SQL
    sql_lines = []
    sql_lines.append("-- Generated Mustelid Data Stored Procedure")
    sql_lines.append("DROP PROCEDURE IF EXISTS ImportMustelids;")
    sql_lines.append("DROP PROCEDURE IF EXISTS DeleteAndResequence;")
    sql_lines.append("")
    sql_lines.append("CREATE PROCEDURE DeleteAndResequence(IN target_id INT)")
    sql_lines.append("BEGIN")
    sql_lines.append("    DECLARE EXIT HANDLER FOR SQLEXCEPTION")
    sql_lines.append("    BEGIN")
    sql_lines.append("        ROLLBACK;")
    sql_lines.append("        RESIGNAL;")
    sql_lines.append("    END;")
    sql_lines.append("")
    sql_lines.append("    START TRANSACTION;")
    sql_lines.append("    -- Since we have ON DELETE CASCADE, child tables are handled automatically!")
    sql_lines.append("    DELETE FROM Mustelids WHERE id = target_id;")
    sql_lines.append("    -- Resequence IDs")
    sql_lines.append("    UPDATE Mustelids SET id = id - 1 WHERE id > target_id ORDER BY id ASC;")
    sql_lines.append("    COMMIT;")
    sql_lines.append("END;")
    sql_lines.append("")
    sql_lines.append("CREATE PROCEDURE ImportMustelids()")
    sql_lines.append("BEGIN")
    sql_lines.append("    DECLARE EXIT HANDLER FOR SQLEXCEPTION")
    sql_lines.append("    BEGIN")
    sql_lines.append("        ROLLBACK;")
    sql_lines.append("        RESIGNAL;")
    sql_lines.append("    END;")
    sql_lines.append("")
    sql_lines.append("    START TRANSACTION;")
    sql_lines.append("")
    sql_lines.append("    -- Cleanup existing data")
    sql_lines.append("    DELETE FROM MustelidHabitats;")
    sql_lines.append("    DELETE FROM MustelidTraits;")
    sql_lines.append("    DELETE FROM Stats;")
    sql_lines.append("    DELETE FROM Mustelids;")
    sql_lines.append("    DELETE FROM Habitats;")
    sql_lines.append("    DELETE FROM Traits;")
    sql_lines.append("")

    # Insert Traits
    if sorted_traits:
        sql_lines.append("    -- Traits")
        for name in sorted_traits:
            sql_lines.append(f"    INSERT INTO Traits (id, name) VALUES ({trait_to_id[name]}, {escape_sql(name)});")
        sql_lines.append("")

    # Insert Habitats
    if sorted_habitats:
        sql_lines.append("    -- Habitats")
        for name in sorted_habitats:
            sql_lines.append(f"    INSERT INTO Habitats (id, name) VALUES ({habitat_to_id[name]}, {escape_sql(name)});")
        sql_lines.append("")

    # Insert Mustelids and related data
    sql_lines.append("    -- Mustelids and related data")
    for i, m in enumerate(mustelids_data):
        m_id = i + 1
        
        # Adjust image_url to include the directory if it starts with ./
        img_url = m.get("image_url")
        if img_url and img_url.startswith("./"):
            img_url = f"/Mustelids/{m['_dir']}/{img_url[2:]}"

        # Main Mustelids table
        cols = ["id"] + mustelid_fields
        vals = [str(m_id)] + [escape_sql(m.get(f) if f != "image_url" else img_url) for f in mustelid_fields]
        sql_lines.append(f"    INSERT INTO Mustelids ({', '.join(cols)}) VALUES ({', '.join(vals)});")

        # MustelidTraits
        for k in trait_keys:
            if k in m and isinstance(m[k], (int, float)):
                sql_lines.append(f"    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES ({m_id}, {trait_to_id[k]}, {m[k]});")

        # MustelidHabitats
        if "habitat" in m:
            h_list = re.split(r'[,&]|\band\b', m["habitat"])
            m_habs = set()
            for h in h_list:
                h_name = h.strip()
                if h_name and h_name in habitat_to_id:
                    m_habs.add(habitat_to_id[h_name])
            for h_id in sorted(list(m_habs)):
                sql_lines.append(f"    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES ({m_id}, {h_id});")

        # Stats
        for k in stat_keys:
            if k in m:
                sql_lines.append(f"    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES ({m_id}, {escape_sql(k)}, {escape_sql(m[k])});")
        
        sql_lines.append("")

    sql_lines.append("    COMMIT;")
    sql_lines.append("END;")

    # Write to data.sql in the same directory as the script
    script_dir = os.path.dirname(os.path.abspath(__file__))
    output_path = os.path.join(script_dir, "data.sql")
    with open(output_path, 'w') as f:
        f.write("\n".join(sql_lines))

    print(f"Successfully generated {output_path} with {len(mustelids_data)} mustelids.")

if __name__ == "__main__":
    main()
