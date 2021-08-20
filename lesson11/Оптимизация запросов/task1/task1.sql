DROP TABLE IF EXISTS `logs`;

CREATE TABLE `logs`
(
    `created_at` DATETIME DEFAULT NOW(),
    `table_name` VARCHAR(255)    NOT NULL,
    `id`         BIGINT UNSIGNED NOT NULL,
    `name_field` VARCHAR(255)
) ENGINE = Archive;


DROP TRIGGER IF EXISTS new_user;
CREATE TRIGGER new_user
    AFTER INSERT
    ON users
    FOR EACH ROW
BEGIN
    INSERT INTO `logs` VALUES (NOW(), 'users', NEW.id, NEW.name);
end;

DROP TRIGGER IF EXISTS new_catalog;
CREATE TRIGGER new_catalog
    AFTER INSERT
    ON catalogs
    FOR EACH ROW
BEGIN
    INSERT INTO `logs` VALUES (NOW(), 'catalogs', NEW.id, NEW.name);
end;

DROP TRIGGER IF EXISTS new_product;
CREATE TRIGGER new_product
    AFTER INSERT
    ON products
    FOR EACH ROW
BEGIN
    INSERT INTO `logs` VALUES (NOW(), 'products', NEW.id, NEW.name);
end;