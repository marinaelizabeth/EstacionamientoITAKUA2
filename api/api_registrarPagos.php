<?php
    require_once(__DIR__.'/../classes/registrarPagos.php');
    require_once(__DIR__.'/../common/validacion.php');

   // $monto =$_POST["monto"];
    $moneda_iso =$_POST["moneda_iso"];
    $usuario =  $_POST["idusuario_cobro"];
    //$fecha_cobro =  $_POST["fecha_cobro"];
    $idvehiculo =$_POST["idvehiculo"];
    $pagadohasta =  $_POST["pagadohasta"];
    $tarifa =  $_POST["idtarifa"];
    $caja =$_POST["idcaja"];
    $cliente =  $_POST["idcliente"];
   // $ultimoPago = $_GET["vencimiento_ult_pago"];
      
   $ultimoPago = '2022-08-21  9:00:00';
       $datos= diferencia($ultimoPago, $pagadohasta);
       $precio =1;
     //  $precio = "SELECT precio FROM `tarifas` WHERE idtipovehiculo = (select idtipovehiculo from `vehiculos` where idcliente= :cliente) and idtarifa = :idtarifas";
       if($tarifa == 1){
          $monto = $datos[3] * $precio;
          echo 'Hola';
       }else{
           if($tarifa == 2){
               $monto = $datos[2] * $precio;
               echo 'chau';
           }else{
               if($tarifa == 3){
                   $monto = 2;
               }else{
                    $monto = $datos[1]*$precio;
               }

           }
       }
    
    

    //validar datos unicamente si todos los campos tienen valores
    if((check_not_empty($monto)&&check_not_empty($usuario)&& check_not_empty($moneda_iso)&& check_not_empty($idvehiculo)&&check_not_empty($pagadohasta)&&check_not_empty($tarifa)&&check_not_empty($caja)&&check_not_empty($cliente) )){ 
        $monto = validar($monto);
        $moneda_iso = validar($moneda_iso);
        $usuario = validar($usuario);
        $idvehiculo= validar($idvehiculo);
        $pagadohasta = validar($pagadohasta);
        $tarifa = validar($tarifa);
        $caja = validar($caja);
        $cliente = validar($cliente);
    
        
        $registrar = new RegistrarPagos();
        $registrar->insertarPagos($monto, $moneda_iso, $usuario, $idvehiculo, $pagadohasta, $tarifa, $caja, $cliente); 
        


    }else{
        $response['error'] = true;
        $response['message'] = 'Complete los datos faltantes';
        echo json_encode($response, JSON_UNESCAPED_UNICODE);
    }
?>
    
