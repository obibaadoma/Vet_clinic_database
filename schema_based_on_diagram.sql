-- Create the patients table
CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(45) NULL,
    date_of_birth DATE NULL
);

-- Create the treatments table
CREATE TABLE treatments (
    id SERIAL PRIMARY KEY,
    type VARCHAR(45) NULL,
    quantity INTEGER NULL,
    name VARCHAR(45) NULL
);

-- Create the medical_histories table
CREATE TABLE medical_histories (
    id SERIAL PRIMARY KEY,
    admitted_at TIMESTAMP NULL,
    patient_id INTEGER NULL,
    status VARCHAR(45) NULL,
    CONSTRAINT fk_medical_histories_patient
        FOREIGN KEY (patient_id) REFERENCES patients (id)
);

-- Create the junction table to represent the many-to-many relationship
CREATE TABLE medical_history_treatments (
    medical_history_id INTEGER,
    treatment_id INTEGER,
    PRIMARY KEY (medical_history_id, treatment_id),
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id),
    FOREIGN KEY (treatment_id) REFERENCES treatments (id)
);

-- Create the invoices table
CREATE TABLE invoices (
    id SERIAL PRIMARY KEY,
    total_amount DECIMAL(8, 2) NULL,
    generated_at TIMESTAMP NULL,
    payed_at TIMESTAMP NULL,
    medical_history_id INTEGER NULL,
    CONSTRAINT fk_invoices_medical_history
        FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id)
);

-- Create the invoices_items table
CREATE TABLE invoices_items (
    id SERIAL PRIMARY KEY,
    unit_price DECIMAL(8, 2) NULL,
    quantity INTEGER NULL,
    total_price DECIMAL(8, 2) NULL,
    invoice_id INTEGER NULL,
    treatment_id INTEGER NULL,
    CONSTRAINT fk_invoices_items_invoice
        FOREIGN KEY (invoice_id) REFERENCES invoices (id)
);

CREATE INDEX ON medical_histories (patient_id);
CREATE INDEX ON invoices (medical_history_id);
CREATE INDEX ON invoices_items (invoice_id);
CREATE INDEX ON invoices_items (treatment_id);
CREATE INDEX ON medical_history_treatments (medical_history_id);
CREATE INDEX ON medical_history_treatments (treatment_id);

ALTER TABLE treatments
DROP COLUMN quantity;


SELECT * FROM treatments;
SELECT * FROM species;