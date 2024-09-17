CREATE TABLE `measurement_types` (
	`id` text PRIMARY KEY NOT NULL,
	`name` text,
	`nameF` text,
	`measureCategory` text,
	`measureCode` text,
	`unit` text
);
--> statement-breakpoint
DROP TABLE `patients`;--> statement-breakpoint
CREATE UNIQUE INDEX `measurement_types_measureCode_unique` ON `measurement_types` (`measureCode`);