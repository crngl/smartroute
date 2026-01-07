-- USERS
INSERT INTO users (name, email) VALUES
('Ceren', 'ceren@example.com'),
('Dilara', 'dilara@example.com');

-- DESTINATIONS
INSERT INTO destinations (name, city, geom) VALUES
('Ankara Center', 'Ankara', ST_SetSRID(ST_MakePoint(32.8597, 39.9334), 4326)),
('Istanbul Center', 'Istanbul', ST_SetSRID(ST_MakePoint(28.9784, 41.0082), 4326)),
('Izmir Center', 'Izmir', ST_SetSRID(ST_MakePoint(27.1428, 38.4237), 4326));

-- ACTIVITIES
INSERT INTO activities (destination_id, name, category, cost, geom) VALUES
(1, 'Anıtkabir Visit', 'culture', 0, ST_SetSRID(ST_MakePoint(32.8597, 39.9250), 4326)),
(1, 'Museum of Anatolian Civilizations', 'culture', 80, ST_SetSRID(ST_MakePoint(32.8642, 39.9389), 4326)),
(2, 'Galata Tower', 'culture', 200, ST_SetSRID(ST_MakePoint(28.9744, 41.0256), 4326)),
(3, 'Kordon Walk', 'nature', 0, ST_SetSRID(ST_MakePoint(27.1384, 38.4324), 4326));

-- ITINERARIES
INSERT INTO itineraries (user_id, destination_id, day_number, total_cost) VALUES
(1, 1, 1, 80),
(1, 2, 2, 200);
