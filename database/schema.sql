-- Enable PostGIS
CREATE EXTENSION IF NOT EXISTS postgis;

-- USERS
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL
);

-- DESTINATIONS
CREATE TABLE destinations (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    city TEXT NOT NULL,
    geom GEOMETRY(Point, 4326)
);

-- ACTIVITIES
CREATE TABLE activities (
    id SERIAL PRIMARY KEY,
    destination_id INTEGER REFERENCES destinations(id),
    name TEXT NOT NULL,
    category TEXT,
    cost NUMERIC,
    geom GEOMETRY(Point, 4326)
);

-- ITINERARIES
CREATE TABLE itineraries (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    destination_id INTEGER REFERENCES destinations(id),
    day_number INTEGER,
    total_cost NUMERIC
);
