<?php
    require_once(__DIR__.'/../classes/registrarVehiculo.php');
    require_once(__DIR__.'/../common/validacion.php');

    //Recibir los datos y almacenarlos en variables
    $numeroChapa =$_POST["nro_chapa"];
    $descripcion =  $_POST["descripcion"];
    $cliente =  $_POST["idcliente"];
    $tipoVehiculo =$_POST["idtipovehiculo"];
    $usuarioRegistro =$_POST["idusuario_registro"];

    //validar datos unicamente si todos los campos tienen valores
    if((check_not_empty($numeroChapa )&&check_not_empty($descripcion)&&check_not_empty($cliente)&&check_not_empty($tipoVehiculo )&&check_not_empty($usuarioRegistro))){

        $numeroChapa = validar($numeroChapa);
        $cliente = validar($cliente);
        $descripcion= validar($descripcion);
        $tipoVehiculo = validar($tipoVehiculo);
        $usuarioRegistro  = validar($usuarioRegistro );
        
        $registrar = new RegistrarVehiculo();
        $registrar->insertarVehiculo($numeroChapa,  $descripcion, $cliente, $tipoVehiculo, $usuarioRegistro); 

    }else{
        $response['error'] = true;
        $response['message'] = 'Complete los datos faltantes';
        echo json_encode($response, JSON_UNESCAPED_UNICODE);
    }

?>
