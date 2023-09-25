/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';

SELECT * FROM animals WHERE name LIKE '%mon';

SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = TRUE;

SELECT * FROM animals WHERE name <> 'Gabumon';

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL OR species = 'null';
COMMIT;

BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';

BEGIN;
SAVEPOINT my_savepoint;

BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

  BEGIN;
    DELETE FROM animals WHERE  date_of_birth > '2022/01/01' ;
    SAVEPOINT SP1;
    UPDATE animals SET weight_kg = weight_kg * -1; 
    ROLLBACK TO SP1;
    UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0; 
    COMMIT;

SELECT COUNT(*) AS animal_count
FROM animals;

SELECT COUNT(*) AS animal_count
FROM animals
WHERE escape_attempts < 1;

SELECT AVG(weight_kg) AS average_weight
FROM animals;

SELECT MAX(escape_attempts)
FROM animals;

SELECT neutered,
       MIN(weight_kg) AS min_weight,
       MAX(weight_kg) AS max_weight
FROM animals
GROUP BY neutered;

SELECT neutered,
       AVG(escape_attempts) AS average_escape_attempts
FROM animals
WHERE date_of_birth >= '1990-01-01' AND date_of_birth <= '2000-12-31'
GROUP BY neutered;

--  day 3
 SELECT *
  FROM species s
  JOIN animals a ON a.owner_id = s.id;

  SELECT * 
FROM animals AS a
JOIN species AS s ON a.species_id = s.id
WHERE s.id = 1;

SELECT full_name, name
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id;

SELECT species.name, COUNT(animals.id) AS count
FROM species
JOIN animals ON species.id = animals.species_id
GROUP BY species.name;

SELECT animals.name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Jennifer Orwell';

SELECT animals.name, owners.full_name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester'
AND animals.escape_attempts = 0;

SELECT owners.full_name, COUNT(animals.id) AS count
FROM owners
JOIN animals ON owners.id = animals.owner_id
GROUP BY owners.full_name
ORDER BY count DESC
LIMIT 1;

-- Day 4

SELECT a.*
FROM animals a
JOIN visits v ON a.id = v.animal_id
JOIN vets vt ON v.vet_id = vt.id
WHERE vt.name = 'William Tatcher'
ORDER BY v.date_of_visit DESC
LIMIT 1;

SELECT COUNT(DISTINCT a.id)
FROM animals a
JOIN visits v ON a.id = v.animal_id
JOIN vets vt ON v.vet_id = vt.id
WHERE vt.name = 'Stephanie Mendez';

SELECT vt.name AS vet_name, array_agg(s.name) AS specialties
FROM vets vt
LEFT JOIN specializations sp ON vt.id = sp.vet_id
LEFT JOIN species s ON sp.species_id = s.id
GROUP BY vt.name;

SELECT a.*
FROM animals a
JOIN visits v ON a.id = v.animal_id
JOIN vets vt ON v.vet_id = vt.id
WHERE vt.name = 'Stephanie Mendez'
AND v.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

SELECT a.id AS animal_id, a.name AS animal_name, COUNT(v.animal_id) AS visit_count
FROM animals a
JOIN visits v ON a.id = v.animal_id
GROUP BY a.id, a.name
ORDER BY visit_count DESC
LIMIT 1;

SELECT a.*, v.date_of_visit
FROM animals a
JOIN visits v ON a.id = v.animal_id
JOIN vets vt ON v.vet_id = vt.id
WHERE vt.name = 'Maisy Smith'
ORDER BY v.date_of_visit ASC
LIMIT 1;

SELECT a.*, vt.name AS vet_name, v.date_of_visit
FROM animals a
JOIN visits v ON a.id = v.animal_id
JOIN vets vt ON v.vet_id = vt.id
ORDER BY v.date_of_visit DESC
LIMIT 1;

SELECT a.*, vt.name AS vet_name
FROM animals a
JOIN visits v ON a.id = v.animal_id
JOIN vets vt ON v.vet_id = vt.id
LEFT JOIN specializations sp ON vt.id = sp.vet_id AND a.species_id = sp.species_id
WHERE sp.species_id IS NULL;

SELECT s.name AS recommended_specialty
FROM (
    SELECT a.species_id, COUNT(*) AS visit_count
    FROM animals a
    JOIN visits v ON a.id = v.animal_id
    JOIN vets vt ON v.vet_id = vt.id
    WHERE vt.name = 'Maisy Smith'
    GROUP BY a.species_id
    ORDER BY visit_count DESC
    LIMIT 1
) AS most_visited_species
JOIN species s ON most_visited_species.species_id = s.id;

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

SELECT * FROM owners;
SELECT * FROM visits;

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, visit_date) 
SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

explain analyze SELECT COUNT(*) FROM visits where animal_id = 4

EXPLAIN ANALYZE
SELECT * FROM owners where email = 'owner_18327@mail.com';
SELECT * FROM visits where vet_id = 2;
SELECT COUNT(*) FROM visits where animal_id = 4;

CREATE INDEX idx_owners_email ON owners (email);

SELECT * FROM owners;
