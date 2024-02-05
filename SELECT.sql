--Задание 2
--1)
select songduration, songname  from song
where songduration = (select max(songduration) from song);

--2)
select songduration, songname  from song
where songduration >=  210;

--3)
select albumname, albumyear  from album
where albumyear between '2018-01-01' and '2020-01-01';

--4)
select artistname from artist
where artistname not like '% %';

--5)
select songname  from song
where songname like '%my%' or songname like '%мой%';

--Задание 3
--1)
select genrename, COUNT(artistname) QTY from genre g
left join genreartist g2 on g.id = g2.idgenre 
left join artist a on g2.idartist  = a.id
group by genrename
order by COUNT(artistname) desc;

--2) тут 2 решения не знаю какое из них верно
select albumname, COUNT(songname) QTY from album a
left join song s on a.id = s.albumid 
where albumyear between '2019-01-01' and '2020-12-31'
group by albumname;

select COUNT(songname) QTY from album a
left join song s on a.id = s.albumid 
where albumyear between '2019-01-01' and '2020-12-31';

--3)
select albumname, avg(songduration) QTY from album a
left join song s on a.id = s.albumid
group by albumname
ORDER BY QTY desc;

--4)
select DISTINCT artistname from artist
where artistname not in (SELECT DISTINCT artistname from artist a
left join artistalbum a2 on a.id = a2.idartist  
left join album a3 on a2.idalbum = a3.id
where albumyear between '2020-01-01' and '2020-12-31')

--5)
select distinct collectionname from collection c
left join collectionsong c2 on c.id = c2.idcollection
left join song s on c2.idsong = s.id 
left join album a on s.albumid = a.id 
left join artistalbum a2 on a.id =a2.idalbum
left join artist a3 on a2.idartist = a3.id
where artistname like 'Тилль Линдеманн'
 
--Задание 4
--1)
select albumname from album a
left join artistalbum a1 on a.id  = a1.idalbum
left join artist a2 on a1.idartist = a2.id
left join genreartist g on a2.id = g.idartist
left join genre g1 on g.idgenre = g1.id
group by albumname
having count(genrename) > 1;

--2)
select songname FROM song s
left join collectionsong c on s.id = c.idsong 
left join collection c1 on c.idcollection = c1.id
where collectionname is NULL

--3)
select artistname FROM artist a
left join artistalbum a1 on a.id = a1.idartist
left join album a2 on a1.idalbum = a2.id
left join song s on a2.id = s.albumid
where songduration = (select min(songduration) from song )

--4)
select albumname from album a
left join song s on a.id  = s.albumid
group by albumname
having count(songname) = (select count(albumid) from album a
left join song s on a.id = s.albumid
group by albumname
ORDER BY count(albumid)
limit 1);
