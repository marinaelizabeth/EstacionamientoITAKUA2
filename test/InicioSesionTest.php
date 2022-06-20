<?php
    require_once(__DIR__.'/../InicioSesion.php');

    use PHPUnit\Framework\TestCase;
    class InicioSesionTest extends TestCase{

        private $op;

        protected function setUp():void{
            $this->op = new InicioSesion();
        }

        public function testLoginWithValidData(){
            //decodificando JSON de respuesta
            $decoded_json = json_decode($this->op->iniciarSesion("admin","admin"), false);
            //verificando que no se reporte error
            $this->assertFalse($decoded_json->error);
        }

        public function testLoginWithInvalidPass(){
            $decoded_json = json_decode($this->op->iniciarSesion("admin","1111"), false);
            $this->assertEquals('Contraseña incorrecta', $decoded_json->message);
        }

        public function testLoginWithInvalidUsername(){
            $decoded_json = json_decode($this->op->iniciarSesion("1111","admin"), false);

            $this->assertEquals('Usuario no encontrado', $decoded_json->message);
        }

   

    }
?>