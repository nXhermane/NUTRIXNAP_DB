CREATE TABLE `patients` (
	`id` text PRIMARY KEY NOT NULL,
	`name` text DEFAULT '' NOT NULL,
	`gender` text,
	`contact` text,
	`address` text,
	`birthday` text,
	`occupation` text,
	`images` text,
	`createdAt` text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	`updatedAt` text DEFAULT CURRENT_TIMESTAMP NOT NULL
);
