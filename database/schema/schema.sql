-- ============================================================================
-- Rideshare Platform — Database Schema
-- Owned by: Member 3 (Database)
--
-- This file should always reflect the CURRENT full schema (source of truth).
-- Incremental changes go into /migrations; this file is updated to match
-- after each migration is applied.
--
-- This file contains the current full database schema for the RideShare
-- platform. Incremental changes are tracked in /migrations and this file
-- is kept synchronized with the latest applied schema.
-- ============================================================================
CREATE TABLE users (
    id SERIAL PRIMARY KEY,

    name VARCHAR(100) NOT NULL,

    email VARCHAR(255) NOT NULL UNIQUE,

    password_hash VARCHAR(255) NOT NULL,

    phone VARCHAR(20),

    role VARCHAR(20) NOT NULL
        CHECK (role IN ('driver', 'passenger', 'both')),

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- RIDES
-- ============================================

CREATE TABLE rides (
    id SERIAL PRIMARY KEY,

    driver_id INTEGER NOT NULL,

    source VARCHAR(100) NOT NULL,

    destination VARCHAR(100) NOT NULL,

    travel_date DATE NOT NULL,

    departure_time TIME NOT NULL,

    vehicle_type VARCHAR(20) NOT NULL
        CHECK (vehicle_type IN ('car', 'bike')),

    vehicle_number VARCHAR(30),

    available_seats INTEGER NOT NULL
        CHECK (available_seats >= 0),

    contribution_per_seat NUMERIC(10,2) NOT NULL
        CHECK (contribution_per_seat >= 0),

    status VARCHAR(20) NOT NULL DEFAULT 'active'
        CHECK (status IN ('active', 'cancelled', 'completed')),

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_rides_driver
        FOREIGN KEY (driver_id)
        REFERENCES users(id)
        ON DELETE CASCADE,

    CONSTRAINT different_locations
        CHECK (source <> destination)
);


-- ============================================
-- BOOKINGS
-- ============================================

CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,

    ride_id INTEGER NOT NULL,

    passenger_id INTEGER NOT NULL,

    seats_requested INTEGER NOT NULL
        CHECK (seats_requested > 0),

    status VARCHAR(20) NOT NULL DEFAULT 'pending'
        CHECK (
            status IN (
                'pending',
                'accepted',
                'rejected',
                'cancelled',
                'completed'
            )
        ),

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_bookings_ride
        FOREIGN KEY (ride_id)
        REFERENCES rides(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_bookings_passenger
        FOREIGN KEY (passenger_id)
        REFERENCES users(id)
        ON DELETE CASCADE,

    CONSTRAINT unique_passenger_ride
        UNIQUE (ride_id, passenger_id)
);


-- ============================================
-- INDEXES
-- ============================================

CREATE INDEX idx_rides_driver_id
ON rides(driver_id);

CREATE INDEX idx_rides_search
ON rides(source, destination, travel_date);

CREATE INDEX idx_bookings_ride_id
ON bookings(ride_id);

CREATE INDEX idx_bookings_passenger_id
ON bookings(passenger_id);