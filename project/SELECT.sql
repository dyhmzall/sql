USE tasks;

-- получить все задачи пользователя, которые может видеть пользователь
SELECT t.id as id, t.name as name, s.name AS status, p.name AS priority
FROM tasks t
         JOIN tasks_users_roles tur ON t.id = tur.task_id
         JOIN statuses s on t.status_id = s.id
         JOIN priorities p on t.priority_id = p.id
WHERE tur.user_id = 1;


-- получить все задачи пользователя, в которых он назначен исполнителем
SELECT t.id as id, t.name as name, s.name AS status, p.name AS priority, r.name as role
FROM tasks t
         JOIN tasks_users_roles tur ON t.id = tur.task_id
         JOIN statuses s on t.status_id = s.id
         JOIN priorities p on t.priority_id = p.id
         JOIN roles r ON tur.role_id = r.id
WHERE tur.user_id = 1
  AND r.name = 'executor';

-- получить все задачи пользователя, в которых он создатель
SELECT t.id as id, t.name as name, s.name AS status, p.name AS priority, r.name as role
FROM tasks t
         JOIN tasks_users_roles tur ON t.id = tur.task_id
         JOIN statuses s on t.status_id = s.id
         JOIN priorities p on t.priority_id = p.id
         JOIN roles r ON tur.role_id = r.id
WHERE tur.user_id = 1
  AND r.name = 'creator';

-- получить все задачи пользователя, к которым у него есть доступ + исполнителя этих задач
SELECT t.id as id, t.name as name, s.name AS status, p.name AS priority, r.name as role, CONCAT(u.last_name, ' ', u.first_name) as executor
FROM tasks t
         JOIN tasks_users_roles tur ON t.id = tur.task_id
         JOIN statuses s on t.status_id = s.id
         JOIN priorities p on t.priority_id = p.id
         JOIN roles r ON tur.role_id = r.id
         JOIN users u on tur.user_id = u.id
WHERE tur.user_id = 1
  AND r.name = 'creator';