<?php
       $tarifa = 1;
       $ultimoPago = '2022-08-21  10:00:00';
       $pagadohasta= '2022-07-22  8:00:00';
       $datos= diferencia($ultimoPago, $pagadohasta);
       $precio =1;
     //  $precio = "SELECT precio FROM `tarifas` WHERE idtipovehiculo = (select idtipovehiculo from `vehiculos` where idcliente= :cliente) and idtarifa = :idtarifas";
       if($tarifa == 1){
          $monto = $datos[3] * $precio;
          echo 'Hola';
          echo $monto; 
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
    
 
       //realiza la operacion de realizar la diferencia de fechas
       function diferencia($fechaDelUltimoPago, $fechaDeHastaCuandoPago){
        $datetime1 = date_create($fechaDelUltimoPago);
        $datetime2 = date_create($fechaDeHastaCuandoPago);
        $interval = date_diff($datetime1, $datetime2);
        $resultado = array();
           // cargando en un array los valores optenidos separando el dia, mes, año y horas
            foreach ($interval as $valor){
                $resultado[] = $valor;
            }
            return $resultado;
    }
?>