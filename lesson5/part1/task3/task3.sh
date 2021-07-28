mysql> CREATE TABLE `storehouses_products` (
    -> id SERIAL,
    -> storehouse_id INT UNSIGNED,
    -> product_id INT UNSIGNED,
    -> value INT UNSIGNED
    -> );
Query OK, 0 rows affected (0,01 sec)


mysql> DESCRIBE `storehouses_products`;
+---------------+---------------------+------+-----+---------+----------------+
| Field         | Type                | Null | Key | Default | Extra          |
+---------------+---------------------+------+-----+---------+----------------+
| id            | bigint(20) unsigned | NO   | PRI | NULL    | auto_increment |
| storehouse_id | int(10) unsigned    | YES  |     | NULL    |                |
| product_id    | int(10) unsigned    | YES  |     | NULL    |                |
| value         | int(10) unsigned    | YES  |     | NULL    |                |
+---------------+---------------------+------+-----+---------+----------------+
4 rows in set (0,00 sec)


mysql> SELECT * FROM `storehouses_products`;
Empty set (0,01 sec)


mysql> INSERT INTO `storehouses_products` (`value`) VALUES (ROUND(RAND()*1000)), (0), (ROUND(RAND()*1000)), (0), (ROUND(RAND()*1000)), (0),(ROUND(RAND()*1000)), (0),(ROUND(RAND()*1000)), (0),(ROUND(RAND()*1000)), (0);
Query OK, 12 rows affected (0,00 sec)
Records: 12  Duplicates: 0  Warnings: 0


mysql> SELECT * FROM `storehouses_products`;
+----+---------------+------------+-------+
| id | storehouse_id | product_id | value |
+----+---------------+------------+-------+
|  1 |          NULL |       NULL |   900 |
|  2 |          NULL |       NULL |     0 |
|  3 |          NULL |       NULL |   745 |
|  4 |          NULL |       NULL |     0 |
|  5 |          NULL |       NULL |    27 |
|  6 |          NULL |       NULL |     0 |
|  7 |          NULL |       NULL |   901 |
|  8 |          NULL |       NULL |     0 |
|  9 |          NULL |       NULL |   424 |
| 10 |          NULL |       NULL |     0 |
| 11 |          NULL |       NULL |   418 |
| 12 |          NULL |       NULL |     0 |
+----+---------------+------------+-------+
12 rows in set (0,00 sec)


mysql> SELECT * FROM `storehouses_products` ORDER BY IF (`value` != 0, `value`, 1000000);
+----+---------------+------------+-------+
| id | storehouse_id | product_id | value |
+----+---------------+------------+-------+
|  5 |          NULL |       NULL |    27 |
| 11 |          NULL |       NULL |   418 |
|  9 |          NULL |       NULL |   424 |
|  3 |          NULL |       NULL |   745 |
|  1 |          NULL |       NULL |   900 |
|  7 |          NULL |       NULL |   901 |
|  2 |          NULL |       NULL |     0 |
|  4 |          NULL |       NULL |     0 |
|  6 |          NULL |       NULL |     0 |
|  8 |          NULL |       NULL |     0 |
| 10 |          NULL |       NULL |     0 |
| 12 |          NULL |       NULL |     0 |
+----+---------------+------------+-------+
12 rows in set (0,00 sec)