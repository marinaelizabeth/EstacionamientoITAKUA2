<?php
    require_once(__DIR__.'/../classes/registrarCliente.php');
    require_once(__DIR__.'/../common/validacion.php');

    $cedulaNumero  =$_POST["cedulanro"];
    $nombre_cliente =$_POST["nombre_cliente"];
    $telefono =  $_POST["telefono"];
    $empresa =  $_POST["empresa"];
    $usuario_registra =$_POST["usuario_registra"];
    $id_ultimopago =$_POST["id_ultimopago"];
    $vencimiento_ult_pago =  $_POST["vencimiento_ult_pago"];
   
    if((check_not_empty($cedulaNumero )&&check_not_empty($nombre_cliente)&&check_not_empty($telefono)&&check_not_empty($empresa )&&check_not_empty($usuario_registra)&&check_not_empty($id_ultimopago )&&check_not_empty($vencimiento_ult_pago))){
        $cedulaNumero = validar($cedulaNumero);
        $nombre_cliente = validar($nombre_cliente);
        $telefono = validar($telefono);
        $empresa = validar($empresa);
        $usuario_registra  = validar($usuario_registra );
        $id_ultimopago = validar($id_ultimopago);
        $vencimiento_ult_pago = validar($vencimiento_ult_pago); 
        
        $registrar = new RegistrarCliente();
        $registrar->insertarCliente($cedulaNumero, $nombre_cliente, $telefono, $empresa, $usuario_registra, $id_ultimopago, $vencimiento_ult_pago); 
    }else{
        $response['error'] = true;
        $response['message'] = 'Complete los datos faltantes';
        echo json_encode($response, JSON_UNESCAPED_UNICODE);
    }

?>