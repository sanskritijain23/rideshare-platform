-- Reusable / reference SQL queries
-- Owned by: Member 3 (Database), consumed by Member 2 (Backend repositories)
--
-- Purpose: a shared place to draft and review queries (e.g. "find matching
-- rides by source/destination/date") before they are implemented as
-- functions in backend/src/repositories/.
--
-- No queries yet — schema must be finalized first.

-- Get all users
SELECT *
FROM users;


-- Get all active rides
SELECT *
FROM rides
WHERE status = 'active';


-- Search rides
SELECT *
FROM rides
WHERE source = 'Bhopal'
  AND destination = 'Indore'
  AND travel_date = '2026-09-10'
  AND status = 'active'
  AND available_seats > 0;


-- Get rides posted by a driver
SELECT *
FROM rides
WHERE driver_id = 1;


-- Get bookings for a ride
SELECT *
FROM bookings
WHERE ride_id = 1;


-- Get bookings made by a passenger
SELECT *
FROM bookings
WHERE passenger_id = 2;


-- Get ride details with driver information
SELECT
    r.id,
    r.source,
    r.destination,
    r.travel_date,
    r.departure_time,
    r.vehicle_type,
    r.available_seats,
    r.contribution_per_seat,
    u.name AS driver_name,
    u.phone AS driver_phone
FROM rides r
JOIN users u
    ON r.driver_id = u.id
WHERE r.status = 'active';


-- Get booking details
SELECT
    b.id AS booking_id,
    b.status AS booking_status,
    b.seats_requested,
    u.name AS passenger_name,
    r.source,
    r.destination,
    r.travel_date
FROM bookings b
JOIN users u
    ON b.passenger_id = u.id
JOIN rides r
    ON b.ride_id = r.id;