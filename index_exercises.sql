USE william;

DESCRIBE employees;
DESCRIBE departments;
DESCRIBE dept_emp;
DESCRIBE dept_manager;
DESCRIBE salaries;

DESCRIBE albums;

ALTER TABLE albums
ADD UNIQUE (artist, name);

DESCRIBE albums;

SELECT *
FROM albums;

INSERT INTO albums (artist, name, release_date, sales, genre)
VALUES ('Metallica', 'Metallica', 2000, 3.4, 'metal');

INSERT INTO albums (artist, name, release_date, sales, genre)
VALUES ('Metallica', 'Master of Puppets', 2000, 3.4, 'metal');