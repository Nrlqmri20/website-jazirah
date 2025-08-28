<?php
require_once '../../config/database.php';
header('Content-Type: application/json');

$data = json_decode(file_get_contents('php://input'), true);

$id = $data['id'] ?? null;
$id_deskripsi_full = $data['id_deskripsi'] ?? '';

if (!$id || !$id_deskripsi_full) {
    echo json_encode(['success' => false, 'message' => 'ID atau ID deskripsi kosong']);
    exit;
}

// Pisahkan id_deskripsi dan sub_deskripsi
if (preg_match('/^([A-Z0-9.]+)\.([a-z])$/i', $id_deskripsi_full, $match)) {
    $id_deskripsi = $match[1];
    $sub_deskripsi = $match[2];
} else {
    echo json_encode(['success' => false, 'message' => 'Format ID deskripsi tidak valid']);
    exit;
}

$rencana_kinerja = $data['deskripsi_rencana_kinerja'] ?? '';
$rencana_aksi = $data['deskripsi_rencana_aksi'] ?? '';
$output = $data['deskripsi_rencana_output'] ?? '';
$pjk = $data['pjk'] ?? '';
// $target_bulan = $data['target_bulan'] ?? '';
$tahun = $data['tahun'] ?? '';
$link = $data['link'] ?? '';
$progress = $data['progress'] ?? '';

try {
    // Update deskripsi
    $stmt1 = $pdo->prepare("UPDATE deskripsi 
    SET id_deskripsi = ?, sub_deskripsi = ?, deskripsi_rencana_kinerja = ?, deskripsi_rencana_aksi = ?, deskripsi_rencana_output = ?, tahun = ?
    WHERE id_desk = (SELECT id_desk FROM bukti_dukung WHERE id_pendukung = ?)");
    $stmt1->execute([$id_deskripsi, $sub_deskripsi, $rencana_kinerja, $rencana_aksi, $output, $tahun, $id]);


    // Update bukti_dukung
    $stmt2 = $pdo->prepare("UPDATE bukti_dukung 
        SET pjk = ?, link = ?, progress = ?
        WHERE id_pendukung = ?");
    $stmt2->execute([$pjk, $link, $progress, $id]);

    echo json_encode(['success' => true, 'message' => 'Data berhasil diperbarui']);
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Gagal memperbarui data: ' . $e->getMessage()]);
}
