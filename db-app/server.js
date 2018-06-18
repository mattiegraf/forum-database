const express = require('express');
var mysql = require('mysql');
var query = require('./queries.js');

const app = express();
const port = process.env.PORT || 5000;

var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'password',
  database : 'boboverse',
  port : 3306,
  multipleStatements : true
});

app.get('/api/hello', (req, res) => {
  res.send({ express: 'Hello From Express' });
});

app.get('/clicked', (req, res) => {
  connection.query("select * from account", (err, rows) => {
    if (err) throw err;
    res.send(rows)
  });
});

/////////////////////////////////////////////////////////////////////
//converted from queries.js
/////////////////////////////////////////////////////////////////


//get all subforums
app.get('/subforums', (req, res) => {
  connection.query("SELECT * FROM subforum", (err, rows) => {
    if (err) throw err;
    res.send(rows)
  });
});

//get one particular subforum
app.get('/s/:name', (req, res) => {
  connection.query("SELECT name FROM subforum WHERE subforum.name = '" + req.params.name + "';", (err, rows) => {
    if (err) throw err;
    res.send(rows)
  });
});

/* View threads on subforums by latest post date. */
app.get('/subforumthreads/:name', function(req, res){
  connection.query("SELECT * FROM thread WHERE name = '"+req.params.name+"' order by date_posted desc;", (err, rows) => {
    if (err) throw err;
    res.send(rows)
  });
});





///dont touch this!!
app.listen(port, () => console.log(`Listening on port ${port}`));