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


    $quote = $_POST['quote'];
    $author = $_POST['author'];
    $upload_by = $_POST['username'];
    $date = $_POST['date'];
    
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
        $sql = $conn->prepare("INSERT INTO quotes (quote, author, upload_by, published_on) VALUES(:quote,:author,:upload_by,:date)");
        $sql->bindParam(':quote',$quote);
        $sql->bindParam(':author',$author);
        $sql->bindParam(':upload_by',$upload_by);
        $sql->bindParam(':date',$date);
        if($sql->execute()){
            responseMessage(201,"Quote created successfully");
        }
    }catch(PDOException $e) {
        responseMessage(400,"Quote created failed");
    }
    
  
    
?>