<?php
try{
    require_once(__DIR__.'/../common/conexion.php');
    $base= new conexion();

    $resultado = $base->query('SELECT * FROM clientes');
    echo "Número de personas:".$resultado->rowCount();
    // Muestra el número de registros

 $resultado->closeCursor(); // Cierre de la consulta
}
catch(Exception $e)
{
    echo 'error';
 // mensaje en caso de error
 }
?>