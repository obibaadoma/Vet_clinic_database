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


