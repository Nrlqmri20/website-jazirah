<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

session_start();
require_once '../../config/database.php';

header('Content-Type: application/json');

file_put_contents(__DIR__ . '/debug_log.txt', json_encode([
    'method' => $_SERVER['REQUEST_METHOD'],
    'post' => $_POST
]));

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = trim($_POST['username'] ?? '');
    $password = trim($_POST['password'] ?? '');

    if ($username === '' || $password === '') {
        echo json_encode([
            'success' => false,
            'message' => 'Username dan Password tidak boleh kosong.'
        ]);
        exit;
    }

    $stmt = $pdo->prepare("SELECT * FROM pengguna WHERE username = ? AND password = ?");
    $stmt->execute([$username, $password]);
    $user = $stmt->fetch();

    if ($user) {
        $_SESSION['user'] = [
            'id_pengguna' => $user['id_pengguna'],
            'username' => $user['username'],
            'id_role' => $user['id_role']
        ];
        echo json_encode([
            'success' => true,
            'redirect' => 'app/views/dashboard.php'
        ]);
    } else {
        echo json_encode([
            'success' => false,
            'message' => 'Username atau Password salah.'
        ]);
    }
} else {
    echo json_encode([
        'success' => false,
        'message' => 'Metode tidak valid.'
    ]);
}
