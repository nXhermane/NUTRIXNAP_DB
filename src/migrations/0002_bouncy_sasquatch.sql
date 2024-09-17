CREATE TABLE `consultation_informations` (
	`id` text PRIMARY KEY NOT NULL,
	`consultationMotive` text,
	`expectations` text,
	`clinicalObjective` text,
	`otherInformation` text,
	`createdAt` text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	`updatedAt` text DEFAULT CURRENT_TIMESTAMP NOT NULL
);
--> statement-breakpoint
CREATE TABLE `food_diaries` (
	`id` text PRIMARY KEY NOT NULL,
	`date` integer,
	`meal` text,
	`observation` text,
	`images` text,
	`createdAt` text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	`updatedAt` text DEFAULT CURRENT_TIMESTAMP NOT NULL
);
--> statement-breakpoint
CREATE TABLE `food_stories` (
	`id` text PRIMARY KEY NOT NULL,
	`bedtime` text,
	`wakeUpTime` text,
	`dietTypes` text,
	`favoriteFoods` text,
	`foodAversions` text,
	`foodIntolerances` text,
	`nutritionalDeficiencies` text,
	`waterConsumption` text,
	`numberOfMealsPerDay` integer,
	`otherInformation` text,
	`createdAt` text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	`updatedAt` text DEFAULT CURRENT_TIMESTAMP NOT NULL
);
--> statement-breakpoint
CREATE TABLE `medical_records` (
	`id` text PRIMARY KEY NOT NULL,
	`medicalStoryId` text,
	`foodStoryId` text,
	`foodDiaryIds` text,
	`objectiveIds` text,
	`patientMeasurementId` text,
	`personalAndSocialStorieId` text,
	`consultationInformationId` text,
	`status` text,
	`eatingBehaviors` text,
	`createdAt` text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	`updatedAt` text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	FOREIGN KEY (`medicalStoryId`) REFERENCES `medical_stories`(`id`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`foodStoryId`) REFERENCES `food_stories`(`id`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`patientMeasurementId`) REFERENCES `patient_measurements`(`id`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`personalAndSocialStorieId`) REFERENCES `personal_and_social_stories`(`id`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`consultationInformationId`) REFERENCES `consultation_informations`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `medical_stories` (
	`id` text PRIMARY KEY NOT NULL,
	`pathologies` text,
	`drugie` text,
	`personalBackground` text,
	`familyBackground` text,
	`otherInformation` text,
	`createdAt` text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	`updatedAt` text DEFAULT CURRENT_TIMESTAMP NOT NULL
);
--> statement-breakpoint
CREATE TABLE `objectives` (
	`id` text PRIMARY KEY NOT NULL,
	`type` text,
	`timeframe` text,
	`body` text,
	`status` text,
	`createdAt` text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	`updatedAt` text DEFAULT CURRENT_TIMESTAMP NOT NULL
);
--> statement-breakpoint
CREATE TABLE `patient_measurements` (
	`id` text PRIMARY KEY NOT NULL,
	`anthropometricMeasurements` text,
	`bodyCompositionMeasurements` text,
	`medicalAnalysisResults` text,
	`createdAt` text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	`updatedAt` text DEFAULT CURRENT_TIMESTAMP NOT NULL
);
--> statement-breakpoint
CREATE TABLE `personal_and_social_stories` (
	`id` text PRIMARY KEY NOT NULL,
	`gastrointestinalState` text,
	`sleepQuality` text,
	`maritalStatus` text,
	`physicalActivity` text,
	`ethnicity` text,
	`isSmoker` integer,
	`isAlcoholConsumer` integer,
	`otherInformation` text,
	`createdAt` text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	`updatedAt` text DEFAULT CURRENT_TIMESTAMP NOT NULL
);
--> statement-breakpoint
DROP TABLE `measurement_types`;