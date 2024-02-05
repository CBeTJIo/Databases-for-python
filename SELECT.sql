--Задание 2
--1)
SELECT songduration, songname FROM song
WHERE songduration = (SELECT MAX(songduration) FROM song);

--2)
SELECT songduration, songname FROM song
WHERE songduration >=  210;

--3)
SELECT albumname, albumyear FROM album
WHERE albumyear BETWEEN '2018-01-01' AND '2020-01-01';

--4)
SELECT artistname FROM artist
WHERE artistname NOT LIKE '% %';

--5)
SELECT songname FROM song
WHERE songname LIKE '%my%' or songname like '%мой%';

--Задание 3
--1)
SELECT genrename, COUNT(artistname) QTY FROM genre AS g
LEFT JOIN genreartist AS g2 ON g.id = g2.idgenre 
LEFT JOIN artist AS a ON g2.idartist  = a.id
GROUP BY genrename
ORDER BY COUNT(artistname) DESC;

--2) тут 2 решения не знаю какое из них верно
SELECT albumname, COUNT(songname) QTY FROM album AS a
LEFT JOIN song AS s ON a.id = s.albumid 
WHERE albumyear BETWEEN '2019-01-01' AND '2020-12-31'
GROUP BY albumname;

SELECT COUNT(songname) QTY FROM album AS a
LEFT JOIN song AS s ON a.id = s.albumid 
WHERE albumyear BETWEEN '2019-01-01' AND '2020-12-31';

--3)
SELECT albumname, AVG(songduration) QTY FROM album AS a
LEFT JOIN song AS s ON a.id = s.albumid
GROUP BY albumname
ORDER BY QTY DESC;

--4)
SELECT DISTINCT artistname FROM artist
WHERE artistname NOT IN (SELECT DISTINCT artistname FROM artist AS a
LEFT JOIN artistalbum AS a2 ON a.id = a2.idartist  
LEFT JOIN album AS a3 ON a2.idalbum = a3.id
WHERE albumyear BETWEEN '2020-01-01' AND '2020-12-31');

--5)
SELECT DISTINCT collectionname FROM collection AS c
LEFT JOIN collectionsong AS c2 ON c.id = c2.idcollection
LEFT JOIN song AS s ON c2.idsong = s.id 
LEFT JOIN album AS a ON s.albumid = a.id 
LEFT JOIN artistalbum AS a2 on a.id =a2.idalbum
LEFT JOIN artist AS a3 ON a2.idartist = a3.id
WHERE artistname LIKE 'Тилль Линдеманн';
 
--Задание 4
--1)
SELECT albumname FROM album AS a
LEFT JOIN artistalbum AS a1 ON a.id  = a1.idalbum
LEFT JOIN artist AS a2 ON a1.idartist = a2.id
LEFT JOIN genreartist AS g ON a2.id = g.idartist
LEFT JOIN genre AS g1 ON g.idgenre = g1.id
GROUP BY albumname
HAVING COUNT(genrename) > 1;

--2)
SELECT songname FROM song AS s
LEFT JOIN collectionsong AS c ON s.id = c.idsong 
LEFT JOIN collection AS c1 ON c.idcollection = c1.id
WHERE collectionname IS NULL;

--3)
SELECT artistname FROM artist AS a
LEFT JOIN artistalbum AS a1 on a.id = a1.idartist
LEFT JOIN album AS a2 ON a1.idalbum = a2.id
LEFT JOIN song AS s ON a2.id = s.albumid
WHERE songduration = (SELECT MIN(songduration) FROM song);

--4)
SELECT albumname FROM album AS a
LEFT JOIN song AS s ON a.id  = s.albumid
GROUP BY albumname
HAVING COUNT(songname) = (SELECT COUNT(albumid) FROM album AS a
LEFT JOIN song AS s ON a.id = s.albumid
GROUP BY albumname
ORDER BY COUNT(albumid)
LIMIT 1);
