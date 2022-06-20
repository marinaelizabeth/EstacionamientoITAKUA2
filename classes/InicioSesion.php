<?php
    require_once(__DIR__.'/../common/conexion.php');

    class InicioSesion extends Conexion{
        function __construct(){
            parent::__construct();
        }

        public function iniciarSesion($username, $pass){

            try{

                $sql = "SELECT * from `usuarios` u JOIN `tipousuario` tu ON tu.`idtipousuario` = u.`idtipousuario` WHERE username = :usr;"; 

                $resultado = $this->conexion_db->prepare($sql);

                $resultado->execute(array(":usr"=>$username));

                    //---si hay filas con ese usuario, se verifica su contrasena---
                if($resultado->rowCount()>0){
                    while($registro = $resultado->fetch(PDO::FETCH_ASSOC)){
                        $pass = md5($pass);
                        
                        if ($pass==$registro['password']){

                            //pass aceptada, recogiendo user data
                            
                            $response['error'] = false;
                            $response['message'] = 'Contraseña aceptada';

                            $response['userdata'] = array(
                                "idusuario" => intval($registro['idusuario']),
                                "username" => $registro['username'],
                                "nombre_completo" => $registro['nombre_completo'],
                                "idtipousuario" => intval($registro['idtipousuario']),
                                "tipousuario" => $registro['descripcion']
                            );

                            //cambiando todos los return por echo
                        }else{
                            $response['error'] = true;
                            $response['message'] = 'Contraseña incorrecta';
                        }
                    }
                }else{
                    $response['error'] = true;
                    $response['message'] = 'Usuario no encontrado';
                }
                
                echo json_encode($response, JSON_UNESCAPED_UNICODE);
            
                $resultado->closeCursor();
            }catch(Exception $e){
                echo "Error: " . $e->getMessage();
            }
            
            $this->conexion_db = null;
        }
        
    }
?>