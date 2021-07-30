mysql> SELECT COUNT(*) as male_likes
    -> FROM `likes`
    -> WHERE `user_id` in (
    ->     SELECT `user_id`
    ->     FROM `profiles`
    ->     WHERE `gender` = 'm'
    -> );
+------------+
| male_likes |
+------------+
|         85 |
+------------+
1 row in set (0,00 sec)


mysql> SELECT COUNT(*) as male_likes
    -> FROM `likes`
    -> WHERE `user_id` in (
    ->     SELECT `user_id`
    ->     FROM `profiles`
    ->     WHERE `gender` = 'f'
    -> );
+------------+
| male_likes |
+------------+
|         65 |
+------------+
1 row in set (0,00 sec)


mysql> SELECT IF(
    ->                        (SELECT COUNT(*) as male_likes
    ->                         FROM `likes`
    ->                         WHERE `user_id` in (
    ->                             SELECT `user_id`
    ->                             FROM `profiles`
    ->                             WHERE `gender` = 'm')
    ->                        ) - (SELECT COUNT(*) as male_likes
    ->                             FROM `likes`
    ->                             WHERE `user_id` in (
    ->                                 SELECT `user_id`
    ->                                 FROM `profiles`
    ->                                 WHERE `gender` = 'f')
    ->                        ) > 0,
    ->                        'man has more likes',
    ->                        'women has more likes'
    ->            );
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| IF(
                       (SELECT COUNT(*) as male_likes
                        FROM `likes`
                        WHERE `user_id` in (
                            SELECT `user_id`
                            FROM `profiles`
                           |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| man has more likes                                                                                                                                                                                                                                              |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0,00 sec)