-- USERS
INSERT INTO users (name, email) VALUES
('Ceren', 'ceren@example.com'),
('Dilara', 'dilara@example.com');

-- DESTINATIONS
INSERT INTO destinations (name, city, geom) VALUES
-- Ankara
('Anitkabir', 'Ankara', ST_SetSRID(ST_MakePoint(32.8347, 39.9250), 4326)),
('Atakule', 'Ankara', ST_SetSRID(ST_MakePoint(32.8585, 39.9075), 4326)),
('Ankara Castle', 'Ankara', ST_SetSRID(ST_MakePoint(32.8650, 39.9400), 4326)),
('Museum of Anatolian Civilizations', 'Ankara', ST_SetSRID(ST_MakePoint(32.8620, 39.9415), 4326)),

-- Istanbul
('Hagia Sophia', 'Istanbul', ST_SetSRID(ST_MakePoint(28.9800, 41.0086), 4326)),
('Blue Mosque', 'Istanbul', ST_SetSRID(ST_MakePoint(28.9769, 41.0054), 4326)),
('Topkapi Palace', 'Istanbul', ST_SetSRID(ST_MakePoint(28.9833, 41.0115), 4326)),
('Grand Bazaar', 'Istanbul', ST_SetSRID(ST_MakePoint(28.9684, 41.0106), 4326)),
('Galata Tower', 'Istanbul', ST_SetSRID(ST_MakePoint(28.9740, 41.0260), 4326)),
('Dolmabahce Palace', 'Istanbul', ST_SetSRID(ST_MakePoint(29.0000, 41.0390), 4326)),

-- Izmir
('Alsancak Coast', 'Izmir', ST_SetSRID(ST_MakePoint(27.1475, 38.4320), 4326)),
('Konak Square', 'Izmir', ST_SetSRID(ST_MakePoint(27.1287, 38.4192), 4326)),
('Kadifekale Castle', 'Izmir', ST_SetSRID(ST_MakePoint(27.1400, 38.4250), 4326)),
('Izmir Agora', 'Izmir', ST_SetSRID(ST_MakePoint(27.1390, 38.4180), 4326)),

-- Eskisehir
('Odunpazari Houses', 'Eskisehir', ST_SetSRID(ST_MakePoint(30.5206, 39.7667), 4326)),
('Porsuk River', 'Eskisehir', ST_SetSRID(ST_MakePoint(30.5180, 39.7760), 4326)),

-- Antalya
('Kaleici Old Town', 'Antalya', ST_SetSRID(ST_MakePoint(30.7030, 36.8850), 4326)),
('Konyaalti Beach', 'Antalya', ST_SetSRID(ST_MakePoint(30.6370, 36.8600), 4326)),
('Duden Waterfalls', 'Antalya', ST_SetSRID(ST_MakePoint(30.7680, 36.9150), 4326)),
('Antalya Museum', 'Antalya', ST_SetSRID(ST_MakePoint(30.6830, 36.8810), 4326)),

-- Bursa
('Grand Mosque', 'Bursa', ST_SetSRID(ST_MakePoint(29.0630, 40.1820), 4326)),
('Uludag National Park', 'Bursa', ST_SetSRID(ST_MakePoint(29.2210, 40.0690), 4326)),
('Cumalikizik Village', 'Bursa', ST_SetSRID(ST_MakePoint(29.1870, 40.1880), 4326)),
('Green Tomb', 'Bursa', ST_SetSRID(ST_MakePoint(29.0850, 40.1890), 4326)),

-- Cappadocia (Nevsehir)
('Goreme Open Air Museum', 'Nevsehir', ST_SetSRID(ST_MakePoint(34.8500, 38.6430), 4326)),
('Uchisar Castle', 'Nevsehir', ST_SetSRID(ST_MakePoint(34.8050, 38.6300), 4326)),
('Pasabag Valley', 'Nevsehir', ST_SetSRID(ST_MakePoint(34.8580, 38.6510), 4326)),
('Derinkuyu Underground City', 'Nevsehir', ST_SetSRID(ST_MakePoint(34.7350, 38.3730), 4326)),

-- Trabzon
('Sumela Monastery', 'Trabzon', ST_SetSRID(ST_MakePoint(39.6550, 40.6900), 4326)),
('Uzungol', 'Trabzon', ST_SetSRID(ST_MakePoint(40.2870, 40.6200), 4326)),
('Ataturk Pavilion', 'Trabzon', ST_SetSRID(ST_MakePoint(39.7350, 41.0050), 4326)),

-- Mugla
('Oludeniz Beach', 'Mugla', ST_SetSRID(ST_MakePoint(29.1210, 36.5490), 4326)),
('Bodrum Castle', 'Mugla', ST_SetSRID(ST_MakePoint(27.4300, 37.0340), 4326)),
('Marmaris Marina', 'Mugla', ST_SetSRID(ST_MakePoint(28.2760, 36.8500), 4326)),
('Fethiye Old Town', 'Mugla', ST_SetSRID(ST_MakePoint(29.1150, 36.6220), 4326)),

-- Canakkale
('Troy Ancient City', 'Canakkale', ST_SetSRID(ST_MakePoint(26.2410, 39.9570), 4326)),
('Gallipoli Peninsula', 'Canakkale', ST_SetSRID(ST_MakePoint(26.6800, 40.2300), 4326)),

-- Gaziantep
('Zeugma Mosaic Museum', 'Gaziantep', ST_SetSRID(ST_MakePoint(37.3780, 37.0660), 4326)),
('Gaziantep Castle', 'Gaziantep', ST_SetSRID(ST_MakePoint(37.3770, 37.0650), 4326)),

-- Mardin
('Mardin Old City', 'Mardin', ST_SetSRID(ST_MakePoint(40.7350, 37.3130), 4326)),
('Dara Ancient City', 'Mardin', ST_SetSRID(ST_MakePoint(40.8750, 37.2000), 4326)),

-- Rize
('Ayder Plateau', 'Rize', ST_SetSRID(ST_MakePoint(40.9500, 40.8570), 4326)),
('Firtina Valley', 'Rize', ST_SetSRID(ST_MakePoint(40.8800, 41.0100), 4326));


