# MustelidSelector2000

## What?

A GUI application in which a user interacts with a series of sliders to determine which mustelid is displayed on the screen (queued picture, along with scientific name, common name, fun fact, traits, habitat, etc.)

The sliders consist of the following:

noodle - dog (proportions)
little - big (relative to other mustelidae)
arid - aquatic (habitat biome)
sillay - serious
stubby snoot - long snoot

Each slider will have a slidable integer value.

## Why?

My friend really likes mustelids so I thought it would be funny to make this app for them, but if you *must* know the professional reason behind the advancement in mustelids-related data infrastructure, I chose this project because it provides the opportunity to create a performant backend with a verifiably adorable frontend. Furthermore, the ability to lazily load and prewarm objects in the frontend is a technical goal for this project, to make sure mustelid delivery is nice and snappy. **My point is... Dolphins. That's my point.**

## GUI

The GUI will be based on my MinimalBarUX, which is designed for accessibility, minimalism, and coziness.

##### AiboStation Holograms

![[Screenshot 2026-04-08 at 7.43.26 1.png]]

##### LaserStation

![[Screenshot 2026-04-08 at 8.02.15.png]]

##### Sillyboard

![[Screenshot 2026-04-08 at 8.04.33.png]]

## Database Design (3NF)

This design ensures the application remains performant and easily extensible while adhering to Third Normal Form (3NF) to avoid redundancies.

### Core Entities

#### Mustelids
- **id** (PK): Unique identifier for each species.
- **common_name**: The primary name (e.g., "Sea Otter").
- **scientific_name**: The Latin name.
- **description**: General overview.
- **image_url**: Path to the mustelid's photo.

#### Traits
Defines what each slider represents. UI labels like "noodle" or "dog" are handled by the frontend, while the DB stores the underlying trait category.
- **id** (PK)
- **name**: (e.g. "proportions", "size", "temperament", "snout_length", "aquatic_index")
- **min_value**: (default 1)
- **max_value**: (default 5)

#### MustelidTraits (Junction Table)
Stores the actual slider values for each mustelid.
- **mustelid_id** (FK, PK)
- **trait_id** (FK, PK)
- **value**: (INTEGER 1–5)
- *Constraint: value BETWEEN 1 AND 5*

#### Habitats
Categorical biomes where mustelids reside.
- **id** (PK)
- **name**: (e.g. forest, river, desert, tundra)

#### MustelidHabitats (Junction Table)
- **mustelid_id** (FK, PK)
- **habitat_id** (FK, PK)

#### Stats
- **id** (PK)
- **mustelid_id** (FK)
- **stat_name**: (e.g. "lifespan", "weight")
- **stat_value**: (TEXT or numeric)

---

### How the Selector Works

The selector uses a nearest-neighbor matching logic based on the 1–5 integer scale:

1. **User Input**: The user provides a set of preferred values for each trait.
2. **Matching Logic**: The system calculates the absolute difference between the user's input and each mustelid's stored trait values.
3. **Query**:
   ```sql
   SELECT m.id, m.common_name,
          SUM(ABS(mt.value - :input_value)) AS score
   FROM Mustelids m
   JOIN MustelidTraits mt ON m.id = mt.mustelid_id
   JOIN Traits t ON mt.trait_id = t.id
   GROUP BY m.id
   ORDER BY score ASC
   LIMIT 1;
   ```
4. **Result**: The mustelid with the lowest score (the closest match) is displayed.

---

### Design Rationale

- **3NF Compliance**: By using junction tables for Traits and Habitats, we avoid repeating groups and ensure every non-key attribute is dependent only on the primary key.
- **Redundancy Control**: Habitats are categorical (where they live), while the `aquatic_index` trait handles the "arid vs aquatic" slider logic, allowing for both realism (otters living in rivers AND coasts) and smooth slider interaction.
- **Extensibility**: New traits or stats can be added as rows in their respective tables without altering the core schema.
