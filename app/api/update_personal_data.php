<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

session_start();
require_once '../../config/database.php';
header('Content-Type: application/json');

if (!isset($_SESSION['user'])) {
    echo json_encode(['success' => false, 'message' => 'Unauthorized']);
    exit;
}

$id_pengguna = $_SESSION['user']['id_pengguna'];

// Ambil input dari form
$nama_lengkap   = $_POST['nama_lengkap'] ?? null;
$username       = $_POST['username'] ?? null;
$email          = $_POST['email'] ?? null;
$nomor_telepon  = $_POST['nomor_telepon'] ?? null;
$jabatan        = $_POST['jabatan'] ?? null;
$bidang         = $_POST['bidang'] ?? null;
$satker         = $_POST['satker'] ?? null;

try {
    // Update tabel pengguna (username & email)
    $stmt1 = $pdo->prepare("UPDATE pengguna 
                            SET username = :username, email = :email 
                            WHERE id_pengguna = :id");
    $stmt1->execute([
        ':username' => $username,
        ':email' => $email,
        ':id' => $id_pengguna
    ]);

    // Update tabel profil_pengguna
    $stmt2 = $pdo->prepare("UPDATE profil_pengguna 
                            SET nama_lengkap = :nama_lengkap, nomor_telepon = :nomor_telepon, 
                                jabatan = :jabatan, bidang = :bidang, satker = :satker 
                            WHERE id_pengguna = :id");
    $stmt2->execute([
        ':nama_lengkap' => $nama_lengkap,
        ':nomor_telepon' => $nomor_telepon,
        ':jabatan' => $jabatan,
        ':bidang' => $bidang,
        ':satker' => $satker,
        ':id' => $id_pengguna
    ]);

    echo json_encode(['success' => true, 'message' => 'Data personal berhasil diperbarui']);
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Error: ' . $e->getMessage()]);
}
