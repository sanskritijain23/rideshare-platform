# Rideshare Platform — Frontend

## Ownership / Responsibility
This folder is owned by **Member 1 (Frontend & UI/UX)**.
It contains the React (Vite) client application: UI components, pages, layouts,
routing, and API-consuming logic. This member is responsible for UI/UX decisions,
component structure, and integrating with the backend REST API described in
`docs/api-contract.md`.

Backend and database internals should not be modified from this folder — if an
API response shape needs to change, raise it against `docs/api-contract.md` first
so the backend developer can update it consistently.

## Tech Stack
- React 18 + Vite
- Tailwind CSS
- React Router
- Axios

## Folder Structure
```
src/
├── assets/       # images, icons, fonts
├── components/   # reusable, presentation-focused UI pieces
├── pages/        # route-level views
├── layouts/      # shared page shells (e.g. authenticated layout, auth layout)
├── services/     # Axios instance + API call wrappers (one file per resource)
├── context/      # React Context providers (added only when state sharing is needed)
├── hooks/        # custom hooks
├── utils/        # formatters, constants, helper functions
└── routes/       # route configuration / route guards
```

Folders are currently empty (tracked with `.gitkeep`) and will be filled in as
features are implemented — no placeholder components have been pre-created.

## Linting
ESLint is configured (`.eslintrc.cjs`) with the React and React Hooks plugins.
Run:
```powershell
npm run lint
```

## Setup (Windows PowerShell)
```powershell
cd frontend
npm install
copy .env.example .env
npm run dev
```

The dev server runs at `http://localhost:5173` by default.

## Environment Variables
See `.env.example`. Copy it to `.env` and adjust `VITE_API_BASE_URL` to point at
your local backend instance. Never commit `.env`.

## Notes
- No state management library is included yet. Context/state will be introduced
  only when a specific feature (e.g. auth session) actually requires it.
- Business feature code (auth pages, ride search, booking flow, etc.) will be
  added in later iterations — this is scaffolding only.
