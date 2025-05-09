<?php
$host = 'localhost'; // Database server
$username = 'root'; // Default username for XAMPP
$password = ''; // Default password for XAMPP is an empty string
$dbname = 'dbl_faq';

// Create a connection
$conn = new mysqli($host, $username, $password, $dbname);

// Check the connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

?>

