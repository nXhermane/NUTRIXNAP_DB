CREATE TABLE `food_groups` (
	`groupId` text PRIMARY KEY NOT NULL,
	`groupCode` text(15),
	`groupName` text(255),
	`groupNameF` text(255)
);
--> statement-breakpoint
CREATE TABLE `food_names` (
	`foodId` text PRIMARY KEY NOT NULL,
	`foodCode` text(10),
	`groupId` text NOT NULL,
	`foodName` text(255),
	`foodNameF` text(255),
	`scientificName` text(155),
	`foodSource` text(255),
	`foodOrigin` text(100),
	`foodNutrients` text,
	FOREIGN KEY (`groupId`) REFERENCES `food_groups`(`groupId`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `meals_categories` (
	`categoryId` text PRIMARY KEY NOT NULL,
	`name` text(200),
	`nameF` text(200)
);
--> statement-breakpoint
CREATE TABLE `meals_types` (
	`typeId` text PRIMARY KEY NOT NULL,
	`name` text,
	`nameF` text
);
--> statement-breakpoint
CREATE TABLE `nutrient_names` (
	`nutrientId` text PRIMARY KEY NOT NULL,
	`nutrientCode` text(10),
	`nutrientName` text(255),
	`nutrientNameF` text(255),
	`nutrientUnit` text(5),
	`nutrientSymbol` text(10),
	`tagname` text(20),
	`nutrientDecimal` text(15)
);
--> statement-breakpoint
CREATE TABLE `recipes` (
	`recipeId` text PRIMARY KEY NOT NULL,
	`name` text(255),
	`nameF` text(255),
	`categoryId` integer NOT NULL,
	`typeId` integer NOT NULL,
	`ingredients` text,
	`preparationMethod` text,
	`cookingTime` integer,
	`quantity` text,
	`description` text,
	FOREIGN KEY (`categoryId`) REFERENCES `meals_categories`(`categoryId`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`typeId`) REFERENCES `meals_types`(`typeId`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
DROP TABLE `consultation_places`;--> statement-breakpoint
DROP TABLE `nutritionists`;--> statement-breakpoint
DROP TABLE `refresh_tokens`;--> statement-breakpoint
DROP TABLE `services`;--> statement-breakpoint
CREATE INDEX `foodCodeIndex` ON `food_names` (`foodCode`);--> statement-breakpoint
CREATE INDEX `groupIdIndex` ON `food_names` (`groupId`);--> statement-breakpoint
CREATE INDEX `foodNameIndex` ON `food_names` (`foodName`);--> statement-breakpoint
CREATE INDEX `foodNameFIndex` ON `food_names` (`foodNameF`);--> statement-breakpoint
CREATE INDEX `foodIdIndex` ON `food_names` (`foodId`);--> statement-breakpoint
CREATE INDEX `nutrientIdIndex` ON `nutrient_names` (`nutrientId`);--> statement-breakpoint
CREATE INDEX `tagnameIndex` ON `nutrient_names` (`tagname`);