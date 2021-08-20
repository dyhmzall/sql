#Задание:

> При помощи базы данных Redis решите задачу поиска имени пользователя по электронному адресу и наоборот, поиск электронного адреса пользователя по его имени.

## Для решения задачи нам потребуется два разных хеша - email_name и name_email

> HSET email_name test1@gmail.com test1<br>
> (integer) 1<br>
> HSET email_name test2@gmail.com test2<br>
> (integer) 1<br>
> HGETALL email_name<br>
> 
> 1) "test1@gmail.com"<br>
> 2) "test1"<br>
> 3) "test2@gmail.com"<br>
> 4) "test2"<br>
>
> HGET email_name test1@gmail.com<br>
> "test1"<br>

> HSET name_email test1 test1@gmail.com<br>
> (integer) 1<br>
> HSET name_email test2 test2@gmail.com<br>
> (integer) 1<br>
> HGETALL name_email<br>
> 1) "test1"<br>
> 2) "test1@gmail.com"<br>
> 3) "test2"<br>
> 4) "test2@gmail.com"<br>
>
> HGET name_email test1<br>
> "test1@gmail.com"<br>