-- ACTIVITIES FOR ANKARA (20 activities, 1 free)
INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Anitkabir Guided Tour', 'culture', 0, ST_SetSRID(ST_MakePoint(32.8347, 39.9250), 4326) FROM destinations WHERE name = 'Anitkabir';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Atakule Observation Deck', 'culture', 85, ST_SetSRID(ST_MakePoint(32.8585, 39.9075), 4326) FROM destinations WHERE name = 'Atakule';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Ankara Castle Walking Tour', 'culture', 75, ST_SetSRID(ST_MakePoint(32.8650, 39.9400), 4326) FROM destinations WHERE name = 'Ankara Castle';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Museum Tour', 'culture', 120, ST_SetSRID(ST_MakePoint(32.8620, 39.9415), 4326) FROM destinations WHERE name = 'Museum of Anatolian Civilizations';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Kocatepe Mosque Visit', 'culture', 40, ST_SetSRID(ST_MakePoint(32.8540, 39.9180), 4326) FROM destinations WHERE name = 'Anitkabir';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Traditional Turkish Breakfast', 'food', 180, ST_SetSRID(ST_MakePoint(32.8520, 39.9190), 4326) FROM destinations WHERE name = 'Anitkabir';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Tunali Hilmi Shopping', 'culture', 250, ST_SetSRID(ST_MakePoint(32.8550, 39.9100), 4326) FROM destinations WHERE name = 'Atakule';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Kuğulu Park Picnic', 'nature', 60, ST_SetSRID(ST_MakePoint(32.8600, 39.9050), 4326) FROM destinations WHERE name = 'Atakule';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Genclik Park Boat Ride', 'nature', 90, ST_SetSRID(ST_MakePoint(32.8500, 39.9400), 4326) FROM destinations WHERE name = 'Anitkabir';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Ethnography Museum Tour', 'culture', 95, ST_SetSRID(ST_MakePoint(32.8580, 39.9280), 4326) FROM destinations WHERE name = 'Museum of Anatolian Civilizations';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Turkish Bath Experience', 'culture', 280, ST_SetSRID(ST_MakePoint(32.8600, 39.9350), 4326) FROM destinations WHERE name = 'Ankara Castle';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Hamamonu Historic Walk', 'culture', 70, ST_SetSRID(ST_MakePoint(32.8700, 39.9320), 4326) FROM destinations WHERE name = 'Ankara Castle';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Fine Dining Experience', 'food', 450, ST_SetSRID(ST_MakePoint(32.8540, 39.9080), 4326) FROM destinations WHERE name = 'Atakule';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Eymir Lake Cycling', 'nature', 130, ST_SetSRID(ST_MakePoint(32.8950, 39.8550), 4326) FROM destinations WHERE name = 'Anitkabir';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Mogan Lake Day Trip', 'nature', 110, ST_SetSRID(ST_MakePoint(32.7850, 39.7550), 4326) FROM destinations WHERE name = 'Anitkabir';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Contemporary Art Gallery', 'culture', 100, ST_SetSRID(ST_MakePoint(32.8570, 39.9150), 4326) FROM destinations WHERE name = 'Atakule';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Rooftop Restaurant Dinner', 'food', 380, ST_SetSRID(ST_MakePoint(32.8580, 39.9085), 4326) FROM destinations WHERE name = 'Atakule';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Wine Tasting Tour', 'food', 320, ST_SetSRID(ST_MakePoint(32.8650, 39.9060), 4326) FROM destinations WHERE name = 'Atakule';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Ankara Opera House Show', 'culture', 200, ST_SetSRID(ST_MakePoint(32.8560, 39.9200), 4326) FROM destinations WHERE name = 'Anitkabir';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Street Food Tour', 'food', 150, ST_SetSRID(ST_MakePoint(32.8640, 39.9380), 4326) FROM destinations WHERE name = 'Ankara Castle';


-- ACTIVITIES FOR ISTANBUL (20 activities, 1 free)
INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Istiklal Street Walking Tour', 'culture', 0, ST_SetSRID(ST_MakePoint(28.9780, 41.0330), 4326) FROM destinations WHERE name = 'Galata Tower';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Hagia Sophia Tour', 'culture', 150, ST_SetSRID(ST_MakePoint(28.9800, 41.0086), 4326) FROM destinations WHERE name = 'Hagia Sophia';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Blue Mosque Visit', 'culture', 100, ST_SetSRID(ST_MakePoint(28.9769, 41.0054), 4326) FROM destinations WHERE name = 'Blue Mosque';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Topkapi Palace Exploration', 'culture', 250, ST_SetSRID(ST_MakePoint(28.9833, 41.0115), 4326) FROM destinations WHERE name = 'Topkapi Palace';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Grand Bazaar Shopping', 'culture', 300, ST_SetSRID(ST_MakePoint(28.9684, 41.0106), 4326) FROM destinations WHERE name = 'Grand Bazaar';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Galata Tower Sunset', 'culture', 180, ST_SetSRID(ST_MakePoint(28.9740, 41.0260), 4326) FROM destinations WHERE name = 'Galata Tower';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Bosphorus Cruise', 'nature', 280, ST_SetSRID(ST_MakePoint(29.0100, 41.0400), 4326) FROM destinations WHERE name = 'Dolmabahce Palace';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Dolmabahce Palace Tour', 'culture', 200, ST_SetSRID(ST_MakePoint(29.0000, 41.0390), 4326) FROM destinations WHERE name = 'Dolmabahce Palace';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Turkish Breakfast at Ortakoy', 'food', 220, ST_SetSRID(ST_MakePoint(29.0270, 41.0550), 4326) FROM destinations WHERE name = 'Dolmabahce Palace';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Basilica Cistern Tour', 'culture', 160, ST_SetSRID(ST_MakePoint(28.9779, 41.0084), 4326) FROM destinations WHERE name = 'Hagia Sophia';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Spice Bazaar Experience', 'culture', 130, ST_SetSRID(ST_MakePoint(28.9707, 41.0166), 4326) FROM destinations WHERE name = 'Grand Bazaar';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Princes Islands Ferry Trip', 'nature', 190, ST_SetSRID(ST_MakePoint(29.0850, 40.8600), 4326) FROM destinations WHERE name = 'Dolmabahce Palace';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Turkish Coffee Workshop', 'food', 120, ST_SetSRID(ST_MakePoint(28.9750, 41.0320), 4326) FROM destinations WHERE name = 'Galata Tower';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Maiden Tower Visit', 'culture', 150, ST_SetSRID(ST_MakePoint(29.0041, 41.0213), 4326) FROM destinations WHERE name = 'Dolmabahce Palace';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Seafood Dinner at Kumkapi', 'food', 380, ST_SetSRID(ST_MakePoint(28.9520, 41.0010), 4326) FROM destinations WHERE name = 'Hagia Sophia';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Suleymaniye Mosque Tour', 'culture', 90, ST_SetSRID(ST_MakePoint(28.9644, 41.0166), 4326) FROM destinations WHERE name = 'Grand Bazaar';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Pera Museum Visit', 'culture', 110, ST_SetSRID(ST_MakePoint(28.9770, 41.0310), 4326) FROM destinations WHERE name = 'Galata Tower';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Traditional Turkish Bath', 'culture', 350, ST_SetSRID(ST_MakePoint(28.9700, 41.0100), 4326) FROM destinations WHERE name = 'Grand Bazaar';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Rooftop Bar Experience', 'food', 320, ST_SetSRID(ST_MakePoint(28.9860, 41.0365), 4326) FROM destinations WHERE name = 'Galata Tower';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Whirling Dervishes Show', 'culture', 240, ST_SetSRID(ST_MakePoint(28.9750, 41.0100), 4326) FROM destinations WHERE name = 'Hagia Sophia';


