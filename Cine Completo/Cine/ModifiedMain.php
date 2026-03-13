<?php
session_start();

/* ===============================
   INCLUDES HEADER
   =============================== */
include("includes/top.php");

/* ===============================
   CONEXIÓN
   =============================== */
$conexion = mysqli_connect("localhost","sagar","123","cine");
mysqli_select_db($conexion, "cine");

/* ===============================
   QUERY BASE CON FILTROS
   =============================== */
$consulta = "SELECT * FROM peliculas WHERE 1";

// Buscar por título
if(isset($_POST['busqueda']) && !empty($_POST['busqueda'])){
    $busqueda = mysqli_real_escape_string($conexion, $_POST['busqueda']);
    $consulta .= " AND titulo LIKE '%$busqueda%'";
}

// Filtrar por género
if(isset($_POST['genero']) && !empty($_POST['genero'])){
    $genero = mysqli_real_escape_string($conexion, $_POST['genero']);
    $consulta .= " AND genero='$genero'";
}

$Datos = mysqli_query($conexion, $consulta);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cine</title>
    <link rel="stylesheet" href="css/mainpage.css">
</head>
<body>

<!-- ===============================
     SEARCH + FILTER
=============================== -->
<form method="POST" class="search-filter-form">
    <input type="text" name="busqueda" placeholder="Buscar películas..." value="<?php echo isset($_POST['busqueda']) ? $_POST['busqueda'] : ''; ?>">

    <select name="genero">
        <option value="">Todos los géneros</option>
        <?php
        $generos = mysqli_query($conexion, "SELECT * FROM genero");
        while ($g = mysqli_fetch_array($generos)) {
            $selected = (isset($_POST['genero']) && $_POST['genero'] == $g['genero']) ? 'selected' : '';
            echo "<option value='{$g["genero"]}' $selected>{$g["genero"]}</option>";
        }
        ?>
    </select>

    <button type="submit" name="buscar">Buscar / Filtrar</button>
</form>


<!-- ===============================
     SCROLL HORIZONTAL (MOVIES)
     =============================== -->
<div class="scroll-row">
    <?php while ($fila = mysqli_fetch_array($Datos)) { ?>
        <div class="movie-card">
            <a href="detalle.php?id=<?php echo $fila["idpelicula"]; ?>">
                <img src="imagenes/<?php echo $fila["foto"]; ?>">
                <div class="overlay">
                    <h3><?php echo $fila["titulo"]; ?></h3>
                    <span class="genre"><?php echo $fila["genero"]; ?></span>
                </div>
            </a>
        </div>
    <?php } ?>
</div>

<br>
<?php include("includes/footer.php"); ?>
</body>
</html>
