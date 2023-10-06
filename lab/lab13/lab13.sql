.read data.sql


CREATE TABLE bluedog AS
  SELECT COLOR, PET FROM STUDENTS WHERE COLOR = 'blue' AND PET = 'dog';

CREATE TABLE bluedog_songs AS
  SELECT COLOR, PET, SONG FROM STUDENTS WHERE COLOR = 'blue' AND PET = 'dog';


CREATE TABLE matchmaker AS
  SELECT ST1.PET,ST1.SONG,ST1.COLOR,ST2.COLOR FROM STUDENTS AS ST1,STUDENTS AS ST2 WHERE ST1.PET = ST2.PET AND ST1.SONG = ST2.SONG AND ST1.TIME < ST2.TIME;


CREATE TABLE sevens AS
  SELECT a.seven FROM students AS a, numbers AS b WHERE a.time = b.time AND a.number = 7 AND b.'7' = "True";  


CREATE TABLE favpets AS
  SELECT PET,COUNT(*) AS COUNT FROM STUDENTS GROUP BY PET ORDER BY COUNT DESC LIMIT 10;


CREATE TABLE dog AS
  SELECT PET,COUNT(*) AS COUNT FROM STUDENTS WHERE PET = 'dog' GROUP BY PET ORDER BY COUNT DESC;


CREATE TABLE bluedog_agg AS
  SELECT SONG,COUNT(SONG) FROM bluedog_songs GROUP BY SONG;


CREATE TABLE instructor_obedience AS
  SELECT SEVEN,INSTRUCTOR,COUNT(*) FROM STUDENTS WHERE seven= '7' GROUP BY INSTRUCTOR;