-- ACTIVITIES FOR IZMIR (20 activities, 1 free)
INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Kordon Sunset Walk', 'nature', 0, ST_SetSRID(ST_MakePoint(27.1480, 38.4330), 4326) FROM destinations WHERE name = 'Alsancak Coast';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Clock Tower Photography', 'culture', 50, ST_SetSRID(ST_MakePoint(27.1289, 38.4194), 4326) FROM destinations WHERE name = 'Konak Square';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Kadifekale Castle Tour', 'culture', 80, ST_SetSRID(ST_MakePoint(27.1400, 38.4250), 4326) FROM destinations WHERE name = 'Kadifekale Castle';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Agora Ancient Site Visit', 'culture', 100, ST_SetSRID(ST_MakePoint(27.1390, 38.4180), 4326) FROM destinations WHERE name = 'Izmir Agora';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Alsancak Breakfast', 'food', 180, ST_SetSRID(ST_MakePoint(27.1465, 38.4315), 4326) FROM destinations WHERE name = 'Alsancak Coast';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Kemeralti Bazaar Shopping', 'culture', 150, ST_SetSRID(ST_MakePoint(27.1370, 38.4200), 4326) FROM destinations WHERE name = 'Konak Square';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Asansor Historic Elevator', 'culture', 60, ST_SetSRID(ST_MakePoint(27.1420, 38.4290), 4326) FROM destinations WHERE name = 'Alsancak Coast';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Izmir Archaeology Museum', 'culture', 90, ST_SetSRID(ST_MakePoint(27.1500, 38.4350), 4326) FROM destinations WHERE name = 'Alsancak Coast';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Seafood Restaurant Dinner', 'food', 320, ST_SetSRID(ST_MakePoint(27.1470, 38.4325), 4326) FROM destinations WHERE name = 'Alsancak Coast';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Ferry to Karsiyaka', 'nature', 70, ST_SetSRID(ST_MakePoint(27.1350, 38.4210), 4326) FROM destinations WHERE name = 'Konak Square';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Cesme Day Trip', 'nature', 200, ST_SetSRID(ST_MakePoint(26.3060, 38.3230), 4326) FROM destinations WHERE name = 'Alsancak Coast';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Wine Tasting in Urla', 'food', 280, ST_SetSRID(ST_MakePoint(26.7650, 38.3220), 4326) FROM destinations WHERE name = 'Alsancak Coast';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Ephesus Ancient City Tour', 'culture', 250, ST_SetSRID(ST_MakePoint(27.3400, 37.9395), 4326) FROM destinations WHERE name = 'Izmir Agora';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Traditional Boyoz Breakfast', 'food', 110, ST_SetSRID(ST_MakePoint(27.1380, 38.4195), 4326) FROM destinations WHERE name = 'Konak Square';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Izmir Art Museum', 'culture', 85, ST_SetSRID(ST_MakePoint(27.1490, 38.4340), 4326) FROM destinations WHERE name = 'Alsancak Coast';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Cycling on Kordon', 'nature', 95, ST_SetSRID(ST_MakePoint(27.1475, 38.4320), 4326) FROM destinations WHERE name = 'Alsancak Coast';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Rooftop Cafe Experience', 'food', 160, ST_SetSRID(ST_MakePoint(27.1455, 38.4310), 4326) FROM destinations WHERE name = 'Alsancak Coast';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Historic Hisar Mosque Visit', 'culture', 40, ST_SetSRID(ST_MakePoint(27.1385, 38.4185), 4326) FROM destinations WHERE name = 'Konak Square';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Pamukkale Day Tour', 'nature', 350, ST_SetSRID(ST_MakePoint(29.1200, 37.9200), 4326) FROM destinations WHERE name = 'Izmir Agora';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Kumru Sandwich Tasting', 'food', 75, ST_SetSRID(ST_MakePoint(27.1390, 38.4200), 4326) FROM destinations WHERE name = 'Konak Square';


-- ACTIVITIES FOR ESKISEHIR (20 activities, 1 free)
INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Porsuk River Walk', 'nature', 0, ST_SetSRID(ST_MakePoint(30.5180, 39.7760), 4326) FROM destinations WHERE name = 'Porsuk River';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Odunpazari Art Gallery Tour', 'culture', 90, ST_SetSRID(ST_MakePoint(30.5210, 39.7670), 4326) FROM destinations WHERE name = 'Odunpazari Houses';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Historic Ottoman Houses Visit', 'culture', 70, ST_SetSRID(ST_MakePoint(30.5206, 39.7667), 4326) FROM destinations WHERE name = 'Odunpazari Houses';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Kentpark Picnic', 'nature', 60, ST_SetSRID(ST_MakePoint(30.5000, 39.7700), 4326) FROM destinations WHERE name = 'Porsuk River';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Glass Art Museum', 'culture', 100, ST_SetSRID(ST_MakePoint(30.5220, 39.7680), 4326) FROM destinations WHERE name = 'Odunpazari Houses';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Meerschaum Museum Tour', 'culture', 80, ST_SetSRID(ST_MakePoint(30.5200, 39.7665), 4326) FROM destinations WHERE name = 'Odunpazari Houses';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Traditional Ciborek Meal', 'food', 120, ST_SetSRID(ST_MakePoint(30.5190, 39.7670), 4326) FROM destinations WHERE name = 'Odunpazari Houses';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Gondola Boat Ride', 'nature', 110, ST_SetSRID(ST_MakePoint(30.5185, 39.7765), 4326) FROM destinations WHERE name = 'Porsuk River';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Sazova Science Park', 'culture', 95, ST_SetSRID(ST_MakePoint(30.4850, 39.7950), 4326) FROM destinations WHERE name = 'Porsuk River';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Haller Youth Center', 'culture', 50, ST_SetSRID(ST_MakePoint(30.5150, 39.7800), 4326) FROM destinations WHERE name = 'Porsuk River';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Eskisehir Modern Art Museum', 'culture', 75, ST_SetSRID(ST_MakePoint(30.5230, 39.7690), 4326) FROM destinations WHERE name = 'Odunpazari Houses';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Cafe Hopping Tour', 'food', 180, ST_SetSRID(ST_MakePoint(30.5175, 39.7755), 4326) FROM destinations WHERE name = 'Porsuk River';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Anadolu University Campus Tour', 'culture', 65, ST_SetSRID(ST_MakePoint(30.5300, 39.8100), 4326) FROM destinations WHERE name = 'Porsuk River';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Balaban Handicrafts Bazaar', 'culture', 85, ST_SetSRID(ST_MakePoint(30.5195, 39.7672), 4326) FROM destinations WHERE name = 'Odunpazari Houses';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Calligraphy Workshop', 'culture', 140, ST_SetSRID(ST_MakePoint(30.5215, 39.7675), 4326) FROM destinations WHERE name = 'Odunpazari Houses';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Rooftop Restaurant Dinner', 'food', 280, ST_SetSRID(ST_MakePoint(30.5200, 39.7750), 4326) FROM destinations WHERE name = 'Porsuk River';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Bicycle Tour', 'nature', 100, ST_SetSRID(ST_MakePoint(30.5170, 39.7770), 4326) FROM destinations WHERE name = 'Porsuk River';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Atlihan Handicrafts Center', 'culture', 90, ST_SetSRID(ST_MakePoint(30.5205, 39.7668), 4326) FROM destinations WHERE name = 'Odunpazari Houses';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Photography Workshop', 'culture', 160, ST_SetSRID(ST_MakePoint(30.5210, 39.7670), 4326) FROM destinations WHERE name = 'Odunpazari Houses';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Turkish Tea House', 'food', 55, ST_SetSRID(ST_MakePoint(30.5192, 39.7760), 4326) FROM destinations WHERE name = 'Porsuk River';


