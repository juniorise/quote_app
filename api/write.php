<?PHP
    $conn = new mysqli('localhost','root','','quoteapp');
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    $quote = $_POST['quote'];
    $author = $_POST['author'];
    $upload_by = $_POST['username'];
    $date = $_POST['date'];
    $sql = "INSERT INTO quotes (quote, authur, upload_by, published_on) VALUES('$quote','$author','$upload_by','$date')";
    if ($conn->query($sql) === TRUE) {
        echo "New record created successfully";
    }else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
    $conn->close();
?>