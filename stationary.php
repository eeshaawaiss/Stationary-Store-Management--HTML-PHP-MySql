<?php

$servername = "127.0.0.1";
$username = "root";
$password = "";
$dbname = "inventory";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Create Category table
$sql = "CREATE TABLE IF NOT EXISTS Category (
    CategoryID INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL
)";
if (!$conn->query($sql)) {
    die("Category table creation failed: " . $conn->error);
}

// Create Supplier table
$sql = "CREATE TABLE IF NOT EXISTS Supplier (
    SupplierID INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    SupplierName VARCHAR(50) NOT NULL
)";
if (!$conn->query($sql)) {
    die("Supplier table creation failed: " . $conn->error);
}

// Create Orders table
$sql = "CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    OrderDate DATE NOT NULL,
    OrderStatus VARCHAR(50) NOT NULL
)";
if (!$conn->query($sql)) {
    die("Orders table creation failed: " . $conn->error);
}

echo "Tables created successfully";

$conn->close();
?>
