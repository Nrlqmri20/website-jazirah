<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

require_once '../../config/database.php';
header('Content-Type: application/json');

try {
    // Jika ada parameter ID → Ambil 1 data untuk edit
    if (isset($_GET['id']) && is_numeric($_GET['id'])) {
        $id = intval($_GET['id']);

        $query = "
            SELECT 
                bd.id_pendukung,
                d.id_deskripsi,
                d.sub_deskripsi,
                d.deskripsi_rencana_kinerja AS rencana_kerja,
                d.deskripsi_rencana_aksi AS rencana_aksi,
                d.deskripsi_rencana_output AS output,
                d.tahun,
                bd.kode_satker,
                bd.pjk,
                bd.target_bulan,
                bd.link,
                bd.progress
            FROM bukti_dukung bd
            JOIN deskripsi d ON bd.id_desk = d.id_desk
            WHERE bd.id_pendukung = ?
            LIMIT 1
        ";
        $stmt = $pdo->prepare($query);
        $stmt->execute([$id]);
        $data = $stmt->fetch();

        echo json_encode([
            'success' => $data ? true : false,
            'data'    => $data,
            'message' => $data ? '' : 'Data tidak ditemukan'
        ]);
        exit;
    }

    // --------------------
    // Ambil parameter filter
    // --------------------
    $search    = isset($_GET['search']) ? trim($_GET['search']) : '';
    $kabupaten = isset($_GET['kabupaten']) ? trim($_GET['kabupaten']) : '';
    $tahun     = isset($_GET['tahun']) ? trim($_GET['tahun']) : '';

    $query = "
        SELECT 
            bd.id_pendukung,
            d.id_deskripsi,
            d.sub_deskripsi,
            d.deskripsi_rencana_kinerja AS rencana_kerja,
            d.deskripsi_rencana_aksi AS rencana_aksi,
            d.deskripsi_rencana_output AS output,
            d.tahun,
            bd.pjk,
            bd.target_bulan,
            bd.link,
            bd.progress
        FROM bukti_dukung bd
        JOIN deskripsi d ON bd.id_desk = d.id_desk
        WHERE 1=1
    ";

    $params = [];

    // Filter kabupaten
    if (!empty($kabupaten)) {
        $query .= " AND bd.kode_satker = ?";
        $params[] = $kabupaten;
    }

    // Filter tahun
    if (!empty($tahun)) {
        $query .= " AND d.tahun = ?";
        $params[] = $tahun;
    }

    // Filter search
    if (!empty($search)) {
        $query .= " AND (
            d.deskripsi_rencana_kinerja LIKE ? OR
            d.deskripsi_rencana_aksi LIKE ? OR
            d.deskripsi_rencana_output LIKE ? OR
            bd.pjk LIKE ?
        )";
        $params = array_merge($params, array_fill(0, 4, "%$search%"));
    }

    $query .= " ORDER BY d.id_deskripsi ASC, d.sub_deskripsi ASC";

    $stmt = $pdo->prepare($query);
    $stmt->execute($params);
    $data = $stmt->fetchAll();

    echo json_encode([
        'success' => true,
        'data'    => $data
    ]);
} catch (Exception $e) {
    echo json_encode([
        'success' => false,
        'message' => 'Gagal mengambil data: ' . $e->getMessage()
    ]);
}
