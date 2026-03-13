<?php
// Consulta de Buscar 
if (isset ($_POST["buscar"]) && $_POST["buscar"]== "buscar"){
        $buscar= $_POST["busqueda"];
        $conexion = mysqli_connect("localhost","sagar","123");
        if(mysqli_connect("localhost","sagar","123")){   
        $consulta = "SELECT * FROM peliculas where titulo like '%".$buscar."%' or descripcion like '%".$buscar."%'";
        // echo $consulta;
        mysqli_SELECT_db($conexion, "cine");       
        $Datos = mysqli_query($conexion,$consulta);      
        }
    }
?>