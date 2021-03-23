<?php
    $conn = new mysqli('localhost','root','','quoteapp');
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }   
    $result = $conn->query("SELECT * FROM quotes");
    $jsonResponse = array();
    while($row = $result->fetch_array(MYSQLI_ASSOC)) {
        $jsonResponse[] = $row;
    }
    echo json_encode(array("users"=>$jsonResponse));
    $result->close();
    $conn->close();

?>