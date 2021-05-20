SHOW DATABASES;

CREATE DATABASE example;

SHOW DATABASES;

USE example;

SHOW TABLES;

CREATE TABLE users (id int NOT NULL, name varchar(50));

SHOW TABLES;

// восстановление

CREATE DATABASE sample;

SHOW DATABASES;

USE sample;

SOURCE example.20.05.sql;

SHOW TABLES;