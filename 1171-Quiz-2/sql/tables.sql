DROP TABLE IF EXISTS albums_tracks CASCADE;
DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS tracks;

CREATE TABLE albums(
    album_ID int NOT NULL,
    title text NOT NULL,
    artist Varchar(100) NOT NULL,
    PRIMARY KEY(album_ID )
);

CREATE TABLE tracks(
    track_ID int NOT NULL,
    title text NOT NULL,
    artist Varchar(100) NOT NULL,
    lenght_time TIME NOT NULL,
    PRIMARY KEY( track_ID)
);
--albums table

INSERT INTO albums (album_ID,title,artist)
VALUES
(1,'beyond infinity','Eminem'),
(2,'fourth dimesion ','maggie'),
(3,' glass shoe','atherine moan & primer'),
(4,'climate changed','50 cent'),
(5,'deaths dead','FKA twigs '),
(6,'total destruction','yeah yeah yeah'),
(7,'army of ants','The Weeknd'),
(8,' baseless','Bad Bunny '),
(9,'sweetbitter','Marshmello'),
(10,'infatuation','Machine Gun Kelly ');


--Tracks table

INSERT INTO tracks(track_ID,title, artist,lenght_time)
VALUES
(10,'anywhere with you','maggie rogers','00:4:58'),
(9,'guilty conscience','Eminem','00:1:16'),
(8,'my heart','catherine moan & primer','00:3:05'),
(7,'many men',' 50 cent','00:4:57'),
(6,'ride the dragon','FKA twigs','00:2:47'),
(5,'save yor tears','The Weeknd','00:4:08'),
(4,'wolf','yeah yeah yeah','00:4:26'),
(3,'jardineira','Bad Bunny','00:2:13'),
(2,'happier','Marshmello','00:3:54'),
(1,'cigarette','lil uzi vert','00:3:02');

--link table
CREATE TABLE albums_tracks(
    id serial PRIMARY KEY,
    album_ID integer REFERENCES albums(album_ID),
    track_ID integer REFERENCES tracks(track_ID)
);

INSERT INTO albums_tracks(album_ID,track_ID)
VALUES
(1,10),
(1,9),
(2,8),
(4,7),
(5,6),
(7,5),
(8,4),
(8,3),
(9,2),
(10,1);

--select from tables
SELECT * FROM albums;
SELECT * FROM tracks;
SELECT * FROM albums_tracks;

--Write an SQL query to see the albums and the tracks that belong to that album.
    SELECT A.title, T.title,T.lenght_time
    FROM albums AS A
    INNER JOIN albums_tracks AS AT
    ON A.album_ID = AT.album_ID
    INNER JOIN tracks AS T
    ON AT.track_ID = T.track_ID;
--Write an SQL query to see the album or albums that each track belongs to.
SELECT T.title AS track_name, T.lenght_time AS track_length, A.title AS released_on_album
FROM tracks as T
INNER JOIN albums_tracks AS AT
ON T.track_ID = AT.track_ID
INNER JOIN albums AS A
ON AT.album_ID = A.album_ID;
--Write a query to see the number of songs an album has.
   SELECT A.title AS album_title, COUNT(T.track_ID)
    FROM albums AS A
    FULL JOIN albums_tracks AS AT
    ON A.album_ID = AT.album_ID
    FULL JOIN tracks AS T
    ON AT.track_ID = T.track_ID
    GROUP BY A.album_ID;
--Write a query to see how many albums a particular track is included on.
   SELECT T.title AS tracks_title, COUNT(A.album_ID)
    FROM albums AS A
    FULL JOIN albums_tracks AS AT
    ON A.album_ID = AT.album_ID
    FULL JOIN tracks AS T
    ON AT.track_ID = T.track_ID
    WHERE T.title = 'guilty conscience'
    GROUP BY  T.track_ID;


