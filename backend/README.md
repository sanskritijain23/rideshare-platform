# Rideshare Platform — Backend

## Ownership / Responsibility
This folder is owned by **Member 2 (Backend & REST APIs)**.
It contains the Express.js application: controllers, routes, services,
middleware, validators, and the application's database connection wiring.

**Important ownership boundary** (see also `docs/database-design.md`):
- The **database member** (Member 3) owns schema design, migrations, and seed
  data — all of that lives in `/database` at the repo root.
- The **backend member** (Member 2) owns `src/config/db.js` (the application's
  connection to PostgreSQL) and `src/repositories/` (data-access functions that
  use that connection). Backend code should query the database according to the
  schema defined in `/database`, not redefine it.

## Tech Stack
- Node.js + Express.js
- PostgreSQL via the `pg` package (no ORM at this stage)
- JWT for authentication tokens
- bcrypt for password hashing

## Folder Structure
```
src/
├── config/         # env-driven configuration, DB connection (db.js)
├── controllers/     # request handlers — parse req, call services, send res
├── routes/           # Express routers, one file per resource
├── services/         # business logic, independent of Express req/res
├── repositories/      # direct PostgreSQL queries / data-access functions
├── middleware/         # auth guard, error handler, request logging, etc.
├── validators/          # request payload validation schemas
├── utils/                # JWT helpers, response formatters, etc.
├── app.js                 # Express app configuration
└── server.js               # process entry point (port binding)
tests/                       # Jest/Supertest test files
```

Only `config/db.js`, `app.js`, and `server.js` contain code at this stage.
Other folders are empty (tracked with `.gitkeep`) — controllers, routes,
services, etc. will be added per feature as they're implemented.

## Setup (Windows PowerShell)
```powershell
cd backend
npm install
copy .env.example .env
npm run dev
```

Health check once running: `GET http://localhost:5000/api/health`

## Environment Variables
See `.env.example`. Copy it to `.env` and set real local values (DB
credentials, JWT secret). Never commit `.env`.

## Testing
Jest + Supertest are included as dev dependencies. Test files go in `/tests`.
No tests exist yet — they'll be added alongside each feature
(see `docs/testing-plan.md`).

## Notes
- No ORM is used. Raw SQL via `pg` is used intentionally, per
  `docs/database-design.md`, so the team practices writing and understanding
  SQL directly.
- No business routes/controllers exist yet — only the health-check route in
  `app.js` — to keep this stage strictly scaffolding.
