# Задание:

> Организуйте хранение категорий и товарных позиций учебной базы данных shop в СУБД MongoDB.

#### таблицу catalogs будет представлять коллекция catalogs

```javascript
db.catalogs.insert({id: 1, name: "Процессоры"});
db.catalogs.insert({id: 2, name: "Материнские платы"});
db.catalogs.insert({id: 3, name: "Видеокарты"});
db.catalogs.insert({id: 4, name: "Жесткие диски"});
db.catalogs.insert({id: 5, name: "Оперативная память"});
```

#### таблицу products будет представлять коллекция products

```javascript
db.products.insert({
    id: 1,
    name: "Intel Core i3-8100",
    description: "Процессор для настольных персональных компьютеров, основанных на платформе Intel.",
    price: 7890.00,
    catalog_id: 1,
    created_at: "2021-08-09 14:40:33",
    updated_at: "2021-08-09 14:40:33"
});
...
```