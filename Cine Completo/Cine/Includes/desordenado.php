<?php
    // Consulata para ordenar Ascendente
    if (isset ($_POST["ordenar"]) && $_POST["ordenar"]== "ordenar"){
            $ordenar= $_POST["ordenar"];
            $conexion = mysqli_connect("localhost","sagar","123");
            if(mysqli_connect("localhost","sagar","123")){   
            $consulta = "SELECT * FROM peliculas order by titulo";
            // echo $consulta;
            mysqli_SELECT_db($conexion, "cine");       
            $Datos = mysqli_query($conexion,$consulta);      
            }
        }

        // Consulata para ordenar Descendente
    if (isset ($_POST["desordenar"]) && $_POST["desordenar"]== "desordenar"){
            $desordenar= $_POST["desordenar"];
            $conexion = mysqli_connect("localhost","sagar","123");
            if(mysqli_connect("localhost","sagar","123")){   
            $consulta = "SELECT * FROM peliculas order by titulo DESC";
            // echo $consulta;
            mysqli_SELECT_db($conexion, "cine");       
            $Datos = mysqli_query($conexion,$consulta);      
            }
        }
?>