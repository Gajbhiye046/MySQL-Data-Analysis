USE spotify ;
SELECT artist, COUNT(*) AS Number_of_tracks FROM tracks
GROUP BY artist
ORDER BY COUNT(*) DESC;

SELECT * FROM tracks;

SELECT genre, MIN(danceability) AS Average_duration
FROM tracks
WHERE artist IN ('Queen','The Beatles')
GROUP BY genre
ORDER BY AVG(duration) DESC;

SELECT artist, MIN(danceability),MAX(danceability), AVG(danceability)
FROM tracks
WHERE artist IN ('Queen','The Beatles')
GROUP BY artist;

SELECT genre
FROM tracks
WHERE genre LIKE '%pop%';

SELECT genre
FROM tracks
WHERE genre LIKE '%rock%';



SELECT genre, artist, MAX(popularity), MIN(popularity), count(*) AS Number_of_tracks
FROM tracks
WHERE genre LIKE '%rock%'
GROUP BY genre
ORDER BY MAX(popularity) DESC;

SELECT genre, release_year, count(*) AS Number_of_tracks
FROM tracks
WHERE release_year BETWEEN 2005 AND 2010
GROUP BY genre
HAVING count(*) > 10 
ORDER BY release_year ; 

SELECT release_year ,artist,count(*) AS Number_of_tracks
FROM tracks
WHERE artist = 'Coldplay'
GROUP BY release_year
ORDER BY release_year ; 

