# Testing Plan

## Goals
Practice testing across the stack — not aiming for full production-grade
coverage, but enough to build good habits and catch regressions during the
hackathon prep.

## Layers

### 1. Database Testing (Member 3)
- Verify schema constraints (NOT NULL, foreign keys, unique constraints)
  behave as expected
- Verify seed data loads cleanly
- Sanity-check key queries in `database/queries/` return expected shapes

### 2. Backend Testing (Member 2)
- Unit tests (Jest) for services/utils with no external dependencies
- Integration tests (Jest + Supertest) for API endpoints once implemented,
  covering:
  - happy path
  - validation errors
  - authorization failures (e.g. editing another user's ride)
- Test files live in `backend/tests/`

### 3. API Testing (Manual, all members)
- Postman collection maintained alongside `docs/api-contract.md`
- Every new endpoint gets at least one request added to the collection
  before merging
- Export/commit the Postman collection once created (e.g. `docs/postman/`)

### 4. Frontend Testing (Member 1)
- Manual testing of flows against the running backend during development
- (Optional, time permitting) component tests for critical reusable
  components

## Test Data
Use `database/seeds/` for consistent local test data — avoid inventing ad-hoc
data per test session so bugs are reproducible across the team.

## Status
No tests exist yet — this document will be filled in with actual test
checklists as each MVP feature (auth, rides, bookings) is implemented.
