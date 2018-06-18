


///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

// GENERAL QUERIES
// - All functions in this section return strings containing the SQL query

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

// NOTE: date should always be a string of format "YYYY-MM-DD"
  
  // Allows user to add a reply to a thread
  function insertReply(commentId, threadId, subforumName, textBody, date, accountEmail) {
    return 'INSERT INTO reply values('+commentId+','+threadId+',"'+subforumName+'","'+textBody+'","'+date+'","'+accountEmail+'")';
  }
  
  
  // Allow user to delete their own reply in a thread
  function deleteReply(accountEmail, commentId, threadId) {
    return 'DELETE FROM reply WHERE email = "'+accountEmail+'" AND id_num = '+commentId+' AND thread_id_num = '+threadId+';';
  }
  
  
  // Allow user to create a thread
  function createThread(subforumName, threadId, title, textBody, date, email) {
    return 'INSERT INTO thread values("'+subforumName+'",'+threadId+',"'+title+'", "'+textBody+'", "'+date+'", "'+email+'");';
  }
  
  
  // Allow user to delete a thread they made
  function deleteThread(email, threadId) {
    return 'DELETE FROM thread WHERE email = "'+email+'" AND id = '+threadId+';';
  }
  
  
  // View threads on subforums by most commented on in the last week.
  function getMostCommentedThreads(subforumName) {
    return `SELECT COUNT(thread_id_num), thread_id_num
  FROM reply
  WHERE name = "`+subforumName+`" AND date_posted >= (CURDATE()-7)
  GROUP BY thread_id_num
  ORDER BY COUNT(thread_id_num) DESC;`;
  }
  
  
  // MADI ALL THE ONES BELOW HERE ARE UNTESTED
  // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  
  
  /* View 10 threads with similar titles to a search phrase. */
  function getThreadsByName(searchPhrase) {
    return "select * from thread where name like '%"+searchPhrase+"%' limit 10;";
  }
  
  
  /* View 10 subforums with similar names as a search phrase. */
  function getSubforumsByName(searchPhrase) {
    return "select * from subforum where name like '%"+searchPhrase+"%' limit 10;";
  }
  
  
  /* Checks to see if a user moderates a subforum.*/
  function checkIfUserIsMod(email, subforumName) {
    return "select * from moderates where email = '"+email+"' and name = '"+subforumName+"';"
  }
  
  
  
  /* MOD/ADMIN QUERY - Delete a thread that they are not the author of. */
  function adminDeleteThread(threadId) {
    return "delete from thread where id = "+threadId+";"
  }
  
  
  /* MOD/ADMIN QUERY - Delete a comment that they are not the author of. */
  function adminDeleteReply(replyId, threadId, subforumName) {
    return "delete from reply where id_num = "+threadId+" and thread_id_num = "+threadId+" and name = '"+subforumName+"';"
  }
  
  
  /* ADMIN QUERY - Add a subforum. */
  function adminCreateSubforum(subforumName) {
    return "insert into subforum values('"+subforumName+"');"
  }
  
  
  /* ADMIN QUERY - Delete a subforum. */
  function adminDeleteSubforum(subforumName) {
    return "delete from subforum where name = '"+subforumName+"';"
  }
  
  /* ADMIN QUERY - Appoint moderation of a user for a subforum. */
  function adminModUser(email, subforumName) {
    return "insert into moderates values('"+email+"', '"+subforumName+"');"
  }
  
  
  /* ADMIN QUERY - Remove moderation ability of a user for a subforum. */
  function adminUnmodUser(email, subforumName) {
    return "delete from moderates where email = '"+email+"' and name = '"+subforumName+"';"
  }
  
  
  /* ADMIN QUERY - Check to see if any users are subscribed to every subforum. AKA a "superfan" of the Boboverse.*/
  function adminSuperfanCheck() {
    return `
    SELECT DISTINCT email
    FROM subscribed_to S
    WHERE NOT EXISTS (
    SELECT *
    FROM subscribed_to S2
    WHERE NOT EXISTS (
    SELECT name
    FROM subscribed_to S3
    WHERE S.email = S3.email AND S2.name = S3.name)
    );`;
  }
  
  /* ADMIN QUERY - Allows admin to see comments on all threads in a easy-to-read manner. */
  function adminViewAllComments() {
    return "SELECT t.title, t.textbody, r.body, r.date_posted, r.email FROM thread t JOIN reply r ON t.id = r.thread_id_num;"
  }
  
  
  /* ADMIN QUERY - Allows admin to see the youngest user(s) on the server. */
  function adminGetYoungestUser() {
    return `
    SELECT *
    FROM account
    WHERE age = (
    SELECT MIN(age)
    FROM account);`
  }
  
  
  /* ADMIN QUERY - Allows admin to see the oldest user(s) on the server. */
  function adminGetOldestUser(){
    return `
    SELECT *
    FROM account
    WHERE age = (
    SELECT MAX(age)
    FROM account);`;
  }
  
  /* ADMIN QUERY - Allows admin to see the age with the highest average banana score. */
  function adminGetAgeWithMaxBananaScore() {
    return `
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
    GROUP BY age) AS t);`;
  }
  
  /* ADMIN QUERY - Allows admin to see the age with the lowest average banana score. */
  function adminGetAgeWithMinBananaScore(){
    return `
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
    GROUP BY age) AS t);`;
  }
  
  /* ADMIN QUERY - Allows admin to add a user to the super exclusive Boboverse forum. */
  function adminCreateUser(email, username, password, age, bananaScore, isAdmin) {
    return "INSERT INTO account values('"+email+"', '"+username+"', '"+password+"', "+age+", "+bananaScore+", "+isAdmin+");";
  }
  
  /* ADMIN QUERY - Allows admin to adjust a user's banana score. */
  function adminChangeUsersBananaScore(email, newScore) {
    return `
    UPDATE account
    SET banana_score = PLACEHOLDER_INTEGER
    WHERE email = 'PLACEHOLDER_EMAIL';`;
  }
  
  /* ADMIN QUERY - Super general selection and projection query. */
  function adminGeneralQuery(selectConstraint, fromConstraint, whereConstraint) {
    return "select "+selectConstraint+" from "+fromConstraint+" where "+whereConstraint+";"
  }
  
  /*ADMIN QUERY - Allows admin to see if a user has posted a thread in every subforum. A true and loyal user of the Boboverse. */
  function adminSuperDuperFanCheck() {
    return `
    SELECT DISTINCT email
    FROM account A
    WHERE NOT EXISTS (
    SELECT *
    FROM subforum S
    WHERE NOT EXISTS (
    SELECT name
    FROM thread T
    WHERE A.email = T.email AND T.name = S.name)
    );`
  }
  