-- ACTIVITIES FOR ANTALYA (20 activities, 1 free)
INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Konyaalti Beach Walk', 'nature', 0, ST_SetSRID(ST_MakePoint(30.6400, 36.8610), 4326) FROM destinations WHERE name = 'Konyaalti Beach';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Kaleici Old Town Tour', 'culture', 100, ST_SetSRID(ST_MakePoint(30.7030, 36.8850), 4326) FROM destinations WHERE name = 'Kaleici Old Town';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Hadrian Gate Visit', 'culture', 60, ST_SetSRID(ST_MakePoint(30.7015, 36.8870), 4326) FROM destinations WHERE name = 'Kaleici Old Town';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Duden Waterfalls Trip', 'nature', 120, ST_SetSRID(ST_MakePoint(30.7680, 36.9150), 4326) FROM destinations WHERE name = 'Duden Waterfalls';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Antalya Museum Tour', 'culture', 110, ST_SetSRID(ST_MakePoint(30.6830, 36.8810), 4326) FROM destinations WHERE name = 'Antalya Museum';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Marina Yacht Tour', 'nature', 280, ST_SetSRID(ST_MakePoint(30.7045, 36.8840), 4326) FROM destinations WHERE name = 'Kaleici Old Town';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Paragliding at Olympos', 'nature', 450, ST_SetSRID(ST_MakePoint(30.4700, 36.3980), 4326) FROM destinations WHERE name = 'Konyaalti Beach';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Turkish Breakfast by the Sea', 'food', 200, ST_SetSRID(ST_MakePoint(30.6380, 36.8605), 4326) FROM destinations WHERE name = 'Konyaalti Beach';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Old Town Rooftop Cafe', 'food', 160, ST_SetSRID(ST_MakePoint(30.7035, 36.8845), 4326) FROM destinations WHERE name = 'Kaleici Old Town';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Perge Ancient City', 'culture', 140, ST_SetSRID(ST_MakePoint(30.8530, 36.9600), 4326) FROM destinations WHERE name = 'Antalya Museum';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Aspendos Theatre Tour', 'culture', 150, ST_SetSRID(ST_MakePoint(31.1720, 36.9390), 4326) FROM destinations WHERE name = 'Antalya Museum';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Cable Car to Tunektepe', 'nature', 170, ST_SetSRID(ST_MakePoint(30.6200, 36.8750), 4326) FROM destinations WHERE name = 'Konyaalti Beach';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Scuba Diving Experience', 'nature', 380, ST_SetSRID(ST_MakePoint(30.6350, 36.8590), 4326) FROM destinations WHERE name = 'Konyaalti Beach';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Traditional Turkish Bath', 'culture', 250, ST_SetSRID(ST_MakePoint(30.7020, 36.8855), 4326) FROM destinations WHERE name = 'Kaleici Old Town';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Sunset Boat Tour', 'nature', 220, ST_SetSRID(ST_MakePoint(30.7050, 36.8835), 4326) FROM destinations WHERE name = 'Kaleici Old Town';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Seafood Restaurant Dinner', 'food', 350, ST_SetSRID(ST_MakePoint(30.7040, 36.8840), 4326) FROM destinations WHERE name = 'Kaleici Old Town';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Beach Club Day Pass', 'nature', 300, ST_SetSRID(ST_MakePoint(30.6390, 36.8600), 4326) FROM destinations WHERE name = 'Konyaalti Beach';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'ATV Safari Tour', 'nature', 320, ST_SetSRID(ST_MakePoint(30.7100, 36.9000), 4326) FROM destinations WHERE name = 'Duden Waterfalls';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Wine Tasting Tour', 'food', 240, ST_SetSRID(ST_MakePoint(30.7025, 36.8850), 4326) FROM destinations WHERE name = 'Kaleici Old Town';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Shopping at Kaleici Bazaar', 'culture', 180, ST_SetSRID(ST_MakePoint(30.7032, 36.8848), 4326) FROM destinations WHERE name = 'Kaleici Old Town';


-- ACTIVITIES FOR BURSA (20 activities, 1 free)
INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Uludag Hiking Trail', 'nature', 0, ST_SetSRID(ST_MakePoint(29.2230, 40.0700), 4326) FROM destinations WHERE name = 'Uludag National Park';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Grand Mosque Tour', 'culture', 50, ST_SetSRID(ST_MakePoint(29.0630, 40.1820), 4326) FROM destinations WHERE name = 'Grand Mosque';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Green Tomb Visit', 'culture', 70, ST_SetSRID(ST_MakePoint(29.0850, 40.1890), 4326) FROM destinations WHERE name = 'Green Tomb';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Cumalikizik Village Walk', 'culture', 90, ST_SetSRID(ST_MakePoint(29.1870, 40.1880), 4326) FROM destinations WHERE name = 'Cumalikizik Village';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Traditional Iskender Kebab', 'food', 180, ST_SetSRID(ST_MakePoint(29.0640, 40.1825), 4326) FROM destinations WHERE name = 'Grand Mosque';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Bursa City Museum', 'culture', 85, ST_SetSRID(ST_MakePoint(29.0700, 40.1900), 4326) FROM destinations WHERE name = 'Green Tomb';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Uludag Cable Car', 'nature', 200, ST_SetSRID(ST_MakePoint(29.0750, 40.1650), 4326) FROM destinations WHERE name = 'Uludag National Park';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Turkish Bath at Eski Kaplica', 'culture', 260, ST_SetSRID(ST_MakePoint(29.0420, 40.1930), 4326) FROM destinations WHERE name = 'Grand Mosque';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Silk Market Shopping', 'culture', 150, ST_SetSRID(ST_MakePoint(29.0650, 40.1830), 4326) FROM destinations WHERE name = 'Grand Mosque';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Koza Han Visit', 'culture', 60, ST_SetSRID(ST_MakePoint(29.0655, 40.1835), 4326) FROM destinations WHERE name = 'Grand Mosque';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Trilye Fish Village Trip', 'food', 280, ST_SetSRID(ST_MakePoint(28.9330, 40.3830), 4326) FROM destinations WHERE name = 'Grand Mosque';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Village Breakfast at Cumalikizik', 'food', 140, ST_SetSRID(ST_MakePoint(29.1875, 40.1885), 4326) FROM destinations WHERE name = 'Cumalikizik Village';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Bursa Castle Panorama', 'culture', 75, ST_SetSRID(ST_MakePoint(29.0650, 40.1920), 4326) FROM destinations WHERE name = 'Green Tomb';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Chestnut Dessert Tasting', 'food', 95, ST_SetSRID(ST_MakePoint(29.0645, 40.1822), 4326) FROM destinations WHERE name = 'Grand Mosque';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Uludag Ski Resort', 'nature', 350, ST_SetSRID(ST_MakePoint(29.2250, 40.0650), 4326) FROM destinations WHERE name = 'Uludag National Park';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Botanical Park Picnic', 'nature', 80, ST_SetSRID(ST_MakePoint(29.1050, 40.2100), 4326) FROM destinations WHERE name = 'Uludag National Park';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Oylat Cave Tour', 'nature', 120, ST_SetSRID(ST_MakePoint(29.3050, 39.9150), 4326) FROM destinations WHERE name = 'Uludag National Park';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Traditional Peach Dessert', 'food', 110, ST_SetSRID(ST_MakePoint(29.0860, 40.1895), 4326) FROM destinations WHERE name = 'Green Tomb';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Iznik Tiles Workshop', 'culture', 180, ST_SetSRID(ST_MakePoint(29.7200, 40.4290), 4326) FROM destinations WHERE name = 'Green Tomb';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Mountain Biking', 'nature', 160, ST_SetSRID(ST_MakePoint(29.2240, 40.0680), 4326) FROM destinations WHERE name = 'Uludag National Park';


