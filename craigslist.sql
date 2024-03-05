-- from the terminal run:
-- psql < craigslist.sql

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE region(
  id SERIAL PRIMARY KEY,
  cityname VARCHAR(20) NOT NULL  
);

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  username VARCHAR(15) NOT NULL,
  password VARCHAR(20) NOT NULL,
  preferred_region_id INTEGER REFERENCES region(id) ON DELETE CASCADE
);

CREATE TABLE category(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE post(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  text TEXT NOT NULL,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  region_id INTEGER REFERENCES region(id) ON DELETE CASCADE,
  category_id INTEGER REFERENCES category(id) ON DELETE CASCADE
);