-- -- Write a database schema: create a restaurant.sql file, in it write a CREATE TABLE statement to create a table called restaurant. This table will contain the following information, you will use the appropriate data types to represent the info. Please use an auto-incrementing primary key ID:

-- -- name
-- -- distance (in miles from HeadQuarters)
-- -- stars
-- -- category (type of food)
-- -- favorite dish
-- -- does takeout?
-- -- last time you ate there
-- -- Run your file one of two ways:

-- -- Copy the "CREATE TABLE" statement and paste it into the PostgreSQL shell
-- -- psql restaurant -f restaurant.sql

-- CREATE TABLE restaurant (
--     id SERIAL NOT NULL PRIMARY KEY,
--     name varchar,
--     distance decimal(4,2),
--     stars integer CHECK(stars < 6 AND stars > 0),
--     category varchar,
--     favorite_dish varchar,
--     takeout char(1),
--     last_visted_date date
-- );

-- INSERT INTO restaurant VALUES (
--     DEFAULT, 'Moon Tower Inn', 0.2, 4, 'Game-meat & specialty hot dogs', 'Chong', 'Y', '12-18-2018'
-- );
-- INSERT INTO restaurant VALUES (
--     DEFAULT, 'Hoodadak', 29.1, 5, 'Korean fried chicken & savory sides', 'Fried Chicken Wings Large(20)', 'Y', '1-12-2019'
-- );
-- INSERT INTO restaurant VALUES (
--     DEFAULT, 'Hokkaido Japanese Kitchen', 14.5, 4, 'Sushi and Japanese dishes', 'Chopped Scallop', 'Y', '8-24-2018'
-- );

-- -- Write queries to get

-- -- The names of the restaurants that you gave a 5 stars to
-- -- The favorite dishes of all 5-star restaurants
-- -- The the id of a restaurant by a specific restaurant name, say 'Moon Tower'
-- -- restaurants in the category of 'BBQ'
-- -- restaurants that do take out
-- -- restaurants that do take out and is in the category of 'BBQ'
-- -- restaurants within 2 miles
-- -- restaurants you haven't ate at in the last week
-- -- restaurants you haven't ate at in the last week and has 5 stars

-- SELECT name FROM restaurant WHERE stars = 5; -- output should return 1 row of restaurant name for the condition
-- SELECT favorite_dish FROM restaurant WHERE stars = 5; -- output should return 1 row of favorite dish name from the condition
-- SELECT id FROM restaurant WHERE name like '%Hokkaido Japanese Kitchen%'; -- output should return the id of 3 from the condition
-- SELECT name FROM restaurant WHERE category in ('Korean fried chicken & savory sides','Sushi and Japanese dishes'); -- output should be 2 rows of restaurant names with the condition
-- SELECT name FROM restaurant WHERE takeout = 'Y'; -- output should be 3 rows of restaurant names with the condition
-- SELECT name FROM restaurant WHERE takeout = 'Y' and category in ('Korean fried chicken & savory sides','Sushi and Japanese dishes'); -- output shoould be 2 rows of restaurant names
-- SELECT name FROM restaurant WHERE distance <= 2; -- output should be 1 row restaurant name with the conidition
-- SELECT name FROM restaurant WHERE last_visted_date <= '1-8-2019'; -- output should be 2 rows of restaurant names with the condition.
-- SELECT name FROM restaurant WHERE last_visted_date <= '1-8-2019' and stars = 5; -- output should be none or 0 rows since the other restaurants are 4 stars


-- Aggregation and Sorting Queries

-- list restaurants by the closest distance.
-- list the top 2 restaurants by distance.
-- list the top 2 restaurants by stars.
-- list the top 2 restaurants by stars where the distance is less than 2 miles.
-- count the number of restaurants in the db.
-- count the number of restaurants by category.
-- get the average stars per restaurant by category.
-- get the max stars of a restaurant by category.

-- SELECT name, distance FROM restaurant ORDER BY distance ASC; -- output should list all restaurants by name ascending from closest distance
-- SELECT name, distance FROM restaurant ORDER BY distance ASC LIMIT 2; -- output should list all restaurants by name ascending from closest distance with a limit of two(top two)
-- SELECT name, stars FROM restaurant ORDER BY stars DESC LIMIT 2; -- output should list all restaurants by name descending from highest or most stars with a limit of two(top two)
-- SELECT name, stars, distance FROM restaurant WHERE distance < 2 ORDER BY stars DESC, distance ASC  LIMIT 2; -- output should list all restaurant by name descending from highest or most stars with a limit of two(top two) and with a condition of 2 miles or less.
-- SELECT count(*) FROM restaurant; -- output should return a count of 3
-- INSERT INTO restaurant VALUES (
--     DEFAULT, 'Ishin Udon', 16.1, 5, 'Japanese noodles & dishes', 'Katsu Curry Udon', 'Y', '1-4-2019' -- inserted another restaurant with the category ilike "%japanese%"
-- );
-- SELECT count(*) FROM restaurant WHERE category ilike '%japanese%';  -- output should return a count of 2 
-- SELECT avg(stars) from restaurant WHERE category ilike any(VALUES('%japanese%'),('%korean%')); -- output should return an avergage of 4.67 stars from the category ilike "%japanese%"
-- SELECT max(stars) from restaurant WHERE category ilike any(VALUES('%japanese%'),('%korean%')); -- output should return a max value of 5 for stars since the top restaurant star is 5 in the listed categories 