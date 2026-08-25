# Requirements

## 1. Project Purpose
A practice full-stack ride-sharing platform, built as a learning exercise
ahead of an Odoo Hackathon. Not intended for production use.

## 2. User Roles
- **Driver** — posts rides, manages booking requests
- **Passenger** — searches rides, sends booking requests
- A single user account can act as driver, passenger, or both

## 3. Functional Requirements (MVP)
| # | Requirement | Role |
|---|---|---|
| 1 | Register and log in | All |
| 2 | Toggle/act as driver, passenger, or both | All |
| 3 | Post a ride (source, destination, date/time, seats, fuel contribution) | Driver |
| 4 | View own posted rides | Driver |
| 5 | Update a posted ride | Driver |
| 6 | Cancel a posted ride | Driver |
| 7 | Search rides by source, destination, date | Passenger |
| 8 | Send a booking request for a ride | Passenger |
| 9 | Accept or reject a booking request | Driver |
| 10 | Available seats update after a booking is confirmed | System |
| 11 | View upcoming and previous rides | All |
| 12 | View/edit basic profile | All |
| 13 | Authorization — users can only modify their own rides/bookings | System |
| 14 | Input validation and consistent error responses | System |

## 4. Non-Functional Requirements
- Passwords stored hashed (bcrypt), never in plain text
- JWT-based authentication for protected routes
- Basic input validation on all write endpoints
- Reasonable error messages (no raw stack traces to the client)
- Codebase should remain simple enough for 3 students to reason about —
  avoid unnecessary enterprise patterns

## 5. Out of Scope (for MVP)
- Payments / real money transfer
- Real-time chat between driver and passenger
- Live location tracking / maps routing
- Ratings and reviews
- Push notifications

## 6. Open Questions
_(Fill in as the team clarifies scope — e.g. can a ride have multiple
passengers per seat-count, what happens to pending requests when a ride is
cancelled, etc.)_