-- ACTIVITIES FOR CAPPADOCIA (20 activities, 1 free)
INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Goreme Panorama Walk', 'nature', 0, ST_SetSRID(ST_MakePoint(34.8510, 38.6440), 4326) FROM destinations WHERE name = 'Goreme Open Air Museum';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Hot Air Balloon Ride', 'nature', 800, ST_SetSRID(ST_MakePoint(34.8505, 38.6435), 4326) FROM destinations WHERE name = 'Goreme Open Air Museum';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Goreme Open Air Museum Tour', 'culture', 180, ST_SetSRID(ST_MakePoint(34.8500, 38.6430), 4326) FROM destinations WHERE name = 'Goreme Open Air Museum';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Uchisar Castle Climb', 'culture', 90, ST_SetSRID(ST_MakePoint(34.8050, 38.6300), 4326) FROM destinations WHERE name = 'Uchisar Castle';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Pasabag Fairy Chimneys', 'nature', 70, ST_SetSRID(ST_MakePoint(34.8580, 38.6510), 4326) FROM destinations WHERE name = 'Pasabag Valley';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Derinkuyu Underground City', 'culture', 150, ST_SetSRID(ST_MakePoint(34.7350, 38.3730), 4326) FROM destinations WHERE name = 'Derinkuyu Underground City';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Pottery Workshop', 'culture', 140, ST_SetSRID(ST_MakePoint(34.8450, 38.6400), 4326) FROM destinations WHERE name = 'Goreme Open Air Museum';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'ATV Sunset Tour', 'nature', 220, ST_SetSRID(ST_MakePoint(34.8520, 38.6445), 4326) FROM destinations WHERE name = 'Goreme Open Air Museum';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Turkish Night Show', 'culture', 280, ST_SetSRID(ST_MakePoint(34.8490, 38.6420), 4326) FROM destinations WHERE name = 'Goreme Open Air Museum';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Love Valley Hiking', 'nature', 100, ST_SetSRID(ST_MakePoint(34.8380, 38.6550), 4326) FROM destinations WHERE name = 'Goreme Open Air Museum';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Red Valley Sunset Walk', 'nature', 80, ST_SetSRID(ST_MakePoint(34.8250, 38.6380), 4326) FROM destinations WHERE name = 'Uchisar Castle';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Cave Restaurant Dinner', 'food', 320, ST_SetSRID(ST_MakePoint(34.8495, 38.6425), 4326) FROM destinations WHERE name = 'Goreme Open Air Museum';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Kaymakli Underground City', 'culture', 130, ST_SetSRID(ST_MakePoint(34.7450, 38.4570), 4326) FROM destinations WHERE name = 'Derinkuyu Underground City';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Horse Riding Tour', 'nature', 190, ST_SetSRID(ST_MakePoint(34.8515, 38.6430), 4326) FROM destinations WHERE name = 'Goreme Open Air Museum';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Ihlara Valley Hiking', 'nature', 160, ST_SetSRID(ST_MakePoint(34.2850, 38.2440), 4326) FROM destinations WHERE name = 'Derinkuyu Underground City';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Wine Tasting at Vineyard', 'food', 200, ST_SetSRID(ST_MakePoint(34.8460, 38.6405), 4326) FROM destinations WHERE name = 'Goreme Open Air Museum';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Photography Workshop', 'culture', 250, ST_SetSRID(ST_MakePoint(34.8500, 38.6430), 4326) FROM destinations WHERE name = 'Goreme Open Air Museum';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Carpet Weaving Demonstration', 'culture', 95, ST_SetSRID(ST_MakePoint(34.8485, 38.6415), 4326) FROM destinations WHERE name = 'Goreme Open Air Museum';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Turkish Breakfast Cave Hotel', 'food', 180, ST_SetSRID(ST_MakePoint(34.8480, 38.6410), 4326) FROM destinations WHERE name = 'Goreme Open Air Museum';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Zelve Open Air Museum', 'culture', 110, ST_SetSRID(ST_MakePoint(34.8650, 38.6620), 4326) FROM destinations WHERE name = 'Pasabag Valley';


-- ACTIVITIES FOR TRABZON (20 activities, 1 free)
INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Uzungol Nature Walk', 'nature', 0, ST_SetSRID(ST_MakePoint(40.2875, 40.6210), 4326) FROM destinations WHERE name = 'Uzungol';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Sumela Monastery Tour', 'culture', 200, ST_SetSRID(ST_MakePoint(39.6550, 40.6900), 4326) FROM destinations WHERE name = 'Sumela Monastery';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Ataturk Pavilion Visit', 'culture', 80, ST_SetSRID(ST_MakePoint(39.7350, 41.0050), 4326) FROM destinations WHERE name = 'Ataturk Pavilion';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Uzungol Boat Tour', 'nature', 120, ST_SetSRID(ST_MakePoint(40.2870, 40.6200), 4326) FROM destinations WHERE name = 'Uzungol';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Ayder Plateau Trip', 'nature', 180, ST_SetSRID(ST_MakePoint(40.9500, 40.8570), 4326) FROM destinations WHERE name = 'Uzungol';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Traditional Black Sea Breakfast', 'food', 160, ST_SetSRID(ST_MakePoint(40.2865, 40.6205), 4326) FROM destinations WHERE name = 'Uzungol';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Trabzon Castle Tour', 'culture', 70, ST_SetSRID(ST_MakePoint(39.7210, 41.0030), 4326) FROM destinations WHERE name = 'Ataturk Pavilion';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Tea Plantation Visit', 'culture', 110, ST_SetSRID(ST_MakePoint(40.5000, 41.0200), 4326) FROM destinations WHERE name = 'Uzungol';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Zigana Mountain Pass', 'nature', 150, ST_SetSRID(ST_MakePoint(39.3850, 40.5750), 4326) FROM destinations WHERE name = 'Sumela Monastery';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Hagia Sophia of Trabzon', 'culture', 90, ST_SetSRID(ST_MakePoint(39.7275, 41.0010), 4326) FROM destinations WHERE name = 'Ataturk Pavilion';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Hamsiköy Rice Pudding', 'food', 75, ST_SetSRID(ST_MakePoint(39.4650, 40.6250), 4326) FROM destinations WHERE name = 'Sumela Monastery';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Uzungol Paragliding', 'nature', 350, ST_SetSRID(ST_MakePoint(40.2880, 40.6215), 4326) FROM destinations WHERE name = 'Uzungol';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Trabzon Museum', 'culture', 65, ST_SetSRID(ST_MakePoint(39.7260, 41.0025), 4326) FROM destinations WHERE name = 'Ataturk Pavilion';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Local Fish Restaurant', 'food', 280, ST_SetSRID(ST_MakePoint(39.7180, 41.0015), 4326) FROM destinations WHERE name = 'Ataturk Pavilion';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Storm Valley Trekking', 'nature', 140, ST_SetSRID(ST_MakePoint(40.8800, 41.0100), 4326) FROM destinations WHERE name = 'Uzungol';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Sera Lake Picnic', 'nature', 95, ST_SetSRID(ST_MakePoint(39.9750, 40.8350), 4326) FROM destinations WHERE name = 'Uzungol';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Horon Dance Show', 'culture', 120, ST_SetSRID(ST_MakePoint(39.7200, 41.0020), 4326) FROM destinations WHERE name = 'Ataturk Pavilion';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Uzungol Horseback Riding', 'nature', 170, ST_SetSRID(ST_MakePoint(40.2882, 40.6208), 4326) FROM destinations WHERE name = 'Uzungol';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Mountain Lodge Stay', 'nature', 400, ST_SetSRID(ST_MakePoint(40.2868, 40.6198), 4326) FROM destinations WHERE name = 'Uzungol';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Hazelnut Farm Tour', 'culture', 100, ST_SetSRID(ST_MakePoint(40.2000, 41.0500), 4326) FROM destinations WHERE name = 'Uzungol';


