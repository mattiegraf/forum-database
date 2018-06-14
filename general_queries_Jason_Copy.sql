/* Selects the username and password of a specific user. Can be used for logging in.*/

SELECT username, password
FROM account
WHERE username = 'PLACEHOLDER_USERNAME';

/* Allows user to add a comment. */

--

/* Allows user to delete a comment. */

--

/* Allows user to add a thread.*/

--

/* Allows user to delete a thread. */

--

/* Allows user to send message to another account. */

insert into message
values(PLACEHOLDER_INTEGER, 'PLACEHOLDER_MESSAGE', PLACEHOLDER_TIME, 'PLACEHOLDER_FROM', 'PLACEHOLDER_TO');

/* Allows user to subscribe to a forum. */

INSERT INTO subscribed_to
values('PLACEHOLDER_EMAIL', 'PLACEHOLDER_SUBFORUM');

/* Allows user to unsubscribe to a forum. */

DELETE FROM subscribed_to
WHERE email = 'PLACEHOLDER_EMAIL' AND name = 'PLACEHOLDER_SUBFORUM';

/* Allows user to view the last 20 messages sent to their account. */

SELECT *
FROM message
WHERE received_email = 'PLACEHOLDER_EMAIL'
LIMIT 20;

/* Allows user to view most commented on threads for each subforum that a user is subscribed to created in the last week. */

--

/* View threads on subforums in order of latest comments. */

--

/* View threads on subforums by most commented on in the last week. */

--

/* View threads on subforums by latest post date. */

--

/* View threads on subforums by total comments. */

--

/* View 10 threads with similar titles to a search phrase. */

SELECT *
FROM thread
WHERE name LIKE '%PLACEHOLDER_SEARCH%'
LIMIT 10;

/* View 10 subforums with similar names as a search phrase. */

SELECT *
FROM subforum
WHERE name LIKE '%PLACEHOLDER_SEARCH%'
LIMIT 10;

/* MOD/ADMIN QUERY - Delete a thread that they are not the author of in a subforum they moderate. */

--

/* MOD/ADMIN QUERY - Delete a comment that they are not the author of in a subforum they moderate. */

--

/* ADMIN QUERY - Add a subforum. */

INSERT INTO subforum
values('PLACEHOLDER_NAME');

/* ADMIN QUERY - Delete a subforum. */

DELETE FROM subforum
WHERE name = 'PLACEHOLDER_SUBFORUM';

/* ADMIN QUERY - Delete an account that isn't another admin. */

DELETE FROM account
WHERE email = 'PLACEHOLDER_EMAIL' and isadmin = 0;

/* ADMIN QUERY - Appoint moderation of a user for a subforum. */

INSERT INTO moderates
values('PLACEHOLDER_EMAIL', 'PLACEHOLDER_SUBFORUM');

/* ADMIN QUERY - Remove moderation ability of a user for a subforum. */

DELETE FROM moderates
WHERE email = 'PLACEHOLDER_EMAIL' AND name = 'PLACEHOLDER_NAME';