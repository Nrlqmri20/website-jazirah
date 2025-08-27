<?php
session_start();
require_once '../../config/database.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['success' => false, 'message' => 'Metode tidak valid']);
    exit;
}

try {
    // Ambil dan bersihkan input
    $kode_satker = intval($_POST['kode_satker']);
    $id_full = trim($_POST['id_deskripsi']);
    $rencana_kerja = trim($_POST['rencanaKerja']);
    $rencana_aksi = trim($_POST['rencanaAksi']);
    $output = trim($_POST['output']);
    $pjk = trim($_POST['pjk']);
    $target_bulan = $_POST['target_bulan'] ?? null;
    $link = trim($_POST['link']);
    $progress = intval($_POST['progress']);

    // Pisah id_deskripsi dan sub_deskripsi jika ID lengkap seperti A.1.I.i.a
    $sub_deskripsi = null;
    if (substr_count($id_full, '.') >= 4) {
        $parts = explode('.', $id_full);
        $sub_deskripsi = array_pop($parts); // Ambil 'a'
        $id_deskripsi = implode('.', $parts); // Ambil A.1.I.i
    } else {
        $id_deskripsi = $id_full;
    }

    // Validasi sederhana
    if (!$kode_satker || !$rencana_kerja || !$rencana_aksi || !$output || !$pjk || !$target_bulan) {
        echo json_encode(['success' => false, 'message' => 'Semua field wajib diisi']);
        exit;
    }

    // Cek apakah id_deskripsi sudah ada di tabel deskripsi
    $stmt = $pdo->prepare("SELECT id_desk FROM deskripsi WHERE id_deskripsi = ? AND sub_deskripsi = ?");
    $stmt->execute([$id_deskripsi, $sub_deskripsi]);
    $deskripsi = $stmt->fetch();

    if (!$deskripsi) {
        // Jika tidak ada, insert dulu ke tabel deskripsi
        $stmt = $pdo->prepare("INSERT INTO deskripsi (id_deskripsi, sub_deskripsi, deskripsi_rencana_kinerja, deskripsi_rencana_aksi, deskripsi_rencana_output) VALUES (?, ?, ?, ?, ?)");
        $stmt->execute([$id_deskripsi, $sub_deskripsi, $rencana_kerja, $rencana_aksi, $output]);
        $id_desk = $pdo->lastInsertId();
    } else {
        $id_desk = $deskripsi['id_desk'];
    }

    $id_pengguna = $_SESSION['user']['id_pengguna'] ?? null;
    if (!$id_pengguna) {
        echo json_encode(['success' => false, 'message' => 'User tidak login']);
        exit;
    }

    // Insert ke bukti_dukung
    $stmt = $pdo->prepare("INSERT INTO bukti_dukung (id_desk, kode_satker, pjk, target_bulan, link, progress, id_pengguna) VALUES (?, ?, ?, ?, ?, ?, ?)");
    $stmt->execute([$id_desk, $kode_satker, $pjk, $target_bulan, $link, $progress, $id_pengguna]);


    echo json_encode(['success' => true, 'message' => 'Data berhasil ditambahkan']);
} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => 'Gagal menambahkan data: ' . $e->getMessage()]);
}
