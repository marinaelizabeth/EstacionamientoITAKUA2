<?php
    require_once(__DIR__.'/../common/conexion.php');

    class MostrarFinanza extends Conexion{
        public function MostrarFinanza(){
            parent::__construct();
        }

        public function get_Finanza(){
            $sql = 'SELECT fecha_cobro, monto FROM `pagos`';
            $sentencia = $this->conexion_db->query($sql);
            $sentencia->execute();
            $resultado=$sentencia->fetchAll(PDO::FETCH_ASSOC);
            $sentencia->closeCursor();
            return $resultado;
            $this->conexion_db = null;
        }
        
    }
?>