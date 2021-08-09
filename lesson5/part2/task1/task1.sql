-- Подсчитайте средний возраст пользователей в таблице users.
SELECT ROUND(AVG(TIMESTAMPDIFF(YEAR, `birthday_at`, NOW()))) FROM `users`;