<?php

    // HACE FALTA RECIBIR CADA PARAMETRO DE PRECIO POR SEPARADO Y EJECUTAR VARIAS SENTENCIAS
     
    require_once(__DIR__.'/../classes/actualizarTarifa.php');
    require_once(__DIR__.'/../common/validacion.php');

    $idtipoVehiculo =$_POST["idtipoVehiculo"];
    $precio_hora =  $_POST["preciohora"];
    $precio_dia =  $_POST["preciodia"];
    $precio_semana =  $_POST["preciosemana"];
    $precio_mes =  $_POST["preciomes"];
    


    //validar datos unicamente si todos los campos tienen valores
    if(
        (check_not_empty($idtipoVehiculo)&&check_not_empty($precio_hora)
        && check_not_empty($precio_dia) && check_not_empty($precio_semana)
        && check_not_empty($precio_mes)
    )
    ){  
        //eliminando caracteres innecesarios y validando datos
        $idtipoVehiculo = validar($idtipoVehiculo);
        $precio_hora = validar($precio_hora);
        $precio_dia = validar($precio_dia);
        $precio_semana = validar($precio_semana);
        $precio_mes = validar($precio_mes);
    
        //chequeando si no hay datos vacios
        if(
            is_numeric($precio_hora) && is_numeric($precio_dia) 
            && is_numeric($precio_semana) && is_numeric($precio_mes)
        ){
            $actualizar = new ActualizarTarifas();
            $actualizar->updateTarifas($idtipoVehiculo, $precio_hora, $precio_dia, $precio_semana, $precio_mes); 
        }else{
            $response['error'] = true;
            $response['message'] = 'Ingrese valores validos';
            echo json_encode($response, JSON_UNESCAPED_UNICODE);
        }

    }else{
        $response['error'] = true;
        $response['message'] = 'Complete los datos faltantes';
        echo json_encode($response, JSON_UNESCAPED_UNICODE);
    }
    
   
    
?>
