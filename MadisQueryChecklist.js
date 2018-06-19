


///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

// GENERAL QUERIES
// - All functions in this section return strings containing the SQL query

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

// NOTE: date should always be a string of format "YYYY-MM-DD"
  
  
  // Allow user to delete their own reply in a thread
  function deleteReply(accountEmail, commentId, threadId) {
    return 'DELETE FROM reply WHERE email = "'+accountEmail+'" AND id_num = '+commentId+' AND thread_id_num = '+threadId+';';
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
  
  /* ADMIN QUERY - Allows admin to add a user to the super exclusive Boboverse forum. */
  function adminCreateUser(email, username, password, age, bananaScore, isAdmin) {
    return "INSERT INTO account values('"+email+"', '"+username+"', '"+password+"', "+age+", "+bananaScore+", "+isAdmin+");";
  }
  
  /* ADMIN QUERY - Super general selection and projection query. */
  function adminGeneralQuery(selectConstraint, fromConstraint, whereConstraint) {
    return "select "+selectConstraint+" from "+fromConstraint+" where "+whereConstraint+";"
  }
