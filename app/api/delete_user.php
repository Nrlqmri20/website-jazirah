<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

header('Content-Type: application/json');

require_once '../../config/database.php';

try {
    // Ambil body JSON
    $data = json_decode(file_get_contents("php://input"), true);

    if (!isset($data['id']) || empty($data['id'])) {
        echo json_encode([
            "success" => false,
            "message" => "ID user tidak diberikan"
        ]);
        exit;
    }

    $id = (int)$data['id'];

    // Cek apakah user ada
    $check = $pdo->prepare("SELECT * FROM pengguna WHERE id_pengguna = ?");
    $check->execute([$id]);
    $user = $check->fetch(PDO::FETCH_ASSOC);

    if (!$user) {
        echo json_encode([
            "success" => false,
            "message" => "User tidak ditemukan"
        ]);
        exit;
    }

    // Hapus user
    $stmt = $pdo->prepare("DELETE FROM pengguna WHERE id_pengguna = ?");
    $stmt->execute([$id]);

    echo json_encode([
        "success" => true,
        "message" => "User berhasil dihapus"
    ]);
} catch (PDOException $e) {
    echo json_encode([
        "success" => false,
        "message" => "Gagal menghapus user: " . $e->getMessage()
    ]);
}
