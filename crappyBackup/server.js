
console.log('Server-side code running');
function handleErr(err) {
  let errStr = "code: " + err.code + "<br>errno: " + err.errno + "<br>sqlMessage: " + err.sqlMessage + "<br>sql: " + err.sql;
  return "<h2> There was an error parsing your request. </h2><br>" + errStr;
}

fieldsDict = {
  account : 'email, username, password, age, banana_score, isadmin',
  message : 'id_num, body, date_sent, sent_email, received_email',
  moderates : 'email, name',
  reply : 'id_num, thread_id_num, name, body, date_posted, email',
  subforum : 'name',
  subscribed_to : 'email, name',
  thread : 'name, id, title, textbody, date_posted, email'
}

/**
 * @param {string} fields - fields of the form "field1, field2, field3"
 * @param {array}  rows   - resulting rows from the query
 * @param {string} query  - the SQL query as a string
 */
function genTableFromQuery(fields, rows, query) {

  let out = `<p> SQL query: ${query} </p><table>`;

  // if results were returned
  if (rows.length > 0) {
      fields = Object.keys(rows[0]);

    // generate header row
    for (let i = 0; i < fields.length; i++) {
      out += '<th>'+fields[i]+'</th>';
    }

    // add html for the row
    for (let i = 0; i < rows.length; i++) {
      out += '<tr>';

      // add html for the entry
      for (let j = 0; j < fields.length; j++)
        out += '<td>' + rows[i][fields[j]] + '</td>';

      out += '</tr>';
    }
    out += '</table>';
  }

  else out += `<strong>Query returned no rows</strong>`;

  out += '<link rel="stylesheet" href="style.css">';

  return out;
}

function makeQuery(query, callback) {
  connection.query(query, (err, rows) => {
    if (!err) callback(rows);
    else handleErr(err);
  })
}

// setup
var mysql = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'cs304bobo',
  database : 'boboverse',
  port : 3306,
  multipleStatements : true,
  typeCast: function castField( field, useDefaultTypeCasting ) {

       // We only want to cast bit fields that have a single-bit in them. If the field
       // has more than one bit, then we cannot assume it is supposed to be a Boolean.
       if ( ( field.type === "BIT" ) && ( field.length === 1 ) ) {

           var bytes = field.buffer();

           // A Buffer in Node represents a collection of 8-bit unsigned integers.
           // Therefore, our single "bit field" comes back as the bits '0000 0001',
           // which is equivalent to the number 1.
           return( bytes[ 0 ] === 1 );

       }

       return( useDefaultTypeCasting() );

     }
});
var queries = require('./js/queries.js')

const express = require('express');
const app = express();
// serve files from the public directory
app.use(express.static('public'));

connection.connect();

// serve index page
app.get('/', (req, res) => { res.sendFile(__dirname + '/index.html'); });


// Initialize database
app.get('/initDb', (req, res) => {
  for (let i = 0; i < queries.dropTables.length; i++) {
    connection.query(queries.dropTables[i], (err, res) => {if (err) console.log(err);});
  }
  connection.query(queries.initTables, (err, res) => {if (err) console.log(err);})

  res.send('<h2> Database initialized! </h2>');
});


// Admin general query
app.get('/makeGeneralQuery', (req, res) => {
  let q = req.query;

  let query = 'select '+q.selectField+' from '+q.fromField;
  if (q.whereField) query += ' where '+q.whereField;

  connection.query(query, (err, rows) => {
    if (!err) {
      res.send(genTableFromQuery(q.selectField, rows, query));
    }
    else {
      res.send(handleErr(err));
    }
  })
})


// Admin create account
app.get('/createAccount', (req, res) => {
  let q = req.query;

  let query = "insert into account values('"+q.email+"','"+q.username+"','"+q.password+"',"+q.age+","+q.banana_score+", 0)"
  connection.query(query, (err, rows) => {
    if (!err) {
      res.send("<h2> Account created successfully! </h2>");
    }
    else res.send(handleErr(err));
  });
});


app.listen(3000, () => { console.log("listening on localhost:3000"); });
