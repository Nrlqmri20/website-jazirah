<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

require_once '../../config/database.php';
header('Content-Type: application/json');

try {
    // Total pengguna
    $totalUsers = $pdo->query("SELECT COUNT(*) FROM pengguna")->fetchColumn();

    // Hitung per role
    $stmt = $pdo->query("
        SELECT r.role_name, COUNT(*) as jumlah
        FROM pengguna p
        JOIN role r ON p.id_role = r.id_role
        GROUP BY r.role_name
    ");
    $roleCounts = $stmt->fetchAll(PDO::FETCH_KEY_PAIR); // hasilnya array: ['Admin_prov' => 2, 'Admin_kabkot' => 2, ...]

    // User yang login hari ini (kalau punya kolom last_login)
    $todayUsers = $pdo->query("
        SELECT COUNT(*) FROM pengguna
        WHERE DATE(updated_at) = CURDATE()
    ")->fetchColumn();

    echo json_encode([
        'success' => true,
        'data' => [
            'totalUsers' => $totalUsers,
            'adminProv' => $roleCounts['Admin_prov'] ?? 0,
            'adminKabkot' => $roleCounts['Admin_kabkot'] ?? 0,
            'operator' => $roleCounts['Operator'] ?? 0,
            'pegawai' => $roleCounts['Pegawai'] ?? 0,
            'pemeriksa' => $roleCounts['Pemeriksa'] ?? 0,
            'todayUsers' => $todayUsers
        ]
    ]);
} catch (Exception $e) {
    echo json_encode([
        'success' => false,
        'message' => 'Gagal mengambil statistik: ' . $e->getMessage()
    ]);
}
