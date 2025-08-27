<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

session_start();
require_once '../../config/database.php';

header('Content-Type: application/json');

if (!isset($_SESSION['user'])) {
    echo json_encode(['success' => false, 'message' => 'Unauthorized']);
    exit();
}

$id_pengguna = $_SESSION['user']['id_pengguna'];

try {
    // Ambil data user + profil + role
    $sql = "SELECT 
                u.id_pengguna,
                u.username,
                u.email,
                r.role_name,
                p.nama_lengkap,
                p.foto_profil,
                p.nomor_telepon,
                p.jabatan,
                p.bidang,
                p.satker,
                p.tanggal_gabung
            FROM pengguna u
            LEFT JOIN role r ON u.id_role = r.id_role
            LEFT JOIN profil_pengguna p ON u.id_pengguna = p.id_pengguna
            WHERE u.id_pengguna = :id";

    $stmt = $pdo->prepare($sql);
    $stmt->execute([':id' => $id_pengguna]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$user) {
        echo json_encode(['success' => false, 'message' => 'User tidak ditemukan']);
        exit();
    }

    // Tentukan avatar
    // Tentukan base URL (otomatis dari server)
    $baseUrl = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http");
    $baseUrl .= "://" . $_SERVER['HTTP_HOST'] . "/web-jaziran-test/";
    $avatarUrl = '';
    if (!empty($user['foto_profil']) && file_exists(__DIR__ . "/../../public/img/profil/" . $user['foto_profil'])) {
        $avatarUrl = $baseUrl . "public/img/profil/" . $user['foto_profil'];
    } else {
        $avatarUrl = "placeholder:" . strtoupper(substr($user['username'], 0, 1));
    }

    echo json_encode([
        'success' => true,
        'data' => $user,
        'avatar' => $avatarUrl
    ]);
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => $e->getMessage()]);
}
