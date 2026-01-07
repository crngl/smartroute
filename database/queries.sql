-- Cheap activities (budget filter)
SELECT name, category, cost
FROM activities
WHERE cost <= 200
ORDER BY cost ASC;

-- Distance between activities and their destinations (km)
SELECT
    a.name AS activity,
    d.name AS destination,
    ST_Distance(
        a.geom::geography,
        d.geom::geography
    ) / 1000 AS distance_km
FROM activities a
JOIN destinations d ON a.destination_id = d.id;

-- Destinations within 50 km of Ankara
SELECT name
FROM destinations
WHERE ST_DWithin(
    geom::geography,
    ST_MakePoint(32.8597, 39.9334)::geography,
    50000
);
