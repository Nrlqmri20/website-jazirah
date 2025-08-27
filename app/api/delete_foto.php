<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

session_start();
require_once "../../config/database.php";

header("Content-Type: application/json");

$userId = $_SESSION['user']['id_pengguna'] ?? null;

if (!$userId) {
    echo json_encode([
        "success" => false,
        "message" => "User tidak ditemukan."
    ]);
    exit;
}

try {
    // ambil nama file lama
    $stmt = $pdo->prepare("SELECT foto_profil FROM profil_pengguna WHERE id_pengguna = ?");
    $stmt->execute([$userId]);
    $current = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($current && !empty($current['foto_profil'])) {
        $filePath = __DIR__ . "/../../public/img/profil/" . $current['foto_profil'];

        if (file_exists($filePath)) {
            unlink($filePath);
        }
    }

    // update database kosongkan foto_profil
    $update = $pdo->prepare("UPDATE profil_pengguna SET foto_profil = NULL WHERE id_pengguna = ?");
    $update->execute([$userId]);

    echo json_encode([
        "success" => true,
        "message" => "Foto profil berhasil dihapus.",
        "affected" => $update->rowCount()
    ]);
} catch (PDOException $e) {
    echo json_encode([
        "success" => false,
        "message" => $e->getMessage()
    ]);
}
