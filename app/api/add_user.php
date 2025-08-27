<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once '../../config/database.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['success' => false, 'message' => 'Metode tidak valid']);
}

try {
    $email = trim($_POST['email']);
    $username = trim($_POST['username']);
    $password = trim($_POST['password']);
    $role = intval($_POST['role']);

    if (!$email || !$password || !$role || !$username) {
        echo json_encode(['success' => false, 'message' => 'Semua field wajib diisi']);
        exit;
    }

    // cek apakah email sudah ada di di table pengguna
    $stmt = $pdo->prepare("SELECT * FROM pengguna WHERE email = ?");
    $stmt->execute([$email]);
    $user = $stmt->fetch();

    if (!$user) {
        $stmt = $pdo->prepare(("INSERT INTO pengguna (email, username, password, id_role) VALUES (?, ?, ?, ?)"));
        $stmt->execute([$email, $username, $password, $role]);
        $id_pengguna = $pdo->lastInsertId();
    } else {
        $id_pengguna = $user['id_pengguna'];
    }

    echo json_encode(['success' => true, 'message' => 'User berhasil ditambahkan', 'id_pengguna' => $id_pengguna]);
} catch (\Throwable $th) {
    echo json_encode(['success' => false,'message' => 'Gagal menambahkan data: ' . $th->getMessage()]);
}
