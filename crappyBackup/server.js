
console.log('Server-side code running');
function handleErr(err) {
  let errStr = "code: " + err.code + "<br>errno: " + err.errno + "<br>sqlMessage: " + err.sqlMessage + "<br>sql: " + err.sql;
  return "<h2> There was an error parsing your request. </h2><br>" + errStr;
}

/**
 * @param {string} fields - fields of the form "field1, field2, field3"
 * @param {array}  rows   - resulting rows from the query
 * @param {string} query  - the SQL query as a string
 */
function genTableFromQuery(rows, query) {

  let out = `<p style='white-space: pre-wrap;'><strong>SQL Query:  </strong>${query}</p><table>`;

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

  res.send('<h2> Database initialized! </h2><link rel="stylesheet" href="style.css">');
});


// general query
app.get('/makeGeneralQuery', (req, res) => {
  let q = req.query;

  let query = 'SELECT '+q.selectField;
  if (q.fromField) query += ' FROM '+q.fromField;
  if (q.whereField) query += ' WHERE '+q.whereField;
  if (q.orderByField) query += ' ORDER BY '+q.orderByField;

  connection.query(query, (err, rows) => {
    if (!err) {
      let out = `
      <p>Make another query: </p>
      <form action="/makeGeneralQuery" method='get'>
        SELECT
        <input type="text" name='selectField'>
        FROM
        <input type="text" name='fromField'>
        WHERE
        <input type="text" name='whereField' placeholder="Optional">
        ORDER BY
        <input type="text" name='orderByField' placeholder="Optional">
        <input type="submit" value='Submit'>
      </form><hr><h3>Results:</h3>`

      res.send(out + genTableFromQuery(rows, query));
    }
    else {
      res.send(handleErr(err));
    }
  })
})


// create account
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

// UPDATE QUERY - Allows admin to adjust a user's banana score. I have a check on banana_score so that it can't be negative.
app.get('/updateBananaScore', (req, res) => {
  let q = req.query;

  // check if new score is a number, and is positive
  if (!isNaN(q.score) && Number(q.score) >= 0) {
    let query = `
    UPDATE account
    SET banana_score = `+q.score+`
    WHERE email = '`+q.email+"';";

    connection.query(query, (err, rows) => {
      if (!err) {
        res.redirect('index.html')
      }
      else res.send(handleErr(err));
    });
  }
  else res.send('<h2> Please enter a non-negative number for Banana Score </h2>');
});

// DELETE QUERY - Allows user to delete a thread.
app.get('/deleteThread', (req, res) => {
  let q = req.query;

  let query = "DELETE FROM thread WHERE email = '"+q.email+"' AND id = "+q.thread_id_num+";";
  connection.query(query, (err, rows) => {
    if (!err) {
      res.redirect('index.html');
    }
    else res.send(handleErr(err));
  });
});

// JOIN Query - See comments on all threads
app.get('/joinQuery', (req, res) => {
  let query = `
  SELECT t.title, t.textbody, r.body, r.date_posted, r.email
  FROM thread t JOIN reply r ON t.id = r.thread_id_num;`;

  connection.query(query, (err, rows) => {
    if (!err) res.send(genTableFromQuery(rows, query));
    else res.send(handleErr(err));
  });
});

// DIVISION QUERY - Allows admin to see if a user has posted a thread in every subforum.
app.get('/divisionQuery', (req, res) => {
  let query = `
  SELECT DISTINCT email as Superfans
  FROM account A
  WHERE NOT EXISTS (
      SELECT *
      FROM subforum S
      WHERE NOT EXISTS (
          SELECT name
          FROM thread T
          WHERE A.email = T.email AND T.name = S.name));`;

  connection.query(query, (err, rows) => {
    if (!err) res.send(genTableFromQuery(rows, query));
    else res.send(handleErr(err));
  });
});

// AGGREGATION QUERY - Allows admin to see the user(s) with the lowest banana score.
app.get('/aggregationQueryMin', (req, res) => {
  let query = `
  SELECT *
  FROM account
  WHERE banana_score = (
      SELECT MIN(banana_score)
      FROM account);`;

  connection.query(query, (err, rows) => {
    if (!err) res.send(genTableFromQuery(rows, query));
    else res.send(handleErr(err));
  });
});

// AGGREGATION QUERY - Allows admin to see the user(s) with the lowest banana score.
app.get('/aggregationQueryMax', (req, res) => {
  let query = `
  SELECT *
  FROM account
  WHERE banana_score = (
      SELECT MAX(banana_score)
      FROM account);`;

  connection.query(query, (err, rows) => {
    if (!err) res.send(genTableFromQuery(rows, query));
    else res.send(handleErr(err));
  });
});

// NESTED AGGREGATION WITH GROUP-BY - Allows admin to see the age with the lowest average banana score.
app.get('/nestedAggrGroupByMin', (req, res) => {
  let query = `
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

  connection.query(query, (err, rows) => {
    if (!err) res.send(genTableFromQuery(rows, query));
    else res.send(handleErr(err));
  });
});

// NESTED AGGREGATION WITH GROUP-BY - Allows admin to see the age with the highest average banana score.
app.get('/nestedAggrGroupByMax', (req, res) => {
  let query = `
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

  connection.query(query, (err, rows) => {
    if (!err) res.send(genTableFromQuery(rows, query));
    else res.send(handleErr(err));
  });
});


app.listen(3000, () => { console.log("listening on localhost:3000"); });
