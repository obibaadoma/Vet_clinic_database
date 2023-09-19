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

