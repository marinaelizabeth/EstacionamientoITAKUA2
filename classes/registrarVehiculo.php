<?php
    require_once(__DIR__.'/../common/conexion.php');

    class RegistrarVehiculo extends Conexion{
        public function RegistrarVehiculo(){
            parent::__construct();
        }

        public function insertarVehiculo( $numeroChapa,  $descripcion, $cliente, $tipoVehiculo, $usuarioRegistro)
        {
            //array de respuesta que sera enviado
            $response = array();

            //consulta para insertar datos
            $sql = "INSERT INTO vehiculos (nro_chapa,  descripcion, idcliente, idtipoVehiculo, idusuario_registro)
            values (:numeroChapa,  :descripcion, :cliente, :tipoVehiculo, :usuarioRegistro ) ";

            try{
                $sentencia = $this->conexion_db->prepare($sql);
                //declarando los marcadores para ejecutar
                $sentencia->execute(array(':numeroChapa'=>$numeroChapa, ':descripcion'=>$descripcion,':cliente'=>$cliente, ':tipoVehiculo'=>$tipoVehiculo, ':usuarioRegistro'=>$usuarioRegistro)); 
                $sentencia->closeCursor();
                
                //echo "Registrado";
                $response['error'] = false;
                echo  json_encode('numero de Chapa '.$numeroChapa.' registrado con éxito!', JSON_UNESCAPED_UNICODE);
            } catch(Exception $e){
                switch($e->getCode()){
                    case '23000':
                        $response['error'] = true;
                        $response['message'] = 'Este numero de chapa del vehiculo ya existe';   
                        break;
                    default:
                        $response['error'] = true;
                        $response['message'] = 'No se pudo registrar el vehiculo. '. $e->getMessage();
                    break;
                }
            }

         
            $this->conexion_db = null;
            //mostrar info en json
            echo json_encode($response);     
        }
    }
    
?>