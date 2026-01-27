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
('Odunpazari Houses', 'Eskisehir', ST_SetSRID(ST_MakePoint(30.5206, 39.7667), 4326)),

-- Antalya
('Konyaalti Beach', 'Antalya', ST_SetSRID(ST_MakePoint(30.6370, 36.8600), 4326)),
('Kaleici Old Town', 'Antalya', ST_SetSRID(ST_MakePoint(30.7030, 36.8850), 4326)),

-- Bursa
('Uludag National Park', 'Bursa', ST_SetSRID(ST_MakePoint(29.2210, 40.0690), 4326)),
('Cumalikizik Village', 'Bursa', ST_SetSRID(ST_MakePoint(29.1870, 40.1880), 4326)),

-- Cappadocia
('Goreme Open Air Museum', 'Nevsehir', ST_SetSRID(ST_MakePoint(34.8500, 38.6430), 4326)),
('Uchisar Castle', 'Nevsehir', ST_SetSRID(ST_MakePoint(34.8050, 38.6300), 4326)),

-- Trabzon
('Sumela Monastery', 'Trabzon', ST_SetSRID(ST_MakePoint(39.6550, 40.6900), 4326)),
('Uzungol', 'Trabzon', ST_SetSRID(ST_MakePoint(40.2870, 40.6200), 4326)),

-- Mugla
('Oludeniz Beach', 'Mugla', ST_SetSRID(ST_MakePoint(29.1210, 36.5490), 4326)),
('Bodrum Castle', 'Mugla', ST_SetSRID(ST_MakePoint(27.4300, 37.0340), 4326)),

-- Canakkale
('Troy Ancient City', 'Canakkale', ST_SetSRID(ST_MakePoint(26.2410, 39.9570), 4326)),

-- Gaziantep
('Zeugma Mosaic Museum', 'Gaziantep', ST_SetSRID(ST_MakePoint(37.3780, 37.0660), 4326)),

-- Mardin
('Mardin Old City', 'Mardin', ST_SetSRID(ST_MakePoint(40.7350, 37.3130), 4326)),

-- Rize
('Ayder Plateau', 'Rize', ST_SetSRID(ST_MakePoint(40.9500, 40.8570), 4326));


-- ACTIVITIES
INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Genclik Park Walk', 'nature', 0,
       ST_SetSRID(ST_MakePoint(32.8500, 39.9400), 4326)
FROM destinations WHERE name = 'Kizilay Square';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Ankara Cafe Break', 'food', 60,
       ST_SetSRID(ST_MakePoint(32.8600, 39.9100), 4326)
FROM destinations WHERE name = 'Cankaya Park';

-- Istanbul activities
INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Taksim Street Tour', 'culture', 0,
       ST_SetSRID(ST_MakePoint(28.9860, 41.0360), 4326)
FROM destinations WHERE name = 'Taksim Square';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Besiktas Breakfast', 'food', 120,
       ST_SetSRID(ST_MakePoint(29.0230, 41.0420), 4326)
FROM destinations WHERE name = 'Besiktas Coast';

-- Izmir activities
INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Alsancak Sunset Walk', 'nature', 0,
       ST_SetSRID(ST_MakePoint(27.1480, 38.4330), 4326)
FROM destinations WHERE name = 'Alsancak Coast';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Konak Clock Tower Visit', 'culture', 0,
       ST_SetSRID(ST_MakePoint(27.1289, 38.4194), 4326)
FROM destinations WHERE name = 'Konak Square';

-- Eskisehir activity
INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Odunpazari Art Walk', 'culture', 50,
       ST_SetSRID(ST_MakePoint(30.5210, 39.7670), 4326)
FROM destinations WHERE name = 'Odunpazari Houses';

-- Antalya activities
INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Beach Walk', 'nature', 0,
       ST_SetSRID(ST_MakePoint(30.6400, 36.8610), 4326)
FROM destinations WHERE name = 'Konyaalti Beach';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Old Town Cafe', 'food', 80,
       ST_SetSRID(ST_MakePoint(30.7040, 36.8840), 4326)
FROM destinations WHERE name = 'Kaleici Old Town';

-- Bursa activities
INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Mountain Hiking', 'nature', 0,
       ST_SetSRID(ST_MakePoint(29.2230, 40.0700), 4326)
FROM destinations WHERE name = 'Uludag National Park';

-- Cappadocia activities
INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Hot Air Balloon Watching', 'culture', 250,
       ST_SetSRID(ST_MakePoint(34.8505, 38.6435), 4326)
FROM destinations WHERE name = 'Goreme Open Air Museum';

-- Trabzon activities
INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Lake Walk', 'nature', 0,
       ST_SetSRID(ST_MakePoint(40.2875, 40.6210), 4326)
FROM destinations WHERE name = 'Uzungol';

-- Mugla activities
INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Sunset Photography', 'nature', 0,
       ST_SetSRID(ST_MakePoint(29.1220, 36.5500), 4326)
FROM destinations WHERE name = 'Oludeniz Beach';



-- ITINERARIES
INSERT INTO itineraries (user_id, destination_id, day_number, total_cost) VALUES
(1, 1, 1, 80),
(1, 2, 2, 200);
