-- Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.

SELECT COUNT(*), DATE_FORMAT(CONCAT(DATE_FORMAT(NOW(), '%Y'), SUBSTRING(`birthday_at`, 5)), '%w') as week_day from users GROUP BY week_day;