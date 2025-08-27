<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

session_start();
require_once '../../config/database.php';

header('Content-Type: application/json');

if (!isset($_SESSION['user']['id_pengguna'])) {
    echo json_encode(['success' => false, 'message' => 'Unauthorized']);
    exit();
}

$id_pengguna = $_SESSION['user']['id_pengguna'];
$username    = $_SESSION['user']['username'] ?? ('user' . $id_pengguna);

// Validasi input
if (!isset($_FILES['avatar']) || $_FILES['avatar']['error'] !== UPLOAD_ERR_OK) {
    echo json_encode(['success' => false, 'message' => 'No file uploaded']);
    exit();
}

$file    = $_FILES['avatar'];
$allowed = ['jpg', 'jpeg', 'png'];
$ext     = strtolower(pathinfo($file['name'], PATHINFO_EXTENSION));

if (!in_array($ext, $allowed)) {
    echo json_encode(['success' => false, 'message' => 'Format file harus JPG/PNG']);
    exit();
}
if ($file['size'] > 2 * 1024 * 1024) {
    echo json_encode(['success' => false, 'message' => 'Ukuran file max 2MB']);
    exit();
}

// (opsional) validasi MIME
$finfo = finfo_open(FILEINFO_MIME_TYPE);
$mime  = finfo_file($finfo, $file['tmp_name']);
finfo_close($finfo);
if (!in_array($mime, ['image/jpeg', 'image/png'])) {
    echo json_encode(['success' => false, 'message' => 'MIME tidak valid']);
    exit();
}

// Tentukan nama file baru (sanitize username)
$safeUser  = preg_replace('/[^a-z0-9\-_.]/', '-', strtolower($username));
$filename  = $safeUser . "-" . $id_pengguna . "." . $ext;

$uploadDir  = __DIR__ . "/../../public/img/profil/";
$publicBase = "public/img/profil/"; // sesuaikan dengan URL yang kamu pakai di <img src="...">

if (!is_dir($uploadDir)) {
    mkdir($uploadDir, 0755, true);
}

// Hapus file lama dengan semua kemungkinan ekstensi
foreach ($allowed as $oldExt) {
    $old = $uploadDir . $safeUser . "-" . $id_pengguna . "." . $oldExt;
    if (is_file($old)) unlink($old);
}

// Pindahkan file baru
$uploadPath = $uploadDir . $filename;
if (!move_uploaded_file($file['tmp_name'], $uploadPath)) {
    echo json_encode(['success' => false, 'message' => 'Upload gagal']);
    exit();
}

// Simpan/Update DB
$stmt = $pdo->prepare("
    INSERT INTO profil_pengguna (id_pengguna, foto_profil, created_at, updated_at)
    VALUES (:id, :foto, NOW(), NOW())
    ON DUPLICATE KEY UPDATE 
        foto_profil = VALUES(foto_profil),
        updated_at = NOW()
");
$stmt->execute([
    ':id'   => $id_pengguna,
    ':foto' => $filename
]);

echo json_encode([
    'success'  => true,
    'message'  => 'Foto profil berhasil diupload',
    'filename' => $filename,
    'url'      => $publicBase . $filename
]);
