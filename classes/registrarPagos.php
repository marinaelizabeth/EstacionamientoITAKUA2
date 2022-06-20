<?php
    require_once(__DIR__.'/../common/conexion.php');

    class RegistrarPagos extends Conexion{
        public function RegistrarPagos(){
            parent::__construct();
        }
        public function insertarPagos($monto, $moneda_iso, $usuario, $idvehiculo, $pagadohasta, $tarifa, $caja){
            
           // $datos = "SELECT `vencimiento_ult_pago` FROM `clientes` WHERE idcliente = :cliente";
           $ultimoPago = '2022-08-23 7:00:00';
           // $this->conexion_db()->prepare('SELECT `vencimiento_ult_pago` FROM `clientes` WHERE idcliente = :cliente');
            //$ultimoPago = 
           
            $fechaCalculada = diferencia($ultimoPago, $pagadohasta);
            $resultado = array();
               // cargando en un array los valores optenidos separando el dia, mes, año y horas
                foreach ($fechaCalculada as $valor){
                    $resultado[] = $valor;
                }
          
            $precio = "SELECT precio FROM `tarifas` WHERE idtipovehiculo = (select idtipovehiculo from `vehiculos` where idcliente= :cliente) and idtarifa = :idtarifas";
            if($tarifa == 1){
               $monto = $datos[3] * $precio;
               echo $monto;
            }else{
                if($tarifa == 2){
                    $monto = $datos[2] * $precio;
                    echo $monto;
                }else{
                    if($tarifa == 3){
                        $monto = 2;
                    }else{
                         $monto = $datos[1]*$precio;
                         echo $monto;
                    }

                }
            }
 
           //array de respuesta que sera envia
           $response = array();
            
            $sql = "INSERT INTO Usuarios (monto, moneda_iso, idusuario_cobro idvehiculo, pagadohasta, idtarifa, idcaja, idfecha_cobro)
            values (:monto, :moneda_iso, :usuario, :idvehiculo, :pagadohasta, :tarifa, :caja, :idfecha_cobro)";
            
            
            $this->conexion_db = null;
           //mostrar info en json
            echo json_encode($response);  
   
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
    
       /* $t1 = '09:30:00' ; 
        $t2 = '17:15:00' ;  
        
        $dt1 = nueva fecha y hora ( $t1 );                     
        $dt2 = nueva fecha y hora ( $t2 ); 
        echo $dt2 -> diferencia ( $dt1 )-> formato ( '%H:%I:%S' ); // 07:45:00    */
    
    
?>