<?php
require_once '../../config/database.php';
header('Content-Type: application/json');

$id = $_GET['id'] ?? null;

if (!$id) {
    echo json_encode(['success' => false, 'message' => 'ID tidak ditemukan']);
    exit;
}

try {
    $stmt = $pdo->prepare("SELECT d.id_desk, d.id_deskripsi, d.sub_deskripsi, d.deskripsi_rencana_kinerja, d.deskripsi_rencana_aksi, d.deskripsi_rencana_output, b.pjk, b.target_bulan, b.link, b.progress, b.id_pendukung FROM deskripsi d 
                                    JOIN bukti_dukung b ON d.id_desk = b.id_desk 
                                    WHERE b.id_pendukung = ?");

    $stmt->execute([$id]);
    $data = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$data) {
        echo json_encode(['success' => false, 'message' => 'Data tidak ditemukan']);
    } else {
        echo json_encode(['success' => true, 'data' => $data]);
    }
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Gagal mengambil data', 'error' => $e->getMessage()]);
}
