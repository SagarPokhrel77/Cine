<?php
if (isset($_POST["enviar"]) && $_POST["enviar"] === "Agregar") {

    $conexion = mysqli_connect("localhost", "sagar", "123", "cine");

    if (!$conexion) {
        die("Database connection failed");
    }

    $usuario = mysqli_real_escape_string($conexion, $_POST["usuario"]);
    $pass    = mysqli_real_escape_string($conexion, $_POST["pass"]);

    mysqli_query(
        $conexion,
        "INSERT INTO usuario (usuario, pass) VALUES ('$usuario', '$pass')"
    );

    header("Location: login.php");
    exit;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/register.css">
</head>
<body>

<form method="POST">
    <label>Usuario</label>
    <input type="text" name="usuario" required>

    <label>Password</label>
    <input type="password" name="pass" required>

    <input type="submit" name="enviar" value="Agregar">
</form>

</body>
</html>
