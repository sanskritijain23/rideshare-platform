// Database connection setup using the native `pg` package.
// No ORM is used at this stage (see docs/database-design.md for rationale).
//
// Ownership note: the DATABASE member owns schema/migrations/seed data
// (see /database). This file is owned by the BACKEND member and is
// responsible only for the application-level connection to Postgres.
//
// This file intentionally does NOT contain business queries.
// Query/data-access functions belong in src/repositories/ once features
// are implemented.

import pkg from "pg";
import dotenv from "dotenv";

dotenv.config();

const { Pool } = pkg;

const pool = new Pool({
  host: process.env.DB_HOST || "localhost",
  port: process.env.DB_PORT || 5432,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME
});

pool.on("error", (err) => {
  console.error("Unexpected error on idle PostgreSQL client", err);
});

export default pool;
