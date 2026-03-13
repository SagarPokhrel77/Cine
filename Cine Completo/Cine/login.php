<?php
session_start();

if (isset($_POST["Enviar"]) && $_POST["Enviar"] === "Enviar") {

    // Conexión a la base de datos
    $conexion = mysqli_connect("localhost", "sagar", "123", "cine");
    if (!$conexion) {
        die("Error de conexión a la base de datos");
    }

    // Escapamos datos para evitar inyecciones SQL
    $usuario = mysqli_real_escape_string($conexion, $_POST["usuario"]);
    $pass    = mysqli_real_escape_string($conexion, $_POST["pass"]);

    // Seleccionamos idusuario y usuario
    $consulta = "SELECT idusuario, usuario FROM usuario WHERE usuario='$usuario' AND pass='$pass'";
    $datos = mysqli_query($conexion, $consulta);

    if ($fila = mysqli_fetch_assoc($datos)) {
        // Guardamos datos en sesión
        $_SESSION["usuario"] = $fila["usuario"];           // Nombre de usuario
        $_SESSION["idusuario"] = (int)$fila["idusuario"];  // ID del usuario
        header("Location: ModifiedMain.php"); // Redirigimos a la página principal
        exit;
    } else {
        $error = "Usuario o contraseña incorrectos";
    }
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/login.css">
</head>
<body>

<form method="POST">
    <label>Usuario</label>
    <input type="text" name="usuario" placeholder="Nombre de usuario" required>

    <label>Contraseña</label>
    <input type="password" name="pass" placeholder="Contraseña" required>

    <input type="submit" name="Enviar" value="Enviar">

    <?php if (!empty($error)): ?>
        <p class="error"><?= htmlspecialchars($error) ?></p>
    <?php endif; ?>

    <a href="register.php">Registrarse</a>
</form>

</body>
</html>
