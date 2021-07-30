-- Определить кто больше поставил лайков (всего) - мужчины или женщины?

-- подсчитаем количество лайков, которые поставили мужчины
SELECT COUNT(*) as male_likes
FROM `likes`
WHERE `user_id` in (
    SELECT `user_id`
    FROM `profiles`
    WHERE `gender` = 'm'
);

-- теперь количество лайков от женщин
SELECT COUNT(*) as male_likes
FROM `likes`
WHERE `user_id` in (
    SELECT `user_id`
    FROM `profiles`
    WHERE `gender` = 'f'
);


-- а теперь их разность
SELECT IF(
                       (SELECT COUNT(*) as male_likes
                        FROM `likes`
                        WHERE `user_id` in (
                            SELECT `user_id`
                            FROM `profiles`
                            WHERE `gender` = 'm')
                       ) - (SELECT COUNT(*) as male_likes
                            FROM `likes`
                            WHERE `user_id` in (
                                SELECT `user_id`
                                FROM `profiles`
                                WHERE `gender` = 'f')
                       ) > 0,
                       'man has more likes',
                       'women has more likes'
           );