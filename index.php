<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bobo's Forum</title>
</head>
<body>
    
<h1>Bobo's Forum</h1>

<?php 

$username = "ora_k4e1b";
$password = "a17041154";

$db_conn = OCILogon($username, $password, "dbhost.ugrad.cs.ubc.ca:1522/ug");

if (db_conn) {
  echo "Successfully connected to Oracle.\n";
  OCILogoff($db_conn);
} else {
  $err = OCIError();
  echo "Oracle Connect Error " . $err['message'];
}

 ?>

</body>
</html>