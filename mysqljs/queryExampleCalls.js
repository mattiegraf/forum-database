
// Setup stuff:
// - Connection info should be based on your MySQL instance
var mysql      = require('mysql');
var queries    = require('./queries')
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'cs304bobo',
  database : 'boboverse',
  port : 3306,
  multipleStatements : true
});


connection.connect();
initializeDb();
// exampleQueries(); // uncomment this to run some example queries - function definition below
connection.end();



/** The main function to query the database
 * @param {string} query - the SQL query as a string
 * @param {function(RowDataPacket[])} - callback function to deal with the array returned by the query
 *                                    - if nothing needs to be done with the data, the callback can be null
 * WARNING: This function is async so I don't think you can return anything in the callback - it always returns undefined
 *          So any operations with the data must be performed within the callback function
 */
function makeQuery(query, callback) {

  connection.query(query, (error, results) => {
    if (error) console.log(error.code);
    if (callback) callback(results);
  });
}


/**
 * Initializes the database
 * - first drops every table, then re-creates them and populates them
 * - note: this function has unexpected behaviour when all the tables do not already exist in the database
 */
function initializeDb() {
  for (sqlQuery of queries.dropTables) {
    makeQuery(sqlQuery, null);
  }
  makeQuery(queries.initTables, null);
}



// here are some example queries to see how some of the functions work
function exampleQueries() {

  //Example: print all the subforums
  makeQuery("select * from subforum;", console.log);

  // Example: get the first account from the account table
  makeQuery("select * from account;", results => {
    console.log(results[0]);
  });

  // Example: creating a reply in a thread
  // NOTE: when the results array isn't needed, the callback can be set to null
  makeQuery(queries.insertReply(30, 'heyo', 'mad@yahoo.ca'), null);

  // Example: creating a new thread
  makeQuery(queries.createThread('Sports', 'lets go letestu', 'ooOOOOooOo', 'nabstua@gmail.com'), null);


  // Example: get 20 most recent messages to a given user
  makeQuery(queries.getMessages('mad@yahoo.ca'), results => {
    // for results that can have no entries, make sure to check if the array is empty first
    if (results.length)
      console.log(results);
  });

  // Example: get user info
  makeQuery(queries.getUserInfo('datboi'), results => {
    if (results.length)
      // even when there is only one row, results is ALWAYS an array
      console.log('username:', results[0].username, 'password:', results[0].password);
  });

}
