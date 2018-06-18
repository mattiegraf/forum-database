
console.log('Server-side code running');

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


// Admin get account info for users
app.get('/getAccountInfo', (req, res) => {
  let field = req.query.chosenField;

  let query = "select email, "+field+" from account;";
  connection.query(query, (err, rows) => {
    if (!err) {
      let out = `<h1> Retrieved user info: </h1>
                 <strong> email : ${field} </strong><br>`;

      for (let i = 0; i < rows.length; i++) {
        out += rows[i].email + " : " + rows[i][field] + "<br>";
      }
      res.send(out);
    }
    else {
      res.send("<h2> There was an error parsing your request. Please try again </h2>");
    }
  });
});




app.listen(3000, () => { console.log("listening on localhost:3000"); });
