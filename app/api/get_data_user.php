<?php
session_start();
require_once '../../config/database.php';

// Pastikan user login
if (!isset($_SESSION['user']['id_pengguna'])) {
    echo json_encode(["success" => false, "message" => "Belum login"]);
    exit();
}

$id_pengguna = $_SESSION['user']['id_pengguna'];

try {
    $stmt = $pdo->prepare("
        SELECT p.id_pengguna, u.username, u.email, r.role_name,
               p.foto_profil, p.nomor_telepon, 
               p.jabatan, p.bidang, p.satker, p.tanggal_gabung
        FROM pengguna u
        LEFT JOIN role r ON u.role_id = r.id_role
        LEFT JOIN profil_pengguna p ON u.id_pengguna = p.id_pengguna
        WHERE u.id_pengguna = ?
    ");
    $stmt->execute([$id_pengguna]);
    $data = $stmt->fetch(PDO::FETCH_ASSOC);

    echo json_encode(["success" => true, "data" => $data]);
} catch (PDOException $e) {
    echo json_encode(["success" => false, "message" => $e->getMessage()]);
}
