

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

// connection.query('SELECT 1 + 1 AS solution', function (error, results, fields) {
//   if (error) throw error;
//   console.log('The solution is: ', results[0].solution);
// });

initDatabase();

connection.end();

/**
 * Initializes the database
 * - first drops every table, then re-creates them and populates them
 * - note: this function has unexpected behaviour when the tables do not already exist in the database
 */
function initDatabase() {

  // Drop old tables if they exist
  connection.query(queries.dropTables, (error, results, fields) => {
    if (!error) console.log("dropped tables");
  });

  // Initialize and populate new tables
  connection.query(queries.initTables, (error, results, fields) => {
    if (error) throw error;
    console.log("initialized tables");
  });

}

