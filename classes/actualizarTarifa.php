<?php
    require_once(__DIR__.'/../common/conexion.php');

    
    class ActualizarTarifas extends Conexion{
        public function ActualizarTarifas(){
            parent::__construct();
        }
        //no se recibe el idtarifa porque los campos van a corresponderse en la app
        //solo se van a diferenciar por tipo de vehiculo
        public function updateTarifas($idtipoVehiculo , $precio_hora, $precio_dia, 
                                        $precio_semana, $precio_mes ){
            //array de respuesta que sera enviado
            $response = array();
            
            //sentencia con multiples updates
            $sql = "
                    UPDATE Tarifas SET precio = :precio_hora WHERE idtarifa = 1 AND 
                    idtipoVehiculo = :idtipoVehiculo;
                    UPDATE Tarifas SET precio = :precio_dia WHERE idtarifa = 2 AND 
                    idtipoVehiculo = :idtipoVehiculo;
                    UPDATE Tarifas SET precio = :precio_semana WHERE idtarifa = 3 AND 
                    idtipoVehiculo = :idtipoVehiculo;
                    UPDATE Tarifas SET precio = :precio_mes WHERE idtarifa = 4 AND 
                    idtipoVehiculo = :idtipoVehiculo;                    
                    ";
            try{
                $sentencia = $this->conexion_db->prepare($sql);
                //declarando los marcadores y ejecutando
                $sentencia->execute(array(':precio_hora'=>$precio_hora, ':precio_dia'=>$precio_dia,
                                            ':precio_semana'=>$precio_semana,
                                            ':precio_mes'=>$precio_mes,
                                            ':idtipoVehiculo'=> $idtipoVehiculo));
                $sentencia->closeCursor();
                
                //Actualizado con exito;
                $response['error'] = false;
                $response['message'] = 'Tarifas actualizadas!';
            }catch(Exception $e){
                //echo "Error: " . $e->getMessage();
                $response['error'] = true;
                $response['message'] = 'Error al actualizar: '. $e->getMessage();
            }
    
            $this->conexion_db = null;
            //mostrar info en json
            echo json_encode($response);     
        }
        
    }
?>