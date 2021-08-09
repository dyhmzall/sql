-- Пусть задан некоторый пользователь.
-- Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.

set @user_id = 9;

SELECT *, COUNT(target_user_id) as messages_cout
FROM (
         SELECT to_user_id as target_user_id
         FROM `messages`
         WHERE from_user_id = @user_id
         UNION ALL
         SELECT from_user_id as target_user_id
         FROM `messages`
         WHERE to_user_id = @user_id
     ) as tmp_table
GROUP BY target_user_id
ORDER BY messages_cout DESC
LIMIT 1;