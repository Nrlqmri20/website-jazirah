<?php
session_start();
require_once '../../config/database.php'; // sesuaikan path-nya

header('Content-Type: application/json');

// kalau login simpan di session
$id_pengguna = $_SESSION['user']['id_pengguna'] ?? null;

// kalau mau tes manual, bisa juga pakai GET:
// $id_pengguna = $_GET['id'] ?? null;

if (!$id_pengguna) {
    echo json_encode([
        "success" => false,
        "message" => "User belum login / id_pengguna tidak ditemukan"
    ]);
    exit;
}

// Total kegiatan
$stmt = $pdo->prepare("SELECT COUNT(*) FROM bukti_dukung WHERE id_pengguna = ?");
$stmt->execute([$id_pengguna]);
$total_kegiatan = (int)$stmt->fetchColumn();

// Rata-rata progress
$stmt = $pdo->prepare("SELECT AVG(progress) FROM bukti_dukung WHERE id_pengguna = ?");
$stmt->execute([$id_pengguna]);
$avg_progress = $stmt->fetchColumn();
$avg_progress = $avg_progress ? round($avg_progress, 2) : 0;

// Kegiatan selesai (progress 100)
$stmt = $pdo->prepare("SELECT COUNT(*) FROM bukti_dukung WHERE id_pengguna = ? AND progress >= 100");
$stmt->execute([$id_pengguna]);
$completed = (int)$stmt->fetchColumn();

echo json_encode([
    "success" => true,
    "data" => [
        "total_kegiatan" => $total_kegiatan,
        "avg_progress"   => $avg_progress,
        "completed"      => $completed
    ]
]);
