mysql> DESCRIBE `storehouses_products`;
+---------------+------------------+------+-----+---------+-------+
| Field         | Type             | Null | Key | Default | Extra |
+---------------+------------------+------+-----+---------+-------+
| id            | int(10) unsigned | YES  |     | NULL    |       |
| storehouse_id | int(10) unsigned | YES  |     | NULL    |       |
| product_id    | int(10) unsigned | YES  |     | NULL    |       |
| value         | int(10) unsigned | YES  |     | NULL    |       |
+---------------+------------------+------+-----+---------+-------+
4 rows in set (0.01 sec)


mysql> SELECT * FROM `storehouses_products`;
Empty set (0.00 sec)


mysql> INSERT INTO `storehouses_products` (`value`) VALUES (ROUND(RAND()*1000));
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO `storehouses_products` (`value`) VALUES (ROUND(RAND()*1000));
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO `storehouses_products` (`value`) VALUES (ROUND(RAND()*1000));
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO `storehouses_products` (`value`) VALUES (ROUND(RAND()*1000));
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO `storehouses_products` (`value`) VALUES (ROUND(RAND()*1000));
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO `storehouses_products` (`value`) VALUES (ROUND(RAND()*1000));
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO `storehouses_products` (`value`) VALUES (ROUND(RAND()*1000));
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO `storehouses_products` (`value`) VALUES (ROUND(RAND()*1000));
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO `storehouses_products` (`value`) VALUES (ROUND(RAND()*1000));
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO `storehouses_products` (`value`) VALUES (ROUND(RAND()*1000));
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO `storehouses_products` (`value`) VALUES (0);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO `storehouses_products` (`value`) VALUES (0);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO `storehouses_products` (`value`) VALUES (0);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO `storehouses_products` (`value`) VALUES (ROUND(RAND()*1000));
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO `storehouses_products` (`value`) VALUES (ROUND(RAND()*1000));
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO `storehouses_products` (`value`) VALUES (0);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO `storehouses_products` (`value`) VALUES (0);
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM `storehouses_products`;
+------+---------------+------------+-------+
| id   | storehouse_id | product_id | value |
+------+---------------+------------+-------+
| NULL |          NULL |       NULL |   882 |
| NULL |          NULL |       NULL |   232 |
| NULL |          NULL |       NULL |   516 |
| NULL |          NULL |       NULL |   883 |
| NULL |          NULL |       NULL |   869 |
| NULL |          NULL |       NULL |   693 |
| NULL |          NULL |       NULL |   858 |
| NULL |          NULL |       NULL |   214 |
| NULL |          NULL |       NULL |   493 |
| NULL |          NULL |       NULL |   826 |
| NULL |          NULL |       NULL |     0 |
| NULL |          NULL |       NULL |     0 |
| NULL |          NULL |       NULL |     0 |
| NULL |          NULL |       NULL |   649 |
| NULL |          NULL |       NULL |   766 |
| NULL |          NULL |       NULL |     0 |
| NULL |          NULL |       NULL |     0 |
+------+---------------+------------+-------+
17 rows in set (0.00 sec)


mysql> SELECT *, IF (`value` != 0, `value`, 1000000) as `_` FROM `storehouses_products` ORDER BY `_`;
+------+---------------+------------+-------+---------+
| id   | storehouse_id | product_id | value | _       |
+------+---------------+------------+-------+---------+
| NULL |          NULL |       NULL |   214 |     214 |
| NULL |          NULL |       NULL |   232 |     232 |
| NULL |          NULL |       NULL |   493 |     493 |
| NULL |          NULL |       NULL |   516 |     516 |
| NULL |          NULL |       NULL |   649 |     649 |
| NULL |          NULL |       NULL |   693 |     693 |
| NULL |          NULL |       NULL |   766 |     766 |
| NULL |          NULL |       NULL |   826 |     826 |
| NULL |          NULL |       NULL |   858 |     858 |
| NULL |          NULL |       NULL |   869 |     869 |
| NULL |          NULL |       NULL |   882 |     882 |
| NULL |          NULL |       NULL |   883 |     883 |
| NULL |          NULL |       NULL |     0 | 1000000 |
| NULL |          NULL |       NULL |     0 | 1000000 |
| NULL |          NULL |       NULL |     0 | 1000000 |
| NULL |          NULL |       NULL |     0 | 1000000 |
| NULL |          NULL |       NULL |     0 | 1000000 |
+------+---------------+------------+-------+---------+
17 rows in set (0.00 sec)