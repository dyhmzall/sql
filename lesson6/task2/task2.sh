mysql> select @user_id;
+----------+
| @user_id |
+----------+
|        9 |
+----------+
1 row in set (0,00 sec)


mysql> SELECT *, COUNT(target_user_id) as messages_cout
    -> FROM (
    ->          SELECT to_user_id as target_user_id
    ->          FROM `messages`
    ->          WHERE from_user_id = @user_id
    ->          UNION ALL
    ->          SELECT from_user_id as target_user_id
    ->          FROM `messages`
    ->          WHERE to_user_id = @user_id
    ->      ) as test
    -> GROUP BY target_user_id
    -> ORDER BY messages_cout DESC
    -> LIMIT 1;
+----------------+---------------+
| target_user_id | messages_cout |
+----------------+---------------+
|             14 |             2 |
+----------------+---------------+
1 row in set (0,00 sec)