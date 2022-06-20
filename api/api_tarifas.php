<?php
    //API
    //MOSTRAR TARIFAS SEGUN TIPO DE VEHICULO
    
    require_once(__DIR__.'/../classes/mostrarTarifas.php');
    require_once(__DIR__.'/../common/validacion.php');


    $tipoVehiculo = validar($_GET["tipovehiculo"]);

    if(check_not_empty($tipoVehiculo)){
        $tarifas = new MostrarTarifas();
        $array_tarifas = $tarifas->get_tarifas($tipoVehiculo);
        //mostrando en json
            //el parametro unescaped unicode hace que se vean bien acentos y demas caracteres latinos
            echo  json_encode($array_tarifas, JSON_UNESCAPED_UNICODE);
    }else{
        //sin datos
        echo "Faltan datos";
    }
?>
