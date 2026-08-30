-- Seed data placeholder
-- Owned by: Member 3 (Database)
--
-- Purpose: will contain sample users, rides, and bookings for local
-- development and manual testing once the schema exists.
-- Keep seed data clearly fake (no real personal data, no real credentials).

-- ============================================
-- SAMPLE USERS
-- ============================================

INSERT INTO users
(name, email, password_hash, phone, role)
VALUES
(
    'Rahul Sharma',
    'rahul@example.com',
    'temporary_hash_1',
    '9876543210',
    'driver'
),
(
    'Ananya Singh',
    'ananya@example.com',
    'temporary_hash_2',
    '9876543211',
    'passenger'
),
(
    'Arjun Verma',
    'arjun@example.com',
    'temporary_hash_3',
    '9876543212',
    'both'
);

-- ============================================
-- SAMPLE RIDES
-- ============================================

INSERT INTO rides
(
    driver_id,
    source,
    destination,
    travel_date,
    departure_time,
    vehicle_type,
    vehicle_number,
    available_seats,
    contribution_per_seat,
    status
)
VALUES
(
    1,
    'Bhopal',
    'Indore',
    '2026-09-10',
    '08:30',
    'car',
    'MP04AB1234',
    3,
    250.00,
    'active'
),
(
    3,
    'Bhopal',
    'Sehore',
    '2026-09-11',
    '09:00',
    'bike',
    'MP04CD5678',
    1,
    100.00,
    'active'
);

-- ============================================
-- SAMPLE BOOKING
-- ============================================

INSERT INTO bookings
(
    ride_id,
    passenger_id,
    seats_requested,
    status
)
VALUES
(
    1,
    2,
    1,
    'pending'
);