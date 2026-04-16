<?php
require_once __DIR__ . "/../ab.php";
$allapot = $pdo->query("SELECT * FROM termek");
$adatok = $allapot->fetchAll(
    PDO::FETCH_ASSOC
);
header("Content-Type: application/json");
echo json_encode($adatok);
