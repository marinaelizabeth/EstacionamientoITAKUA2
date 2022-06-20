<?php
    require_once(__DIR__.'/../common/conexion.php');

    class MostrarTarifas extends Conexion{
        public function MostrarTarifas(){
            parent::__construct();
        }

        public function get_tarifas($dato){
            //$sql = "SELECT * FROM TARIFAS WHERE tipoVehiculo_idtipoVehiculo ='" . $dato . "'";
            $sql = "SELECT * FROM TARIFAS WHERE idtipoVehiculo = :idtipo";

            $sentencia = $this->conexion_db->prepare($sql);
            $sentencia->execute(array(":idtipo"=>$dato));
            $resultado=$sentencia->fetchAll(PDO::FETCH_ASSOC);
            $sentencia->closeCursor();
            return $resultado;
            $this->conexion_db = null;
        }
        
    }
?>