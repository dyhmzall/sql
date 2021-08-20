USE tasks;

-- получить все задачи пользователя, которые может видеть пользователь
SELECT t.id AS id, t.name AS name, s.name AS status, p.name AS priority
FROM tasks t
         JOIN tasks_users_roles tur ON t.id = tur.task_id
         JOIN statuses s on t.status_id = s.id
         JOIN priorities p on t.priority_id = p.id
WHERE tur.user_id = 1;


-- получить все задачи пользователя, в которых он назначен исполнителем
SELECT t.id AS id, t.name AS name, s.name AS status, p.name AS priority, r.name AS role
FROM tasks t
         JOIN tasks_users_roles tur ON t.id = tur.task_id
         JOIN statuses s on t.status_id = s.id
         JOIN priorities p on t.priority_id = p.id
         JOIN roles r ON tur.role_id = r.id
WHERE tur.user_id = 1
  AND r.name = 'executor';

-- получить все задачи пользователя, в которых он создатель
SELECT t.id AS id, t.name AS name, s.name AS status, p.name AS priority, r.name AS role
FROM tasks t
         JOIN tasks_users_roles tur ON t.id = tur.task_id
         JOIN statuses s on t.status_id = s.id
         JOIN priorities p on t.priority_id = p.id
         JOIN roles r ON tur.role_id = r.id
WHERE tur.user_id = 1
  AND r.name = 'creator';

-- получить все задачи пользователя, к которым у него есть доступ + исполнителя этих задач
SELECT t.id AS id, t.name AS name, s.name AS status, p.name AS priority, r.name AS role, CONCAT(u.last_name, ' ', u.first_name) AS executor
FROM tasks t
         JOIN tasks_users_roles tur ON t.id = tur.task_id
         JOIN statuses s on t.status_id = s.id
         JOIN priorities p on t.priority_id = p.id
         JOIN roles r ON tur.role_id = r.id
         JOIN users u on tur.user_id = u.id
WHERE tur.user_id = 1
  AND r.name = 'creator';

-- получить комментарии к задаче + автора
SELECT c.text AS text, t.name AS task, CONCAT(u.first_name, ' ', u.last_name) AS user
FROM comments c
         JOIN tasks t ON c.task_id = t.id
         JOIN users u on c.user_id = u.id
WHERE c.id = 1;

-- получить количество доступных задач каждого пользователя
SELECT u.id AS user, COUNT(*) AS cnt
FROM tasks t
         JOIN tasks_users_roles tur ON tur.task_id = t.id
         JOIN users u ON u.id = tur.user_id
         JOIN roles r ON r.id = tur.role_id
GROUP BY user;