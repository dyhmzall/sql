# Таблица users была неудачно спроектирована.
# Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения
# в формате 20.10.2017 8:10.
# Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.


mysql> DROP TABLE `users`;
Query OK, 0 rows affected (0,00 sec)


mysql> CREATE TABLE `users` (
    -> id SERIAL,
    -> name VARCHAR(255),
    -> birthday_at DATE,
    -> created_at VARCHAR(255),
    -> updated_at VARCHAR(255)
    -> );
Query OK, 0 rows affected (0,00 sec)


mysql> INSERT INTO `users` (`name`, `birthday_at`, `created_at`, `updated_at`)
    ->  VALUES ('Иван', '1988-08-31', '20.10.2017 8:10', '20.10.2017 8:10'),
    ->         ('Петр', '1990-03-19', '11.10.2018 14:20', '11.10.2018 14:20'),
    ->         ('Саша', '1992-01-15', '6.12.2020 4:36', '6.12.2020 4:36');
Query OK, 3 rows affected (0,00 sec)
Records: 3  Duplicates: 0  Warnings: 0


mysql> SELECT * FROM `users`;
+----+----------+-------------+------------------+------------------+
| id | name     | birthday_at | created_at       | updated_at       |
+----+----------+-------------+------------------+------------------+
|  1 | Иван     | 1988-08-31  | 20.10.2017 8:10  | 20.10.2017 8:10  |
|  2 | Петр     | 1990-03-19  | 11.10.2018 14:20 | 11.10.2018 14:20 |
|  3 | Саша     | 1992-01-15  | 6.12.2020 4:36   | 6.12.2020 4:36   |
+----+----------+-------------+------------------+------------------+
3 rows in set (0,00 sec)


mysql> UPDATE `users`
    -> SET `created_at` = STR_TO_DATE(`created_at`, '%d.%m.%Y %k:%i'),
    ->     `updated_at` = STR_TO_DATE(`updated_at`, '%d.%m.%Y %k:%i');
Query OK, 3 rows affected (0,00 sec)
Rows matched: 3  Changed: 3  Warnings: 0


mysql> SELECT * FROM `users`;
+----+----------+-------------+---------------------+---------------------+
| id | name     | birthday_at | created_at          | updated_at          |
+----+----------+-------------+---------------------+---------------------+
|  1 | Иван     | 1988-08-31  | 2017-10-20 08:10:00 | 2017-10-20 08:10:00 |
|  2 | Петр     | 1990-03-19  | 2018-10-11 14:20:00 | 2018-10-11 14:20:00 |
|  3 | Саша     | 1992-01-15  | 2020-12-06 04:36:00 | 2020-12-06 04:36:00 |
+----+----------+-------------+---------------------+---------------------+
3 rows in set (0,00 sec)


mysql> ALTER TABLE `users` CHANGE `created_at` `created_at` DATETIME;
Query OK, 3 rows affected (0,01 sec)
Records: 3  Duplicates: 0  Warnings: 0


mysql> ALTER TABLE `users` CHANGE `updated_at` `updated_at` DATETIME;
Query OK, 3 rows affected (0,01 sec)
Records: 3  Duplicates: 0  Warnings: 0


mysql> DESCRIBE `users`;
+-------------+---------------------+------+-----+---------+----------------+
| Field       | Type                | Null | Key | Default | Extra          |
+-------------+---------------------+------+-----+---------+----------------+
| id          | bigint(20) unsigned | NO   | PRI | NULL    | auto_increment |
| name        | varchar(255)        | YES  |     | NULL    |                |
| birthday_at | date                | YES  |     | NULL    |                |
| created_at  | datetime            | YES  |     | NULL    |                |
| updated_at  | datetime            | YES  |     | NULL    |                |
+-------------+---------------------+------+-----+---------+----------------+
5 rows in set (0,00 sec)


mysql> SELECT * FROM `users`;
+----+----------+-------------+---------------------+---------------------+
| id | name     | birthday_at | created_at          | updated_at          |
+----+----------+-------------+---------------------+---------------------+
|  1 | Иван     | 1988-08-31  | 2017-10-20 08:10:00 | 2017-10-20 08:10:00 |
|  2 | Петр     | 1990-03-19  | 2018-10-11 14:20:00 | 2018-10-11 14:20:00 |
|  3 | Саша     | 1992-01-15  | 2020-12-06 04:36:00 | 2020-12-06 04:36:00 |
+----+----------+-------------+---------------------+---------------------+
3 rows in set (0,00 sec)