<?php
require 'config.php';
echo "Testing connection to: " . DB_SERVER . "<br>";

$conn = new mysqli(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
echo "Success! Connected to RDS database: " . DB_NAME;

// Test query
$result = $conn->query("SELECT COUNT(*) AS user_count FROM users");
if ($result) {
    $row = $result->fetch_assoc();
    echo "<br>Total users: " . $row['user_count'];
} else {
    echo "<br>Query failed: " . $conn->error;
}

$conn->close();
?>


