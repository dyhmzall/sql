-- В таблице products есть два текстовых поля: name с названием товара и description с его описанием.
-- Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема.
-- Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены.
-- При попытке присвоить полям NULL-значение необходимо отменить операцию.

DROP TRIGGER IF EXISTS check_products_insert;

CREATE TRIGGER check_products_insert
    BEFORE INSERT
    ON products
    FOR EACH ROW
BEGIN
    IF (new.name is NULL and new.description is NULL)
    THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INSERT canceled';
    END IF;
END;

-- ошибка вставки данных
INSERT INTO products (name, description) VALUES(NULL, NULL);

-- ошибки вставки данных нет
INSERT INTO products (name, description) VALUES('test', NULL);

DROP TRIGGER IF EXISTS check_products_update;

CREATE TRIGGER check_products_update
    BEFORE UPDATE
    ON products
    FOR EACH ROW
BEGIN
    IF (new.name is NULL and new.description is NULL)
    THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'UPDATE canceled';
    END IF;
END;

-- ошибка обновления
UPDATE products SET name=NULL WHERE id = 1;