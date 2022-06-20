<?php
    
    
    require_once(__DIR__.'/../classes/resumenFinanciero.php');
    require_once(__DIR__.'/../common/validacion.php');


    $cajaInicio = $_POST["cajaInicio"];
        if ($cajaInicio == null){
            $cajaInicio = 0;
        }
        if ($cajaInicio >= 0){
            $finanza = new MostrarFinanza();
            $array_finanza = $finanza->get_Finanza();
            //realiza la suma de los montos que se encuentra en json
            $quantity_sum = array_sum(array_column($array_finanza, 'monto'));
            // para convertir arrays en cadenas JSON.
            echo  json_encode($array_finanza);
            //realiza la suma de la CajaInicial mas lo que salio en la suma del monto
            $total = $quantity_sum + $cajaInicio;
            echo  $total;
        }else{
            echo "ingrese un monto que no sea negativo";
        }
        
   
?>
