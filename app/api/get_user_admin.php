<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once '../../config/database.php';

header('Content-Type: application/json');

try {
    $sql = "
        SELECT 
            p.id_pengguna,
            p.username,
            p.email,
            p.password,
            p.id_role,
            r.role_name,
            p.created_at
        FROM pengguna p
        JOIN role r ON p.id_role = r.id_role
        ORDER BY p.id_pengguna ASC
    ";

    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    $users = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode([
        "success" => true,
        "data" => $users
    ]);

} catch (PDOException $e) {
    echo json_encode([
        "success" => false,
        "message" => $e->getMessage()
    ]);
}
