
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

// connect to the database
connection.connect();
// here are some example queries to see how the functions work
exampleQueries();
// disconnect from the database
connection.end();

/**
 * Initializes the database
 * - first drops every table, then re-creates them and populates them
 * - note: this function has unexpected behaviour when the tables do not already exist in the database
 */
function exampleQueries() {

  // Drop old tables if they exist
  connection.query(queries.dropTables, (error, results, fields) => {
    if (!error) console.log("\ndropped tables");
  });

  // Initialize and populate new tables
  connection.query(queries.initTables, (error, results, fields) => {
    if (error) throw error;
    console.log("initialized tables\n");
  });

  // // Get user info example
  // connection.query(queries.getUserInfo("datboi"), (error, results, fields) => {
  //   // if results is an empty array, then no info was returned from the SQL query
  //   // make sure to check this before trying to access results!!
  //   if (results.length > 0) {
  //     console.log("get user info example:")
  //     console.log("username:", results[0].username, "password:", results[0].password, "\n");
  //   }
  // });

  // // User adding comment example
  // let exampleCommentQuery = queries.insertReply(5, 17, "Food", "I have absolutely terrible taste", "2018-06-06", "mad@yahoo.ca");
  // connection.query(exampleCommentQuery, (error, results, fields) => {
  //   if (error) throw error;
  //   console.log("inserting comment example (check db to see inserted comment)\n");
  // });

  // // User deleting comment example
  // connection.query(queries.deleteReply('superfoody@live.com', 1, 17), (error, results, fields) => {
  //   if (error) throw error;
  //   console.log("delete reply example (check db to see deleted comment)");
  // });

  // // Creating thread example
  // let exampleThreadCreationQuery = queries.createThread('Sports',6,'Sports suk','','2018-07-10','vybaby@gmail.com');
  // connection.query(exampleThreadCreationQuery, (error, results, fields) => {
  //   if (error) throw error;
  //   console.log("thread creation example (check db for results)");
  // });

  // // Deleting thread example
  // connection.query(queries.deleteThread('json@hotmail.com', 2), (error, results, fields) => {
  //   if (error) throw error;
  //   console.log("thread deletion example (check db for results)");
  // });

  // // Sending message example
  // let sendMessageQuery = queries.sendMessage(6, 'I am actively repulsed by paperclips', '2018-06-06', 'catdog@gmail.com', 'deskrage@gmail.com');
  // connection.query(sendMessageQuery, (error, results, fields) => {
  //   if (error) throw error;
  //   console.log("send message example (check db for results)");
  // });

  // // Subscribe to subforum example
  // connection.query(queries.subscribeTo('json@hotmail.com', 'Sports'), (error, results, fields) => {
  //   if (error) throw error;
  //   console.log("subscribe to subforum example (check db for results)");
  // });

  // // Unsubscribe from subforum example
  // connection.query(queries.unsubscribeFrom('json@hotmail.com', 'Gaming'), (error, results, fields) => {
  //   if (error) throw error;
  //   console.log("unsubscribe from subforum example (check db for results)");
  // });

  // // Get 20 most recent messages example
  // // Returns an array of RowDataPacket objects
  // connection.query(queries.getMessages('mad@yahoo.ca'), (error, results, fields) => {
  //   if (error) throw error;
  //
  //   console.log("get messages example:")
  //   if (results.length > 0)
  //     console.log(results);
  // });

  // // example: Get most commented-in threads for subforum
  // // This doesn't return anything right now because there aren't any threads from the past week
  // connection.query(queries.getMostCommentedThreads('Movies/Television'), (error, results, fields) => {
  //   if (error) throw error;
  //
  //   console.log("get most commented-in threads example:");
  //   if (results.length > 0)
  //     console.log(results);
  //   else
  //     console.log('no threads found')
  // });

  // // example: get all replies to given thread
  // // returns an array of RowDataPacket objects
  // connection.query(queries.getReplies(30), (error, results, fields) => {
  //   if (error) throw error;
  //   console.log('get replies from thread example:')
  //   console.log(results);
  // });
}
