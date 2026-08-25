// Express application setup.
// Routes/controllers/middleware will be registered here as they are built.
// This is intentionally minimal — no business routes yet.

import express from "express";
import cors from "cors";

const app = express();

app.use(cors());
app.use(express.json());

// Basic health check endpoint — useful for confirming the server + env
// setup works before any real API routes exist.
app.get("/api/health", (req, res) => {
  res.json({ status: "ok" });
});

// Feature routes (auth, rides, bookings, etc.) will be mounted here later,
// e.g.: app.use("/api/auth", authRoutes);

export default app;
