<?php
    require_once(__DIR__.'/../classes/InicioSesion.php');
    require_once(__DIR__.'/../common/validacion.php');

    $username =validar($_POST["username"]);
    $pass = validar( $_POST["pass"]);

    if(check_not_empty($pass) && check_not_empty($username)){
        $login = new InicioSesion();
        $login->iniciarSesion($username, $pass); 
    }else{
        $response['error'] = true;
        $response['message'] = 'Complete los datos';
        echo json_encode($response, JSON_UNESCAPED_UNICODE);
    }
    
?>