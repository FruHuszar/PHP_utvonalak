<?php 
    $kertUtvonal = strtok($_SERVER['REQUEST_URI'], '?');
    $alapUtvonal = "/vegpontok";
    if (str_starts_with($kertUtvonal, $alapUtvonal)){
        $utvonal = substr($kertUtvonal, strlen($alapUtvonal));
    }
    $utvonalak = [
        "/" => __DIR__."/nezetek/otthon.php",
    ];
    if (isset($utvonalak[$utvonal])){
        require_once $utvonalak[$utvonal];
    }
?>