-- ACTIVITIES FOR MUGLA (20 activities, 1 free)
INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Oludeniz Beach Sunset', 'nature', 0, ST_SetSRID(ST_MakePoint(29.1220, 36.5500), 4326) FROM destinations WHERE name = 'Oludeniz Beach';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Bodrum Castle Tour', 'culture', 130, ST_SetSRID(ST_MakePoint(27.4300, 37.0340), 4326) FROM destinations WHERE name = 'Bodrum Castle';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Oludeniz Paragliding', 'nature', 500, ST_SetSRID(ST_MakePoint(29.1210, 36.5490), 4326) FROM destinations WHERE name = 'Oludeniz Beach';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Blue Cruise from Fethiye', 'nature', 450, ST_SetSRID(ST_MakePoint(29.1150, 36.6220), 4326) FROM destinations WHERE name = 'Fethiye Old Town';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Underwater Archaeology Museum', 'culture', 110, ST_SetSRID(ST_MakePoint(27.4305, 37.0345), 4326) FROM destinations WHERE name = 'Bodrum Castle';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Marmaris Boat Tour', 'nature', 280, ST_SetSRID(ST_MakePoint(28.2760, 36.8500), 4326) FROM destinations WHERE name = 'Marmaris Marina';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Butterfly Valley Boat Trip', 'nature', 180, ST_SetSRID(ST_MakePoint(29.1050, 36.5230), 4326) FROM destinations WHERE name = 'Oludeniz Beach';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Bodrum Windmills Visit', 'culture', 60, ST_SetSRID(ST_MakePoint(27.4280, 37.0360), 4326) FROM destinations WHERE name = 'Bodrum Castle';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Dalyan Mud Baths', 'nature', 200, ST_SetSRID(ST_MakePoint(28.6410, 36.8370), 4326) FROM destinations WHERE name = 'Marmaris Marina';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Seafood Dinner at Marina', 'food', 380, ST_SetSRID(ST_MakePoint(28.2765, 36.8505), 4326) FROM destinations WHERE name = 'Marmaris Marina';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Scuba Diving at Oludeniz', 'nature', 350, ST_SetSRID(ST_MakePoint(29.1215, 36.5495), 4326) FROM destinations WHERE name = 'Oludeniz Beach';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Bodrum Beach Clubs', 'nature', 300, ST_SetSRID(ST_MakePoint(27.4320, 37.0350), 4326) FROM destinations WHERE name = 'Bodrum Castle';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Kayakoy Ghost Village', 'culture', 90, ST_SetSRID(ST_MakePoint(29.0850, 36.5750), 4326) FROM destinations WHERE name = 'Fethiye Old Town';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Saklikent Gorge Trek', 'nature', 150, ST_SetSRID(ST_MakePoint(29.3170, 36.4680), 4326) FROM destinations WHERE name = 'Fethiye Old Town';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Turkish Breakfast by the Sea', 'food', 220, ST_SetSRID(ST_MakePoint(29.1225, 36.5485), 4326) FROM destinations WHERE name = 'Oludeniz Beach';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Marmaris Bar Street Night', 'culture', 250, ST_SetSRID(ST_MakePoint(28.2770, 36.8510), 4326) FROM destinations WHERE name = 'Marmaris Marina';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Fethiye Fish Market Dinner', 'food', 280, ST_SetSRID(ST_MakePoint(29.1155, 36.6225), 4326) FROM destinations WHERE name = 'Fethiye Old Town';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Cleopatra Island Trip', 'nature', 240, ST_SetSRID(ST_MakePoint(28.1450, 37.0050), 4326) FROM destinations WHERE name = 'Marmaris Marina';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Bodrum Amphitheater', 'culture', 75, ST_SetSRID(ST_MakePoint(27.4280, 37.0320), 4326) FROM destinations WHERE name = 'Bodrum Castle';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Jeep Safari Adventure', 'nature', 320, ST_SetSRID(ST_MakePoint(29.1200, 36.5480), 4326) FROM destinations WHERE name = 'Oludeniz Beach';


