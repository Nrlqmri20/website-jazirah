<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once '../../config/database.php';
header('Content-Type: application/json');

$id = $_GET['id_pengguna'] ?? null;

if (!$id) {
    echo json_encode(['success' => false, 'message' => 'ID tidak ditemukan']);
    exit;
}

try {
    $stmt = $pdo->prepare("SELECT * FROM pengguna WHERE id_pengguna = ?");
    $stmt->execute([$id]);
    $data = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$data) {
        echo json_encode([
            'success' => false, 
            'message' => 'Data tidak ditemukan']);
    } else {
        echo json_encode([
            'success' => true, 
            'data' => $data]);
    }
} catch (PDOException $e) {
    echo json_encode([
        'success' => false, 
        'message' => 'Gagal mengambil data', 
        'error' => $e->getMessage()]);
}
