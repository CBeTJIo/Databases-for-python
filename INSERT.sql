insert into artist (artistname)
VALUES('Тилль Линдеманн'),
('Юрий Шевчук'),
('Серж Танкян'),
('Алла Пугачева'),
('Михаил Круг'),
('Андрей Губин'),
('Анжела Жиркова'),
('Eminem');

insert into genre (genrename)
VALUES('Pop'),
('Rock'),
('Chanson'),
('Folk'),
('Rap');

insert into album (albumname, albumyear)
VALUES('Elect the Dead (Deluxe)', '2001-01-01'),
('Исповедь', '2003-01-01'),
('Северный ветер', '2021-01-01'),
('Mutter', '2001-01-01'),
('Music to Be Murdered By', '2020-01-01'),
('The Slim Shady LP', '1999-01-01');

insert into song (albumid, songname, songduration)
VALUES(1,'Lie Lie Lie', 229),
(1, 'Sky is Over', 186),
(2, 'Исповедь', 318),
(2, 'На юг', 235),
(3,'Охота на лисицу', 192),
(3,'Северный ветер', 192),
(4,'Mutter', 269),
(4,'Links 2 3 4', 217),
(4,'Ich will', 217),
(5, 'You Gon Learn', 234),
(6, 'my name is', 248);

insert into collection (collectionname, collectionyear)
VALUES('Рок', '2002-01-01'),
('Шансон', '2003-01-01'),
('Смесь', '2015-01-01'),
('Избранный', '2023-01-01');

insert into artistalbum (idartist, idalbum)
VALUES(1, 4),
(3, 1),
(5, 2),
(7, 3),
(8, 5),
(8, 6);

insert into genreartist (idgenre, idartist)
VALUES(1, 4),
(1, 6),
(2, 1),
(2, 2),
(2, 3),
(2, 7),
(3, 5),
(4, 7),
(5, 8);

insert into collectionsong (idcollection, idsong)
VALUES(1, 1),
(1, 2),
(1, 7),
(1, 8),
(1, 9),
(2, 3),
(2, 4),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(4, 1),
(4, 2),
(4, 5),
(4, 6),
(4, 7),
(4, 8),
(4, 9),
(4, 11);