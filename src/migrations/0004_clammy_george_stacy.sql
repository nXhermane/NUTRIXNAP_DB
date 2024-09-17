CREATE TABLE `consultation_places` (
	`id` text PRIMARY KEY NOT NULL,
	`name` text NOT NULL,
	`address` text,
	`isOnline` integer,
	`isPublic` integer,
	`createdAt` text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	`updatedAt` text DEFAULT CURRENT_TIMESTAMP NOT NULL
);
--> statement-breakpoint
CREATE TABLE `nutritionists` (
	`id` text PRIMARY KEY NOT NULL,
	`password` text,
	`name` text NOT NULL,
	`email` text NOT NULL,
	`gender` text,
	`contact` text,
	`address` text,
	`birthday` text,
	`specialities` text,
	`images` text,
	`consultationPlaceIds` text,
	`serviceIds` text,
	`createdAt` text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	`updatedAt` text DEFAULT CURRENT_TIMESTAMP NOT NULL
);
--> statement-breakpoint
CREATE TABLE `services` (
	`id` text PRIMARY KEY NOT NULL,
	`name` text NOT NULL,
	`type` text,
	`patientType` text,
	`duration` text DEFAULT '00:30' NOT NULL,
	`price` integer NOT NULL,
	`consultationPlaces` text,
	`createdAt` text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	`updatedAt` text DEFAULT CURRENT_TIMESTAMP NOT NULL
);
--> statement-breakpoint
DROP TABLE `consultation_informations`;--> statement-breakpoint
DROP TABLE `food_diaries`;--> statement-breakpoint
DROP TABLE `food_stories`;--> statement-breakpoint
DROP TABLE `medical_records`;--> statement-breakpoint
DROP TABLE `medical_stories`;--> statement-breakpoint
DROP TABLE `objectives`;--> statement-breakpoint
DROP TABLE `patient_measurements`;--> statement-breakpoint
DROP TABLE `personal_and_social_stories`;