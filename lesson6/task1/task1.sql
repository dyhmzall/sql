-- Проанализировать запросы, которые выполнялись на занятии,
-- определить возможные корректировки и/или улучшения (JOIN пока не применять).

-- можно немного изменить запрос (Начинаем создавать архив новостей по месяцам)
-- чтобы разбить новости не только по месяцам, но и по годам
SELECT
    COUNT(id) AS media -- группируем по id и считаем сумму таких записей
     , MONTHNAME(created_at) AS month_name, YEAR(created_at) as created_year
-- , MONTH(created_at) AS month_num -- если заходим вывести номер месяца (вспомогательно)
FROM media
GROUP BY month_name, created_year
    -- order by month(created_at) -- упорядочим по месяцам
order by created_year desc, media desc -- узнаем самые активные месяцы (+ по годам)
;