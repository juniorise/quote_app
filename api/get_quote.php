<?php
    include "api_constant.php";
    try {
        $conn = new PDO("mysql:host=$servername;dbname=quoteapp", $username, $password);
        // set the PDO error mode to exception
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch(PDOException $e) {
        echo "Connection failed: " . $e->getMessage();
    }

    $result = $conn->prepare("SELECT * FROM quotes");
    $result->execute();
    $jsonResponse = array();
    while($row = $result->fetch(PDO::FETCH_ASSOC)) {
        $jsonResponse[] = $row;
    }
    header('Content-type: application/json');
    echo json_encode(array("users"=>$jsonResponse));
    

?>