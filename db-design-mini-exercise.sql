INSERT INTO Users (username, password)
VALUES ('username1', 'awesomepassword'),
       ('username2', 'awesord');


SELECT username
from Users;

INSERT INTO user_in_leagues (user_id, league_id, join_date)
VALUES (2, 3, 2022-01-01);

INSERT INTO league (user_id, name, start_date) VALUES
(2, 'user2 league not as cool', 2021-12-12);

SELECT username, l.name
FROM Users
JOIN user_in_leagues uil on Users.id = uil.user_id
JOIN league l on uil.league_id = l.league_id;

SELECT l.name, COUNT(u.username)
FROM league l
JOIN user_in_leagues uil on l.league_id = uil.league_id
JOIN Users u on uil.user_id = u.id
group by l.name