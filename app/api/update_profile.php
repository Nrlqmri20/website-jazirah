<?php
session_start();
require_once '../../config/database.php';

header('Content-Type: application/json');

// Cek login
if (!isset($_SESSION['user']['id_pengguna'])) {
    echo json_encode(["success" => false, "message" => "Belum login"]);
    exit();
}

$id_pengguna = $_SESSION['user']['id_pengguna'];

// Ambil data dari POST
$full_name = $_POST['full_name'] ?? '';
$username  = $_POST['username']  ?? '';
$email     = $_POST['email']     ?? '';
$phone     = $_POST['phone']     ?? '';
$position  = $_POST['position']  ?? '';
$department = $_POST['department'] ?? '';
$satker    = $_POST['satker']    ?? '';

try {
    // Update ke tabel pengguna (username + email)
    // (Kalau tabel 'pengguna' punya kolom full_name, tambahkan juga di query)
    $stmt = $pdo->prepare("UPDATE pengguna SET username = ?, email = ? WHERE id_pengguna = ?");
    $stmt->execute([$username, $email, $id_pengguna]);

    // Upsert ke profil_pengguna (tanpa foto)
    $stmt = $pdo->prepare("
        INSERT INTO profil_pengguna (id_pengguna, nomor_telepon, jabatan, bidang, satker, tanggal_gabung, created_at, updated_at)
        VALUES (?, ?, ?, ?, ?, CURDATE(), NOW(), NOW())
        ON DUPLICATE KEY UPDATE
            nomor_telepon = VALUES(nomor_telepon),
            jabatan       = VALUES(jabatan),
            bidang        = VALUES(bidang),
            satker        = VALUES(satker),
            updated_at    = NOW()
    ");
    $stmt->execute([$id_pengguna, $phone, $position, $department, $satker]);

    echo json_encode(["success" => true]);
} catch (PDOException $e) {
    echo json_encode(["success" => false, "message" => $e->getMessage()]);
}
