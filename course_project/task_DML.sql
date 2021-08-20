-- -- -- -- -- -- -- -- --
-- table users
-- -- -- -- -- -- -- -- --
INSERT INTO `users` (`id`, `login`, `password`, `first_name`, `last_name`, `email`)
VALUES (1, 'user1', '24c9e15e52afc47c225b757e7bee1f9d', 'User', 'One', 'user1@gmail.com');

INSERT INTO `users` (`id`, `login`, `password`, `first_name`, `last_name`, `email`)
VALUES (2, 'user2', '24c9e15e52afc47c225b757e7bee1f9d', 'User', 'Two', 'user2@gmail.com');

INSERT INTO `users` (`id`, `login`, `password`, `first_name`, `last_name`, `email`)
VALUES (3, 'user3', '24c9e15e52afc47c225b757e7bee1f9d', 'User', 'Three', 'user3@gmail.com');

INSERT INTO `users` (`id`, `login`, `password`, `first_name`, `last_name`, `email`)
VALUES (4, 'user4', '24c9e15e52afc47c225b757e7bee1f9d', 'User', 'Four', 'user4@gmail.com');

INSERT INTO `users` (`id`, `login`, `password`, `first_name`, `last_name`, `email`)
VALUES (5, 'user5', '24c9e15e52afc47c225b757e7bee1f9d', 'User', 'Five', 'user5@gmail.com');

INSERT INTO `users` (`id`, `login`, `password`, `first_name`, `last_name`, `email`)
VALUES (6, 'user6', '24c9e15e52afc47c225b757e7bee1f9d', 'User', 'Six', 'user6@gmail.com');

INSERT INTO `users` (`id`, `login`, `password`, `first_name`, `last_name`, `email`)
VALUES (7, 'user7', '24c9e15e52afc47c225b757e7bee1f9d', 'User', 'Seven', 'user7@gmail.com');

INSERT INTO `users` (`id`, `login`, `password`, `first_name`, `last_name`, `email`)
VALUES (8, 'user8', '24c9e15e52afc47c225b757e7bee1f9d', 'User', 'Eight', 'user8@gmail.com');

INSERT INTO `users` (`id`, `login`, `password`, `first_name`, `last_name`, `email`)
VALUES (9, 'user9', '24c9e15e52afc47c225b757e7bee1f9d', 'User', 'Nine', 'user9@gmail.com');

INSERT INTO `users` (`id`, `login`, `password`, `first_name`, `last_name`, `email`)
VALUES (10, 'user10', '24c9e15e52afc47c225b757e7bee1f9d', 'User', 'Ten', 'user10@gmail.com');

-- -- -- -- -- -- -- -- --
-- table projects
-- -- -- -- -- -- -- -- --
INSERT INTO `projects` (`id`, `name`)
VALUES (1, 'Project 1');

INSERT INTO `projects` (`id`, `name`)
VALUES (2, 'Project 2');

INSERT INTO `projects` (`id`, `name`)
VALUES (3, 'Project 3');

INSERT INTO `projects` (`id`, `name`)
VALUES (4, 'Project 4');

INSERT INTO `projects` (`id`, `name`)
VALUES (5, 'Project 5');

-- -- -- -- -- -- -- -- --
-- table statuses
-- -- -- -- -- -- -- -- --
INSERT INTO `statuses` (`id`, `name`)
VALUES (1, 'created');

INSERT INTO `statuses` (`id`, `name`)
VALUES (2, 'waiting');

INSERT INTO `statuses` (`id`, `name`)
VALUES (3, 'active');

INSERT INTO `statuses` (`id`, `name`)
VALUES (4, 'paused');

INSERT INTO `statuses` (`id`, `name`)
VALUES (5, 'closed');

INSERT INTO `statuses` (`id`, `name`)
VALUES (6, 'cancelled');

-- -- -- -- -- -- -- -- --
-- table priorities
-- -- -- -- -- -- -- -- --
INSERT INTO `priorities` (`id`, `name`)
VALUES (1, 'high');

INSERT INTO `priorities` (`id`, `name`)
VALUES (2, 'medium');

INSERT INTO `priorities` (`id`, `name`)
VALUES (3, 'low');

