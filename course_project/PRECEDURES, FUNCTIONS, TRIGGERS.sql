-- процедура: при создании задачи нужно привязать ее к пользователю
DROP PROCEDURE IF EXISTS create_task;
CREATE PROCEDURE create_task(
    IN user_id INT,
    IN status_id INT,
    IN priority_id INT,
    IN project_id INT,
    IN task_name VARCHAR(255),
    IN task_text TEXT
)
BEGIN
    INSERT INTO `tasks` (`status_id`, `priority_id`, `project_id`, `name`, `description`)
    VALUES (status_id, priority_id, project_id, task_name, task_text);

    INSERT INTO `tasks_users_roles` (`task_id`, `user_id`, `role_id`)
    VALUES (LAST_INSERT_ID(), user_id, 1);
END;

-- проверка
CALL create_task(1, 1, 1, 1, 'test', 'test test test');

SELECT *
FROM tasks
ORDER BY id DESC;

SELECT *
FROM tasks_users_roles
ORDER BY task_id DESC;

-- функция: получает количество задач, выполняемых пользователем
DROP FUNCTION IF EXISTS get_user_execution_tasks;
CREATE FUNCTION get_user_execution_tasks(target_user_id INT)
    RETURNS INT
BEGIN
    DECLARE cnt INT;

    SELECT COUNT(*)
    INTO cnt
    FROM tasks t
             JOIN tasks_users_roles tur ON tur.task_id = t.id
             JOIN roles r ON tur.role_id = r.id
    WHERE r.name = 'executor'
      AND tur.user_id = target_user_id;

    RETURN cnt;
END;

-- проверка
SELECT get_user_execution_tasks(1);

SELECT id, get_user_execution_tasks(id) as cnt
FROM shop.users;

-- триггер: когда мы удаляем роль для задачи нужно следить, чтобы у задачи оставалось хотя бы одна роль
DROP TRIGGER IF EXISTS delete_task_role;
CREATE TRIGGER delete_task_role
    BEFORE DELETE
    ON tasks_users_roles
    FOR EACH ROW
BEGIN
    DECLARE user_cnt INT;
    SELECT COUNT(*) INTO user_cnt FROM tasks_users_roles WHERE task_id = OLD.task_id;
    IF user_cnt <= 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'DELETE CANCELLED';
    END IF;
END;

-- проверка
SELECT *
FROM tasks_users_roles;

DELETE
FROM tasks_users_roles
WHERE task_id = 1
  AND user_id = 1; -- ok

DELETE
FROM tasks_users_roles
WHERE task_id = 21
  AND user_id = 1; -- error