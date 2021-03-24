<?php
    $servername = "localhost";
    $username = "root";
    $password = "";

    try {
        $conn = new PDO("mysql:host=$servername;dbname=quoteapp", $username, $password);
        // set the PDO error mode to exception
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch(PDOException $e) {
        echo "Connection failed: " . $e->getMessage();
    }

    
    $username = $_POST['username'];
    $password = $_POST['password'];

    function responseMessage($statusCode,$message){
        http_response_code($statusCode);
        header('Content-type: application/json');
        $response = array();
        $response = array(
            "status" => $statusCode,
            "message" => $message,
        );
        echo json_encode($response);
    }

    try {
        $sql = $conn->prepare("SELECT * FROM users WHERE username = '$username'");
        $sql->execute();
        if($sql->rowCount() != 0){
            $result = $sql->fetch(PDO::FETCH_ASSOC);
            if(password_verify($password,$result['password'])){
                responseMessage(200,"Login successfully");
                return;
            }
            responseMessage(400,"Username or password is incorrect");
        }else {
            responseMessage(400,"Username or password is incorrect");
        }
    }catch(PDOException $e) {
        responseMessage(400,"Bad Request");
    }


?>