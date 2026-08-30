-- ============================================================================
-- Migration 0002
-- Allow rides to have zero available seats
-- ============================================================================

ALTER TABLE rides
DROP CONSTRAINT rides_available_seats_check;

ALTER TABLE rides
ADD CONSTRAINT rides_available_seats_check
CHECK (available_seats >= 0);