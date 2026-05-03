SELECT m.common_name, m.scientific_name, m.genus, m.description,
       (COALESCE(ABS(t1.value - %s), 5.0) + 
        COALESCE(ABS(t2.value - %s), 5.0) + 
        COALESCE(ABS(t3.value - %s), 5.0) + 
        COALESCE(ABS(t4.value - %s), 5.0) + 
        COALESCE(ABS(t5.value - %s), 5.0)) as total_diff
FROM Mustelids m
LEFT JOIN (SELECT mustelid_id, value FROM MustelidTraits mt JOIN Traits t ON mt.trait_id = t.id WHERE t.name = 'biome') t1 ON m.id = t1.mustelid_id
LEFT JOIN (SELECT mustelid_id, value FROM MustelidTraits mt JOIN Traits t ON mt.trait_id = t.id WHERE t.name = 'noodle') t2 ON m.id = t2.mustelid_id
LEFT JOIN (SELECT mustelid_id, value FROM MustelidTraits mt JOIN Traits t ON mt.trait_id = t.id WHERE t.name = 'sillay') t3 ON m.id = t3.mustelid_id
LEFT JOIN (SELECT mustelid_id, value FROM MustelidTraits mt JOIN Traits t ON mt.trait_id = t.id WHERE t.name = 'size') t4 ON m.id = t4.mustelid_id
LEFT JOIN (SELECT mustelid_id, value FROM MustelidTraits mt JOIN Traits t ON mt.trait_id = t.id WHERE t.name = 'snoot') t5 ON m.id = t5.mustelid_id
ORDER BY total_diff ASC, m.common_name ASC
LIMIT 1;
