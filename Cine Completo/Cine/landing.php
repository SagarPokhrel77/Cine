<?php
session_start();
$conexion = mysqli_connect("localhost", "sagar", "123", "cine");
if (!$conexion) die("Error de conexión a la base de datos");

// =======================
// LOGIN
$login_error = "";
if (isset($_POST['login'])) {
    $usuario = mysqli_real_escape_string($conexion, $_POST['usuario']);
    $pass    = mysqli_real_escape_string($conexion, $_POST['pass']);

    $query = "SELECT idusuario, usuario FROM usuario WHERE usuario='$usuario' AND pass='$pass'";
    $res = mysqli_query($conexion, $query);

    if ($fila = mysqli_fetch_assoc($res)) {
        $_SESSION['idusuario'] = (int)$fila['idusuario'];
        $_SESSION['usuario'] = $fila['usuario'];
        header("Location: ModifiedMain.php");
        exit;
    } else {
        $login_error = "❌ Usuario o contraseña incorrectos";
    }
}

// =======================
// REGISTRO
$register_error = "";
$register_success = "";
if (isset($_POST['register'])) {
    $usuario = mysqli_real_escape_string($conexion, $_POST['rusuario']);
    $pass    = mysqli_real_escape_string($conexion, $_POST['rpass']);

    $check = mysqli_query($conexion, "SELECT idusuario FROM usuario WHERE usuario='$usuario'");
    if (mysqli_num_rows($check) > 0) {
        $register_error = "⚠️ El usuario ya existe";
    } else {
        mysqli_query($conexion, "INSERT INTO usuario (usuario, pass) VALUES ('$usuario','$pass')");
        $register_success = "✅ Usuario registrado correctamente. Ahora puedes iniciar sesión.";
    }
}

// =======================
// INVITADO
if (isset($_POST['guest'])) {
    $guest_name = "Invitado_" . rand(1000,9999);
    mysqli_query($conexion, "INSERT INTO usuario (usuario, pass) VALUES ('$guest_name','guest')");
    $_SESSION['idusuario'] = mysqli_insert_id($conexion);
    $_SESSION['usuario'] = $guest_name;
    header("Location: ModifiedMain.php");
    exit;
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cine Landing</title>
<style>
/* =======================
   GLOBAL RESET + BACKGROUND
======================= */
*,
*::before,
*::after { box-sizing: border-box; }
body { margin:0; font-family: Arial, Helvetica, sans-serif; 
       background:#0f0f0f; color:#fff; }
a { color:#ffd700; text-decoration:none; }
a:hover { text-decoration:underline; }

/* HEADER */
header { text-align:center; padding:40px 20px; }
header img { max-width:250px; margin-bottom:20px; }
header h1 { font-size:2rem; color:#fff; margin:5px 0; }
header p { font-size:1.1rem; margin-top:5px; font-weight:bold; color:#fff; }
header p .highlight { color:#ff4d4d; } /* descuento en rojo */
.highlight{color:red; font-weight:bold; }

/* CONTAINER */
.container { display:flex; flex-wrap:wrap; justify-content:center; gap:30px; padding:20px; max-width:1000px; margin:auto; }

/* CARD */
.card { background:#1a1a1a; border:2px solid #ffd700; border-radius:15px; padding:25px; width:300px; 
       box-shadow:0 4px 15px rgba(0,0,0,0.5); text-align:center; transition: transform 0.3s ease, box-shadow 0.3s ease; }
.card:hover { transform: translateY(-5px); box-shadow: 0 18px 35px rgba(0,0,0,0.7), 0 0 20px rgba(255,215,0,0.5);}
.card h2 { margin-bottom:10px; color:#fff; font-size:1.5rem; }
.card p { margin-bottom:15px; color:#fff; font-size:0.95rem; line-height:1.4em; }

/* INPUTS & BUTTONS */
input[type=text], input[type=password] { width:100%; padding:12px; margin:5px 0 15px 0; border:none; border-radius:30px; background:#141414; color:#fff; }
input[type=text]::placeholder, input[type=password]::placeholder { color:#bbb; }

/* Botones dorados */
button { width:100%; padding:12px; border:none; border-radius:30px; background: linear-gradient(135deg,#ffd700,#ffc107); color:#141414; font-weight:bold; cursor:pointer; transition:0.25s; font-size:1rem; }
button:hover { transform: scale(1.05); box-shadow: 0 10px 25px rgba(0,0,0,0.6), 0 0 15px rgba(255,215,0,0.6); }

.error { color:red; font-size:0.9rem; margin-bottom:10px; }
.success { color:#4cd137; font-size:0.9rem; margin-bottom:10px; }

/* RESPONSIVE */
@media(max-width:768px){ .container{flex-direction:column; align-items:center;} header img { max-width:300px;} }
</style>
</head>
<body>

<header>
    <!-- LOGO GRANDE -->
    <img src="imagenes/logo.png" alt="Logo Cine">
    <h1>🎬 ¡Tu cine favorito te espera! 🍿</h1>
    <p>🔥 <span class="highlight">Regístrate ya y obtén 50% de descuento</span> 🎉</p>
</header>

<div class="container">

<!-- LOGIN -->
<div class="card">
    <h2>Iniciar Sesión</h2>
    <form method="POST">
        <input type="text" name="usuario" placeholder="Usuario" required>
        <input type="password" name="pass" placeholder="Contraseña" required>
        <?php if($login_error) echo "<p class='error'>$login_error</p>"; ?>
        <button type="submit" name="login">Login</button>
    </form>
</div>

<!-- REGISTRO -->
<div class="card">
    <h2>Registro</h2>
    <p>Crea tu cuenta ahora y recibe <span class="highlight">50% OFF en tu primera compra de tickets</span></p>
    <form method="POST">
        <input type="text" name="rusuario" placeholder="Usuario" required>
        <input type="password" name="rpass" placeholder="Contraseña" required>
        <?php 
            if($register_error) echo "<p class='error'>$register_error</p>"; 
            if($register_success) echo "<p class='success'>$register_success</p>";
        ?>
        <button type="submit" name="register">Registrarme</button>
    </form>
</div>

<!-- INVITADO -->
<div class="card">
    <h2>Entrar como Invitado</h2>
    <p>Prueba nuestra plataforma sin registrarte y mira tus películas favoritas</p>
    <form method="POST">
        <button type="submit" name="guest">Continuar como Invitado</button>
    </form>
</div>

</div>

</body>
</html>
