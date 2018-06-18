
console.log('Server-side code running');

var mysql = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'cs304bobo',
  database : 'boboverse',
  port : 3306,
  multipleStatements : true
});
const express = require('express');
const app = express();
// serve files from the public directory
app.use(express.static('public'));



// connection.connect();
//
// connection.query("select 1 + 1 as solution;", (err, rows) => {
//   console.log(rows[0].solution);
// });
//
// app.get('/', function(req, res){
//   res.send('<h1> hello world! </h1>');
// });
//
// app.listen(3000);
//
// connection.end();

connection.connect();

// serve index page
app.get('/', (req, res) => {
  res.sendFile(__dirname + '/index.html');
});
//
app.get('/login', (req, res) => {
  let username = req.query.username;
  let password = req.query.password;
  res.send(`<h1> hello ${username}! </h1>
    <p> your password is: ${password}</p>`);
})


// // 1. Get all user emails
// app.post('/getEmails', (req, res) => {
//   connection.query("select * from account", (err, rows) => {
//     if (err) throw err;
//     res.send(rows)
//   });
// });
//
//
// // 2. Get all threads for given subforum
// app.post('/getThreadsForSubforum', (req, res) => {
//   console.log(req.body.subforumName);
// });


app.listen(3000, () => {
  console.log("listening on localhost:3000");
});
