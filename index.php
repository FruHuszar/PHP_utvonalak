<?php
$kertUtvonal = strtok($_SERVER['REQUEST_URI'], '?');
$alapUtvonal = "/vegpontok";
if (str_starts_with($kertUtvonal, $alapUtvonal)) {
    $utvonal = substr($kertUtvonal, strlen($alapUtvonal));
}
$utvonalak = [
    "/" => __DIR__ . "/nezetek/otthon.php",
    "/kontakt" => __DIR__ . "/nezetek/kontakt.php",
    "/termekek" => __DIR__ . "/api/termekek.php",
    "/404" => __DIR__ . "/nezetek/404.php",
];
if (isset($utvonalak[$utvonal])) {
    require_once $utvonalak[$utvonal];
} else {
    include_once $utvonalak["/404"];
}
