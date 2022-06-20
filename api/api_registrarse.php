<?php
    require_once(__DIR__.'/../classes/registrarusuario.php');
    require_once(__DIR__.'/../common/validacion.php');

    $username =$_POST["username"];
    $fullname =$_POST["nombrecompleto"];
    $pass =  $_POST["pass"];
    $confirmpass =  $_POST["confirmpass"];
    $tipoUsuario =$_POST["tipoUsuario"];
    //validar datos unicamente si todos los campos tienen valores
    if((check_not_empty($username) && check_not_empty($fullname)&&check_not_empty($pass)&&check_not_empty($confirmpass)&&check_not_empty($tipoUsuario))){
        $username = validar($username);
        $fullname = validar($fullname);
        $pass = validar($pass);
        $confirmpass = validar($confirmpass);
        $tipoUsuario = validar($tipoUsuario);

        if(($pass == $confirmpass)&&!empty($pass)){
            $registrar = new RegistrarUsuario();
            $registrar->insertarUsuario($username, $fullname, $pass, $tipoUsuario); 
        }else{
            $response['error'] = true;
            $response['message'] = 'Verifica las contraseñas';
            echo json_encode($response, JSON_UNESCAPED_UNICODE);     
        }
    }else{
        $response['error'] = true;
            $response['message'] = 'Complete los datos faltantes';
            echo json_encode($response, JSON_UNESCAPED_UNICODE);
    }
    
    
?>
