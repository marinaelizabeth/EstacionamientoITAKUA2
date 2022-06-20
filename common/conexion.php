<?php
    require 'config.php';
    class Conexion{
        protected $conexion_db;
        
        public function __construct()
        {
            try{
                //---dsn significa: data source name---
                $dsn = 'mysql:host='. DB_HOST . ';dbname=' . DB_NOMBRE . ';charset=' . DB_CHARSET;
                
                $this->conexion_db = new PDO($dsn, DB_USUARIO, DB_CONTRA);
                $this->conexion_db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                //echo "Conectado";

                return $this->conexion_db;
            }catch(PDOException  $e){
                echo "Error: " . $e->getMessage();
            }
        }
    }
   
?>