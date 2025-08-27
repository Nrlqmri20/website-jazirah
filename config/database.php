<?php
try {
    $host = 'localhost';
    $dbname = 'database_jazirah_test'; // Pastikan nama database benar
    $username = 'root'; // Sesuaikan dengan konfigurasi MySQL Anda
    $password = ''; // Sesuaikan dengan password MySQL Anda

    $pdo = new PDO(
        "mysql:host=$host;dbname=$dbname;charset=utf8mb4",
        $username,
        $password,
        [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES => false
        ]
    );

    // Debug: Test koneksi
    error_log("Database connected successfully to: $dbname");
} catch (PDOException $e) {
    error_log("Database connection failed: " . $e->getMessage());
    die("Database connection failed: " . $e->getMessage());
}