-- -- -- -- -- -- -- -- --
-- table tasks
-- -- -- -- -- -- -- -- --
INSERT INTO `tasks` (`id`, `status_id`, `priority_id`, `project_id`, `name`, `description`, `url`, `created_at`, `updated_at`, `deadline_at`, `planned_time`)
VALUES (1, 1, 1, 1, 'task1', 'description of task 1', 'https://test.com/task/1', '2021-08-10 12:00:00', '2021-08-10 12:00:00', '2021-08-20 12:00:00', '120'),
       (2, 2, 2, 1, 'task2', 'description of task 2', 'https://test.com/task/2', '2021-08-11 15:00:00', '2021-08-12 12:00:00', '2021-08-21 12:00:00', '400'),
       (3, 3, 3, 1, 'task3', 'description of task 3', 'https://test.com/task/3', '2021-08-11 22:00:00', '2021-08-13 16:00:00', '2021-09-01 00:00:00', '215'),
       (4, 4, 1, 2, 'task4', 'description of task 4', 'https://test.com/task/4', '2021-08-11 15:00:00', '2021-08-12 12:00:00', '2021-08-25 12:00:00', '100'),
       (5, 5, 2, 2, 'task5', 'description of task 5', 'https://test.com/task/5', '2021-08-14 15:00:00', '2021-08-15 12:00:00', '2021-09-01 00:00:00', '660'),
       (6, 1, 3, 2, 'task6', 'description of task 6', 'https://test.com/task/6', '2021-08-15 15:00:00', '2021-08-16 12:00:00', '2021-08-23 12:00:00', '300'),
       (7, 6, 1, 3, 'task7', 'description of task 7', 'https://test.com/task/7', '2021-08-16 15:00:00', '2021-08-17 12:00:00', '2021-09-01 00:00:00', '135'),
       (8, 3, 2, 3, 'task8', 'description of task 8', 'https://test.com/task/8', '2021-08-15 15:00:00', '2021-08-20 12:00:00', '2021-08-27 12:00:00', '14'),
       (9, 4, 3, 3, 'task9', 'description of task 9', 'https://test.com/task/9', '2021-08-17 15:00:00', '2021-08-18 12:00:00', '2021-09-01 00:00:00', '85'),
       (10, 5, 1, 4, 'task10', 'description of task 10', 'https://test.com/task/10', '2021-08-19 15:00:00', '2021-08-20 12:00:00', '2021-08-29 12:00:00', '125'),
       (11, 1, 2, 4, 'task11', 'description of task 11', 'https://test.com/task/11', '2021-08-20 15:00:00', '2021-08-21 12:00:00', '2021-09-01 00:00:00', '800'),
       (12, 2, 3, 4, 'task12', 'description of task 12', 'https://test.com/task/12', '2021-08-20 15:00:00', '2021-08-21 12:00:00', '2021-09-01 00:00:00', '19'),
       (13, 6, 1, 5, 'task13', 'description of task 13', 'https://test.com/task/13', '2021-08-21 15:00:00', '2021-08-22 12:00:00', '2021-08-31 12:00:00', '24'),
       (14, 4, 2, 5, 'task14', 'description of task 14', 'https://test.com/task/14', '2021-08-22 15:00:00', '2021-08-23 12:00:00', '2021-09-01 00:00:00', '235'),
       (15, 5, 3, 5, 'task15', 'description of task 15', 'https://test.com/task/15', '2021-08-23 15:00:00', '2021-08-24 12:00:00', '2021-08-31 12:00:00', '315'),
       (16, 1, 1, 5, 'task16', 'description of task 16', 'https://test.com/task/16', '2021-08-25 15:00:00', '2021-08-26 12:00:00', '2021-09-01 00:00:00', '20'),
       (17, 2, 2, 5, 'task17', 'description of task 17', 'https://test.com/task/17', '2021-08-25 15:00:00', '2021-08-26 12:00:00', '2021-09-01 00:00:00', '710'),
       (18, 3, 3, 5, 'task18', 'description of task 18', 'https://test.com/task/18', '2021-08-27 15:00:00', '2021-08-27 12:00:00', '2021-08-27 12:00:00', '25'),
       (19, 6, 1, 5, 'task19', 'description of task 19', 'https://test.com/task/19', '2021-08-28 15:00:00', '2021-08-29 12:00:00', '2021-09-01 00:00:00', '16'),
       (20, 5, 2, 5, 'task20', 'description of task 20', 'https://test.com/task/20', '2021-08-30 09:00:00', '2021-08-30 12:00:00', '2021-08-30 12:00:00', '30');

