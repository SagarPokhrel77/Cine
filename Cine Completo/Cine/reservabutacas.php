<?php
session_start();
include("includes/top.php");

$conexion = mysqli_connect("localhost", "sagar", "123", "cine");
if (!$conexion) die("Error de conexión");

if (!isset($_GET['idfuncion'])) die("Función no especificada");
$idfuncion = (int)$_GET['idfuncion'];

if (!isset($_SESSION['idusuario'])) die("Debes iniciar sesión");
$idusuario = (int)$_SESSION['idusuario'];

/* ================= DATOS FUNCIÓN + PELÍCULA ================= */
$q_funcion = "
SELECT h.idsala, h.fecha, TIME(h.hora) AS hora,
       s.nombre AS nombre_sala, h.precio,
       p.idpelicula, p.titulo, p.trailer AS trailer_peli
FROM horas h
JOIN salas s ON h.idsala = s.idsala
JOIN peliculas p ON h.idpelicula = p.idpelicula
WHERE h.idfuncion = $idfuncion
";
$r_funcion = mysqli_query($conexion, $q_funcion);
$funcion = mysqli_fetch_assoc($r_funcion);
if (!$funcion) die("Función no encontrada");

$idsala = (int)$funcion['idsala'];
$idpelicula = (int)$funcion['idpelicula'];
$fecha  = $funcion['fecha'];
$hora   = $funcion['hora'];

/* ================= SESIÓN ================= */
if (!isset($_SESSION['reservas'])) $_SESSION['reservas'] = [];
if (!isset($_SESSION['reservas'][$idfuncion])) {
    $_SESSION['reservas'][$idfuncion] = [];
}

/* ================= POST ================= */
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (!empty($_POST['butacas'])) {
        foreach ($_POST['butacas'] as $idbutaca) {
            $idbutaca = (int)$idbutaca;
            if (!in_array($idbutaca, $_SESSION['reservas'][$idfuncion])) {
                $_SESSION['reservas'][$idfuncion][] = $idbutaca;
                mysqli_query($conexion, "UPDATE butacas SET idusuario = $idusuario WHERE idbutaca = $idbutaca AND idsala = $idsala");
            }
        }
    }

    if (isset($_POST['accion']) && $_POST['accion'] === 'quitar' && !empty($_POST['quitar_butacas'])) {
        foreach ($_POST['quitar_butacas'] as $idbutaca) {
            $idbutaca = (int)$idbutaca;
            mysqli_query($conexion, "UPDATE butacas SET idusuario = NULL WHERE idbutaca = $idbutaca AND idusuario = $idusuario");
            $_SESSION['reservas'][$idfuncion] = array_diff($_SESSION['reservas'][$idfuncion], [$idbutaca]);
        }
    }

    if (isset($_POST['accion']) && $_POST['accion'] === 'comprar') {
        header("Location: carrito.php?idfuncion=$idfuncion");
        exit;
    }
}

/* ================= MAPA BUTACAS ================= */
$q_butacas = "SELECT * FROM butacas WHERE idsala = $idsala ORDER BY fila, asiento";
$r = mysqli_query($conexion, $q_butacas);

$mapa = [];
while ($b = mysqli_fetch_assoc($r)) {
    $mapa[$b['fila']][$b['asiento']] = $b;
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Reservar Butacas</title>
<link rel="stylesheet" href="css/reservabutacas.css">
</head>
<body>

<h1><?= htmlspecialchars($funcion['titulo']) ?></h1>
<p><?= htmlspecialchars($funcion['nombre_sala']) ?> | <?= $fecha ?> | <?= $hora ?></p>

<form method="post">

<div class="pantalla-3d">
    <div class="pantalla-central">
        <iframe 
            id="trailer"
            src="<?= htmlspecialchars($funcion['trailer_peli']) ?>?enablejsapi=1&autoplay=1&mute=1&controls=1"
            allow="autoplay; encrypted-media"
            allowfullscreen>
        </iframe>
    </div>
    <div class="pantalla-lado pantalla-left">
        <iframe 
            src="<?= htmlspecialchars($funcion['trailer_peli']) ?>?enablejsapi=1&autoplay=1&mute=1&controls=0"
            allow="autoplay; encrypted-media"
            allowfullscreen>
        </iframe>
    </div>
    <div class="pantalla-lado pantalla-right">
        <iframe 
            src="<?= htmlspecialchars($funcion['trailer_peli']) ?>?enablejsapi=1&autoplay=1&mute=1&controls=0"
            allow="autoplay; encrypted-media"
            allowfullscreen>
        </iframe>
    </div>
</div>

<?php foreach ($mapa as $fila => $asientos): ?>
<div class="fila">
<?php
$max = max(array_keys($asientos));
$medio = ceil($max / 2);
for ($i = 1; $i <= $max; $i++) {
    if ($i == $medio) echo '<div class="espacio"></div>';
    if (isset($asientos[$i])) {
        $b = $asientos[$i];
        $en_sesion = in_array($b['idbutaca'], $_SESSION['reservas'][$idfuncion]);
        if ($b['idusuario'] && $b['idusuario'] != $idusuario) {
            echo '<div class="seat ocupada">'.$b['asiento'].'</div>';
        } elseif ($b['idusuario'] == $idusuario || $en_sesion) {
            echo '<label><input type="checkbox" name="quitar_butacas[]" value="'.$b['idbutaca'].'"><div class="seat reservada">'.$b['asiento'].'</div></label>';
        } else {
            echo '<label><input type="checkbox" name="butacas[]" value="'.$b['idbutaca'].'" onchange="this.form.submit()"><div class="seat disponible">'.$b['asiento'].'</div></label>';
        }
    } else {
        echo '<div class="espacio"></div>';
    }
}
?>  
</div>
<?php endforeach; ?>

<div class="volver"><a href="ModifiedMain.php?idfuncion=<?= $idfuncion ?>" class="btn-volver">← Volver</a></div>

<div class="botones">
    <button type="submit" name="accion" value="quitar"><b>Quitar Reserva</b></button>
    <button type="submit" name="accion" value="comprar"><b>Comprar</b></button>
</div>

<?php include("includes/footer.php"); ?>
</form>

<script>
let player;

// Se ejecuta automáticamente cuando la API de YouTube está lista
function onYouTubeIframeAPIReady() {
    player = new YT.Player('trailer', {
        events: {
            'onReady': onPlayerReady
        }
    });
}

// Cuando el reproductor está listo
function onPlayerReady(event) {
    event.target.setPlaybackRate(2); // 🔥 Velocidad de Video de trailer
    event.target.playVideo();
}

/* OPCIONAL: funciones para cambiar velocidad dinámicamente */
function velocidadNormal() {
    player.setPlaybackRate(1);
}

function velocidadRapida() {
    player.setPlaybackRate(2);
}


let player;
let tiempoGuardado = localStorage.getItem("tiempoTrailer");

// Se ejecuta cuando la API está lista
function onYouTubeIframeAPIReady() {
    player = new YT.Player('trailer', {
        events: {
            'onReady': onPlayerReady
        }
    });
}

function onPlayerReady(event) {

    event.target.setPlaybackRate(2);
    event.target.playVideo();

    // 🔥 Si había tiempo guardado, volver a ese segundo
    if (tiempoGuardado) {
        event.target.seekTo(parseFloat(tiempoGuardado));
    }

    // 🔥 Guardar tiempo cada segundo
    setInterval(function(){
        if (player && player.getCurrentTime) {
            localStorage.setItem("tiempoTrailer", player.getCurrentTime());
        }
    }, 1000);
}
</script>




</body>
</html>