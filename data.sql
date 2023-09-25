/* Populate database with sample data. */

INSERT INTO animals (name) VALUES ('Luna');
INSERT INTO animals (name) VALUES ('Daisy');
INSERT INTO animals (name) VALUES ('Charlie');

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)VALUES ('Agumon','2020-12-03',0,true,10.23);

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)VALUES ('Gabumon','2018-11-15',2,true,8);

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)VALUES ('Pikachu','2021-01-07',1,false,15.04);

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)VALUES ('Charmander','2020-02-08',0,false,-11),
('Plantmon','2021-11-15',2,true,-5.7),
('Squirtle','1993-04-02',3,false,-12.13),
('Angemon','2005-06-12',1,true,-45),
('Boarmon','2005-06-07',7,true,20.4),
('Blossom','1998-10-13',3,true,17),
('Ditto','2022-05-14',4,true,22);

  INSERT INTO species (name) VALUES
('Pokemon'),('Digimon');

UPDATE animals
SET species_id = (
  CASE 
    WHEN name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
    ELSE (SELECT id FROM species WHERE name = 'Pokemon')
  END
);

UPDATE animals
SET owner_id = (
  SELECT id FROM owners 
  WHERE full_name = 'Sam Smith'
)
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = (
  SELECT id FROM owners 
  WHERE full_name = 'Jennifer Orwell'
)
WHERE name IN ('Gabumon','Pikachu');

UPDATE animals
SET owner_id = (
  SELECT id FROM owners 
  WHERE full_name = 'Bob'
)
WHERE name IN ('Devimon','Plantmon');

UPDATE animals
SET owner_id = (
  SELECT id FROM owners 
  WHERE full_name = 'Melody Pond'
)
WHERE name IN ('Charmander','Squirtle','Blossom');

UPDATE animals
SET owner_id = (
  SELECT id FROM owners 
  WHERE full_name = 'Dean Winchester'
)
WHERE name IN ('Angemon','Boarmon');

-- Day 4

INSERT INTO vets (name, age, date_of_graduation)
VALUES
  ('William Tatcher', 45, '2000-04-23'),
  ('Maisy Smith', 26, '2019-01-17'),
  ('Stephanie Mendez', 64, '1981-05-04'),
  ('Jack Harkness', 38, '2008-06-08');

  INSERT INTO specializations (vet_id, species_id)
VALUES
  (1, 1),  -- William Tatcher specialized in Pokemon
  (3, 2),  -- Stephanie Mendez specialized in Digimon
  (3, 1),  -- Stephanie Mendez specialized in Pokemon
  (4, 2);  -- Jack Harkness specialized in Digimon

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES
  (1, 1, '2020-05-24'),     -- Agumon visited William Tatcher
  (1, 3, '2020-07-22'),     -- Agumon visited Stephanie Mendez
  (2, 4, '2021-02-02'),     -- Gabumon visited Jack Harkness
  (3, 2, '2020-01-05'),     -- Pikachu visited Maisy Smith
  (3, 2, '2020-03-08'),     -- Pikachu visited Maisy Smith
  (3, 2, '2020-05-14'),     -- Pikachu visited Maisy Smith
  (4, 3, '2021-05-04'),     -- Devimon visited Stephanie Mendez
  (5, 4, '2021-02-24'),     -- Charmander visited Jack Harkness
  (6, 2, '2019-12-21'),     -- Plantmon visited Maisy Smith
  (6, 1, '2020-08-10'),     -- Plantmon visited William Tatcher
  (6, 2, '2021-04-07'),     -- Plantmon visited Maisy Smith
  (7, 3, '2019-09-29'),     -- Squirtle visited Stephanie Mendez
  (8, 4, '2020-10-03'),     -- Angemon visited Jack Harkness
  (8, 4, '2020-11-04'),     -- Angemon visited Jack Harkness
  (9, 2, '2019-01-24'),     -- Boarmon visited Maisy Smith
  (9, 2, '2019-05-15'),     -- Boarmon visited Maisy Smith
  (9, 2, '2020-02-27'),     -- Boarmon visited Maisy Smith
  (9, 2, '2020-08-03'),     -- Boarmon visited Maisy Smith
  (10, 3, '2020-05-24'),    -- Blossom visited Stephanie Mendez
  (10, 1, '2021-01-11');    -- Blossom visited William Tatcher


SELECT * FROM animals;

explain analyze SELECT COUNT(*) FROM visits where animal_id = 4

EXPLAIN ANALYZE
SELECT * FROM owners where email = 'owner_18327@mail.com';
SELECT * FROM visits where vet_id = 2;
SELECT COUNT(*) FROM visits where animal_id = 4;

CREATE INDEX idx_owners_email ON owners (email);