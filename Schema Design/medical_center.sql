-- from the terminal run:
-- psql < medical_center.sql

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  department TEXT NOT NULL
);

CREATE TABLE patient(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  birthday DATE NOT NULL,
  insurance TEXT NOT NULL,
  medical_record_number INTEGER NOT NULL
);

CREATE TABLE visit(
  id SERIAL PRIMARY KEY,
  visit_date DATE NOT NULL,
  doctor_id INTEGER REFERENCES doctors(id) ON DELETE CASCADE,
  patient_id INTEGER REFERENCES patient(id) ON DELETE CASCADE
);

CREATE TABLE diseases(
  id SERIAL PRIMARY KEY,
  name TEXT,
  description TEXT,
  is_chronic BOOLEAN
);

CREATE TABLE diagnoses(
  id SERIAL PRIMARY KEY,
  visit_id INTEGER REFERENCES visit(id) ON DELETE CASCADE,
  disease_id INTEGER REFERENCES diseases(id) ON DELETE CASCADE,
  doctor_note TEXT
);

