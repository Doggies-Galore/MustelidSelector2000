CREATE TABLE Mustelids (
    id              INTEGER      PRIMARY KEY,
    common_name     VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(150) NOT NULL,
    subfamily       VARCHAR(100),
    genus           VARCHAR(100),
    description     TEXT,
    fun_fact        TEXT,
    image_url       TEXT,
    wiki_url        TEXT
);

CREATE TABLE Traits (
    id   INTEGER      PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE MustelidTraits (
    mustelid_id INTEGER NOT NULL REFERENCES Mustelids(id) ON DELETE CASCADE ON UPDATE CASCADE,
    trait_id    INTEGER NOT NULL REFERENCES Traits(id) ON DELETE CASCADE ON UPDATE CASCADE,
    value       REAL    NOT NULL CHECK (value BETWEEN 1.0 AND 5.0),
    PRIMARY KEY (mustelid_id, trait_id)
);

CREATE TABLE Habitats (
    id   INTEGER      PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE MustelidHabitats (
    mustelid_id INTEGER NOT NULL REFERENCES Mustelids(id) ON DELETE CASCADE ON UPDATE CASCADE,
    habitat_id  INTEGER NOT NULL REFERENCES Habitats(id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (mustelid_id, habitat_id)
);

CREATE TABLE Stats (
    id          INT          AUTO_INCREMENT PRIMARY KEY,
    mustelid_id INTEGER      NOT NULL REFERENCES Mustelids(id) ON DELETE CASCADE ON UPDATE CASCADE,
    stat_name   VARCHAR(100) NOT NULL,
    stat_value  TEXT         NOT NULL
);