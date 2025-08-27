<?php
require_once '../../config/database.php'; // koneksi database

header('Content-Type: application/json');

// Ambil data JSON
$input = json_decode(file_get_contents('php://input'), true);
$id = $input['id'] ?? null;

if (!$id) {
    echo json_encode(['success' => false, 'message' => 'ID tidak ditemukan.']);
    exit;
}

try {
    // Ambil id_desk dari bukti_dukung
    $stmt = $pdo->prepare("SELECT id_desk FROM bukti_dukung WHERE id_pendukung = ?");
    $stmt->execute([$id]);
    $data = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$data) {
        echo json_encode(['success' => false, 'message' => 'Data tidak ditemukan.']);
        exit;
    }

    $id_desk = $data['id_desk'];

    // Hapus dari bukti_dukung
    $stmt = $pdo->prepare("DELETE FROM bukti_dukung WHERE id_pendukung = ?");
    $stmt->execute([$id]);

    // Hapus dari deskripsi
    $stmt = $pdo->prepare("DELETE FROM deskripsi WHERE id_desk = ?");
    $stmt->execute([$id_desk]);

    echo json_encode(['success' => true, 'message' => 'Data berhasil dihapus.']);
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Gagal menghapus: ' . $e->getMessage()]);
}
