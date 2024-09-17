import { Knex } from "knex";
import Database from "better-sqlite3";
import { drizzle, BetterSQLiteTransaction } from "drizzle-orm/better-sqlite3";
import { uuid } from "uuidv4";
import { eq } from "drizzle-orm";
const knex = require("knex");
const sqliteDb = new Database("./food_and_recipe.sqlite");
const db = drizzle(sqliteDb);



import { foodGroups, foodNames, nutrientNames, mealsTypes } from "./schema/foodAndRecipe.schema";

const knexLast = knex({
   client: "sqlite3",
   connection: {
      filename: "./foods&Recipes.sqlite",
   },
   useNullAsDefault: true,
});

async function getGroupData() {
   const groupData = await knexLast("food_groups").select();
   for (const group of groupData) {
      const res = await db.insert(foodGroups).values(group).returning({ groupId: foodGroups.groupId });
      console.log(res);
   }
}

async function getFoodNameData() {
   const foodData = await knexLast("food_names").select();
   for (const foodName of foodData) {
      const nutrientAmounts = await knexLast("nutrient_amounts")
         .select("nutrientId", "nutrientValue", "originalValue")
         .where("foodId", foodName.foodId);
      const insertFood = {
         foodId: foodName.foodId,
         foodCode: foodName.foodCode,
         groupId: foodName.groupId,
         foodName: foodName.foodName,
         foodNameF: foodName.foodNameF,
         scientificName: foodName.scientificName,
         foodSource: foodName.foodSource,
         foodOrigin: foodName.foodOrigin,
         foodNutrients: nutrientAmounts,
      };
      const res = await db.insert(foodNames).values(insertFood).returning({ foodId: foodNames.foodId });
      console.log("Food Insertion", res);
   }
}

async function getNutrientNameData() {
   const nutrientNameData = await knexLast("nutrient_names").select();
   for (const nutrientName of nutrientNameData) {
      const nutrient = {
         nutrientId: nutrientName.nutrientId,
         nutrientCode: nutrientName.nutrientCode,
         nutrientName: nutrientName.nutrientName,
         nutrientNameF: nutrientName.nutrientNameF,
         nutrientUnit: nutrientName.nutrientUnit,
         nutrientSymbol: nutrientName.nutrientSymbol,
         tagname: nutrientName.tagname,
         nutrientDecimal: nutrientName.nutrientDecimal,
      };
      const res = await db.insert(nutrientNames).values(nutrient).returning({ nutrientId: nutrientNames.nutrientId });
      console.log("Nutrient Insertion", res);
   }
}


async function getMealsTypeData() {
   const mealsType = await knexLast("meals_types").select();
   for (const meals of mealsType) {
      const { typeId, ...otherMealsProps } = meals;
      const newTypeId = uuid();
      const res = await db.insert(mealsTypes).values({
         ...otherMealsProps,
         typeId: newTypeId,
      });
      console.log("Meals Type Insertion", res);
   }
}

(async () => {
   const start = Date.now();
   await getGroupData();
   await getNutrientNameData();
   await getFoodNameData();
   await getMealsTypeData();
   console.log("Temps passer :", (Date.now() - start) / 3600, "min");
})();
