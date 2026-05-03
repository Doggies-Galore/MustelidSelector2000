-- Generated Mustelid Data Stored Procedure
DROP PROCEDURE IF EXISTS ImportMustelids;
DROP PROCEDURE IF EXISTS DeleteAndResequence;

CREATE PROCEDURE DeleteAndResequence(IN target_id INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;
    -- Since we have ON DELETE CASCADE, child tables are handled automatically!
    DELETE FROM Mustelids WHERE id = target_id;
    -- Resequence IDs
    UPDATE Mustelids SET id = id - 1 WHERE id > target_id ORDER BY id ASC;
    COMMIT;
END;

CREATE PROCEDURE ImportMustelids()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    -- Cleanup existing data
    DELETE FROM MustelidHabitats;
    DELETE FROM MustelidTraits;
    DELETE FROM Stats;
    DELETE FROM Mustelids;
    DELETE FROM Habitats;
    DELETE FROM Traits;

    -- Traits
    INSERT INTO Traits (id, name) VALUES (1, 'biome');
    INSERT INTO Traits (id, name) VALUES (2, 'noodle');
    INSERT INTO Traits (id, name) VALUES (3, 'sillay');
    INSERT INTO Traits (id, name) VALUES (4, 'size');
    INSERT INTO Traits (id, name) VALUES (5, 'snoot');

    -- Habitats
    INSERT INTO Habitats (id, name) VALUES (1, 'Alpine Scree');
    INSERT INTO Habitats (id, name) VALUES (2, 'Arctic Tundra');
    INSERT INTO Habitats (id, name) VALUES (3, 'Arid Savanna');
    INSERT INTO Habitats (id, name) VALUES (4, 'Arid Steppes');
    INSERT INTO Habitats (id, name) VALUES (5, 'Bamboo Groves');
    INSERT INTO Habitats (id, name) VALUES (6, 'Bedrooms');
    INSERT INTO Habitats (id, name) VALUES (7, 'Boreal Forest');
    INSERT INTO Habitats (id, name) VALUES (8, 'Broad-leaved');
    INSERT INTO Habitats (id, name) VALUES (9, 'Cloud Forests');
    INSERT INTO Habitats (id, name) VALUES (10, 'Coastal Marine');
    INSERT INTO Habitats (id, name) VALUES (11, 'Coniferous');
    INSERT INTO Habitats (id, name) VALUES (12, 'Deciduous Woodlands');
    INSERT INTO Habitats (id, name) VALUES (13, 'Deciduous Woods');
    INSERT INTO Habitats (id, name) VALUES (14, 'Domesticated');
    INSERT INTO Habitats (id, name) VALUES (15, 'Dry Scrub');
    INSERT INTO Habitats (id, name) VALUES (16, 'Farmland');
    INSERT INTO Habitats (id, name) VALUES (17, 'Forest Streams');
    INSERT INTO Habitats (id, name) VALUES (18, 'Forests');
    INSERT INTO Habitats (id, name) VALUES (19, 'Freshwater Rivers');
    INSERT INTO Habitats (id, name) VALUES (20, 'Grassland');
    INSERT INTO Habitats (id, name) VALUES (21, 'Grasslands');
    INSERT INTO Habitats (id, name) VALUES (22, 'Hedgerows');
    INSERT INTO Habitats (id, name) VALUES (23, 'Hilly Mixed Forests');
    INSERT INTO Habitats (id, name) VALUES (24, 'Humid Lowland Rainforests');
    INSERT INTO Habitats (id, name) VALUES (25, 'Lowland');
    INSERT INTO Habitats (id, name) VALUES (26, 'Mangrove Swamps');
    INSERT INTO Habitats (id, name) VALUES (27, 'Mixed Forests');
    INSERT INTO Habitats (id, name) VALUES (28, 'Moist Shola Rainforests');
    INSERT INTO Habitats (id, name) VALUES (29, 'Montane');
    INSERT INTO Habitats (id, name) VALUES (30, 'Montane Meadows');
    INSERT INTO Habitats (id, name) VALUES (31, 'Montane Riparian Cloud Forests');
    INSERT INTO Habitats (id, name) VALUES (32, 'Nearshore Kelp Forests');
    INSERT INTO Habitats (id, name) VALUES (33, 'Old-growth Deciduous Forests');
    INSERT INTO Habitats (id, name) VALUES (34, 'Open Fields');
    INSERT INTO Habitats (id, name) VALUES (35, 'Pampas');
    INSERT INTO Habitats (id, name) VALUES (36, 'Pastures');
    INSERT INTO Habitats (id, name) VALUES (37, 'Rice Paddies');
    INSERT INTO Habitats (id, name) VALUES (38, 'River Valleys');
    INSERT INTO Habitats (id, name) VALUES (39, 'Riverbanks');
    INSERT INTO Habitats (id, name) VALUES (40, 'Rocky Mountains');
    INSERT INTO Habitats (id, name) VALUES (41, 'Semi-deserts');
    INSERT INTO Habitats (id, name) VALUES (42, 'Shortgrass Prairie');
    INSERT INTO Habitats (id, name) VALUES (43, 'Shrubby Woodlands');
    INSERT INTO Habitats (id, name) VALUES (44, 'Slow-moving Amazonian Rivers');
    INSERT INTO Habitats (id, name) VALUES (45, 'Southeast Asian Swamp Forests');
    INSERT INTO Habitats (id, name) VALUES (46, 'Steppe');
    INSERT INTO Habitats (id, name) VALUES (47, 'Steppes');
    INSERT INTO Habitats (id, name) VALUES (48, 'Subtropical');
    INSERT INTO Habitats (id, name) VALUES (49, 'Subtropical Forests');
    INSERT INTO Habitats (id, name) VALUES (50, 'Taiga');
    INSERT INTO Habitats (id, name) VALUES (51, 'Temperate Forests');
    INSERT INTO Habitats (id, name) VALUES (52, 'Tropical');
    INSERT INTO Habitats (id, name) VALUES (53, 'Tropical Forests');
    INSERT INTO Habitats (id, name) VALUES (54, 'Tundra Edges');
    INSERT INTO Habitats (id, name) VALUES (55, 'Wetlands');
    INSERT INTO Habitats (id, name) VALUES (56, 'Woodlands');
    INSERT INTO Habitats (id, name) VALUES (57, 'arms');
    INSERT INTO Habitats (id, name) VALUES (58, 'hearts.');

    -- Mustelids and related data
    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (1, 'Amazon weasel', 'Neogale africana', 'Mustelinae', 'Neogale', 'The Amazon weasel is a species of mustelid native to the Amazon basin in South America. Despite its name, it is not found in Africa.', 'They are the only mustelids with a ventral stripe, a dark line that runs down the middle of their pale-colored chest and belly.', '/Mustelids/amazon_weasel/assets/photo.webp', 'https://en.wikipedia.org/wiki/Amazon_weasel');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (1, 1, 4.02);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (1, 2, 4.32);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (1, 3, 3.34);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (1, 4, 2.35);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (1, 5, 2.78);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (1, 24);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (1, 'weight', '0.5 kg (estimated)');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (1, 'lifespan', '3–5 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (2, 'Striped polecat', 'Ictonyx striatus', 'Ictonychinae', 'Ictonyx', 'The striped polecat, also known as the zorilla, is a member of the family Mustelidae that resembles a skunk. It is found in sub-Saharan Africa.', 'Often called the zorilla, their defensive spray is so powerful it can cause temporary blindness in potential predators.', '/Mustelids/striped_polecat/assets/photo.webp', 'https://en.wikipedia.org/wiki/Striped_polecat');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (2, 1, 1.06);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (2, 2, 2.17);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (2, 3, 3.46);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (2, 4, 2.89);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (2, 5, 2.48);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (2, 15);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (2, 16);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (2, 'weight', '0.5–1.8 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (2, 'lifespan', '5–8 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (3, 'Vietnam ferret-badger', 'Melogale cucphuongensis', 'Helictidinae', 'Melogale', 'The Vietnam ferret-badger is a species of mustelid endemic to Vietnam. It was only described as a distinct species in 2011.', 'This extremely rare species was only discovered by scientists in 2011 and is one of the least-studied mammals in the world.', '/Mustelids/vietnam_ferret_badger/assets/photo.webp', 'https://en.wikipedia.org/wiki/Vietnam_ferret-badger');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (3, 1, 3.65);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (3, 2, 1.98);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (3, 3, 1.12);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (3, 4, 2.66);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (3, 5, 5.0);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (3, 49);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (3, 52);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (3, 'weight', '0.8 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (3, 'lifespan', '5–8 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (4, 'Smooth-coated otter', 'Lutrogale perspicillata', 'Lutrinae', 'Lutrogale', 'The smooth-coated otter is an otter species found in South and Southeast Asia. It is known for its smooth, sleek fur.', 'They are highly social and hunt in coordinated V-shaped formations to herd schools of fish into shallow water where they are easier to catch.', '/Mustelids/smooth_coated_otter/assets/photo.webp', 'https://en.wikipedia.org/wiki/Smooth-coated_otter');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (4, 1, 4.32);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (4, 2, 3.58);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (4, 3, 2.78);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (4, 4, 4.23);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (4, 5, 3.4);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (4, 19);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (4, 55);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (4, 'weight', '7–11 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (4, 'lifespan', '4–10 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (5, 'Japanese badger', 'Meles anakuma', 'Melinae', 'Meles', 'The Japanese badger is a species of badger endemic to Japan, where it is found on Honshu, Kyushu, Shikoku, and Shodoshima.', 'In Japanese folklore, they are known as mujina and are believed to be shapeshifters capable of taking human form.', '/Mustelids/japanese_badger/assets/photo.webp', 'https://en.wikipedia.org/wiki/Japanese_badger');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (5, 1, 1.86);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (5, 2, 1.49);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (5, 3, 4.38);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (5, 4, 4.1);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (5, 5, 3.83);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (5, 5);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (5, 27);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (5, 'weight', '3.8–11 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (5, 'lifespan', '10 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (6, 'Fisher', 'Pekania pennanti', 'Guloninae', 'Pekania', 'The fisher is a small carnivorous mammal native to North America. It is a member of the mustelid family and is the only living species in the genus Pekania.', 'They are one of the few animals capable of successfully preying on porcupines by using their agility to attack the face or flip them over.', '/Mustelids/fisher/assets/photo.webp', 'https://en.wikipedia.org/wiki/Fisher_(animal)');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (6, 1, 2.48);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (6, 2, 2.42);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (6, 3, 2.05);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (6, 4, 3.7);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (6, 5, 3.95);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (6, 11);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (6, 27);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (6, 'weight', '2–6 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (6, 'lifespan', '7–10 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (7, 'European pine marten', 'Martes martes', 'Guloninae', 'Martes', 'The European pine marten, also known as the pine marten or the sweet marten, is an animal native to Northern Europe.', 'They are the only mustelids with semi-retractable claws, which combined with 180-degree rotating ankles, makes them expert climbers.', '/Mustelids/european_pine_marten/assets/photo.webp', 'https://en.wikipedia.org/wiki/European_pine_marten');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (7, 1, 3.28);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (7, 2, 2.6);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (7, 3, 4.82);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (7, 4, 3.09);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (7, 5, 3.58);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (7, 33);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (7, 'weight', '0.9–2.2 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (7, 'lifespan', '3–4 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (8, 'Caucasian badger', 'Meles canescens', 'Melinae', 'Meles', 'The Caucasian badger, also known as the Southwest Asian badger, is a species of badger native to Western Asia and some islands in the Mediterranean Sea.', 'They were only officially recognized as a distinct species from the European badger in 2013 following genetic studies.', '/Mustelids/caucasian_badger/assets/photo.webp', 'https://en.wikipedia.org/wiki/Caucasian_badger');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (8, 1, 2.17);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (8, 2, 1.43);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (8, 3, 1.37);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (8, 4, 4.42);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (8, 5, 1.8);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (8, 30);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (8, 47);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (8, 'weight', '7–17 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (8, 'lifespan', '15 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (9, 'Japanese weasel', 'Mustela itatsi', 'Mustelinae', 'Mustela', 'The Japanese weasel is a carnivorous mammal belonging to the genus Mustela in the family Mustelidae. It is native to Japan.', 'In Japanese folklore, they are associated with the kamaitachi, a supernatural creature depicted as a weasel with sickle-like claws.', '/Mustelids/japanese_weasel/assets/photo.webp', 'https://en.wikipedia.org/wiki/Japanese_weasel');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (9, 1, 2.85);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (9, 2, 4.82);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (9, 3, 4.02);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (9, 4, 2.3);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (9, 5, 3.46);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (9, 17);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (9, 21);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (9, 'weight', '0.1–0.82 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (9, 'lifespan', '2–3 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (10, 'American mink', 'Neogale vison', 'Mustelinae', 'Neogale', 'The American mink is a semiaquatic species of mustelid native to North America. It has been introduced to many other parts of the world.', 'When they are happy or content, minks have been known to make a soft purring sound similar to a domestic cat.', '/Mustelids/american_mink/assets/photo.webp', 'https://en.wikipedia.org/wiki/American_mink');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (10, 1, 4.75);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (10, 2, 4.2);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (10, 3, 5.0);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (10, 4, 3.0);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (10, 5, 1.86);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (10, 39);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (10, 55);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (10, 'weight', '0.7–2.0 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (10, 'lifespan', '3–5 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (11, 'Patagonian weasel', 'Lyncodon patagonicus', 'Ictonychinae', 'Lyncodon', 'The Patagonian weasel is a small mustelid native to the Pampas of Argentina and Chile. It is the only species in the genus Lyncodon.', 'They are the only member of their genus, Lyncodon, and were historically kept as ''working pets'' by ranchers to control rodent populations.', '/Mustelids/patagonian_weasel/assets/photo.webp', 'https://en.wikipedia.org/wiki/Patagonian_weasel');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (11, 1, 3.52);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (11, 2, 3.95);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (11, 3, 2.42);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (11, 4, 1.83);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (11, 5, 3.71);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (11, 35);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (11, 43);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (11, 'weight', '0.225 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (11, 'lifespan', '1–3 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (12, 'Giant otter', 'Pteronura brasiliensis', 'Lutrinae', 'Pteronura', 'The giant otter is a South American carnivorous mammal. It is the longest member of the mustelid family.', 'Known as the ''river wolf'', they are the noisiest otter species and have unique cream-colored throat patches that act like fingerprints for identification.', '/Mustelids/giant_otter/assets/photo.webp', 'https://en.wikipedia.org/wiki/Giant_otter');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (12, 1, 4.63);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (12, 2, 1.06);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (12, 3, 1.31);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (12, 4, 4.97);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (12, 5, 1.98);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (12, 44);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (12, 'weight', '22–34 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (12, 'lifespan', '8–13 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (13, 'Sumatran hog badger', 'Arctonyx hoevenii', 'Melinae', 'Arctonyx', 'The Sumatran hog badger is a species of mustelid endemic to the island of Sumatra in Indonesia. It is the smallest of the three species in the genus Arctonyx.', 'They are the smallest species in their genus and are exclusively found on the island of Sumatra, often at high altitudes.', '/Mustelids/sumatran_hog_badger/assets/photo.webp', 'https://en.wikipedia.org/wiki/Sumatran_hog_badger');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (13, 1, 2.6);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (13, 2, 2.11);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (13, 3, 1.25);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (13, 4, 4.33);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (13, 5, 4.82);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (13, 9);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (13, 29);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (13, 'weight', '7–14 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (13, 'lifespan', '14–15 years (captivity)');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (14, 'Malayan weasel', 'Mustela nudipes', 'Mustelinae', 'Mustela', 'The Malayan weasel is a species of weasel native to the Malay Peninsula and the islands of Sumatra and Borneo.', 'Their scientific name, Mustela nudipes, translates to ''bare feet'', referring to the fact that their foot pads have no fur at all.', '/Mustelids/malayan_weasel/assets/photo.webp', 'https://en.wikipedia.org/wiki/Malayan_weasel');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (14, 1, 1.74);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (14, 2, 4.45);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (14, 3, 4.63);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (14, 4, 3.06);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (14, 5, 3.09);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (14, 20);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (14, 22);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (14, 'weight', '1–2 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (14, 'lifespan', '3–10 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (15, 'Japanese marten', 'Martes melampus', 'Guloninae', 'Martes', 'The Japanese marten is a mammal in the marten genus. It is most closely related to the sable. It is endemic to the islands of Japan.', 'They play a vital role in their ecosystem as seed dispersers, with over 60% of their droppings containing seeds from the fruits they eat.', '/Mustelids/japanese_marten/assets/photo.webp', 'https://en.wikipedia.org/wiki/Japanese_marten');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (15, 1, 2.35);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (15, 2, 3.28);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (15, 3, 4.69);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (15, 4, 2.95);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (15, 5, 2.66);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (15, 8);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (15, 27);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (15, 'weight', '1–1.5 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (15, 'lifespan', '8–12 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (16, 'Stoat (Beringian ermine)', 'Mustela erminea', 'Mustelinae', 'Mustela', 'The stoat, also known as the ermine or Beringian ermine, is a species of mustelid native to Eurasia and the northern regions of North America.', 'Regardless of whether its coat is brown or winter white, the tip of a stoat''s tail always remains black, likely to distract predators.', '/Mustelids/stoat_beringian_ermine/assets/photo.webp', 'https://en.wikipedia.org/wiki/Stoat');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (16, 1, 1.49);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (16, 2, 4.63);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (16, 3, 4.94);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (16, 4, 1.96);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (16, 5, 1.55);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (16, 20);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (16, 22);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (16, 'weight', '0.1–0.45 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (16, 'lifespan', '1–5 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (17, 'Back-striped weasel', 'Mustela strigidorsa', 'Mustelinae', 'Mustela', 'The back-striped weasel, also known as the stripe-backed weasel, is a species of mustelid found in Southeast Asia.', 'They are characterized by a narrow, silvery stripe running down the entire length of their back, which is mirrored by a yellowish streak on their belly.', '/Mustelids/back_striped_weasel/assets/photo.webp', 'https://en.wikipedia.org/wiki/Back-striped_weasel');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (17, 1, 3.77);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (17, 2, 4.38);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (17, 3, 4.51);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (17, 4, 3.0);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (17, 5, 4.14);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (17, 20);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (17, 22);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (17, 'weight', '0.7–2.0 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (17, 'lifespan', '4–7 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (18, 'Beech marten', 'Martes foina', 'Guloninae', 'Martes', 'The beech marten, also known as the stone marten, house marten or white-breasted marten, is a species of marten native to much of Europe and Central Asia.', 'They have a notorious reputation for entering parked vehicle engine bays and chewing on cables and hoses, a behavior often called ''marten damage''.', '/Mustelids/beech_marten/assets/photo.webp', 'https://en.wikipedia.org/wiki/Beech_marten');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (18, 1, 2.91);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (18, 2, 3.89);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (18, 3, 3.83);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (18, 4, 3.18);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (18, 5, 3.28);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (18, 13);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (18, 40);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (18, 'weight', '1.1–2.5 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (18, 'lifespan', '3–10 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (19, 'Haida ermine', 'Mustela haidarum', 'Mustelinae', 'Mustela', 'The Haida ermine is a species of mustelid endemic to the islands of the Haida Gwaii archipelago in British Columbia and the Alexander Archipelago in Alaska.', 'They were only recognized as a distinct species in 2021 after being isolated on the Haida Gwaii archipelago for approximately 300,000 years.', '/Mustelids/haida_ermine/assets/photo.webp', 'https://en.wikipedia.org/wiki/Haida_ermine');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (19, 1, 3.03);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (19, 2, 4.75);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (19, 3, 4.75);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (19, 4, 1.45);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (19, 5, 2.17);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (19, 20);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (19, 22);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (19, 'weight', '0.1–0.15 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (19, 'lifespan', '< 2 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (20, 'Honey badger', 'Mellivora capensis', 'Mellivorinae', 'Mellivora', 'The honey badger, also known as the ratel, is a mammal widely distributed in Africa, Southwest Asia, and the Indian subcontinent. Because of its wide range and occurrence in many different habitats, it is listed as Least Concern on the IUCN Red List.', 'They have incredibly thick, loose skin that allows them to twist and turn inside it to bite back at an attacker even if they are caught in its jaws.', '/Mustelids/honey_badger/assets/photo.webp', 'https://en.wikipedia.org/wiki/Honey_badger');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (20, 1, 1.62);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (20, 2, 3.34);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (20, 3, 1.06);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (20, 4, 4.33);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (20, 5, 4.63);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (20, 3);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (20, 21);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (20, 'weight', '5–16 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (20, 'lifespan', '7–8 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (21, 'Yellow-throated marten', 'Martes flavigula', 'Guloninae', 'Martes', 'The yellow-throated marten, also known as the kharza, is a marten species native to Asia. It is listed as Least Concern on the IUCN Red List due to its wide distribution.', 'They are the largest marten species in the Old World and are sometimes seen hunting in small family groups to take down larger prey like musk deer.', '/Mustelids/yellow_throated_marten/assets/photo.webp', 'https://en.wikipedia.org/wiki/Yellow-throated_marten');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (21, 1, 1.92);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (21, 2, 4.02);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (21, 3, 4.57);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (21, 4, 3.61);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (21, 5, 2.29);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (21, 27);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (21, 48);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (21, 'weight', '1.2–5.7 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (21, 'lifespan', '7–10 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (22, 'Long-tailed weasel', 'Neogale frenata', 'Mustelinae', 'Neogale', 'The long-tailed weasel, also known as the bridled weasel or big over-and-under, is a species of mustelid native to North America.', 'Unlike skunks which spray, long-tailed weasels drag and rub their bodies against surfaces to mark territory with their musky odor.', '/Mustelids/long_tailed_weasel/assets/photo.webp', 'https://en.wikipedia.org/wiki/Long-tailed_weasel');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (22, 1, 2.54);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (22, 2, 4.88);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (22, 3, 3.89);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (22, 4, 1.93);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (22, 5, 1.68);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (22, 20);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (22, 22);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (22, 'weight', '0.07–0.45 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (22, 'lifespan', '3–7 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (23, 'Sea otter', 'Enhydra lutris', 'Lutrinae', 'Enhydra', 'The sea otter is a marine mammal native to the coasts of the northern and eastern North Pacific Ocean.', 'Sea otters have the densest fur of any animal, with up to one million hairs per square inch; they lack blubber and rely entirely on this fur to stay warm.', '/Mustelids/sea_otter/assets/photo.webp', 'https://en.wikipedia.org/wiki/Sea_otter');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (23, 1, 4.82);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (23, 2, 1.12);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (23, 3, 3.58);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (23, 4, 5.0);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (23, 5, 1.06);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (23, 32);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (23, 'weight', '14–45 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (23, 'lifespan', '10–15 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (24, 'Colombian weasel', 'Neogale felipei', 'Mustelinae', 'Neogale', 'The Colombian weasel, also known as Don Felipe''s weasel, is a very rare species of mustelid found in Colombia and Ecuador.', 'They are considered the rarest carnivore in South America and have noticeable webbing between their toes, suggesting a semi-aquatic lifestyle.', '/Mustelids/colombian_weasel/assets/photo.webp', 'https://en.wikipedia.org/wiki/Colombian_weasel');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (24, 1, 1.8);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (24, 2, 4.08);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (24, 3, 4.14);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (24, 4, 1.5);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (24, 5, 3.15);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (24, 31);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (24, 'weight', '0.12–0.15 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (24, 'lifespan', '1–6 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (25, 'Asian badger', 'Meles leucurus', 'Melinae', 'Meles', 'The Asian badger, also known as the sand badger, is a species of badger native to Asia. It is widely distributed from the Volga River in the west to the Korean Peninsula in the east.', 'Unlike many other badgers, they often hibernate in family groups, with adults sharing their dens with the previous year''s cubs.', '/Mustelids/asian_badger/assets/photo.webp', 'https://en.wikipedia.org/wiki/Asian_badger');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (25, 1, 1.98);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (25, 2, 2.29);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (25, 3, 2.29);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (25, 4, 3.99);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (25, 5, 3.34);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (25, 18);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (25, 47);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (25, 54);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (25, 'weight', '3.5–9 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (25, 'lifespan', '5–10 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (26, 'Bornean ferret-badger', 'Melogale everetti', 'Helictidinae', 'Melogale', 'The Bornean ferret-badger, also known as Everett''s ferret-badger or the Kinabalu ferret-badger, is a small mustelid endemic to the island of Borneo. It is listed as Endangered on the IUCN Red List due to its restricted range and habitat loss.', 'They cleverly repurpose abandoned burrows created by other animals rather than digging their own, despite having strong claws.', '/Mustelids/bornean_ferret_badger/assets/photo.webp', 'https://en.wikipedia.org/wiki/Bornean_ferret-badger');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (26, 1, 3.4);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (26, 2, 1.74);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (26, 3, 1.49);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (26, 4, 3.25);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (26, 5, 4.51);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (26, 49);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (26, 52);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (26, 'weight', '1–3 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (26, 'lifespan', '< 5 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (27, 'American ermine', 'Mustela richardsonii', 'Mustelinae', 'Mustela', 'The American ermine is a species of mustelid native to North America. It was formerly considered a subspecies of the stoat.', 'They exhibit a reproductive strategy called embryonic diapause, where the embryo remains dormant for months so the young are born in spring.', '/Mustelids/american_ermine/assets/photo.webp', 'https://en.wikipedia.org/wiki/American_ermine');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (27, 1, 2.72);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (27, 2, 4.69);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (27, 3, 3.95);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (27, 4, 1.32);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (27, 5, 1.92);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (27, 20);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (27, 22);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (27, 'weight', '0.025–0.18 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (27, 'lifespan', '1–2 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (28, 'Neotropical otter', 'Lontra longicaudis', 'Lutrinae', 'Lontra', 'The neotropical otter, also known as the neotropical river otter, is an otter species found in Central America, South America and the island of Trinidad.', 'They are intelligent tool users and have been observed using rocks to break open the shells of crustaceans and mollusks.', '/Mustelids/neotropical_otter/assets/photo.webp', 'https://en.wikipedia.org/wiki/Neotropical_otter');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (28, 1, 4.69);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (28, 2, 1.31);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (28, 3, 3.65);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (28, 4, 4.3);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (28, 5, 1.49);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (28, 19);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (28, 55);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (28, 'weight', '5–15 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (28, 'lifespan', '10–15 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (29, 'Least weasel', 'Mustela nivalis', 'Mustelinae', 'Mustela', 'The least weasel is the smallest member of the genus Mustela, the family Mustelidae and the order Carnivora. It is native to Eurasia, North America and North Africa.', 'They are the smallest carnivorous mammals in the world and must consume up to 60% of their body weight every day to survive.', '/Mustelids/least_weasel/assets/photo.webp', 'https://en.wikipedia.org/wiki/Least_weasel');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (29, 1, 1.68);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (29, 2, 4.51);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (29, 3, 3.77);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (29, 4, 1.0);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (29, 5, 1.31);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (29, 20);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (29, 22);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (29, 'weight', '0.025–0.1 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (29, 'lifespan', '< 1 year');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (30, 'Wolverine', 'Gulo gulo', 'Guloninae', 'Gulo', 'The wolverine, also referred to as the glutton, carcajou, or quickhatch, is the largest terrestrial member of the family Mustelidae. It is a muscular carnivore and a solitary animal.', 'Their paws act like natural snowshoes by spreading to twice their size when they hit the ground, allowing them to travel easily over deep snow.', '/Mustelids/wolverine/assets/photo.webp', 'https://en.wikipedia.org/wiki/Wolverine');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (30, 1, 4.2);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (30, 2, 1.0);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (30, 3, 1.0);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (30, 4, 4.47);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (30, 5, 3.77);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (30, 2);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (30, 7);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (30, 'weight', '8–18 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (30, 'lifespan', '5–10 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (31, 'Yellow-bellied weasel', 'Mustela kathiah', 'Mustelinae', 'Mustela', 'The yellow-bellied weasel is a species of mustelid found in the forests of central and eastern Asia. It is known for its distinctive yellow underbelly.', 'Historically in Nepal, they were kept by humans to control rodent populations and were even trained to attack larger animals for sport.', '/Mustelids/yellow_bellied_weasel/assets/photo.webp', 'https://en.wikipedia.org/wiki/Yellow-bellied_weasel');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (31, 1, 1.31);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (31, 2, 4.94);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (31, 3, 3.4);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (31, 4, 3.06);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (31, 5, 4.02);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (31, 20);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (31, 22);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (31, 'weight', '1.5 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (31, 'lifespan', '3–4 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (32, 'Congo clawless otter', 'Aonyx congicus', 'Lutrinae', 'Aonyx', 'The Congo clawless otter is a species of otter in the family Mustelidae. It is found in Cameroon, Congo, Democratic Republic of the Congo, Equatorial Guinea, and Gabon.', 'They are considered the most terrestrial of all otter species and spend a significant amount of time exploring shores and land compared to their relatives.', '/Mustelids/congo_clawless_otter/assets/photo.webp', 'https://en.wikipedia.org/wiki/Congo_clawless_otter');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (32, 1, 4.26);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (32, 2, 1.55);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (32, 3, 1.43);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (32, 4, 4.66);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (32, 5, 3.65);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (32, 19);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (32, 55);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (32, 'weight', '10–25 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (32, 'lifespan', '10–15 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (33, 'Nilgiri marten', 'Martes gwatkinsii', 'Guloninae', 'Martes', 'The Nilgiri marten is the only species of marten found in southern India. It is found in the hills of the Nilgiris and parts of the Western Ghats.', 'They are the only species of marten found in India and are endemic exclusively to the Western Ghats mountain range.', '/Mustelids/nilgiri_marten/assets/photo.webp', 'https://en.wikipedia.org/wiki/Nilgiri_marten');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (33, 1, 3.71);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (33, 2, 2.66);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (33, 3, 1.98);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (33, 4, 3.28);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (33, 5, 2.35);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (33, 28);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (33, 'weight', '2.1 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (33, 'lifespan', '12–15 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (34, 'Pacific marten', 'Martes caurina', 'Guloninae', 'Martes', 'The Pacific marten is a species of North American mammal in the family Mustelidae. It is found in the western United States and southwestern Canada.', 'They are capable of descending tree trunks headfirst by rotating their hind limbs, a rare ability among mammals.', '/Mustelids/pacific_marten/assets/photo.webp', 'https://en.wikipedia.org/wiki/Pacific_marten');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (34, 1, 1.12);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (34, 2, 2.85);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (34, 3, 4.2);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (34, 4, 2.96);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (34, 5, 2.11);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (34, 11);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (34, 27);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (34, 'weight', '0.75–1.8 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (34, 'lifespan', '4–6 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (35, 'Spotted-necked otter', 'Hydrictis maculicollis', 'Lutrinae', 'Hydrictis', 'The spotted-necked otter, or speckle-throated otter, is a species of otter native to sub-Saharan Africa.', 'Each individual has a unique pattern of creamy-white blotches on its throat and chest, which researchers use to identify them in the wild.', '/Mustelids/spotted_necked_otter/assets/photo.webp', 'https://en.wikipedia.org/wiki/Spotted-necked_otter');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (35, 1, 4.94);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (35, 2, 1.37);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (35, 3, 4.88);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (35, 4, 3.78);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (35, 5, 1.25);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (35, 19);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (35, 55);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (35, 'weight', '3–6 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (35, 'lifespan', '8 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (36, 'European badger', 'Meles meles', 'Melinae', 'Meles', 'The European badger is a badger species native to almost all of Europe. It is a powerful animal with a small head, a stocky body, small black eyes and a short tail.', 'They live in communal burrow systems called setts that can be hundreds of years old and are passed down through many generations of the same clan.', '/Mustelids/european_badger/assets/photo.webp', 'https://en.wikipedia.org/wiki/European_badger');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (36, 1, 3.58);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (36, 2, 3.52);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (36, 3, 2.6);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (36, 4, 4.42);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (36, 5, 4.08);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (36, 12);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (36, 36);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (36, 'weight', '7–17 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (36, 'lifespan', '3–8 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (37, 'Marbled polecat', 'Vormela peregusna', 'Ictonychinae', 'Vormela', 'The marbled polecat is a small mustelid native to southeast Europe and parts of Asia. It is known for its striking, multi-colored coat.', 'They have a unique ''marbled'' coat of yellow, white, and brown spots, and when threatened, they fluff up their fur and stand on their hind legs to look larger.', '/Mustelids/marbled_polecat/assets/photo.webp', 'https://en.wikipedia.org/wiki/Marbled_polecat');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (37, 1, 1.0);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (37, 2, 3.77);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (37, 3, 2.85);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (37, 4, 2.35);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (37, 5, 2.91);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (37, 4);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (37, 41);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (37, 'weight', '0.3–0.7 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (37, 'lifespan', '8–12 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (38, 'Greater grison', 'Galictis vittata', 'Ictonychinae', 'Galictis', 'The greater grison is a species of mustelid found in Central and South America. It is a medium-sized animal with a grizzled grey coat and a black underside.', 'When hunting, they move in a zigzag pattern and frequently pause to raise their heads above tall grass to sniff the air and survey their surroundings.', '/Mustelids/greater_grison/assets/photo.webp', 'https://en.wikipedia.org/wiki/Greater_grison');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (38, 1, 2.78);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (38, 2, 1.62);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (38, 3, 3.03);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (38, 4, 3.43);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (38, 5, 4.32);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (38, 46);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (38, 53);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (38, 'weight', '1.5–3.8 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (38, 'lifespan', '10–12 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (39, 'Siberian weasel', 'Mustela sibirica', 'Mustelinae', 'Mustela', 'The Siberian weasel, also known as the kolinsky, is a medium-sized species of mustelid native to Asia.', 'The famous ''Kolinsky sable-hair'' artist brushes are actually made from the winter fur of the male Siberian weasel, not from actual sables.', '/Mustelids/siberian_weasel/assets/photo.webp', 'https://en.wikipedia.org/wiki/Siberian_weasel');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (39, 1, 3.89);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (39, 2, 3.83);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (39, 3, 4.26);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (39, 4, 2.46);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (39, 5, 2.23);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (39, 38);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (39, 50);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (39, 55);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (39, 'weight', '0.36–0.82 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (39, 'lifespan', '2.1 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (40, 'Steppe polecat', 'Mustela eversmanii', 'Mustelinae', 'Mustela', 'The steppe polecat, also known as the white or masked polecat, is a species of mustelid native to Central and Eastern Europe and Central Asia.', 'They perform a ''war dance'' to disorient prey, leaping and jumping around while making soft clucking sounds before they attack.', '/Mustelids/steppe_polecat/assets/photo.webp', 'https://en.wikipedia.org/wiki/Steppe_polecat');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (40, 1, 1.43);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (40, 2, 2.97);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (40, 3, 4.08);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (40, 4, 3.01);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (40, 5, 4.2);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (40, 15);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (40, 16);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (40, 'weight', '0.7–2.05 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (40, 'lifespan', 'Up to 5 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (41, 'Chinese ferret-badger', 'Melogale moschata', 'Helictidinae', 'Melogale', 'The Chinese ferret-badger, also known as the small-toothed ferret-badger, is a small mustelid widely distributed in Southeast Asia and southern China. It is known for its distinctive facial mask and agile climbing abilities.', 'They are agile climbers that often sleep in tree branches and are encouraged by farmers to stay near agricultural areas to control pests.', '/Mustelids/chinese_ferret_badger/assets/photo.webp', 'https://en.wikipedia.org/wiki/Chinese_ferret-badger');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (41, 1, 3.34);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (41, 2, 3.09);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (41, 3, 3.52);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (41, 4, 3.25);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (41, 5, 4.45);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (41, 49);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (41, 52);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (41, 'weight', '1–3 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (41, 'lifespan', '< 10 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (42, 'Saharan striped polecat', 'Ictonyx libycus', 'Ictonychinae', 'Ictonyx', 'The Saharan striped polecat, also known as the Saharan striped weasel, is a species of mustelid found in North Africa and parts of the Sahel region.', 'They have fur on the undersides of their paws, which is an adaptation to help them walk and hunt in sandy desert environments.', '/Mustelids/saharan_striped_polecat/assets/photo.webp', 'https://en.wikipedia.org/wiki/Saharan_striped_polecat');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (42, 1, 1.55);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (42, 2, 2.54);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (42, 3, 2.97);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (42, 4, 2.38);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (42, 5, 4.26);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (42, 15);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (42, 16);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (42, 'weight', '0.24–0.8 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (42, 'lifespan', '5–6 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (43, 'American marten', 'Martes americana', 'Guloninae', 'Martes', 'The American marten is a North American mammal, a member of the family Mustelidae. It is also sometimes referred to as the American pine marten.', 'A group of martens is collectively known as a richness.', '/Mustelids/american_marten/assets/photo.webp', 'https://en.wikipedia.org/wiki/American_marten');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (43, 1, 2.66);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (43, 2, 4.26);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (43, 3, 2.48);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (43, 4, 2.83);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (43, 5, 1.18);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (43, 11);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (43, 27);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (43, 'weight', '0.5–1.6 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (43, 'lifespan', '12–17 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (44, 'African clawless otter', 'Aonyx capensis', 'Lutrinae', 'Aonyx', 'The African clawless otter, also known as the Cape clawless otter, is the second-largest freshwater species of otter. It is found in much of sub-Saharan Africa.', 'They are the second-largest freshwater otter and have incredibly dexterous front paws that are almost entirely clawless and unwebbed, allowing them to feel for prey in the mud.', '/Mustelids/african_clawless_otter/assets/photo.webp', 'https://en.wikipedia.org/wiki/African_clawless_otter');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (44, 1, 4.45);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (44, 2, 1.68);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (44, 3, 2.72);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (44, 4, 4.62);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (44, 5, 1.74);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (44, 19);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (44, 55);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (44, 'weight', '12–21 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (44, 'lifespan', '10–12 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (45, 'Sable', 'Martes zibellina', 'Guloninae', 'Martes', 'The sable is a species of marten, a small carnivorous mammal inhabiting forest environments, primarily in Russia from the Ural Mountains throughout Siberia, and northern Mongolia.', 'Their fur is unique because it feels smooth regardless of which direction you stroke it, unlike most animals where the fur has a distinct ''grain''.', '/Mustelids/sable/assets/photo.webp', 'https://en.wikipedia.org/wiki/Sable');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (45, 1, 2.29);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (45, 2, 1.18);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (45, 3, 4.32);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (45, 4, 2.95);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (45, 5, 2.54);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (45, 11);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (45, 27);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (45, 'weight', '0.7–1.8 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (45, 'lifespan', 'Up to 18 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (46, 'Southern river otter', 'Lontra provocax', 'Lutrinae', 'Lontra', 'The southern river otter is a species of otter that lives in Chile and Argentina. It is also known as the huillín.', 'In Chile, they are known as the ''Huillín'' and have the smallest geographical range of all otter species, living in both freshwater and marine habitats.', '/Mustelids/southern_river_otter/assets/photo.webp', 'https://en.wikipedia.org/wiki/Southern_river_otter');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (46, 1, 4.88);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (46, 2, 2.91);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (46, 3, 3.71);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (46, 4, 4.11);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (46, 5, 1.12);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (46, 19);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (46, 55);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (46, 'weight', '5–10 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (46, 'lifespan', '3–5 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (47, 'European mink', 'Mustela lutreola', 'Mustelinae', 'Mustela', 'The European mink is a semiaquatic species of mustelid native to Europe. It is one of the most endangered mammals in the world.', 'Unlike the American mink, they have a distinctive white upper lip that forms a small mask around their mouth.', '/Mustelids/european_mink/assets/photo.webp', 'https://en.wikipedia.org/wiki/European_mink');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (47, 1, 4.38);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (47, 2, 3.46);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (47, 3, 2.91);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (47, 4, 2.57);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (47, 5, 3.89);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (47, 39);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (47, 55);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (47, 'weight', '0.5–0.9 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (47, 'lifespan', '6–10 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (48, 'Marine otter', 'Lontra felina', 'Lutrinae', 'Lontra', 'The marine otter is a rare and relatively unknown South American mammal of the weasel family. It is found along the Pacific coast of South America.', 'Locally known as the ''chungungo'', they are one of the few otter species adapted to live in marine environments along the Pacific coast of South America.', '/Mustelids/marine_otter/assets/photo.webp', 'https://en.wikipedia.org/wiki/Marine_otter');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (48, 1, 5.0);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (48, 2, 3.4);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (48, 3, 1.8);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (48, 4, 3.78);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (48, 5, 1.37);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (48, 10);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (48, 'weight', '3–6 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (48, 'lifespan', '10–15 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (49, 'North American river otter', 'Lontra canadensis', 'Lutrinae', 'Lontra', 'The North American river otter, also known as the northern river otter or common otter, is a semiaquatic mammal endemic to the North American continent.', 'They are famous for their playful behavior, such as sliding down mud or snow banks, which helps them strengthen social bonds and practice hunting skills.', '/Mustelids/north_american_river_otter/assets/photo.webp', 'https://en.wikipedia.org/wiki/North_American_river_otter');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (49, 1, 4.51);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (49, 2, 1.25);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (49, 3, 2.23);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (49, 4, 4.26);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (49, 5, 1.43);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (49, 19);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (49, 55);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (49, 'weight', '5–14 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (49, 'lifespan', '8–13 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (50, 'Javan ferret-badger', 'Melogale orientalis', 'Helictidinae', 'Melogale', 'The Javan ferret-badger is a small mustelid endemic to the Indonesian islands of Java and Bali. It is a secretive, nocturnal animal found in various forest types.', 'They have partially webbed toes and specialized ridges on their foot pads that help them scramble through trees and bushes in the forests of Java and Bali.', '/Mustelids/javan_ferret_badger/assets/photo.webp', 'https://en.wikipedia.org/wiki/Javan_ferret-badger');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (50, 1, 3.22);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (50, 2, 2.35);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (50, 3, 2.66);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (50, 4, 3.06);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (50, 5, 2.72);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (50, 49);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (50, 52);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (50, 'weight', '1–2 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (50, 'lifespan', '5–8 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (51, 'Tayra', 'Eira barbara', 'Guloninae', 'Eira', 'The tayra is an omnivorous animal from the weasel family, native to the Americas. It is the only species in the genus Eira and is found from southern Mexico to northern Argentina and on the island of Trinidad.', 'They have been observed picking unripe plantains and hiding them to ripen, which may be evidence of future planning behavior.', '/Mustelids/tayra/assets/photo.webp', 'https://en.wikipedia.org/wiki/Tayra');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (51, 1, 3.83);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (51, 2, 2.05);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (51, 3, 1.62);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (51, 4, 3.89);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (51, 5, 2.97);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (51, 46);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (51, 53);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (51, 'weight', '2.7–8 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (51, 'lifespan', 'Unknown (Wild)');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (52, 'Greater hog badger', 'Arctonyx collaris', 'Melinae', 'Arctonyx', 'The greater hog badger is a mustelid native to Southeast Asia. It is listed as Vulnerable on the IUCN Red List because the population is thought to be declining due to habitat loss and hunting.', 'They are among the largest terrestrial mustelids and are capable of digging complex tunnel systems that serve as essential habitat for many other small animals.', '/Mustelids/greater_hog_badger/assets/photo.webp', 'https://en.wikipedia.org/wiki/Greater_hog_badger');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (52, 1, 3.15);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (52, 2, 3.03);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (52, 3, 1.18);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (52, 4, 4.33);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (52, 5, 4.94);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (52, 23);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (52, 25);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (52, 'weight', '7–14 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (52, 'lifespan', '8–12 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (53, 'Formosan ferret-badger', 'Melogale subaurantiaca', 'Helictidinae', 'Melogale', 'The Formosan ferret-badger is a species of mustelid endemic to the island of Taiwan. It is nocturnal and omnivorous, feeding on insects, earthworms, and fruit.', 'Once considered a subspecies of the Chinese ferret-badger, they were reclassified as a distinct species in 2019 following a genetic study.', '/Mustelids/formosan_ferret_badger/assets/photo.webp', 'https://en.wikipedia.org/wiki/Formosan_ferret-badger');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (53, 1, 3.46);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (53, 2, 3.65);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (53, 3, 1.68);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (53, 4, 3.25);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (53, 5, 4.38);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (53, 49);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (53, 52);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (53, 'weight', '< 2 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (53, 'lifespan', '< 10 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (54, 'European polecat', 'Mustela putorius', 'Mustelinae', 'Mustela', 'The European polecat, also known as the common forest polecat, is a species of mustelid native to western Eurasia and North Africa.', 'They are the wild ancestors of the domestic ferret and were once nicknamed ''chicken-cats'' due to their habit of raiding poultry coops.', '/Mustelids/european_polecat/assets/photo.webp', 'https://en.wikipedia.org/wiki/European_polecat');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (54, 1, 2.11);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (54, 2, 2.72);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (54, 3, 3.28);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (54, 4, 2.83);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (54, 5, 2.42);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (54, 15);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (54, 16);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (54, 'weight', '0.4–1.7 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (54, 'lifespan', '5–6 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (55, 'Black-footed ferret', 'Mustela nigripes', 'Mustelinae', 'Mustela', 'The black-footed ferret, also known as the American polecat or prairie dog hunter, is a species of mustelid native to central North America.', 'They were once thought to be extinct until a small population was rediscovered in Wyoming in 1981; all living individuals today descend from just seven ancestors.', '/Mustelids/black_footed_ferret/assets/photo.webp', 'https://en.wikipedia.org/wiki/Black-footed_ferret');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (55, 1, 1.25);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (55, 2, 3.22);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (55, 3, 2.35);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (55, 4, 2.8);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (55, 5, 3.22);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (55, 42);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (55, 'weight', '0.6–1.4 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (55, 'lifespan', '1–4 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (56, 'Northern hog badger', 'Arctonyx albogularis', 'Melinae', 'Arctonyx', 'The northern hog badger is a mustelid species native to South and East Asia. It was formerly considered a subspecies of the greater hog badger.', 'They have a highly sensitive, pig-like snout that they use to root through soil for earthworms and insects.', '/Mustelids/northern_hog_badger/assets/photo.webp', 'https://en.wikipedia.org/wiki/Northern_hog_badger');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (56, 1, 2.05);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (56, 2, 1.8);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (56, 3, 1.92);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (56, 4, 4.33);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (56, 5, 4.88);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (56, 21);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (56, 51);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (56, 'weight', '7–14 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (56, 'lifespan', '14 years (captivity)');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (57, 'Indonesian mountain weasel', 'Mustela lutreolina', 'Mustelinae', 'Mustela', 'The Indonesian mountain weasel is a species of weasel that lives on the islands of Java and Sumatra in Indonesia.', 'They are among the rarest weasels in the world, endemic to the high-altitude tropical rainforests of Java and Sumatra, and very few specimens have ever been studied.', '/Mustelids/indonesian_mountain_weasel/assets/photo.webp', 'https://en.wikipedia.org/wiki/Indonesian_mountain_weasel');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (57, 1, 2.97);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (57, 2, 5.0);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (57, 3, 3.15);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (57, 4, 2.05);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (57, 5, 4.57);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (57, 1);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (57, 20);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (57, 'weight', '0.29–0.34 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (57, 'lifespan', '7–10 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (58, 'Eurasian otter', 'Lutra lutra', 'Lutrinae', 'Lutra', 'The Eurasian otter, also known as the European otter, Eurasian river otter, common otter, or Old World otter, is a semiaquatic mammal native to Eurasia.', 'Their droppings, known as ''spraint'', have a surprisingly pleasant smell that is often compared to jasmine tea or mown hay.', '/Mustelids/eurasian_otter/assets/photo.webp', 'https://en.wikipedia.org/wiki/Eurasian_otter');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (58, 1, 4.57);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (58, 2, 2.23);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (58, 3, 2.17);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (58, 4, 4.26);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (58, 5, 2.05);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (58, 19);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (58, 55);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (58, 'weight', '7–12 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (58, 'lifespan', '3–4 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (59, 'Lesser grison', 'Galictis cuja', 'Ictonychinae', 'Galictis', 'The lesser grison is a species of mustelid found in South America. It is a small, slender animal with a long neck and short legs.', 'They have a habit of traveling in small family groups that move together in a single-file line through the undergrowth.', '/Mustelids/lesser_grison/assets/photo.webp', 'https://en.wikipedia.org/wiki/Lesser_grison');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (59, 1, 4.14);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (59, 2, 2.78);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (59, 3, 1.86);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (59, 4, 3.16);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (59, 5, 3.03);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (59, 46);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (59, 53);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (59, 'weight', '1–2.5 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (59, 'lifespan', '10+ years (captivity)');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (60, 'American badger', 'Taxidea taxus', 'Taxidiinae', 'Taxidea', 'The American badger is a North American badger, somewhat similar in appearance to the European badger, although not closely related. It is found in the western and central United States, northern Mexico, and south-central Canada to certain areas of southwestern British Columbia.', 'They occasionally hunt in short-term alliances with coyotes, where the badger digs prey out of burrows while the coyote catches any that escape to the surface.', '/Mustelids/american_badger/assets/photo.webp', 'https://en.wikipedia.org/wiki/American_badger');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (60, 1, 2.23);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (60, 2, 1.86);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (60, 3, 2.11);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (60, 4, 4.15);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (60, 5, 4.69);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (60, 34);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (60, 56);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (60, 'weight', '4–12 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (60, 'lifespan', '4–10 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (61, 'Asian small-clawed otter', 'Aonyx cinereus', 'Lutrinae', 'Aonyx', 'The Asian small-clawed otter, also known as the oriental small-clawed otter, is the smallest otter species in the world, native to South and Southeast Asia.', 'They are the smallest of all 13 otter species and form monogamous pairs that often stay together for life, with both parents helping to raise the pups.', '/Mustelids/asian_small_clawed_otter/assets/photo.webp', 'https://en.wikipedia.org/wiki/Asian_small-clawed_otter');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (61, 1, 3.95);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (61, 2, 1.92);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (61, 3, 3.09);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (61, 4, 3.57);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (61, 5, 1.62);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (61, 26);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (61, 37);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (61, 'weight', '1–5.5 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (61, 'lifespan', '10–16 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (62, 'Burmese ferret-badger', 'Melogale personata', 'Helictidinae', 'Melogale', 'The Burmese ferret-badger, also known as the large-toothed ferret-badger, is a species of mustelid found in Southeast Asia, from Nepal and northeastern India to Indochina.', 'Each individual has a unique pattern of black and white patches on its face, making them easy to identify from one another.', '/Mustelids/burmese_ferret_badger/assets/photo.webp', 'https://en.wikipedia.org/wiki/Burmese_ferret-badger');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (62, 1, 3.09);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (62, 2, 3.71);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (62, 3, 1.55);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (62, 4, 3.25);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (62, 5, 4.75);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (62, 49);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (62, 52);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (62, 'weight', '1–3 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (62, 'lifespan', '< 10 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (63, 'Domestic ferret', 'Mustela furo', 'Mustelinae', 'Mustela', 'The ferret is the domesticated form of the European polecat, a mammal belonging to the same genus as the weasel, Mustela, in the family Mustelidae.', 'The name ''ferret'' is derived from the Latin word furittus, meaning ''little thief'', referring to their habit of stealing and stashing small items.', '/Mustelids/domestic_ferret/assets/photo.webp', 'https://en.wikipedia.org/wiki/Ferret');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (63, 1, 1.37);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (63, 2, 2.48);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (63, 3, 3.22);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (63, 4, 2.95);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (63, 5, 2.85);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (63, 14);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (63, 'weight', '0.5–2.0 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (63, 'lifespan', '5–8 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (64, 'African striped weasel', 'Poecilogale albinucha', 'Ictonychinae', 'Poecilogale', 'The African striped weasel, also known as the white-naped weasel, is a small, burrowing mustelid native to sub-Saharan Africa.', 'They obtain almost all the water they need directly from the prey they consume and rarely drink standing water.', '/Mustelids/african_striped_weasel/assets/photo.webp', 'https://en.wikipedia.org/wiki/African_striped_weasel');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (64, 1, 2.42);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (64, 2, 4.14);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (64, 3, 1.74);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (64, 4, 2.03);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (64, 5, 3.52);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (64, 20);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (64, 22);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (64, 'weight', '0.23–0.38 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (64, 'lifespan', '5–6 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (65, 'Hairy-nosed otter', 'Lutra sumatrana', 'Lutrinae', 'Lutra', 'The hairy-nosed otter is an otter species native to Southeast Asia. It is one of the rarest and least-known otter species.', 'They are one of the world''s rarest otters and are named for their nose pad, which is completely covered in short velvety hair, unlike the naked noses of most other otters.', '/Mustelids/hairy_nosed_otter/assets/photo.webp', 'https://en.wikipedia.org/wiki/Hairy-nosed_otter');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (65, 1, 4.08);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (65, 2, 3.15);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (65, 3, 2.54);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (65, 4, 4.02);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (65, 5, 1.0);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (65, 45);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (65, 'weight', '5–8 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (65, 'lifespan', '10–12 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (66, 'Mountain weasel', 'Mustela altaica', 'Mustelinae', 'Mustela', 'The mountain weasel, also known as the pale weasel, Altai weasel or solongoi, primarily lives in high-altitude environments in Asia.', 'In parts of China, there have been reports of these elusive weasels acting surprisingly friendly and appearing tame when encountering people in tents.', '/Mustelids/mountain_weasel/assets/photo.webp', 'https://en.wikipedia.org/wiki/Mountain_weasel');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (66, 1, 1.18);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (66, 2, 4.57);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (66, 3, 4.45);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (66, 4, 1.86);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (66, 5, 2.6);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (66, 1);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (66, 20);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (66, 'weight', '0.12–0.35 kg');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (66, 'lifespan', '7–10 years');

    INSERT INTO Mustelids (id, common_name, scientific_name, subfamily, genus, description, fun_fact, image_url, wiki_url) VALUES (67, 'Cuddlebug', 'Lutra Bombacia', 'Lutrinae', 'Neogale', 'This is Cuddlebug. He loves you. <3', 'He twerk. :3', '/Mustelids/cuddlebug/assets/photo.webp', 'https://en.wikipedia.org/wiki/Colombian_weasel');
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (67, 1, 5);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (67, 2, 5);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (67, 3, 5);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (67, 4, 5);
    INSERT INTO MustelidTraits (mustelid_id, trait_id, value) VALUES (67, 5, 5);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (67, 6);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (67, 57);
    INSERT INTO MustelidHabitats (mustelid_id, habitat_id) VALUES (67, 58);
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (67, 'weight', 'Wait');
    INSERT INTO Stats (mustelid_id, stat_name, stat_value) VALUES (67, 'lifespan', '∞ years');

    COMMIT;
END;