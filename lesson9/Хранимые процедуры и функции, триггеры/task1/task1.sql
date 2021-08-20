-- Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток.
-- С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро",
-- с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",
-- с 18:00 до 00:00 — "Добрый вечер",
-- с 00:00 до 6:00 — "Доброй ночи".

DROP FUNCTION IF EXISTS hello;
CREATE FUNCTION hello()
    RETURNS VARCHAR(255) NOT DETERMINISTIC
BEGIN
    DECLARE hour INT;

    SELECT TIME_FORMAT(NOW(), '%H') INTO hour;

    IF (hour < 6) THEN
        RETURN 'Доброй ночи';
    END IF;
    IF (hour >= 6 AND hour < 12) THEN
        RETURN 'Доброе утро';
    END IF;
    IF (hour >= 12 AND hour < 18) THEN
        RETURN 'Добрый день';
    END IF;
    IF (hour >= 18) THEN
        RETURN 'Добрый вечер';
    END IF;

    RETURN hour;
end;

SELECT hello();