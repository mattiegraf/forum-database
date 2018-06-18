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


// Allows user to view the last 20 messages sent to their account.
app.get('/viewmessages/:email', function(req, res){
  connection.query("SELECT * FROM message WHERE received_email = '"+req.params.email+"' ORDER BY date_sent DESC LIMIT 20;", (err, rows) => {
    if (err) throw err;
    res.send(rows)
  });
});

// Allow user to send a message to another user
app.get('/sendMessage/:to/:from/:body', function(req, res){
  connection.query("insert into message values((select max(id_num) + 1 from message m1), '"+req.params.body+"', curdate(), '"+req.params.from+"', '"+req.params.to+"');", (err, rows) => {
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


/* View thread. */
app.get('/thread/:name/:id', function(req, res){
  connection.query("SELECT * FROM thread WHERE name = '"+req.params.name+"'and id = "+req.params.id+";", (err, rows) => {
    if (err) throw err;
    res.send(rows)
  });
});


/* Allows user to see all the comments for a given thread. */
app.get('/comments/:name/:id', function(req, res){
  connection.query("select * from reply where name = '"+req.params.name+"'and thread_id_num = "+req.params.id+";", (err, rows) => {
    if (err) throw err;
    res.send(rows)
  });
});

/* Allows user to see all the comments for a given thread. */
app.get('/user/:email/:pass', function(req, res){
  connection.query('SELECT * FROM account WHERE password = "'+req.params.pass+'" and email = "' + req.params.email + '";', (err, rows) => {
    if (err) throw err;
    res.send(rows)
  });
});

///dont touch this!!
app.listen(port, () => console.log(`Listening on port ${port}`));