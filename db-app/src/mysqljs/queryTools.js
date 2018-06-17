
// Setup stuff:
// - Connection info should be based on your MySQL instance
var mysql      = require('mysql');
var queries    = require('./queries');

var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'cs304bobo',
  database : 'boboverse',
  port : 3306,
  multipleStatements : true
});



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


  module.exports = {
    initializeDb : initializeDb,
    makeQuery : makeQuery};