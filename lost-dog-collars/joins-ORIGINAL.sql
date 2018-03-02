-- dog_owners table
-- id |  name   | dog_name
-- ----+---------+----------
--  1 | Omid    | Bronson
--  2 | Evan    | Bogie
--  3 | Whitney | Gilly
--  4 | Spencer | Lilly
--  5 | Dan     | Apple
--  6 | Dan     | Linux
--  7 | Omid    | Bronson
--  8 | Evan    | Bogie
--  9 | Whitney | Gilly
-- 10 | Spencer | Lilly
-- 11 | Dan     | Apple
-- 12 | Dan     | Linux
-- lost_dog_collars table
-- id | dog_name
-- ----+----------
--   1 | Bogie
--   2 | Lassie
--   3 | Gilly
--   4 | Lilly
--   5 | Fido
--   6 | Linux
--   7 | Bronson
--   8 | Goose
--   9 | Bogie
--  10 | Lassie
--  11 | Gilly
--  12 | Lilly
--  13 | Fido
--  14 | Linux
--  15 | Bronson
--  16 | Goose


/*  first query example from excercise */
-- SELECT dog_owners.name , lost_dog_collars.dog_name
--   FROM dog_owners
--   JOIN lost_dog_collars
--   ON dog_owners.dog_name = lost_dog_collars.dog_name

/*  Display only collars with known owners and those owners' names */
SELECT dog_owners.name , lost_dog_collars.dog_name
  FROM dog_owners
  JOIN lost_dog_collars
  ON dog_owners.dog_name = lost_dog_collars.dog_name;

  --OUTPUT IN TERMINAL

--   name   | dog_name
-- ---------+----------
--  Evan    | Bogie
--  Whitney | Gilly
--  Spencer | Lilly
--  Dan     | Linux
--  Omid    | Bronson

-- if you use
-- LEFT JOIN lost_dog_collars
-- then you also show the NULL value
--OUTPUT IN TERMINAL

-- name   | dog_name
-- ---------+----------
-- Evan    | Bogie
-- Whitney | Gilly
-- Spencer | Lilly
-- Dan     | Linux
-- Omid    | Bronson
-- Dan     |
/*  Display only collars without known owners. */
SELECT dog_owners.name , lost_dog_collars.dog_name
  FROM dog_owners
  RIGHT JOIN lost_dog_collars
  ON dog_owners.dog_name = lost_dog_collars.dog_name
  WHERE dog_owners.name IS NULL;
  --OUTPUT IN TERMINAL

--  name | dog_name
 -- ------+----------
 --       | Lassie
 --       | Fido
 --       | Goose

/*  Display all collars in our possession. If an owner exists for a given collar, display that also. */
SELECT dog_owners.name , lost_dog_collars.dog_name
  FROM dog_owners
  RIGHT JOIN lost_dog_collars
  ON dog_owners.dog_name = lost_dog_collars.dog_name;
  --OUTPUT IN TERMINAL
--   name   | dog_name
-- ---------+----------
-- Evan    | Bogie
--        | Lassie
-- Whitney | Gilly
-- Spencer | Lilly
--        | Fido
-- Dan     | Linux
-- Omid    | Bronson
--        | Goose
/* Display all owners known to us. If a collar matches that owner, display the collar also.
 */
 SELECT dog_owners.name , lost_dog_collars.dog_name
   FROM dog_owners
   LEFT  JOIN lost_dog_collars
   ON dog_owners.dog_name = lost_dog_collars.dog_name;
--OUTPUT IN TERMINAL
 --   name   | dog_name
 -- ---------+----------
 --  Evan    | Bogie
 --  Whitney | Gilly
 --  Spencer | Lilly
 --  Dan     | Linux
 --  Omid    | Bronson
 --  Dan     |
