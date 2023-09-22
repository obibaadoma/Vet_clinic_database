/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id integer ,
    name text,
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal
);

ALTER TABLE animals
ADD COLUMN species VARCHAR(255);

--  day 3
CREATE TABLE owners(
   id INTEGER PRIMARY KEY,
   full_name VARCHAR(50),
   age INTEGER);

   CREATE TABLE species(
   id INTEGER PRIMARY KEY,
   name VARCHAR(50)
);

UPDATE animals
SET id = floor(random() * (100 - 1 + 1) + 1)
WHERE id IS NULL;

ALTER TABLE animals
ADD COLUMN new_id SERIAL PRIMARY KEY;

UPDATE animals
SET new_id = id;

ALTER TABLE animals
DROP COLUMN id;

ALTER TABLE animals
RENAME COLUMN new_id TO id;

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id INTEGER;


ALTER TABLE animals
ADD CONSTRAINT fk_species_id
  FOREIGN KEY (species_id)
  REFERENCES species (id);

  ALTER TABLE animals
ADD COLUMN owner_id INTEGER;


ALTER TABLE animals
ADD CONSTRAINT fk_owner_id
  FOREIGN KEY (owner_id)
  REFERENCES owners (id);

CREATE TABLE specializations (
  vet_id INTEGER,
  species_id INTEGER,
  PRIMARY KEY (vet_id, species_id),
  FOREIGN KEY (vet_id) REFERENCES vets (id),
  FOREIGN KEY (species_id) REFERENCES species (id)
);

CREATE TABLE visits (
  visit_id SERIAL PRIMARY KEY,
  animal_id INTEGER,
  vet_id INTEGER,
  visit_date DATE,
  FOREIGN KEY (animal_id) REFERENCES animals (id),
  FOREIGN KEY (vet_id) REFERENCES vets (id)
);

 INSERT INTO VETS (name,age,date_of_graduation) VALUES 
 ('Maisy Smith','26','2019-01-17'),
 ('Stephanie Mendez','64','1981-05-14'),
 ('Jack Harkness','38','2008-06-08');

 INSERT INTO specializations (vet_id, species_id)
VALUES (
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 
  -- Replace with the correct vet's name
  (SELECT id FROM species WHERE name = 'Digimon') 
  -- Replace with the correct species name
);

-- Insert specialization for Pokemon
INSERT INTO specializations (vet_id, species_id)
VALUES (
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 
  -- Replace with the correct vet's name
  (SELECT id FROM species WHERE name = 'Pokemon')
   -- Replace with the correct species name
);
