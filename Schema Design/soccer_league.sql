-- from the terminal run:
-- psql < soccer_league.sql

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    city TEXT NOT NULL,
    stadium TEXT NOT NULL,
    mascot TEXT
);

CREATE TABLE players(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams(id) ON DELETE SET NULL,
    back_number INTEGER NOT NULL,
    birthday DATE NOT NULL,
    nationality TEXT NOT NULL,
    weight INTEGER NOT NULL,
    height INTEGER NOT NULL
);

CREATE TABLE referees(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE season(
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE match(
    id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    hometeam_id INTEGER REFERENCES teams(id) ON DELETE SET NULL,
    awayteam_id INTEGER REFERENCES teams(id) ON DELETE SET NULL,
    season_id INTEGER REFERENCES season(id) ON DELETE SET NULL,
    main_ref_id INTEGER REFERENCES referees(id) ON DELETE SET NULL,
    ass_ref1_idINTEGER REFERENCES referees(id) ON DELETE SET NULL,
    ass_ref2_idINTEGER REFERENCES referees(id) ON DELETE SET NULL
);

CREATE TABLE goals(
    id SERIAL PRIMARY KEY,
    match_id INTEGER REFERENCES match(id) ON DELETE CASCADE,
    players_id INTEGER REFERENCES players(id) ON DELETE CASCADE
);

CREATE TABLE result(
    id SERIAL PRIMARY KEY,
    score NOT NULL,
    match_id INTEGER REFERENCES match(id) ON DELETE CASCADE,
    hometeam_id INTEGER REFERENCES teams(id) ON DELETE SET NULL,
    awayteam_id INTEGER REFERENCES teams(id) ON DELETE SET NULL
);

CREATE TABLE standing(
    team_id INTEGER REFERENCES match(id) ON DELETE CASCADE,
    ranking INTEGER DEFAULT 0,
    wins INTEGER DEFAULT 0,
    losses INTEGER DEFAULT 0,
    draws INTEGER DEFAULT 0
);