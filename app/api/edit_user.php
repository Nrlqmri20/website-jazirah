<?php
// edit_user.php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

header('Content-Type: application/json');

require_once '../../config/database.php'; // koneksi PDO

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['success' => false, 'message' => 'Metode tidak valid']);
    exit;
}

$id_pengguna = $_POST['id_pengguna'] ?? null;
$username    = $_POST['username'] ?? '';
$email       = $_POST['email'] ?? '';
$password    = $_POST['pass'] ?? '';
$id_role     = $_POST['role'] ?? '';

if (!$id_pengguna) {
    echo json_encode(['success' => false, 'message' => 'ID pengguna tidak ditemukan']);
    exit;
}

try {
    // Ambil data user lama
    $stmt = $pdo->prepare("SELECT * FROM pengguna WHERE id_pengguna = ?");
    $stmt->execute([$id_pengguna]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$user) {
        echo json_encode(['success' => false, 'message' => 'Pengguna tidak ditemukan']);
        exit;
    }

    // Jika password baru diisi, pakai yang baru
    if (!empty($password)) {
        $finalPassword = $password;
    } else {
        $finalPassword = $user['password']; // tetap pakai password lama
    }

    // Update data user
    $update = $pdo->prepare("
        UPDATE pengguna 
        SET username = :username, email = :email, password = :password, id_role = :id_role 
        WHERE id_pengguna = :id_pengguna
    ");

    $update->execute([
        ':username'    => $username,
        ':email'       => $email,
        ':password'    => $finalPassword,
        ':id_role'     => $id_role,
        ':id_pengguna' => $id_pengguna
    ]);

    echo json_encode(['success' => true, 'message' => 'Data pengguna berhasil diperbarui']);
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Database error: ' . $e->getMessage()]);
}
