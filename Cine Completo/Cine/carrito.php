<?php
session_start();
include("includes/top.php"); // Asegúrate que top.php inicia sesión

$conexion = mysqli_connect("localhost", "sagar", "123", "cine");
if (!$conexion) die("Error de conexión");

// ==================== ID DE LA FUNCIÓN ====================
$idfuncion = 0;
if (isset($_GET['idfuncion'])) {
    $idfuncion = (int)$_GET['idfuncion'];
} elseif (isset($_POST['idfuncion'])) {
    $idfuncion = (int)$_POST['idfuncion'];
} else {
    die("Función no especificada");
}

// ==================== USUARIO ====================
if (!isset($_SESSION['idusuario'])) die("Debes iniciar sesión");
$idusuario = (int)$_SESSION['idusuario'];

// ==================== DATOS DE LA FUNCIÓN ====================
$q_funcion = "
SELECT h.idsala, h.fecha, TIME(h.hora) AS hora, h.precio,
       s.nombre AS nombre_sala, p.titulo, p.foto, p.idpelicula
FROM horas h
JOIN salas s ON h.idsala = s.idsala
JOIN peliculas p ON h.idpelicula = p.idpelicula
WHERE h.idfuncion = $idfuncion
";
$r_funcion = mysqli_query($conexion, $q_funcion);
$funcion = mysqli_fetch_assoc($r_funcion);
if (!$funcion) die("Función no encontrada");

// ==================== BUTACAS RESERVADAS DEL USUARIO ====================
$q_butacas = "
SELECT *
FROM butacas
WHERE idsala = {$funcion['idsala']} AND idusuario = $idusuario
ORDER BY fila, asiento
";
$r = mysqli_query($conexion, $q_butacas);

$detalles = [];
$total = 0;
while ($b = mysqli_fetch_assoc($r)) {
    $detalles[] = $b;
    $total += (float)$funcion['precio'];
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Carrito de Compra</title>
<link rel="stylesheet" href="Css/carrito.css">
<style>
.peli-img { width:80px; height:auto; }
.carrito-table { width:100%; border-collapse: collapse; margin-top: 20px; }
.carrito-table th, .carrito-table td { border:1px solid #ccc; padding:8px; text-align:center; }
.total-row { background:#f0f0f0; font-weight:bold; }
.form-compra { text-align:center; margin-top:20px; display:flex; justify-content:center; gap:15px; }
.btn-compra, .back-btn { padding:10px 20px; background:#333; color:#fff; border:none; border-radius:5px; cursor:pointer; text-decoration:none; }
.back-btn:hover, .btn-compra:hover { background:#555; }
</style>
</head>
<body>

<h1>Carrito de Compra</h1>
<p class="funcion-info">
    <?= htmlspecialchars($funcion['titulo']) ?> - <?= htmlspecialchars($funcion['nombre_sala']) ?> | <?= $funcion['fecha'] ?> | <?= $funcion['hora'] ?>
</p>

<table class="carrito-table">
    <thead>
        <tr>
            <th>Película</th>
            <th>Fila</th>
            <th>Asiento</th>
            <th>Precio</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($detalles as $d): ?>
        <tr>
            <td>
                <a href="detalle.php?id=<?= $funcion['idpelicula'] ?>">
                    <img src="imagenes/<?= htmlspecialchars($funcion['foto']) ?>" 
                         alt="<?= htmlspecialchars($funcion['titulo']) ?>" 
                         class="peli-img">
                </a>
            </td>
            <td><?= $d['fila'] ?></td>
            <td><?= $d['asiento'] ?></td>
            <td>$<?= number_format($funcion['precio'],2) ?></td>
        </tr>
        <?php endforeach; ?>
        <tr class="total-row">
            <td colspan="3"><strong>Total</strong></td>
            <td><strong>$<?= number_format($total,2) ?></strong></td>
        </tr>
    </tbody>
</table>

<!-- Botones centrados -->
<div class="form-compra">
    <!-- Volver a ModifiedMain.php -->
    <a href="ModifiedMain.php" class="back-btn">← Volver</a>

    <!-- Finalizar Compra -->
    <form method="post" action="ticket.php" style="display:inline;">
        <?php foreach ($detalles as $b): ?>
            <input type="hidden" name="butacas[]" value="<?= (int)$b['idbutaca'] ?>">
        <?php endforeach; ?>
        <input type="hidden" name="idfuncion" value="<?= $idfuncion ?>">
        <button type="submit" class="btn-compra">Finalizar Compra</button>
    </form>
</div>

<br>
<?php include("includes/footer.php"); ?>
</body>
</html>
