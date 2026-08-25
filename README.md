# Rideshare Platform

A practice full-stack ride-sharing platform, built by a 3-member student team
as preparation for an Odoo Hackathon.

> **Status:** Learning project. Not intended for production use.

## Project Idea
The platform connects passengers with people already travelling in the same
direction who have an empty seat in their car or bike. A driver can post a
ride, and a passenger can search for a matching ride and send a booking
request. The passenger contributes a small amount towards fuel.

This project exists to practice: requirement analysis, UI/UX, frontend
development, backend development, database design, authentication, API
integration, testing, deployment, and presentation.

## Core MVP Features
- User registration and login
- User can act as a driver, passenger, or both
- Driver can post, view, update, and cancel a ride
- Passenger can search rides by source, destination, and date
- Passenger can send a booking request
- Driver can accept or reject a booking request
- Available seats update after a booking is confirmed
- View upcoming and previous rides
- Basic user profile
- Authorization, validation, and error handling throughout

## Tech Stack
| Layer | Technology |
|---|---|
| Frontend | React (Vite), Tailwind CSS, React Router, Axios |
| Backend | Node.js, Express.js, JWT, bcrypt |
| Database | PostgreSQL (via `pg`, no ORM) |
| API Testing | Postman |
| Version Control | Git + GitHub |

## Team Division
| Member | Responsibility | Folder |
|---|---|---|
| Member 1 | Frontend & UI/UX | `/frontend` |
| Member 2 | Backend & REST APIs | `/backend` |
| Member 3 | Database design, migrations, seed data | `/database` |

Shared documentation (requirements, API contract, etc.) lives in `/docs` and
should be kept in sync by whoever changes the relevant contract.

## Repository Structure
```
rideshare-platform/
├── frontend/     # React app (Member 1)
├── backend/      # Express API (Member 2)
├── database/     # Schema, migrations, seeds (Member 3)
├── docs/         # Shared documentation
└── .github/      # PR template, CI workflow
```
Each folder has its own README with a more detailed responsibility note and
setup instructions.

## Getting Started (Windows PowerShell / VS Code)

### Prerequisites
- Node.js (v20+ recommended)
- PostgreSQL installed locally **or** Docker Desktop (see below)
- Git

### Option A — Without Docker (native setup)
```powershell
# 1. Clone the repo
git clone https://github.com/<your-org-or-username>/rideshare-platform.git
cd rideshare-platform

# 2. Set up the database (requires local PostgreSQL + psql on PATH)
createdb rideshare_dev
psql -d rideshare_dev -f database/schema/schema.sql

# 3. Set up the backend
cd backend
npm install
copy .env.example .env
# edit .env with your local DB credentials and a JWT secret
npm run dev

# 4. Set up the frontend (in a new terminal)
cd frontend
npm install
copy .env.example .env
npm run dev
```
Frontend runs at `http://localhost:5173`, backend at `http://localhost:5000`.

### Option B — With Docker (optional)
Before running Docker, create the backend's `.env` file (the compose file
reads it via `env_file`):
```powershell
copy backend\.env.example backend\.env
```
Then start everything:
```powershell
docker compose up --build
```
This starts PostgreSQL, the backend, and the frontend together. Docker is
**not required** — Option A works fully without it. Use whichever is more
convenient for you.

## Branch Strategy
- `main` — stable code only
- `develop` — integration branch for finished features
- Feature branches — created off `develop`, named `<area>/<short-description>`:
  - `frontend/login-page`
  - `backend/auth-api`
  - `database/initial-schema`

See `docs/team-workflow.md` for the full workflow and PR process.

## Documentation
- `docs/requirements.md` — functional & non-functional requirements
- `docs/api-contract.md` — shared frontend/backend API field-name contract
- `docs/database-design.md` — schema design & ownership notes
- `docs/testing-plan.md` — testing approach across layers
- `docs/team-workflow.md` — branching, PRs, and team process

## Current Stage
This repository currently contains **only the initial project scaffolding**:
folder structure, configuration files, and documentation templates. No
business features (auth, rides, bookings) are implemented yet.
