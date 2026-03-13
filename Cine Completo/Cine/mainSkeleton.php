<?php
session_start();

   // Using include to access code from other page which is inside include folder
    include("includes/top.php");
    include("includes/footer.php");

    // Hago la conexion para sacar todos los pelis de base de datos 
    if(mysqli_connect("localhost","sagar","123")){
    $conexion = mysqli_connect("localhost","sagar","123");
    $consulta = "SELECT * FROM genero";
    // tde variable conexion and tde name of data base.
    mysqli_SELECT_db($conexion, "cine");
    // To run consulta in tde data base.
    // Creating datos contains all tde table and tde data 
    $Datos = mysqli_query($conexion,$consulta);
    }

    // Hago include para traer el filtro de peliculas 
    include("includes/genero.php");
    include("includes/buscar.php");
    include("includes/desordenado.php");
?>
<!DOCTYPE html
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cine</title>
    <!-- <link rel="stylesheet" href="css/mainpage.css"> -->

</head>
<body>
    <!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
        <table style="widtd:100%" border="solid 1px black" cellspacing="0px" width="100%" >
        <tr>
            <th>PeliculaID</th>
            <th>Titulo
            <!-- Ordenar Las pelis por genero  -->
                <form action="#" method="POST"> 
                    <br>
                    <button type="submit" name="ordenar" value="ordenar"> Up </button>
                </form>
                <form action="#" method="POST">
                    <button type="submit" name="desordenar" value="desordenar"> Down </button>
                </form>
            </th>
            <th>
            <!-- Despegable para filtro de pelis -->
                <form action="#" method="POST">
                Genero: 
                    <select name="genero" id="genero">
                        <?php
                            if(mysqli_connect("localhost","sagar","123")){
                            $conexion = mysqli_connect("localhost","sagar","123");
                            $consulta = "SELECT * FROM genero";
                            // tde variable conexion and tde name of data base.
                            mysqli_SELECT_db($conexion, "cine");
                            // To run consulta in tde data base.
                            // Creating datos contains all tde table and tde data 
                            $DatosGenero = mysqli_query($conexion,$consulta);
                            while ($fila = mysqli_fetch_array($DatosGenero)) { 
                                ?>
                                <option value="<?php echo $fila["genero"];?>"> <?php echo $fila["genero"];?> </option>
                            <?php 
                            }
                        }
                        ?>
                    </select>
                    <input type="submit" name="Filter" value="Filter">
                </form> 
            </th>
            <th>Descripcion</th>
            <th>Fotos</th>
            <th>
                <!-- From to create a search box -->
                <form action="#" method="POST">
                Buscar: <input type="text" name="busqueda" id="busqueda"> 
                <button type="submit" name="buscar" value="buscar">
                    <img src="./Imagenes/buscar.png" width="50px" height="50px">
                </button>
                </form>
            </th>
        </tr>

         <!-- Hago un while para recorrer la tabla y mostrar todas las pelis  -->
        <?php 
            while ($fila = mysqli_fetch_array($Datos)) { 
            ?>
                <tr>
                    <td><?php echo $fila["idpelicula"]; ?></td>
                    <td><?php echo $fila["titulo"]; ?></td>
                    <td><?php echo $fila["genero"]; ?></td>
                    <td><?php echo $fila["descripcion"]; ?></td>
                    <td> <a href="detalle.php?id=<?php echo $fila["idpelicula"];?>"> <img src="imagenes/<?php echo $fila["foto"];?> "style="width:150px; height:150px; "></a> </td>
                </tr>
            <?php 
            } 
        ?>
    </table>   

</body>
</html>
