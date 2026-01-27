-- USERS
INSERT INTO users (name, email) VALUES
('Ceren', 'ceren@example.com'),
('Dilara', 'dilara@example.com');

-- DESTINATIONS
INSERT INTO destinations (name, city, geom) VALUES
-- Ankara
('Kizilay Square', 'Ankara', ST_SetSRID(ST_MakePoint(32.8533, 39.9208), 4326)),
('Cankaya Park', 'Ankara', ST_SetSRID(ST_MakePoint(32.8670, 39.9040), 4326)),

-- Istanbul
('Taksim Square', 'Istanbul', ST_SetSRID(ST_MakePoint(28.9850, 41.0370), 4326)),
('Besiktas Coast', 'Istanbul', ST_SetSRID(ST_MakePoint(29.0250, 41.0430), 4326)),

-- Izmir
('Alsancak Coast', 'Izmir', ST_SetSRID(ST_MakePoint(27.1475, 38.4320), 4326)),
('Konak Square', 'Izmir', ST_SetSRID(ST_MakePoint(27.1287, 38.4192), 4326)),

-- Eskisehir
('Odunpazari Houses', 'Eskisehir', ST_SetSRID(ST_MakePoint(30.5206, 39.7667), 4326));

-- ACTIVITIES
INSERT INTO activities (destination_id, name, category, cost, geom) VALUES
-- Ankara activities
(1, 'Genclik Park Walk', 'nature', 0, ST_SetSRID(ST_MakePoint(32.8500, 39.9400), 4326)),
(2, 'Ankara Cafe Break', 'food', 60, ST_SetSRID(ST_MakePoint(32.8600, 39.9100), 4326)),

-- Istanbul activities
(3, 'Taksim Street Tour', 'culture', 0, ST_SetSRID(ST_MakePoint(28.9860, 41.0360), 4326)),
(4, 'Besiktas Breakfast', 'food', 120, ST_SetSRID(ST_MakePoint(29.0230, 41.0420), 4326)),

-- Izmir activities
(5, 'Alsancak Sunset Walk', 'nature', 0, ST_SetSRID(ST_MakePoint(27.1480, 38.4330), 4326)),
(6, 'Konak Clock Tower Visit', 'culture', 0, ST_SetSRID(ST_MakePoint(27.1289, 38.4194), 4326)),

-- Eskisehir activity 
(7, 'Odunpazari Art Walk', 'culture', 50, ST_SetSRID(ST_MakePoint(30.5210, 39.7670), 4326));

-- ITINERARIES
INSERT INTO itineraries (user_id, destination_id, day_number, total_cost) VALUES
(1, 1, 1, 80),
(1, 2, 2, 200);
