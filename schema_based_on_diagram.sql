/* Database schema to keep the structure of entire database. */

CREATE DATABASE clinic;

CREATE TABLE patients (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    PRIMARY KEY(id)
);


CREATE TABLE medical_histories (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP NOT NULL,
    status VARCHAR(50) NOT NULL,
    patient_id INT,
    CONSTRAINT fk_patient FOREIGN KEY(patient_id) REFERENCES patients (id),
    PRIMARY KEY (id)
);

CREATE TABLE invoices (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL NOT NULL,
    generated_at TIMESTAMP NOT NULL,
    payed_at TIMESTAMP NOT NULL,
    medical_history_id INT,
    CONSTRAINT fk_medical_history FOREIGN KEY(medical_history_id) REFERENCES medical_histories (id),
    PRIMARY KEY (id)
);

CREATE TABLE treatments (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    type VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY(id)
);

