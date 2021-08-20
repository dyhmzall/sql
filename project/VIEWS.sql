-- представление показывает задачи без подробных данных, нужно для просмотра, менеджерами, например
DROP VIEW IF EXISTS task_summary;
CREATE VIEW task_summary AS
SELECT id, name, description
FROM tasks;

-- проверка
SELECT *
FROM task_summary;

SELECT *
FROM task_summary
ORDER BY id DESC;

SELECT *
FROM task_summary
WHERE name LIKE '%test%';

-- представление, которое сразу добавляет исполнителя и создателя к задаче
DROP VIEW IF EXISTS full_task;
CREATE VIEW full_task AS
SELECT t.id AS id, t.name AS name, t.description AS description, CONCAT(u1.first_name, ' ', u1.last_name) AS creator, CONCAT(u2.first_name, ' ', u2.last_name) AS 'executor'
FROM tasks t
         JOIN tasks_users_roles tur1 ON t.id = tur1.task_id
         JOIN tasks_users_roles tur2 ON t.id = tur2.task_id
         JOIN users u1 ON u1.id = tur1.user_id
         JOIN users u2 ON u2.id = tur2.user_id
WHERE tur1.role_id = 1
  AND tur2.role_id = 5;

-- проверка
SELECT * FROM full_task;
