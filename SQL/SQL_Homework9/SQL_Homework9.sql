CREATE TABLE `Students` (
  `user_id` integer PRIMARY KEY,
  `created_at` timestamp,
  `gruppe_id` integer,
  `username` varchar(64) UNIQUE,
  `email` varchar(256) UNIQUE,
  `phone` varchar(64) UNIQUE,
  `avatar_image` varchar(2048),
  `pasword` varchar(255),
  `status` bool
);

CREATE TABLE `Lessons` (
  `lesson_id` integer PRIMARY KEY,
  `created_at` timestamp,
  `titel` varchar(255),
  `teacher` varchar(255)
);

CREATE TABLE `Gruppes` (
  `gruppe_id` integer PRIMARY KEY,
  `created_at` timestamp,
  `gruppename` varchar(64) UNIQUE,
  `avatar_image` varchar(2048),
  `status` bool
);

CREATE TABLE `Placement_of_group` (
  `Placement_of_gruppe_id` integer,
  `created_at` timestamp,
  `gruppe_id` integer,
  `user_id` integer,
  `end_to` timestamp,
  PRIMARY KEY (`Placement_of_gruppe_id`, `gruppe_id`, `user_id`)
);

ALTER TABLE `Students` ADD FOREIGN KEY (`user_id`) REFERENCES `Gruppes` (`gruppe_id`);

ALTER TABLE `Lessons` ADD FOREIGN KEY (`lesson_id`) REFERENCES `Gruppes` (`gruppe_id`);

ALTER TABLE `Gruppes` ADD FOREIGN KEY (`gruppe_id`) REFERENCES `Placement_of_group` (`gruppe_id`);

ALTER TABLE `Students` ADD FOREIGN KEY (`user_id`) REFERENCES `Placement_of_group` (`user_id`);
