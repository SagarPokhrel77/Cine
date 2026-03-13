<?php
if ((isset ($_POST["Filter"])) && $_POST["Filter"]=="Filter"){
            $genero= $_POST["genero"];
            $conexion = mysqli_connect("localhost","sagar","123");
            if(mysqli_connect("localhost","sagar","123")){ 
                if ($genero == "todo"){
                    $consulta = "SELECT * FROM peliculas";
                } else {
                    $consulta = "SELECT * FROM peliculas where genero='".$genero."'";
                }
                mysqli_SELECT_db($conexion, "cine");       
                $Datos = mysqli_query($conexion,$consulta);      
            }
        }
?>