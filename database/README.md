# Rideshare Platform — Database

## Ownership / Responsibility
This folder is owned by **Member 3 (Database)**.
It contains schema design, migrations, seed data, reusable queries, and the
ER diagram for the PostgreSQL database.

**Ownership boundary** (see also `backend/README.md` and
`docs/database-design.md`):
- **This member (Database)** owns everything in this folder: table design,
  constraints, indexes, migrations, and seed data.
- **The backend member** owns the application's connection to the database
  (`backend/src/config/db.js`) and how the backend queries it
  (`backend/src/repositories/`). Backend code should consume the schema
  defined here, not redefine it.

## Tech Stack
- PostgreSQL
- Plain SQL (no ORM) — migrations and schema are hand-written `.sql` files

## Folder Structure
```
schema/         # schema.sql — full current schema snapshot (source of truth)
migrations/     # sequential, incremental schema changes (NNNN_description.sql)
seeds/          # sample data for local development
queries/        # reusable/reference SQL queries, drafted here before backend uses them
er-diagram/     # exported ER diagram image + notes
```

## Local Setup (Windows PowerShell)
Assuming PostgreSQL is installed locally and `psql` is on PATH:
```powershell
# Create the database (adjust user as needed)
createdb rideshare_dev

# Apply the schema
psql -d rideshare_dev -f schema/schema.sql

# Apply seed data (once available)
psql -d rideshare_dev -f seeds/seed_placeholder.sql
```

Alternatively, use the root `docker-compose.yml` to run PostgreSQL in a
container without installing it locally.

## Conventions
- Migration files are numbered sequentially and never edited after being
  merged to `develop`/`main` — a new migration is added instead.
- `schema/schema.sql` is kept in sync with the cumulative effect of all
  migrations, so a new developer can set up the DB from this one file.
- No real/sensitive data is ever placed in `seeds/`.

## Status
No tables are defined yet. Schema design will follow the requirements in
`docs/requirements.md` and be documented in `docs/database-design.md` before
the first real migration is written.
