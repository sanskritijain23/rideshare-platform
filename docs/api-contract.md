# API Contract

This is the **shared source of truth** for request/response field names
between frontend and backend. Update this file *before* changing an endpoint's
shape, so both sides stay in sync.

Base URL (local dev): `http://localhost:5000/api`

All request/response bodies are JSON. All protected endpoints require:
`Authorization: Bearer <jwt_token>`

---

## Conventions
- Field names: `camelCase`
- Dates: ISO 8601 strings, e.g. `"2026-09-01T09:00:00Z"`
- IDs: integers (or UUIDs — decide and note here once finalized)
- Every error response follows the same shape:
```json
{
  "success": false,
  "message": "Human-readable error message",
  "errors": [
    { "field": "email", "message": "Email is required" }
  ]
}
```
- Every success response follows:
```json
{
  "success": true,
  "data": { }
}
```

---

## Health Check
`GET /health`
```json
{ "status": "ok" }
```

---

## Auth (template — to be finalized when implemented)

### Register
`POST /auth/register`
Request:
```json
{
  "name": "string",
  "email": "string",
  "password": "string",
  "phone": "string"
}
```
Response:
```json
{
  "success": true,
  "data": {
    "user": { "id": 1, "name": "string", "email": "string" },
    "token": "jwt-string"
  }
}
```

### Login
`POST /auth/login`
Request:
```json
{ "email": "string", "password": "string" }
```
Response: same shape as Register.

---

## Rides (template — to be finalized when implemented)

### Post a ride
`POST /rides` _(driver only)_
Request:
```json
{
  "source": "string",
  "destination": "string",
  "departureTime": "ISO8601 string",
  "availableSeats": "number",
  "fuelContribution": "number",
  "vehicleType": "car | bike"
}
```

### Search rides
`GET /rides?source=&destination=&date=`

### Update a ride
`PUT /rides/:id` _(owner driver only)_

### Cancel a ride
`DELETE /rides/:id` _(owner driver only)_

---

## Bookings (template — to be finalized when implemented)

### Request a booking
`POST /bookings`
```json
{ "rideId": "number" }
```

### Accept / reject a booking
`PATCH /bookings/:id`
```json
{ "status": "accepted | rejected" }
```

---

## Notes
- This file will be expanded incrementally, feature by feature — it is
  intentionally sparse right now (MVP scaffolding stage only).
- Whoever implements an endpoint first should update this file in the same
  pull request.
