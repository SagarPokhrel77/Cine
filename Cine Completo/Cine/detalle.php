<?php
session_start();

// Conexión a la base de datos
$conexion = mysqli_connect("localhost", "sagar", "123", "cine");
if (!$conexion) die("Error de conexión");

// Validar que se reciba id de película
if (!isset($_GET['id'])) die("Película no especificada");
$idpelicula = (int) $_GET['id'];

// Obtener datos de la película
$q = "SELECT * FROM peliculas WHERE idpelicula = $idpelicula";
$r = mysqli_query($conexion, $q);
$peli = mysqli_fetch_assoc($r);
if (!$peli) die("Película no encontrada");

include("includes/top.php");

// Formatear fecha de estreno
$fechaEstreno = $peli['fechaestreno'];
$fechaFormateada = ($fechaEstreno && $fechaEstreno != '0000-00-00') ? date("Y-m-d", strtotime($fechaEstreno)) : "N/A";

// Consultar salas y funciones usando la tabla horas
$q_salas = "
    SELECT 
        s.idsala, s.numerosala, s.nombre AS nombre_sala, s.tiposala, 
        h.idfuncion, h.hora, h.fecha
    FROM salas s
    INNER JOIN horas h ON h.idsala = s.idsala
    WHERE h.idpelicula = $idpelicula
    ORDER BY s.idsala, h.fecha, h.hora
";

$r_salas = mysqli_query($conexion, $q_salas);
if (!$r_salas) die("Error al consultar salas y horarios");
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title><?php echo htmlspecialchars($peli['titulo']); ?></title>
    <link rel="stylesheet" href="Css/detalle.css">
</head>
<body>

<!-- Script para el trailer -->
<script>
    var TRAILER_URL = "<?php echo $peli['trailer']; ?>";
</script>
<script src="JavaScript/trailer.js"></script>

<!-- Contenedor principal -->
<div class="netflix-detail-container">

    <!-- Backdrop -->
    <div class="backdrop" style="background-image: url('imagenes/<?php echo $peli['foto']; ?>')">
        <div class="black-overlay"></div>
    </div>

    <!-- Botón volver -->
    <a href="ModifiedMain.php" class="back-btn">← Volver</a>

    <!-- Contenido de detalle -->
    <div class="detail-content">
        <div class="poster-img">
            <img src="imagenes/<?php echo $peli['foto']; ?>" alt="Poster">
        </div>
        <div class="info">
            <h1 class="title-netflix"><?php echo htmlspecialchars($peli['titulo']); ?></h1>
            <div class="actions">
                <button class="btn-play" onclick="openTrailer()">▶ Reproducir</button>
                <button class="btn-list">+ Mi Lista</button>
            </div>
            <div class="meta-netflix">
                <span class="year"><?php echo $fechaFormateada; ?></span>
                <span class="dot">&#8226;</span>
                <span class="duration"><?php echo $peli['duracion']; ?> min</span>
                <span class="dot">&#8226;</span>
                <span class="genre"><?php echo htmlspecialchars($peli['genero']); ?></span>
            </div>
            <p class="sinopsis-netflix"><?php echo htmlspecialchars($peli['descripcion']); ?></p>
            <div class="credits-netflix">
                <strong>Director:</strong> <?php echo htmlspecialchars($peli['director']); ?>
            </div>
        </div>
    </div>
</div>

<!-- Modal del trailer -->
<div id="trailerModal" class="trailer-modal">
    <div class="trailer-content">
        <span class="close-btn" onclick="closeTrailer()">✖</span>
        <iframe id="trailerFrame" src="" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
    </div>
</div>

<!-- Sección de horarios y salas -->
<div class="salas-container">
    <h2>Horas disponibles</h2>
    <?php
    $currentSala = null;

    while ($fila = mysqli_fetch_assoc($r_salas)) {
        // Si cambiamos de sala, cerramos la anterior
        if ($currentSala != $fila['idsala']) {
            if ($currentSala !== null) echo '</div></div>'; // cerrar sala anterior
            echo '<div class="sala-block">';
            echo '<h3>Sala: ' . htmlspecialchars($fila['nombre_sala']) 
                 . ' (' . htmlspecialchars($fila['tiposala']) . ')</h3>';
            echo '<div class="horarios">';
            $currentSala = $fila['idsala'];
        }

        // Mostrar cada horario con fecha como botón
        echo '<button class="btn-hora" onclick="window.location.href=\'reservabutacas.php?idfuncion='
             . $fila['idfuncion'] . '\'">'

             . htmlspecialchars($fila['fecha']) . ' - ' . htmlspecialchars($fila['hora']) . '</button> ';
    }

    // Cerrar la última sala
    if ($currentSala !== null) echo '</div></div>';
    ?>
</div>

<?php include("includes/footer.php"); ?>
</body>
</html>
