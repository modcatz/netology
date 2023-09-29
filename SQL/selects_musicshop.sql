-- Задание 2
-- 1. Название и продолжительность самого длительного трека.
SELECT "name", duration
FROM tracks 
WHERE duration = (SELECT max(duration) FROM tracks);

-- 2. Название треков, продолжительность которых не менее 3,5 минут.
SELECT "name"
FROM tracks 
WHERE duration >= 210;

-- 3. Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT "name"
FROM compilations 
WHERE "year" BETWEEN 2018 AND 2020;

-- 4. Исполнители, чьё имя состоит из одного слова.
SELECT "name" 
FROM artists  
WHERE POSITION(' ' IN "name") = 0;

-- 5. Название треков, которые содержат слово «мой» или «my»
SELECT "name" 
FROM tracks  
WHERE lower("name") LIKE '%my%';

-- Задание 3
-- 1. Количество исполнителей в каждом жанре.
SELECT g."name" , COUNT(artist_id)
FROM genre_artist ga
JOIN genres g ON g.id = ga.genre_id 
GROUP BY g."name";
-- 2. Количество треков, вошедших в альбомы 2019–2020 годов
SELECT COUNT(t.id)
FROM tracks t 
JOIN albums a ON t.album_id = a.id 
WHERE a."year" BETWEEN 2019 AND 2020;
-- 3. Средняя продолжительность треков по каждому альбому.
SELECT a."name", AVG(t.duration)
FROM tracks t 
JOIN albums a ON t.album_id = a.id 
GROUP BY a."name";
-- 4. Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT DISTINCT ar."name"
FROM album_artist aa  
JOIN artists ar ON aa.artist_id = ar.id 
WHERE ar.id NOT IN (

SELECT aa.artist_id 
FROM album_artist aa  
JOIN albums al ON aa.album_id = al.id
WHERE al."year" = 2020
);
-- 5. Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT DISTINCT c."name" 
FROM compilation_track ct 
JOIN compilations c ON ct.compilation_id = c.id 
WHERE ct.track_id IN (
SELECT id FROM tracks
WHERE album_id IN (
SELECT album_id FROM album_artist 
WHERE artist_id = (SELECT id FROM artists WHERE "name" = 'Taylor Swift')
)
);