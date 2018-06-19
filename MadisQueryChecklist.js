


///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

// GENERAL QUERIES
// - All functions in this section return strings containing the SQL query

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

// NOTE: date should always be a string of format "YYYY-MM-DD"
  
  /* ADMIN QUERY - Allows admin to add a user to the super exclusive Boboverse forum. */
  function adminCreateUser(email, username, password, age, bananaScore, isAdmin) {
    return "INSERT INTO account values('"+email+"', '"+username+"', '"+password+"', "+age+", "+bananaScore+", "+isAdmin+");";
  }
  
  /* ADMIN QUERY - Super general selection and projection query. */
  function adminGeneralQuery(selectConstraint, fromConstraint, whereConstraint) {
    return "select "+selectConstraint+" from "+fromConstraint+" where "+whereConstraint+";"
  }
