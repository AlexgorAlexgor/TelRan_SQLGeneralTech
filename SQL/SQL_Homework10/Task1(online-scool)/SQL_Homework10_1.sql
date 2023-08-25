/* 
Main сlass: General Tech
1. Завершить описание схемы БД "онлайн-школа" 
*/

recYUpwcaA0R0CI4X


CREATE TABLE `Students` (
  `student_id` integer PRIMARY KEY,
  `created_at` timestamp,
  `fullname` varchar(128) UNIQUE,
  `email` varchar(256) UNIQUE,
  `phone` varchar(64) UNIQUE,
  `avatar_image` varchar(2048),
  `password` varchar(255),
  `is_passiv` bool
);

CREATE TABLE `Lessons` (
  `lesson_id` iinteger PRIMARY KEY,
  `created_at` timestamp,
  `titel` varchar(255),
  `teacher_id` integer
);

CREATE TABLE `Groups` (
  `group_id` integer PRIMARY KEY,
  `created_at` timestamp,
  `group_name` varchar(64) UNIQUE,
  `avatar_image` varchar(2048),
  `status` bool
);

CREATE TABLE `Placement_of_group` (
  `Placement_of_group_id` integer,
  `created_at` timestamp,
  `group_id` integer,
  `user_id` integer,
  `end_to` timestamp,
  PRIMARY KEY (`Placement_of_group_id`, `group_id`, `user_id`)
);

CREATE TABLE `Teacher` (
  `teacher_id` integer PRIMARY KEY,
  `support_id` integer,
  `phone` varchar(64) UNIQUE,
  `email` varchar(255),
  `chesked` bool,
  `fullname` varchar(128),
  `task` varchar(255)
);

CREATE TABLE `Chats` (
  `chat_id` integer PRIMARY KEY,
  `group_id` integer,
  `message` varchar(255),
  `date_time` Date
);

CREATE TABLE `HomeWork` (
  `homework_id` integer PRIMARY KEY,
  `teacher_id` integer,
  `student_id` integer,
  `message_id` integer,
  `reaction` varchar(255),
  `content` varchar(1024),
  `date_time` Date
);

CREATE TABLE `Raiting` (
  `rating_id` integer PRIMARY KEY,
  `lessons_id` integer,
  `student_id` integer,
  `group_id` integer,
  `raiting` integer,
  `team` varchar(255)
);

CREATE TABLE `homework_solutions` (
  `homework_solution_id` int,
  `student_id` int,
  `homework_id` int,
  `content` varchar(128)
);

ALTER TABLE `Placement_of_group` ADD FOREIGN KEY (`user_id`) REFERENCES `Students` (`student_id`);

ALTER TABLE `Placement_of_group` ADD FOREIGN KEY (`group_id`) REFERENCES `Groups` (`group_id`);

ALTER TABLE `Groups` ADD FOREIGN KEY (`group_id`) REFERENCES `Lessons` (`lesson_id`);

ALTER TABLE `Lessons` ADD FOREIGN KEY (`teacher_id`) REFERENCES `Teacher` (`teacher_id`);

ALTER TABLE `HomeWork` ADD FOREIGN KEY (`teacher_id`) REFERENCES `Teacher` (`teacher_id`);

ALTER TABLE `HomeWork` ADD FOREIGN KEY (`student_id`) REFERENCES `Students` (`student_id`);

ALTER TABLE `Raiting` ADD FOREIGN KEY (`student_id`) REFERENCES `Students` (`student_id`);

ALTER TABLE `Raiting` ADD FOREIGN KEY (`lessons_id`) REFERENCES `Lessons` (`lesson_id`);

ALTER TABLE `Chats` ADD FOREIGN KEY (`group_id`) REFERENCES `Groups` (`group_id`);

ALTER TABLE `Groups` ADD FOREIGN KEY (`group_id`) REFERENCES `Raiting` (`group_id`);

ALTER TABLE `Teacher` ADD FOREIGN KEY (`support_id`) REFERENCES `Chats` (`chat_id`);

ALTER TABLE `homework_solutions` ADD FOREIGN KEY (`student_id`) REFERENCES `Students` (`student_id`);

ALTER TABLE `homework_solutions` ADD FOREIGN KEY (`homework_id`) REFERENCES `HomeWork` (`homework_id`);
