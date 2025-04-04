CREATE TABLE Movies1 (
  Code INTEGER PRIMARY KEY,
  Title VARCHAR(255) NOT NULL,
  Rating VARCHAR(255) 
);

CREATE TABLE MovieTheaters (
  Code INTEGER PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Movie INTEGER,  
    FOREIGN KEY (Movie) REFERENCES Movies1(Code)
);

INSERT INTO movies1(Code,Title,Rating) VALUES(1,'Citizen Kane','PG');
 INSERT INTO Movies1(Code,Title,Rating) VALUES(2,'Singin'' in the Rain','G');
 INSERT INTO Movies1(Code,Title,Rating) VALUES(3,'The Wizard of Oz','G');
 INSERT INTO Movies1(Code,Title,Rating) VALUES(4,'The Quiet Man',NULL);
 INSERT INTO Movies1(Code,Title,Rating) VALUES(5,'North by Northwest',NULL);
 INSERT INTO Movies1(Code,Title,Rating) VALUES(6,'The Last Tango in Paris','NC-17');
 INSERT INTO Movies1(Code,Title,Rating) VALUES(7,'Some Like it Hot','PG-13');
 INSERT INTO Movies1(Code,Title,Rating) VALUES(8,'A Night at the Opera',NULL);
 
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(1,'Odeon',5);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(2,'Imperial',1);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(3,'Majestic',NULL);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(4,'Royale',6);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(5,'Paraiso',3);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(6,'Nickelodeon',NULL);
 
 
 SELECT * FROM movies1;
 
 SELECT * FROM movietheaters;
 
-- 4.1 Select the title of all movies.
    
    SELECT TITLE FROM MOVIES1;
 
-- 4.2 Show all the distinct ratings in the database.

    SELECT DISTINCT(RATING) FROM MOVIES1;

-- 4.3  Show all unrated movies.

    SELECT * FROM MOVIES1 WHERE RATING IS NULL;
    
    
-- 4.4 Select all movie theaters that are not currently showing a movie.

    SELECT * FROM movietheaters WHERE MOVIE IS NULL;

-- 4.5 Select all data from all movie theaters 
    -- and, additionally, the data from the movie that is being shown in the theater (if one is being shown).
    
    SELECT * FROM movietheaters  LEFT JOIN MOVIES1 ON movietheaters.movie=MOVIES1.CODE;
    
    
-- 4.6 Select all data from all movies and, if that movie is being shown in a theater, show the data from the theater.

    SELECT *
   FROM MovieTheaters RIGHT JOIN Movies1
   ON MovieTheaters.Movie = Movies1.Code;

-- 4.7 Show the titles of movies not currently being shown in any theaters.



-- 4.8 Add the unrated movie "One, Two, Three".

    INSERT INTO Movies1(Title,Rating)VALUES('One, Two, Three',NULL);

-- 4.9 Set the rating of all unrated movies to "G".
-- 4.10 Remove movie theaters projecting movies rated "NC-17".