import Database from "better-sqlite3";
import { drizzle,BetterSQLiteTransaction } from "drizzle-orm/better-sqlite3";

import {eq} from "drizzle-orm"
import { patients } from "./schema/patient.schema";
const sqliteDb = new Database("./src/patient.sqlite");
const db = drizzle(sqliteDb);
function yello(tx:BetterSQLiteTransaction){
  console.log("hello")
}
(async () => {
   const start = Date.now();
 await  db.transaction(tx=>{
     yello(tx)
   })
   const result = await db.select().from(patients).where(eq(patients.id,"mmm")).get();
   console.log("....", Date.now() - start, "ms");
   console.log(!!result);
})();
