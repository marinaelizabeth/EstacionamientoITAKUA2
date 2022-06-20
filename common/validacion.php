<?php
    function validar($datos){
        //borrar caracteres innecesarios (espacios o saltos de linea)
        $datos =trim($datos);
        //remover barras invertidas
        $datos =stripslashes($datos);
        //convertir caracteres especiales a entidades html
        $datos = htmlspecialchars($datos);
        //retornar datos seguros (evitando ataques)
        return $datos;
    }

    //revisar si no esta vacio un string
    function check_not_empty($s, $include_whitespace = false)
    {
    if ($include_whitespace) {
        // make it so strings containing white space are treated as empty too
        $s = trim($s);
    }
    return (isset($s) && strlen($s)); // var is set and not an empty string ''
    }   
?>