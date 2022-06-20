<?php
    require_once(__DIR__.'/../common/conexion.php');

    
    class RegistrarCliente extends Conexion{
        public function RegistrarCliente(){
            parent::__construct();
        }

        public function insertarCliente($cedulaNumero, $nombre_cliente, $telefono, $empresa, $usuario_registra, $id_ultimopago, $vencimiento_ult_pago){
            //array de respuesta que sera enviado
            $response = array();

            $sql = "INSERT INTO clientes ( cedulanro, nombre_cliente, telefono, empresa, usuario_registra,id_ultimopago, vencimiento_ult_pago)
            values (:cedulaNumero, :nombre_cliente, :telefono, :empresa, :usuario_registra, :id_ultimopago, :vencimiento_ult_pago) ";
            


            try{
                $sentencia = $this->conexion_db->prepare($sql);
                //declarando los marcadores para ejecutar
                $sentencia->execute(array(':cedulaNumero'=>$cedulaNumero, ':nombre_cliente'=>$nombre_cliente, ':telefono'=>$telefono, ':empresa'=>$empresa,':usuario_registra'=>$usuario_registra, ':id_ultimopago'=>$id_ultimopago, ':vencimiento_ult_pago'=>$vencimiento_ult_pago));
                $sentencia->closeCursor();
                
                //echo "Registrado";
                $response['error'] = false;
                echo  json_encode('el cliente con ci '.$cedulaNumero.' registrado con éxito!', JSON_UNESCAPED_UNICODE);
            }catch(Exception $e){
                switch($e->getCode()){
                    case '23000':
                        $response['error'] = true;
                        $response['message'] = 'Este cliente ya existe';   
                        break;
                    default:
                        $response['error'] = true;
                        $response['message'] = 'No se pudo agregar al cliente. '. $e->getMessage();
                        break;
                }
            }
    
            $this->conexion_db = null;
            //mostrar info en json
            echo json_encode($response);     
        }
        
    }
?>