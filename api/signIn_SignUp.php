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
    $create_on = $_POST['create_on'];

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
                $create_on = $result['create_on'];
                responseMessage(200,"Login successfully");
                return;
            }
            responseMessage(400,"Username or password is incorrect");
        }else {
            try {
                $signup = $conn->prepare("INSERT INTO users (username, password, create_on) VALUES (:username, :password, :create_on)");
                $signup->bindParam(':username',$username);
                $hashPassword = password_hash($password,PASSWORD_DEFAULT);
                $signup->bindParam(':password',$hashPassword);
                $signup->bindParam(':create_on',$create_on);
                if($signup->execute()){
                    responseMessage(201,"Signup successfully");
                }
            }catch(PDOException $e){
                responseMessage(400,"Signup failed");
            }
        }
    }catch(PDOException $e) {
        responseMessage(400,"Bad Request");
    }


?>