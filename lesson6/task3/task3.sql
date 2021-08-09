-- Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.

-- вытащим все профили и упорядочим их по возрасту от самых молодых до самых старых
SELECT `user_id`, `created_at`
FROM `profiles`
ORDER BY `created_at` DESC
LIMIT 10;

-- вытащим лайки этих пользователей
SELECT COUNT(*) as count_of_likes
FROM `likes`
WHERE `user_id` in (
    SELECT `user_id`, `created_at`
    FROM `profiles`
    ORDER BY `created_at` DESC
    LIMIT 10
);

-- вынужден тут признаться, что данный запрос у меня не прошел
-- так как у меня версия mysql 5.7 и я получаю ошибку
-- This version of MySQL doesn't yet support 'LIMIT & IN/ALL/ANY/SOME subquery'
-- поэтому я написал запрос для 1 пользователя и потом поменял = на in
