# Database Design

## Ownership
- Schema design, migrations, and seed data: **Member 3 (Database)**
- Application-level connection (`backend/src/config/db.js`) and
  data-access code (`backend/src/repositories/`): **Member 2 (Backend)**

Backend code must reflect the schema defined here — the database member is the
source of truth for table structure, constraints, and relationships.

## Why no ORM
The team is using the raw `pg` package instead of an ORM (e.g. Sequelize,
Prisma) for this learning project so members practice writing and reading SQL
directly. This can be revisited later if the project grows.

## Entities (draft — finalize alongside requirements.md)
- **users** — id, name, email, password_hash, phone, created_at
- **rides** — id, driver_id (FK → users), source, destination,
  departure_time, available_seats, fuel_contribution, vehicle_type, status,
  created_at
- **bookings** — id, ride_id (FK → rides), passenger_id (FK → users),
  status (pending/accepted/rejected/cancelled), created_at

_(Exact columns, types, and constraints to be finalized by the database member
and reflected in `database/schema/schema.sql`.)_

## Relationships (draft)
- One user → many rides (as driver)
- One user → many bookings (as passenger)
- One ride → many bookings
- A ride's `available_seats` decreases when a booking is accepted

## ER Diagram
See `database/er-diagram/` — diagram to be added once entities are finalized.

## Migration Strategy
- Migrations live in `database/migrations/`, numbered sequentially
  (`0001_...`, `0002_...`)
- Each migration is a single, reviewable change
- `database/schema/schema.sql` is kept in sync with the cumulative result of
  all applied migrations
- Migrations are never edited after being merged — corrections are new
  migrations

## Seed Data Strategy
- `database/seeds/` contains clearly-fake sample data (users, rides) for
  local development and manual/API testing
- No real personal data or credentials, ever
