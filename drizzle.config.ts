import { defineConfig, Config } from "drizzle-kit";
import path from "path";

const config: Config = {
   dialect: "sqlite",
   schema: "./src/schema/patientNeeds.ts",
   out: "./src/migrations",
   // driver: "better-sqlite3",
   dbCredentials: {
      url: "./src/patient_needs.sqlite",
   },
   verbose: true,
   strict: true,
};

export default config;
