mysql> SELECT COUNT(id) as media, MONTHNAME(created_at) as month_name, YEAR(created_at) as created_year FROM media GROUP BY month_name, created_year ORDER BY created_year DESC, media DESC;
+-------+------------+--------------+
| media | month_name | created_year |
+-------+------------+--------------+
|    13 | September  |         2021 |
|    12 | July       |         2021 |
|    11 | August     |         2021 |
|    10 | December   |         2021 |
|    10 | January    |         2021 |
|     9 | April      |         2021 |
|     8 | February   |         2021 |
|     7 | October    |         2021 |
|     6 | March      |         2021 |
|     6 | May        |         2021 |
|     3 | June       |         2021 |
|     1 | November   |         2021 |
|    13 | June       |         2020 |
|    12 | May        |         2020 |
|    12 | February   |         2020 |
|    10 | July       |         2020 |
|    10 | March      |         2020 |
|    10 | September  |         2020 |
|     8 | August     |         2020 |
|     8 | December   |         2020 |
|     7 | October    |         2020 |
|     5 | April      |         2020 |
|     5 | January    |         2020 |
|     4 | November   |         2020 |
+-------+------------+--------------+
24 rows in set (0,00 sec)