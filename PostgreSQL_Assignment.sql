-- Active: 1747721142584@@localhost@5432@conservation_db
-- Active: 1747721142584@@localhost@5432@conservation_db
CREATE TABLE rangers(
    ranger_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    region TEXT NOT NULL
);

INSERT INTO rangers(name,region)VALUES
('Alice Green',' Northern Hills'),
('Bob White','River Delta'),
('Carol King','Mountain Range');

SELECT * FROM rangers;

CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name TEXT NOT NULL,
    scientific_name TEXT NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status TEXT NOT NULL
);

INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');


SELECT * FROM species;

CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    species_id INT NOT NULL,
    ranger_id INT NOT NULL,
    location TEXT NOT NULL,
    sighting_time TIMESTAMP NOT NULL,
    notes TEXT,

    FOREIGN KEY (species_id) REFERENCES species(species_id),
    FOREIGN KEY (ranger_id) REFERENCES rangers(ranger_id)
);

INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 'Peak Ridge',        '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area',     '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass',     '2024-05-18 18:30:00', NULL);


SELECT * FROM sightings;


-- problem-1
INSERT INTO rangers(name,region)VALUES
('Derek Fox','Coastal Plains');


-- problem-2
SELECT COUNT(DISTINCT species_id) AS unique_species_count FROM sightings;


-- problem-3
SELECT * from sightings WHERE location LIKE '%Pass%';


-- problem-4
SELECT r.name,COUNT(s.sighting_id) AS total_sightings FROM rangers r
 JOIN sightings s ON r.ranger_id = s.ranger_id
GROUP BY r.name;


-- problem-5
SELECT common_name FROM species WHERE species_id NOT IN(SELECT DISTINCT species_id FROM sightings);

-- problem-6
SELECT sp.common_name, s.sighting_time, r.name
FROM sightings s
JOIN species sp ON s.species_id = sp.species_id
JOIN rangers r ON s.ranger_id = r.ranger_id
ORDER BY s.sighting_time DESC
LIMIT 2;


-- problem-7
UPDATE species 
SET conservation_status ='Historic' WHERE discovery_date<'1800-01-01';


-- problem-8
SELECT sighting_id,
    CASE
        WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        WHEN EXTRACT(HOUR FROM sighting_time)> 17 THEN 'Evening' 
    END AS time_of_day
FROM sightings;

-- problem-9

DELETE FROM rangers 
WHERE ranger_id NOT IN (
    SELECT DISTINCT ranger_id FROM sightings
); 