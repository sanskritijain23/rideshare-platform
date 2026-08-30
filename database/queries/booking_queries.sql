-- ============================================================================
-- RideShare Platform — Booking Queries
-- Owned by: Member 3 (Database)
--
-- These queries are intended to be executed together inside a
-- PostgreSQL transaction by the backend repository.
-- ============================================================================


-- ============================================================================
-- 1. Lock the ride and check available seats
-- ============================================================================
-- Parameters:
--   $1 = ride_id
--   $2 = seats_requested
--
-- The backend should check that a row is returned before creating
-- the booking.

SELECT
    id,
    available_seats,
    status
FROM rides
WHERE id = $1
  AND status = 'active'
  AND available_seats >= $2
FOR UPDATE;


-- ============================================================================
-- 2. Create a pending booking
-- ============================================================================
-- Parameters:
--   $1 = ride_id
--   $2 = passenger_id
--   $3 = seats_requested

INSERT INTO bookings
(
    ride_id,
    passenger_id,
    seats_requested,
    status
)
VALUES
(
    $1,
    $2,
    $3,
    'pending'
)
RETURNING
    id,
    ride_id,
    passenger_id,
    seats_requested,
    status;


-- ============================================================================
-- 3. Decrease available seats after booking acceptance
-- ============================================================================
-- Parameters:
--   $1 = seats_requested
--   $2 = ride_id

UPDATE rides
SET
    available_seats = available_seats - $1,
    updated_at = CURRENT_TIMESTAMP
WHERE id = $2
  AND status = 'active'
  AND available_seats >= $1
RETURNING
    id,
    available_seats;


-- ============================================================================
-- 4. Accept a pending booking
-- ============================================================================
-- Parameters:
--   $1 = booking_id

UPDATE bookings
SET
    status = 'accepted',
    updated_at = CURRENT_TIMESTAMP
WHERE id = $1
  AND status = 'pending'
RETURNING
    id,
    status;


-- ============================================================================
-- 5. Cancel an accepted booking
-- ============================================================================
-- Parameters:
--   $1 = booking_id

UPDATE bookings
SET
    status = 'cancelled',
    updated_at = CURRENT_TIMESTAMP
WHERE id = $1
  AND status = 'accepted'
RETURNING
    id,
    ride_id,
    passenger_id,
    seats_requested,
    status;


-- ============================================================================
-- 6. Restore seats after cancelling an accepted booking
-- ============================================================================
-- Parameters:
--   $1 = seats_requested
--   $2 = ride_id

UPDATE rides
SET
    available_seats = available_seats + $1,
    updated_at = CURRENT_TIMESTAMP
WHERE id = $2
RETURNING
    id,
    available_seats;