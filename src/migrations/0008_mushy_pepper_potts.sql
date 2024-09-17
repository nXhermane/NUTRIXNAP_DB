CREATE TABLE `nutrition_rules` (
	`id` text PRIMARY KEY NOT NULL,
	`name` text(255),
	`nameF` text(255),
	`code` text(100) NOT NULL,
	`formula` text NOT NULL,
	`createdAt` text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	`updatedAt` text DEFAULT CURRENT_TIMESTAMP NOT NULL
);
--> statement-breakpoint
DROP TABLE `food_groups`;--> statement-breakpoint
DROP TABLE `food_names`;--> statement-breakpoint
DROP TABLE `meals_categories`;--> statement-breakpoint
DROP TABLE `meals_types`;--> statement-breakpoint
DROP TABLE `nutrient_names`;--> statement-breakpoint
DROP TABLE `recipes`;--> statement-breakpoint
CREATE UNIQUE INDEX `nutrition_rules_code_unique` ON `nutrition_rules` (`code`);