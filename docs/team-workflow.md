# Team Workflow

## Team Division
| Member | Responsibility |
|---|---|
| Member 1 | Frontend & UI/UX (`/frontend`) |
| Member 2 | Backend & REST APIs (`/backend`) |
| Member 3 | Database design, migrations, seed data (`/database`) |

## Branch Strategy
- `main` — always stable, deployable code
- `develop` — integration branch where finished feature branches are merged
- Feature branches — created off `develop`, one per feature/task

### Feature Branch Naming
Use `<area>/<short-description>`:
- `frontend/login-page`
- `frontend/ride-search-ui`
- `backend/auth-api`
- `backend/ride-crud-api`
- `database/initial-schema`
- `database/booking-seed-data`

## Workflow
1. Pull latest `develop`
2. Create a feature branch off `develop`
3. Commit small, focused changes with clear messages
4. Open a Pull Request into `develop` (use the PR template)
5. At least one other team member reviews before merging
6. Periodically, `develop` is merged into `main` once stable

## Pull Requests
- Keep PRs scoped to one feature/task
- Reference the related item in `docs/requirements.md` if applicable
- If the PR changes an API endpoint's request/response shape, update
  `docs/api-contract.md` in the same PR
- If the PR changes the schema, add a migration file and update
  `database/schema/schema.sql` in the same PR

## Communication
- Any change to shared contracts (`docs/api-contract.md`,
  `docs/database-design.md`) should be flagged to the affected teammate
  before merging, not just left in the PR description
- Use a shared chat (WhatsApp/Discord/etc.) for quick sync; use PR
  comments for anything that should be traceable later

## Commit Messages
Keep them short and descriptive, e.g.:
- `backend: add JWT auth middleware`
- `frontend: build ride search form UI`
- `database: add rides table migration`
