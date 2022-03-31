USE albums_db;

SELECT *
FROM albums;
-- Also, used the table explorer.
-- 3a: There are 31 rows in the albums table.

SELECT DISTINCT artist 
FROM albums;
-- 3b: There are 23 unique artists.
-- Also: SELECT COUNT(DISTINCT artist) FROM albums;

DESCRIBE albums;
-- 3c: Primary key is 'id'

SELECT * FROM albums ORDER BY release_date;
-- 3d: 1967, 2011

SELECT name FROM albums WHERE artist = 'Pink Floyd';

SELECT release_date FROM albums WHERE name = 'Sgt. Pepper\'s Lonely Hearts Club Band';

SELECT genre FROM albums WHERE name = "Nevermind";

SELECT name FROM albums WHERE release_date > 1989 AND release_date < 2000;

SELECT name FROM albums WHERE sales < 20.0;

SELECT name, genre FROM albums WHERE genre >= 'Rock';
-- SQL evalautes each word seperated by commons independantly for 'Rock' only








