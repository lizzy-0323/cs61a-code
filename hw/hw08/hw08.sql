CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT DOGS.NAME AS NAME ,SIZES.SIZE AS SIZE FROM DOGS,SIZES WHERE DOGS.HEIGHT<=SIZES.MAX AND DOGS.HEIGHT>SIZES.MIN ORDER BY DOGS.NAME;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT P1.NAME FROM DOGS AS P1, DOGS AS P2, PARENTS WHERE P1.NAME = PARENTS.child AND P2.NAME =PARENTS.parent ORDER BY P2.HEIGHT DESC;  


-- Filling out this helper table is optional
CREATE TABLE siblings AS
SELECT P1.CHILD AS SIB1,P2.CHILD AS SIB2 FROM PARENTS AS P1, PARENTS AS P2 WHERE P1.PARENT = P2.PARENT AND P1.CHILD <P2.CHILD;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT SIB1 || " and " || SIB2  || " are " || S1.SIZE || " siblings" FROM siblings,size_of_dogs AS S1,size_of_dogs AS S2
  WHERE S1.SIZE==S2.SIZE AND SIB1=S1.NAME AND SIB2=S2.NAME;


-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
CREATE TABLE stacks_helper(dog, stack_height, last_height);
CREATE TABLE stacks_helper2(dog1,dog2,stack_height,last_height);
CREATE TABLE stacks_helper3(dog1,dog2,dog3,stack_height,last_height);
CREATE TABLE stacks_helper4(dog1,dog2,dog3,dog4,stack_height,last_height);
-- Add your INSERT INTOs here
INSERT INTO stacks_helper SELECT NAME,HEIGHT,HEIGHT FROM DOGS;
INSERT INTO stacks_helper2 SELECT S1.DOG,S2.DOG,S1.LAST_HEIGHT+S2.LAST_HEIGHT,S2.LAST_HEIGHT FROM stacks_helper AS S1,stacks_helper AS S2 WHERE S1.DOG!=S2.DOG AND S1.last_height<S2.last_height;
INSERT INTO stacks_helper3 SELECT S1.DOG1,S1.DOG2,S2.DOG,S1.STACK_HEIGHT+S2.LAST_HEIGHT,S2.LAST_HEIGHT FROM stacks_helper2 AS S1,stacks_helper AS S2 WHERE S1.DOG2!=S2.DOG AND S1.LAST_HEIGHT<S2.LAST_HEIGHT;
INSERT INTO stacks_helper4 SELECT S1.DOG1,S1.DOG2,S1.DOG3,S2.DOG,S1.STACK_HEIGHT+S2.LAST_HEIGHT, S2.LAST_HEIGHT FROM stacks_helper3 AS S1,stacks_helper AS S2 WHERE S1.DOG3!=S2.DOG AND S1.LAST_HEIGHT<S2.LAST_HEIGHT;
CREATE TABLE stacks AS
SELECT DOG1 || ", " || DOG2 || ", " || DOG3 || ", " || DOG4, stack_height FROM stacks_helper4 WHERE STACK_HEIGHT>=170 ORDER BY stack_height;

