# Задание:

> Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, catalogs и products в таблицу logs помещается время и дата создания записи, название таблицы, идентификатор первичного ключа и содержимое поля name.

Создадим таблицу logs типа archive

```sql
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs`
(
    `created_at` DATETIME DEFAULT NOW(),
    `table_name` VARCHAR(255)    NOT NULL,
    `table_id`   BIGINT UNSIGNED NOT NULL,
    `name_field` VARCHAR(255)
) ENGINE = Archive;
```

Создадим триггеры, которые будут вставлять строки в таблицу logs

```sql
DROP TRIGGER IF EXISTS new_user;
CREATE TRIGGER new_user
    AFTER INSERT
    ON users
    FOR EACH ROW
BEGIN
    INSERT INTO `logs` VALUES (NOW(), 'users', NEW.id, NEW.name);
end;

DROP TRIGGER IF EXISTS new_catalog;
CREATE TRIGGER new_catalog
    AFTER INSERT
    ON catalogs
    FOR EACH ROW
BEGIN
    INSERT INTO `logs` VALUES (NOW(), 'catalogs', NEW.id, NEW.name);
end;

DROP TRIGGER IF EXISTS new_product;
CREATE TRIGGER new_product
    AFTER INSERT
    ON products
    FOR EACH ROW
BEGIN
    INSERT INTO `logs` VALUES (NOW(), 'products', NEW.id, NEW.name);
end;
```

Проверяем результат

```ssh
SELECT * FROM `logs`;
Empty set (0,00 sec)

INSERT INTO `users` VALUES(NULL, 'test_user', '1988-08-31', NULL, NULL);
Query OK, 1 row affected (0,00 sec)

mysql> INSERT INTO `catalogs` VALUE (NULL, 'test');
Query OK, 1 row affected (0,00 sec)

mysql> INSERT INTO `products` (`name`, `price`, `catalog_id`) VALUES('test', 1000.00, 1);
Query OK, 1 row affected (0,00 sec)

mysql> SELECT * FROM `logs`;
+---------------------+------------+----+------------+
| created_at          | table_name | id | name_field |
+---------------------+------------+----+------------+
| 2021-08-16 15:52:01 | users      | 10 | test_user  |
| 2021-08-16 15:52:16 | catalogs   |  8 | test       |
| 2021-08-16 15:53:22 | products   |  8 | test       |
+---------------------+------------+----+------------+
3 rows in set (0,00 sec)
```
