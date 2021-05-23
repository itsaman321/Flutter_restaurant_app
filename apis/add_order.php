<?php

require_once 'dbconfig.php';

$orderid = $_GET["orderid"];
$tableId = $_GET['tableId'] ;
$amount = $_GET['amount'] ;
$dateTime = $_GET['dateTime'] ;
$productarray = json_decode($_GET['products']);


$productCount = sizeof($productarray) ;

for($x=0 ; $x < $productCount ; $x ++){
    
    
    
    $query = "insert into orders(orderid, tableid, amount, ordertime, prodid) values ('$orderid','$tableId','$amount','$dateTime','$productarray[$x]')";
    
    $result= mysqli_query($conn,$query) ;
    
    
    
}


if($result){
        echo 'Order Successful';
    }
    else{
        echo 'Problem There' ;
    }


?>

