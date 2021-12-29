<?php
/* Database credentials. Assuming you are running MySQL
server with default setting (user 'root' with no password) */
/* reference: https://www.tutorialrepublic.com/php-tutorial/php-mysql-crud-application.php */
define('DB_SERVER', 'localhost');
define('DB_USERNAME', '000824838');
define('DB_PASSWORD', '20011002');
define('DB_NAME', '000824838');

/* Attempt to connect to MySQL database */
$link = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);

// Check connection
if ($link === false) {
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
