DROP DATABASE IF EXISTS `prodcatalogdb`;
CREATE DATABASE `prodcatalogdb` DEFAULT CHARACTER SET utf8;
USE prodcatalogdb;

/** Таблица "Категория товаров" */
CREATE TABLE category (
    id           BIGINT NOT NULL AUTO_INCREMENT,
    name         VARCHAR(64) NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

/** Таблица "Товары" */
CREATE TABLE product (
    id           BIGINT      NOT NULL AUTO_INCREMENT,
    category_id  BIGINT NOT NULL,
    name         VARCHAR(128) NULL DEFAULT NULL,
    info         TEXT NULL DEFAULT NULL,
    price        VARCHAR(64) NULL DEFAULT NULL,
    count        INT NOT NULL,
    manufacturer VARCHAR(128) NULL DEFAULT NULL,
    releaseDate  VARCHAR(64) NULL DEFAULT NULL,
    link         TEXT NULL DEFAULT NULL,
    photo        BLOB NULL DEFAULT NULL,
    release_date VARCHAR(64) NULL DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES category (id)
);

/** Таблица "Тип пользователей" */
CREATE TABLE user_type (
    id           BIGINT NOT NULL AUTO_INCREMENT,
    name         VARCHAR(64) NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

/** Таблица "Пользователи" */
CREATE TABLE user (
    id          BIGINT      NOT NULL AUTO_INCREMENT,
    type_id     BIGINT NOT NULL,
    name        VARCHAR(64) NOT NULL DEFAULT '0',
    login       VARCHAR(64) NOT NULL DEFAULT '0',
    password    VARCHAR(64) NOT NULL DEFAULT '0',
    email       VARCHAR(64) NOT NULL DEFAULT '0',
    contact     VARCHAR(64) NOT NULL DEFAULT '0',
    access_mode INT,
    PRIMARY KEY (id),
    FOREIGN KEY (type_id) REFERENCES user_type (id)
);

/** Таблица "Сообщения" */
CREATE TABLE message (
    id          BIGINT      NOT NULL AUTO_INCREMENT,
    user_id     BIGINT NOT NULL,
    question    VARCHAR(64) NULL DEFAULT NULL,
    message     VARCHAR(64) NULL DEFAULT NULL,
    answer      VARCHAR(64) NULL DEFAULT NULL,
    status      VARCHAR(64) NULL DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES user (id)
);

-- category
insert into category values (1, 'Computers');
insert into category values (2, 'Electronics');
insert into category values (3, 'Accessories');

-- products
INSERT INTO `product` (`id`, `category_id`, `name`, `info`, `price`, `count`, `manufacturer`, `releaseDate`, `link`, `photo`, `release_date`) VALUES (111, 1, 'Asus Vivobook 18', '18" 1920 x 1200, IPS, 144 Гц, AMD Ryzen 7 260, 16 ГБ DDR5, SSD 1024 ГБ, видеокарта встроенная, без ОС, цвет крышки темно-синий, аккумулятор 70 Вт·ч', 3500, 10, 'ASUS', '2025', 'https://imgproxy.onliner.by/I6zDcAKDIs8z7LKidef3f4S1PJ31UVJwPW6FWd_owCU/w:170/h:250/z:2/f:jpg/aHR0cHM6Ly9jb250/ZW50Lm9ubGluZXIu/YnkvY2F0YWxvZy9k/ZXZpY2Uvb3JpZ2lu/YWwvODNmNTRjN2Uz/MjQ4ZGY5YzhiOGRl/ZGI0M2Y4ODE0M2Qu/anBn', NULL, '2025');
INSERT INTO `product` (`id`, `category_id`, `name`, `info`, `price`, `count`, `manufacturer`, `releaseDate`, `link`, `photo`, `release_date`) VALUES (222, 2, 'iPhone 17 Pro Max', 'iOS, экран 6.9" OLED (1320x2868) 120 Гц, Apple A19 Pro, ОЗУ 12 ГБ, память 256 ГБ, камера 48 Мп, аккумулятор 4823 мАч, моноблок, влагозащита IP68', 5500, 5, 'Apple', NULL, 'https://imgproxy.onliner.by/Wr6ioyowhZMjJ_fHhs2g2DydzHF9jd5NPrd3lM1sIf0/w:170/h:250/z:2/f:jpg/aHR0cHM6Ly9jb250/ZW50Lm9ubGluZXIu/YnkvY2F0YWxvZy9k/ZXZpY2Uvb3JpZ2lu/YWwvNDliMzA1ZDhh/OGQyZTdiMmVhOThi/M2UxYWQ1ZmRhNDEu/anBn', NULL, '2025');
INSERT INTO `product` (`id`, `category_id`, `name`, `info`, `price`, `count`, `manufacturer`, `releaseDate`, `link`, `photo`, `release_date`) VALUES (335, 1, 'ASUS TUF Gaming F16', '16.0" 1920 x 1200, IPS, 165 Гц, Intel Core i5 13450HX, 16 ГБ DDR5, SSD 512 ГБ, видеокарта NVIDIA GeForce RTX 5060 8 ГБ (TGP 115 Вт), без ОС, цвет крышки серый, аккумулятор 90 Вт·ч', 4300, 2, 'ASUS', NULL, 'https://imgproxy.onliner.by/2qFdZJdd8QmLsNVPpEkTc9EwjOA33BGfia1Bdh63BAY/w:170/h:250/z:2/f:jpg/aHR0cHM6Ly9jb250/ZW50Lm9ubGluZXIu/YnkvY2F0YWxvZy9k/ZXZpY2Uvb3JpZ2lu/YWwvZmI0OGM1NmY2/NTdhYTIzOWI2YmMy/NDY5N2JlY2YzNzAu/anBn', NULL, '2025');
INSERT INTO `product` (`id`, `category_id`, `name`, `info`, `price`, `count`, `manufacturer`, `releaseDate`, `link`, `photo`, `release_date`) VALUES (438, 1, 'Zenbook Pro 14', '14.5" 2880 x 1800, OLED, 120 Гц, сенсорный, Intel Core i7 13700H, 16 ГБ LPDDR5, SSD 1024 ГБ, видеокарта NVIDIA GeForce RTX 4050 6 ГБ, Windows 11 Home, цвет крышки черный, аккумулятор 76 Вт·ч', 5000, 6, 'ASUS', NULL, 'https://imgproxy.onliner.by/r6ZiRKvjwH3dYXCn7KSD0QwJ5Rwlz1rXNraEDcLaBUU/w:170/h:250/z:2/f:jpg/aHR0cHM6Ly9jb250/ZW50Lm9ubGluZXIu/YnkvY2F0YWxvZy9k/ZXZpY2Uvb3JpZ2lu/YWwvMWE2ZGRjMzMy/MjI0NjRlOWZiOTYz/N2IyMWM1YzFmZDAu/anBlZw', NULL, '2023');
INSERT INTO `product` (`id`, `category_id`, `name`, `info`, `price`, `count`, `manufacturer`, `releaseDate`, `link`, `photo`, `release_date`) VALUES (229, 1, 'Jet Multimedia', 'игровой (геймерский), AMD Ryzen 5 8500G, 16 ГБ DDR5, SSD 500 ГБ, графика: встроенная в процессор, БП 500 Вт, без ОС', 2000, 15, 'Jet', '2023', 'https://imgproxy.onliner.by/rzCRM-QKW-q5S5PtZNOLNSLJXT-vdzRnRhIutFto-_Q/w:170/h:250/z:2/f:jpg/aHR0cHM6Ly9jb250/ZW50Lm9ubGluZXIu/YnkvY2F0YWxvZy9k/ZXZpY2Uvb3JpZ2lu/YWwvODFkOWJmODU4/NTY1NzdkOWUyNGQw/ZWFhNmJhZGJjMjMu/anBn', NULL, '2023');
INSERT INTO `product` (`id`, `category_id`, `name`, `info`, `price`, `count`, `manufacturer`, `releaseDate`, `link`, `photo`, `release_date`) VALUES (5222, 2, 'Samsung Galaxy S25 Ultra', 'Android, экран 6.9" AMOLED (1440x3120) 120 Гц, Qualcomm Snapdragon 8 Elite, ОЗУ 12 ГБ, память 256 ГБ, камера 200 Мп, аккумулятор 5000 мАч, моноблок, влагозащита IP68', 3500, 7, 'Samsung', NULL, 'https://imgproxy.onliner.by/qlzW3NW-1y24uClX3P8MC5k6O6u6Ul5tR618bWBXHaw/w:170/h:250/z:2/f:jpg/aHR0cHM6Ly9jb250/ZW50Lm9ubGluZXIu/YnkvY2F0YWxvZy9k/ZXZpY2Uvb3JpZ2lu/YWwvZjA5MzQ1ZmI1/NGZkODEyODNhNjA3/ZGU0ZGEzOWZlYWQu/anBn', NULL, '2025');
INSERT INTO `product` (`id`, `category_id`, `name`, `info`, `price`, `count`, `manufacturer`, `releaseDate`, `link`, `photo`, `release_date`) VALUES (102, 3, 'Чехол для телефона Apple MagSafe Clear Case', 'накладной, стекло/поликарбонат, цвета: прозрачный', 350, 50, 'Apple', NULL, 'https://imgproxy.onliner.by/sdPcWYWtj6l5WusI6XUnd1scMumEGILXDG1af11Q_-Q/w:170/h:250/z:2/f:jpg/aHR0cHM6Ly9jb250/ZW50Lm9ubGluZXIu/YnkvY2F0YWxvZy9k/ZXZpY2Uvb3JpZ2lu/YWwvZjY2OWExZThk/MTRlMGFkYTVkZDhk/YmFlYjU1YTRiOWYu/anBn', NULL, '2025');
INSERT INTO `product` (`id`, `category_id`, `name`, `info`, `price`, `count`, `manufacturer`, `releaseDate`, `link`, `photo`, `release_date`) VALUES (103, 3, 'Чехол для телефона Pitaka Ultra-Slim', 'накладной, арамидное волокно, цвета: серый/черный', 310, 25, 'Apple', NULL, 'https://imgproxy.onliner.by/Ragv1wOTg76u5OImJusooExSu7p9K2I2VnBxPDPIKA8/w:170/h:250/z:2/f:jpg/aHR0cHM6Ly9jb250/ZW50Lm9ubGluZXIu/YnkvY2F0YWxvZy9k/ZXZpY2Uvb3JpZ2lu/YWwvNmUwNGY0OGFj/YWM1YmRiMjUxNDJi/YjY2OWIwYThhNTQu/anBn', NULL, '2025');
INSERT INTO `product` (`id`, `category_id`, `name`, `info`, `price`, `count`, `manufacturer`, `releaseDate`, `link`, `photo`, `release_date`) VALUES (152, 2, 'Samsung Galaxy S25', 'Android, экран 6.2" AMOLED (1080x2340) 120 Гц, Qualcomm Snapdragon 8 Elite, ОЗУ 12 ГБ, память 128 ГБ, камера 50 Мп, аккумулятор 4000 мАч, моноблок, влагозащита IP68', 2500, 15, 'Samsung', NULL, 'https://imgproxy.onliner.by/e08AVZI8swm3-H_ZT-O026QUCPBsjEERkx_brfN0v_k/w:170/h:250/z:2/f:jpg/aHR0cHM6Ly9jb250/ZW50Lm9ubGluZXIu/YnkvY2F0YWxvZy9k/ZXZpY2Uvb3JpZ2lu/YWwvZjlkMWY3MDY0/YjYyYTMxYjZmYWNl/MjQxMzgzODNhNDcu/anBn', NULL, '2025');
INSERT INTO `product` (`id`, `category_id`, `name`, `info`, `price`, `count`, `manufacturer`, `releaseDate`, `link`, `photo`, `release_date`) VALUES (202, 3, 'Чехол для телефона Samsung Silicone Case Galaxy Z Fold 6', 'накладной, силикон, цвета: белый', 250, 55, 'Samsung', NULL, 'https://imgproxy.onliner.by/6m1CPo1xt9U4aUM0uVjFu2muFfDzomk9UyIGvn_g6X8/w:170/h:250/z:2/f:jpg/aHR0cHM6Ly9jb250/ZW50Lm9ubGluZXIu/YnkvY2F0YWxvZy9k/ZXZpY2Uvb3JpZ2lu/YWwvYjNlNDhmNTlj/MTA2MmFiNmI5MWU5/MzZjNDM2NzMwOTUu/anBn', NULL, '2025');

-- user_type
insert into user_type values (1, 'User');
insert into user_type values (2, 'Admin');

-- users
insert into user values (1, 1, 'user', 'user', 'user', '', '', 0);
insert into user values (2, 2, 'admin', 'admin', 'admin', '', '', 0);
