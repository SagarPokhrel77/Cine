<?php
session_start();
include("includes/top.php");

$conexion = mysqli_connect("localhost", "sagar", "123", "cine");
if (!$conexion) die("Error de conexión");

$idfuncion = 0;
if (isset($_POST['idfuncion'])) {
    $idfuncion = (int)$_POST['idfuncion'];
} elseif (isset($_GET['idfuncion'])) {
    $idfuncion = (int)$_GET['idfuncion'];
} else {
    die("Función no especificada");
}

if (!isset($_SESSION['idusuario'])) die("Debes iniciar sesión");
$idusuario = (int)$_SESSION['idusuario'];

$q_funcion = "
SELECT h.idsala, h.fecha, TIME(h.hora) AS hora, h.precio,
       s.nombre AS nombre_sala, p.titulo
FROM horas h
JOIN salas s ON h.idsala = s.idsala
JOIN peliculas p ON h.idpelicula = p.idpelicula
WHERE h.idfuncion = $idfuncion
";
$r_funcion = mysqli_query($conexion, $q_funcion);
$funcion = mysqli_fetch_assoc($r_funcion);
if (!$funcion) die("Función no encontrada");

$q_usuario = "SELECT usuario FROM usuario WHERE idusuario = $idusuario";
$r_usuario = mysqli_query($conexion, $q_usuario);
$usuario = mysqli_fetch_assoc($r_usuario);

$detalles = [];
$total = 0;

if (isset($_POST['butacas']) && is_array($_POST['butacas'])) {
    $butacas_ids = array_map('intval', $_POST['butacas']);
    $ids_str = implode(',', $butacas_ids);
    $q_butacas = "SELECT * FROM butacas WHERE idbutaca IN ($ids_str) AND idusuario = $idusuario ORDER BY fila, asiento";
    $r_butacas = mysqli_query($conexion, $q_butacas);

    while ($b = mysqli_fetch_assoc($r_butacas)) {
        $detalles[] = $b;
        $total += (float)$funcion['precio'];
    }
} else {
    die("No se seleccionaron butacas");
}

$asientos = array_map(fn($b) => $b['fila'].$b['asiento'], $detalles);

$ticket_text = "Usuario: {$usuario['usuario']}\n";
$ticket_text .= "Película: {$funcion['titulo']}\n";
$ticket_text .= "Sala: {$funcion['nombre_sala']}\n";
$ticket_text .= "Fecha: {$funcion['fecha']}\n";
$ticket_text .= "Hora: {$funcion['hora']}\n";
$ticket_text .= "Butacas: ".implode(", ", $asientos)."\n";
$ticket_text .= "Precio por ticket: $".number_format($funcion['precio'],2)."\n";
$ticket_text .= "Total: $".number_format($total,2);

$ticket_text_encoded = rawurlencode($ticket_text);
$qr_url = "https://api.qrserver.com/v1/create-qr-code/?size=300x300&data={$ticket_text_encoded}";
?>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Ticket Cine</title>
<script src="https://cdn.jsdelivr.net/npm/html2canvas@1.4.1/dist/html2canvas.min.js"></script>
<style>
/* ===============================
   FULL SCREEN LAYOUT
=============================== */
body {
    margin: 0;
    padding: 0;
    font-family: Arial, Helvetica, sans-serif;
    background:
        radial-gradient(circle at top, rgba(255, 215, 0, 0.08), transparent 60%),
        linear-gradient(135deg, #0f0f0f, #141414, #1a1a1a);
    color: #fff;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}

/* HEADER FULL WIDTH */
.header-full {
    width: 100%;
    background: linear-gradient(90deg, #ffd700, #ffc107);
    padding: 20px 0;
    text-align: center;
    font-size: 24px;
    font-weight: bold;
    color: #141414;
    letter-spacing: 1px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.4);
}

/* CONTENT CENTERED */
.content-container {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

/* TICKET */
.ticket {
    background: #1a1a1a;
    border: 2px solid #ffd700;
    border-radius: 15px;
    padding: 25px;
    width: 360px;
    max-width: 90%;
    box-shadow:
        0 18px 35px rgba(0,0,0,0.7),
        0 10px 20px rgba(255,215,0,0.3);
    text-align: center;
    margin-bottom: 20px;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.ticket:hover {
    transform: translateY(-5px);
    box-shadow:
        0 25px 45px rgba(0,0,0,0.7),
        0 15px 25px rgba(255,215,0,0.5);
}

.ticket h2 {
    margin-bottom: 15px;
    font-size: 22px;
    color: #ffd700;
    letter-spacing: 1px;
}

.ticket p {
    margin: 6px 0;
    font-size: 14px;
}

.ticket .total {
    font-weight: bold;
    font-size: 16px;
    color: #ffd700;
    margin-top: 8px;
}

.ticket img {
    width: 280px;
    height: 280px;
    margin-top: 15px;
    border-radius: 12px;
    border: 1px solid #ffd700;
}

/* BOTONES */
.botones-container {
    display: flex;
    justify-content: center;
    gap: 15px;
    flex-wrap: wrap;
    margin-bottom: 30px;
}

.btn, .back-btn {
    padding: 10px 22px;
    border-radius: 30px;
    font-weight: bold;
    cursor: pointer;
    text-decoration: none;
    transition: transform 0.25s ease, box-shadow 0.25s ease;
    position: relative;
}

.btn {
    background: linear-gradient(135deg, #ffd700, #ffc107);
    color: #141414;
    border: none;
}

.btn:hover {
    transform: translateY(-2px) scale(1.05);
    box-shadow: 0 10px 25px rgba(0,0,0,0.6), 0 0 15px rgba(255,215,0,0.6);
}

.back-btn {
    background: #333;
    color: #ffd700;
    border: none;
}

.back-btn:hover {
    background: #555;
}

</style>
</head>
<body>

<div class="header-full">🎬 Ticket Cine</div>

<div class="content-container">
    <div class="ticket" id="ticketDiv">
        <h2>Ticket Cine</h2>
        <p><strong>Usuario:</strong> <?= htmlspecialchars($usuario['usuario']) ?></p>
        <p><strong>Película:</strong> <?= htmlspecialchars($funcion['titulo']) ?></p>
        <p><strong>Sala:</strong> <?= htmlspecialchars($funcion['nombre_sala']) ?></p>
        <p><strong>Fecha:</strong> <?= $funcion['fecha'] ?></p>
        <p><strong>Hora:</strong> <?= $funcion['hora'] ?></p>
        <p><strong>Butacas:</strong> <?= implode(", ", $asientos) ?></p>
        <p class="total"><strong>Total:</strong> $<?= number_format($total,2) ?></p>

        <img src="<?= $qr_url ?>" alt="QR del ticket">
    </div>

    <div class="botones-container">
        <button class="btn" onclick="descargarTicket()">Descargar Ticket</button>
        <a href="carrito.php?idfuncion=<?= $idfuncion ?>" class="back-btn">← Volver</a>
    </div>
</div>

<script>
function descargarTicket() {
    const ticket = document.getElementById('ticketDiv');

    // Aumentar resolución para que QR sea escaneable
    html2canvas(ticket, { scale: 3, useCORS: true }).then(canvas => {
        const link = document.createElement('a');
        link.download = 'ticket_<?= $idfuncion ?>.png';
        link.href = canvas.toDataURL('image/png');
        link.click();
    });
}
</script>


<?php include("includes/footer.php"); ?>
</body>
</html>
