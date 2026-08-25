// Server entry point. Keeps app.js (Express config) separate from
// the actual process/port binding for easier testing later.

import dotenv from "dotenv";
import app from "./app.js";

dotenv.config();

const PORT = process.env.PORT || 5000;

app.listen(PORT, () => {
  console.log(`Backend server running on port ${PORT}`);
});
