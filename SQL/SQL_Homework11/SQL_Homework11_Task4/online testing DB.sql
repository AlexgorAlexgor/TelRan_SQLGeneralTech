
-- 4. Описать схему БД "онлайн-тестирование" с помощью инструмента онлайн-проектирования БД. Необходимо предусмотреть регистрацию пользователя и выбор им тем для прохождения тестирования.

-- https://dbdiagram.io/d/64ef7c1202bd1c4a5eb1f03f

CREATE TABLE `users` (
  `user_id` integer PRIMARY KEY
  `created_at` timestamp,
  `username` varchar(64) UNIQUE,
  `pasword` varchar(64) UNIQUE,
  `email` varchar(256) UNIQUE,
  `phone` varchar(64) UNIQUE,
  `avatar_image` varchar(2048),
  `status` bool,
  `is_employee` bool
);

CREATE TABLE `topics` (
  `topic_id` integer PRIMARY KEY,
  `topic_name` varchar(256)
);

CREATE TABLE `tests` (
  `test_id` integer PRIMARY KEY,
  `created_at` timestamp,
  `test_name` varchar(256),
  `topic_id` integer
);

CREATE TABLE `questions` (
  `question_id` integer PRIMARY KEY,
  `created_at` timestamp,
  `question_text` varchar(256),
  `test_id` integer
);

CREATE TABLE `options` (
  `option_id` integer PRIMARY KEY,
  `created_at` timestamp,
  `option_text` varchar(256),
  `question_id` integer,
  `is_correct_option` bool
);

CREATE TABLE `userTestAttempts` (
  `attempt_id` integer PRIMARY KEY,
  `user_id` integer,
  `test_id` integer,
  `attempt_date` timestamp,
  `score` integer
);

CREATE TABLE `userAnswers` (
  `answer_id` integer PRIMARY KEY,
  `attempt_id` integer,
  `question_id` integer,
  `selected_option_id` integer
);

ALTER TABLE `topics` ADD FOREIGN KEY (`topic_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `tests` ADD FOREIGN KEY (`topic_id`) REFERENCES `topics` (`topic_id`);

ALTER TABLE `questions` ADD FOREIGN KEY (`question_id`) REFERENCES `options` (`question_id`);

ALTER TABLE `questions` ADD FOREIGN KEY (`test_id`) REFERENCES `tests` (`test_id`);

ALTER TABLE `userTestAttempts` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `userTestAttempts` ADD FOREIGN KEY (`test_id`) REFERENCES `tests` (`test_id`);

ALTER TABLE `userTestAttempts` ADD FOREIGN KEY (`attempt_id`) REFERENCES `userAnswers` (`attempt_id`);

ALTER TABLE `userAnswers` ADD FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`);

ALTER TABLE `options` ADD FOREIGN KEY (`option_id`) REFERENCES `userAnswers` (`selected_option_id`);
