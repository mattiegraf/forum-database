/* ADMIN QUERY - Super general selection and projection query. I think it meets this?:
Pick one query of this category and provide an interface for the user to specify the 
selection condition and the attributes to be returned. Rerun the query with another constant. We need 2 of these. 
/PROJECTION QUERY. */

SELECT PLACEHOLDER
FROM PLACEHOLDER
WHERE PLACEHOLDER;

/* ADMIN QUERY - Allows admin to see comments on all threads in a easy-to-read manner. JOIN QUERY.*/
SELECT t.title, t.textbody, r.body, r.date_posted, r.email
FROM thread t JOIN reply r ON t.id = r.thread_id_num;

/*ADMIN QUERY - Allows admin to see if a user has posted a thread in every subforum. A true and loyal user of the Boboverse. DIVISION QUERY.*/

SELECT DISTINCT email
FROM account A
WHERE NOT EXISTS (
SELECT *
FROM subforum S
WHERE NOT EXISTS (
SELECT name
FROM thread T
WHERE A.email = T.email AND T.name = S.name)
);

/* ADMIN QUERY - Allows admin to see the user(s) with the lowest banana score. AGGREGATION QUERY - CAN USE EITHER THE SET OF AGE OR BANANA SCORE.*/

SELECT *
FROM account
WHERE banana_score = (
SELECT MIN(banana_score)
FROM account);

/* ADMIN QUERY - Allows admin to see the user(s) with the highest banana score. AGGREGATION QUERY - CAN USE EITHER THE SET OF AGE OR BANANA SCORE.*/

SELECT *
FROM account
WHERE banana_score = (
SELECT MAX(banana_score)
FROM account);

/* ADMIN QUERY - Allows admin to see the youngest user(s) on the server. AGGREGATION QUERY - CAN USE EITHER THE SET OF AGE OR BANANA SCORE.*/
SELECT *
FROM account
WHERE age = (
SELECT MIN(age)
FROM account);

/* ADMIN QUERY - Allows admin to see the oldest user(s) on the server. AGGREGATION QUERY - CAN USE EITHER THE SET OF AGE OR BANANA SCORE.*/
SELECT *
FROM account
WHERE age = (
SELECT MAX(age)
FROM account);

/* ADMIN QUERY - Allows admin to see the age with the highest average banana score. NESTED AGGREGATION WITH GROUP-BY.*/

SELECT *
FROM(
SELECT AVG(banana_score)AS AvgBananaScore, age
FROM account
GROUP BY age) AS t
WHERE AvgBananaScore = (
SELECT MAX(AvgBananaScore)
FROM(
SELECT AVG(banana_score)AS AvgBananaScore, age
FROM account
GROUP BY age) AS t);

/* ADMIN QUERY - Allows admin to see the age with the lowest average banana score. NESTED AGGREGATION WITH GROUP-BY.*/

SELECT *
FROM(
SELECT AVG(banana_score)AS AvgBananaScore, age
FROM account
GROUP BY age) AS t
WHERE AvgBananaScore = (
SELECT MIN(AvgBananaScore)
FROM(
SELECT AVG(banana_score)AS AvgBananaScore, age
FROM account
GROUP BY age) AS t);

/* Allows user to delete a thread. DELETE QUERY. AS IT WILL SHOW THE CASCADE FOR COMMENTS.*/

DELETE FROM thread
WHERE email = 'PLACEHOLDER_EMAIL' AND id = PLACEHOLDER_ID;

/* ADMIN QUERY - Allows admin to adjust a user's banana score. UPDATE QUERY, as I have a check on banana_score so that it can't be
negative. WARNING - MYSQL SKIPS CHECKS, SO YOU'LL HAVE TO MAKE THE CHECK AT THE APPLICATION LEVEL.*/

UPDATE account
SET banana_score = PLACEHOLDER_INTEGER
WHERE email = 'PLACEHOLDER_EMAIL';