-- ACTIVITIES FOR CANAKKALE (20 activities, 1 free)
INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Troy Ancient City Walk', 'culture', 0, ST_SetSRID(ST_MakePoint(26.2410, 39.9570), 4326) FROM destinations WHERE name = 'Troy Ancient City';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Gallipoli Battlefields Tour', 'culture', 220, ST_SetSRID(ST_MakePoint(26.6800, 40.2300), 4326) FROM destinations WHERE name = 'Gallipoli Peninsula';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Troy Museum Visit', 'culture', 100, ST_SetSRID(ST_MakePoint(26.2385, 39.9545), 4326) FROM destinations WHERE name = 'Troy Ancient City';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Wooden Horse Photo', 'culture', 50, ST_SetSRID(ST_MakePoint(26.2415, 39.9575), 4326) FROM destinations WHERE name = 'Troy Ancient City';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'ANZAC Cove Visit', 'culture', 80, ST_SetSRID(ST_MakePoint(26.2850, 40.2380), 4326) FROM destinations WHERE name = 'Gallipoli Peninsula';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Canakkale Waterfront Walk', 'nature', 60, ST_SetSRID(ST_MakePoint(26.4080, 40.1550), 4326) FROM destinations WHERE name = 'Troy Ancient City';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Kilitbahir Castle Tour', 'culture', 70, ST_SetSRID(ST_MakePoint(26.3720, 40.1480), 4326) FROM destinations WHERE name = 'Gallipoli Peninsula';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Canakkale Archaeological Museum', 'culture', 90, ST_SetSRID(ST_MakePoint(26.4120, 40.1510), 4326) FROM destinations WHERE name = 'Troy Ancient City';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Fish Dinner at Waterfront', 'food', 280, ST_SetSRID(ST_MakePoint(26.4085, 40.1555), 4326) FROM destinations WHERE name = 'Troy Ancient City';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Bozcaada Island Ferry', 'nature', 150, ST_SetSRID(ST_MakePoint(26.0400, 39.8350), 4326) FROM destinations WHERE name = 'Troy Ancient City';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Lone Pine Memorial', 'culture', 75, ST_SetSRID(ST_MakePoint(26.2720, 40.2420), 4326) FROM destinations WHERE name = 'Gallipoli Peninsula';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Sunset at Dardanelles', 'nature', 95, ST_SetSRID(ST_MakePoint(26.4090, 40.1520), 4326) FROM destinations WHERE name = 'Troy Ancient City';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Assos Ancient City', 'culture', 140, ST_SetSRID(ST_MakePoint(26.3380, 39.4920), 4326) FROM destinations WHERE name = 'Troy Ancient City';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Wine Tasting in Bozcaada', 'food', 240, ST_SetSRID(ST_MakePoint(26.0420, 39.8360), 4326) FROM destinations WHERE name = 'Troy Ancient City';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Chunuk Bair Memorial', 'culture', 85, ST_SetSRID(ST_MakePoint(26.2880, 40.2450), 4326) FROM destinations WHERE name = 'Gallipoli Peninsula';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Traditional Canakkale Pottery', 'culture', 120, ST_SetSRID(ST_MakePoint(26.4100, 40.1530), 4326) FROM destinations WHERE name = 'Troy Ancient City';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Cafe Break at Republic Square', 'food', 110, ST_SetSRID(ST_MakePoint(26.4110, 40.1540), 4326) FROM destinations WHERE name = 'Troy Ancient City';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Gallipoli National Park', 'nature', 100, ST_SetSRID(ST_MakePoint(26.6820, 40.2320), 4326) FROM destinations WHERE name = 'Gallipoli Peninsula';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Historic Clock Tower', 'culture', 45, ST_SetSRID(ST_MakePoint(26.4095, 40.1525), 4326) FROM destinations WHERE name = 'Troy Ancient City';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Gokceada Island Day Trip', 'nature', 280, ST_SetSRID(ST_MakePoint(25.9000, 40.1850), 4326) FROM destinations WHERE name = 'Gallipoli Peninsula';


-- ACTIVITIES FOR GAZIANTEP (20 activities, 1 free)
INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Gaziantep Castle Walk', 'culture', 0, ST_SetSRID(ST_MakePoint(37.3775, 37.0655), 4326) FROM destinations WHERE name = 'Gaziantep Castle';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Zeugma Mosaic Museum Tour', 'culture', 120, ST_SetSRID(ST_MakePoint(37.3780, 37.0660), 4326) FROM destinations WHERE name = 'Zeugma Mosaic Museum';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Baklava Making Workshop', 'food', 180, ST_SetSRID(ST_MakePoint(37.3770, 37.0650), 4326) FROM destinations WHERE name = 'Gaziantep Castle';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Traditional Gaziantep Breakfast', 'food', 200, ST_SetSRID(ST_MakePoint(37.3765, 37.0645), 4326) FROM destinations WHERE name = 'Gaziantep Castle';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Copper Bazaar Shopping', 'culture', 100, ST_SetSRID(ST_MakePoint(37.3760, 37.0640), 4326) FROM destinations WHERE name = 'Gaziantep Castle';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Gaziantep Cuisine Museum', 'culture', 85, ST_SetSRID(ST_MakePoint(37.3785, 37.0665), 4326) FROM destinations WHERE name = 'Zeugma Mosaic Museum';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Kebab Restaurant Tour', 'food', 280, ST_SetSRID(ST_MakePoint(37.3755, 37.0635), 4326) FROM destinations WHERE name = 'Gaziantep Castle';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Rumkale Ancient Fortress', 'culture', 150, ST_SetSRID(ST_MakePoint(37.8550, 37.2580), 4326) FROM destinations WHERE name = 'Zeugma Mosaic Museum';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Antep Pepper Tasting', 'food', 90, ST_SetSRID(ST_MakePoint(37.3758, 37.0642), 4326) FROM destinations WHERE name = 'Gaziantep Castle';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Hasan Suzer Ethnography Museum', 'culture', 75, ST_SetSRID(ST_MakePoint(37.3790, 37.0670), 4326) FROM destinations WHERE name = 'Zeugma Mosaic Museum';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Yesemek Sculpture Workshop', 'culture', 130, ST_SetSRID(ST_MakePoint(36.9570, 37.0320), 4326) FROM destinations WHERE name = 'Zeugma Mosaic Museum';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Katmerci Breakfast', 'food', 140, ST_SetSRID(ST_MakePoint(37.3762, 37.0648), 4326) FROM destinations WHERE name = 'Gaziantep Castle';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Pistachio Farm Visit', 'culture', 110, ST_SetSRID(ST_MakePoint(37.5000, 37.1500), 4326) FROM destinations WHERE name = 'Zeugma Mosaic Museum';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Traditional Coffee House', 'food', 80, ST_SetSRID(ST_MakePoint(37.3768, 37.0652), 4326) FROM destinations WHERE name = 'Gaziantep Castle';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Zeugma Ancient City Ruins', 'culture', 140, ST_SetSRID(ST_MakePoint(37.8680, 37.0450), 4326) FROM destinations WHERE name = 'Zeugma Mosaic Museum';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Lahmacun Restaurant Tour', 'food', 160, ST_SetSRID(ST_MakePoint(37.3772, 37.0654), 4326) FROM destinations WHERE name = 'Gaziantep Castle';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Silk Road Caravanserai', 'culture', 95, ST_SetSRID(ST_MakePoint(37.3800, 37.0680), 4326) FROM destinations WHERE name = 'Zeugma Mosaic Museum';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Savurga Yogurt Workshop', 'food', 105, ST_SetSRID(ST_MakePoint(37.3754, 37.0638), 4326) FROM destinations WHERE name = 'Gaziantep Castle';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Traditional Toy Museum', 'culture', 70, ST_SetSRID(ST_MakePoint(37.3795, 37.0675), 4326) FROM destinations WHERE name = 'Zeugma Mosaic Museum';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Dinner at Historic Mansion', 'food', 380, ST_SetSRID(ST_MakePoint(37.3766, 37.0646), 4326) FROM destinations WHERE name = 'Gaziantep Castle';