-- -- -- -- -- -- -- -- --
-- table lists
-- -- -- -- -- -- -- -- --
INSERT INTO `lists` (`id`, `name`, `user_id`)
VALUES (1, 'My list 1', 1);

INSERT INTO `lists` (`id`, `name`, `user_id`)
VALUES (2, 'My list 2', 1);

INSERT INTO `lists` (`id`, `name`, `user_id`)
VALUES (3, 'My list 3', 1);

INSERT INTO `lists` (`id`, `name`, `user_id`)
VALUES (4, 'First', 2);

INSERT INTO `lists` (`id`, `name`, `user_id`)
VALUES (5, 'Second', 2);

INSERT INTO `lists` (`id`, `name`, `user_id`)
VALUES (6, 'Main', 3);

INSERT INTO `lists` (`id`, `name`, `user_id`)
VALUES (7, 'Main', 4);

INSERT INTO `lists` (`id`, `name`, `user_id`)
VALUES (8, 'Main', 5);

-- -- -- -- -- -- -- -- --
-- table lists_tasks
-- -- -- -- -- -- -- -- --
INSERT INTO `lists_tasks` (`list_id`, `task_id`)
VALUES (1, 1),
       (1, 2),
       (1, 3),
       (2, 1),
       (2, 2),
       (3, 4),
       (3, 5),
       (4, 6),
       (4, 7),
       (5, 8);

-- -- -- -- -- -- -- -- --
-- table spend_times
-- -- -- -- -- -- -- -- --
INSERT INTO `spend_times` (`task_id`, `user_id`, `start_time`, `end_time`)
VALUES (1, 1, '2021-08-11 09:00:00', '2021-08-11 10:30:00'),
       (1, 1, '2021-08-11 16:00:00', '2021-08-11 18:00:00'),
       (1, 1, '2021-08-12 11:20:00', '2021-08-12 14:55:00'),
       (2, 1, '2021-08-15 09:00:00', '2021-08-15 18:00:00'),
       (2, 2, '2021-08-17 09:00:00', '2021-08-17 18:00:00'),
       (3, 2, '2021-08-11 15:00:00', '2021-08-11 16:30:00'),
       (3, 2, '2021-08-11 17:00:00', '2021-08-11 17:45:00'),
       (4, 2, '2021-08-11 15:00:00', '2021-08-11 15:00:00'),
       (5, 3, '2021-08-14 12:00:00', '2021-08-14 18:00:00');

-- -- -- -- -- -- -- -- --
-- table filters
-- -- -- -- -- -- -- -- --
INSERT INTO `filters` (`id`, `name`, `user_id`, `url`)
VALUES (1, 'new', 1, 'https://test.com/tasks/?status=created'),
       (2, 'new', 1, 'https://test.com/tasks/?status=!created'),
       (3, 'main', 2, 'https://test.com/tasks/?status=closed'),
       (4, 'default', 5, 'https://test.com/tasks/?status=cancelled,closed&user=me');

-- -- -- -- -- -- -- -- --
-- table roles
-- -- -- -- -- -- -- -- --
INSERT INTO `roles` (`id`, `name`)
VALUES (1, 'creator'),
       (2, 'admin'),
       (3, 'viewer'),
       (4, 'editor'),
       (5, 'executor');

-- -- -- -- -- -- -- -- --
-- table tasks_users_roles
-- -- -- -- -- -- -- -- --
INSERT INTO `tasks_users_roles` (`task_id`, `user_id`, `role_id`)
VALUES (1, 1, 1),
       (1, 2, 2),
       (1, 3, 3),
       (1, 4, 5),
       (2, 2, 1),
       (2, 1, 5),
       (2, 3, 3);

-- -- -- -- -- -- -- -- --
-- table projects_users_roles
-- -- -- -- -- -- -- -- --
INSERT INTO `projects_users_roles` (project_id, user_id, role_id)
VALUES (1, 1, 1),
       (1, 2, 2),
       (1, 3, 3),
       (1, 4, 5),
       (2, 2, 1),
       (2, 1, 5),
       (2, 3, 3);

-- -- -- -- -- -- -- -- --
-- table comments
-- -- -- -- -- -- -- -- --
INSERT INTO `comments` (id, task_id, user_id, text, created_at)
VALUES (1, 1, 1, 'start task, no questions', '2021-08-11 09:00:00'),
       (2, 1, 2, 'as fast as you can', '2021-08-11 09:11:00');