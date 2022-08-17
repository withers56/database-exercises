USE william;

CREATE TABLE IF NOT EXISTS adlister_users (
    user_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_email VARCHAR(100) NOT NULL,
    user_password VARCHAR(20) NOT NULL,
    PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS advertisements (
    ad_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    description VARCHAR(1000) NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (ad_id),
    FOREIGN KEY (user_id) REFERENCES adlister_users(user_id)
);

CREATE TABLE IF NOT EXISTS categories (
    category_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    category VARCHAR(100),
    PRIMARY KEY (category_id)
);

CREATE TABLE IF NOT EXISTS ad_category (
    ad_id INT UNSIGNED NOT NULL,
    cat_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (ad_id) REFERENCES advertisements(ad_id),
    FOREIGN KEY (cat_id) REFERENCES categories(category_id)
);

SELECT *
FROM adlister_users;

SELECT *
FROM advertisements;

SELECT * FROM categories;

SELECT *
from ad_category;

INSERT INTO ad_category (ad_id, cat_id) VALUES
(1, 2), (2, 1), (3, 2), (3, 3);

SELECT title, au.user_email
FROM advertisements
JOIN adlister_users au on advertisements.user_id = au.user_id;

SELECT a.title, c.category
FROM advertisements AS a
JOIN ad_category ac on a.ad_id = ac.ad_id
JOIN categories c on ac.cat_id = c.category_id;

SELECT c.category, a.title
FROM categories As c
JOIN ad_category ac on c.category_id = ac.cat_id
JOIN advertisements a on ac.ad_id = a.ad_id
GROUP BY c.category, a.title;

SELECT au.user_id, a.title
FROM adlister_users AS au
JOIN advertisements AS a ON au.user_id = a.user_id
WHERE au.user_id = 1;