-- ACTIVITIES FOR MARDIN (20 activities, 1 free)
INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Mardin Old City Sunset Walk', 'culture', 0, ST_SetSRID(ST_MakePoint(40.7355, 37.3135), 4326) FROM destinations WHERE name = 'Mardin Old City';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Dara Ancient City Tour', 'culture', 110, ST_SetSRID(ST_MakePoint(40.8750, 37.2000), 4326) FROM destinations WHERE name = 'Dara Ancient City';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Deyrulzafaran Monastery', 'culture', 90, ST_SetSRID(ST_MakePoint(40.6850, 37.2850), 4326) FROM destinations WHERE name = 'Mardin Old City';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Stone Houses Photography', 'culture', 80, ST_SetSRID(ST_MakePoint(40.7348, 37.3128), 4326) FROM destinations WHERE name = 'Mardin Old City';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Traditional Mesopotamian Breakfast', 'food', 180, ST_SetSRID(ST_MakePoint(40.7352, 37.3132), 4326) FROM destinations WHERE name = 'Mardin Old City';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Mardin Museum Visit', 'culture', 75, ST_SetSRID(ST_MakePoint(40.7360, 37.3140), 4326) FROM destinations WHERE name = 'Mardin Old City';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Kasimiye Medrese Tour', 'culture', 65, ST_SetSRID(ST_MakePoint(40.7380, 37.3150), 4326) FROM destinations WHERE name = 'Mardin Old City';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Midyat Silver Shopping', 'culture', 200, ST_SetSRID(ST_MakePoint(41.3700, 37.4200), 4326) FROM destinations WHERE name = 'Dara Ancient City';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Syriac Heritage Tour', 'culture', 140, ST_SetSRID(ST_MakePoint(40.7345, 37.3125), 4326) FROM destinations WHERE name = 'Mardin Old City';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Rooftop Restaurant Dinner', 'food', 320, ST_SetSRID(ST_MakePoint(40.7358, 37.3138), 4326) FROM destinations WHERE name = 'Mardin Old City';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Hasankeyf Ancient City', 'culture', 160, ST_SetSRID(ST_MakePoint(41.4050, 37.7150), 4326) FROM destinations WHERE name = 'Dara Ancient City';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Traditional Mardin Cuisine', 'food', 250, ST_SetSRID(ST_MakePoint(40.7354, 37.3134), 4326) FROM destinations WHERE name = 'Mardin Old City';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Zinciriye Medrese', 'culture', 55, ST_SetSRID(ST_MakePoint(40.7342, 37.3122), 4326) FROM destinations WHERE name = 'Mardin Old City';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Mesopotamian Plain View', 'nature', 70, ST_SetSRID(ST_MakePoint(40.7365, 37.3145), 4326) FROM destinations WHERE name = 'Mardin Old City';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Historic Bazaar Shopping', 'culture', 120, ST_SetSRID(ST_MakePoint(40.7350, 37.3130), 4326) FROM destinations WHERE name = 'Mardin Old City';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Saffron Tea House', 'food', 95, ST_SetSRID(ST_MakePoint(40.7356, 37.3136), 4326) FROM destinations WHERE name = 'Mardin Old City';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Mor Gabriel Monastery', 'culture', 130, ST_SetSRID(ST_MakePoint(41.5400, 37.3400), 4326) FROM destinations WHERE name = 'Dara Ancient City';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Stone Carving Workshop', 'culture', 150, ST_SetSRID(ST_MakePoint(40.7362, 37.3142), 4326) FROM destinations WHERE name = 'Mardin Old City';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Abbasid Palace Visit', 'culture', 85, ST_SetSRID(ST_MakePoint(40.7357, 37.3137), 4326) FROM destinations WHERE name = 'Mardin Old City';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Sunset Photography Tour', 'nature', 110, ST_SetSRID(ST_MakePoint(40.7368, 37.3148), 4326) FROM destinations WHERE name = 'Mardin Old City';


-- ACTIVITIES FOR RIZE (20 activities, 1 free)
INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Ayder Plateau Nature Walk', 'nature', 0, ST_SetSRID(ST_MakePoint(40.9505, 40.8575), 4326) FROM destinations WHERE name = 'Ayder Plateau';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Firtina Valley Hiking', 'nature', 120, ST_SetSRID(ST_MakePoint(40.8800, 41.0100), 4326) FROM destinations WHERE name = 'Firtina Valley';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Ayder Hot Springs', 'nature', 150, ST_SetSRID(ST_MakePoint(40.9500, 40.8570), 4326) FROM destinations WHERE name = 'Ayder Plateau';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Tea Plantation Tour', 'culture', 90, ST_SetSRID(ST_MakePoint(40.5200, 41.0300), 4326) FROM destinations WHERE name = 'Firtina Valley';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Zilkale Castle Trek', 'culture', 110, ST_SetSRID(ST_MakePoint(40.8550, 41.0250), 4326) FROM destinations WHERE name = 'Firtina Valley';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Traditional Black Sea Breakfast', 'food', 180, ST_SetSRID(ST_MakePoint(40.9502, 40.8572), 4326) FROM destinations WHERE name = 'Ayder Plateau';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Kackar Mountains Trekking', 'nature', 250, ST_SetSRID(ST_MakePoint(41.0500, 40.8500), 4326) FROM destinations WHERE name = 'Ayder Plateau';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Palovit Waterfall Visit', 'nature', 80, ST_SetSRID(ST_MakePoint(40.9800, 40.8650), 4326) FROM destinations WHERE name = 'Ayder Plateau';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Rize Castle Tour', 'culture', 60, ST_SetSRID(ST_MakePoint(40.5220, 41.0280), 4326) FROM destinations WHERE name = 'Firtina Valley';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Traditional Muhlama Meal', 'food', 140, ST_SetSRID(ST_MakePoint(40.9498, 40.8568), 4326) FROM destinations WHERE name = 'Ayder Plateau';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Pokut Plateau Day Trip', 'nature', 160, ST_SetSRID(ST_MakePoint(40.9650, 40.9850), 4326) FROM destinations WHERE name = 'Ayder Plateau';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Storm Valley Zip Line', 'nature', 200, ST_SetSRID(ST_MakePoint(40.8805, 41.0105), 4326) FROM destinations WHERE name = 'Firtina Valley';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Rize Tea Museum', 'culture', 75, ST_SetSRID(ST_MakePoint(40.5210, 41.0290), 4326) FROM destinations WHERE name = 'Firtina Valley';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Rafting on Firtina River', 'nature', 280, ST_SetSRID(ST_MakePoint(40.8810, 41.0110), 4326) FROM destinations WHERE name = 'Firtina Valley';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Mountain Lodge Stay', 'nature', 350, ST_SetSRID(ST_MakePoint(40.9508, 40.8578), 4326) FROM destinations WHERE name = 'Ayder Plateau';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Traditional Tea House', 'food', 70, ST_SetSRID(ST_MakePoint(40.9495, 40.8565), 4326) FROM destinations WHERE name = 'Ayder Plateau';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Anzer Honey Tasting', 'food', 120, ST_SetSRID(ST_MakePoint(40.6500, 40.6500), 4326) FROM destinations WHERE name = 'Firtina Valley';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Horseback Riding in Valley', 'nature', 190, ST_SetSRID(ST_MakePoint(40.9510, 40.8580), 4326) FROM destinations WHERE name = 'Ayder Plateau';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Historic Stone Bridges Tour', 'culture', 95, ST_SetSRID(ST_MakePoint(40.8795, 41.0095), 4326) FROM destinations WHERE name = 'Firtina Valley';

INSERT INTO activities (destination_id, name, category, cost, geom)
SELECT id, 'Photography Workshop', 'culture', 170, ST_SetSRID(ST_MakePoint(40.9512, 40.8582), 4326) FROM destinations WHERE name = 'Ayder Plateau';


-- ITINERARIES
INSERT INTO itineraries (user_id, destination_id, day_number, total_cost) VALUES
(1, 1, 1, 1500),
(1, 7, 2, 2000);