<?php
session_start();
header('Content-Type: application/json');

$conexion = mysqli_connect("localhost", "sagar", "123", "cine");
if (!$conexion) {
    echo json_encode(['status'=>'error','message'=>'Error de conexión']);
    exit;
}

if (!isset($_POST['idfuncion'], $_POST['butacas'])) {
    echo json_encode(['status'=>'error','message'=>'Datos incompletos']);
    exit;
}

$idfuncion = (int)$_POST['idfuncion'];
$butacas = $_POST['butacas'];

// Obtener función
$q = "SELECT idsala, fecha, TIME(hora) AS hora FROM horas WHERE idfuncion = $idfuncion";
$r = mysqli_query($conexion, $q);

if (!$r || mysqli_num_rows($r) == 0) {
    echo json_encode(['status'=>'error','message'=>'Función no encontrada']);
    exit;
}

$f = mysqli_fetch_assoc($r);
$idsala = $f['idsala'];
$fecha  = $f['fecha'];
$hora   = $f['hora'];

foreach ($butacas as $idbutaca) {
    $idbutaca = (int)$idbutaca;

    mysqli_query($conexion, "
        INSERT INTO salasbutacas (idsala, idbutaca, fecha, hora, ocupado)
        VALUES ($idsala, $idbutaca, '$fecha', '$hora', 1)
        ON DUPLICATE KEY UPDATE ocupado = 1
    ");
}

echo json_encode(['status'=>'ok']);
