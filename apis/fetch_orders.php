<?php 

 require_once 'dbconfig.php' ;
    
  if($_GET != null) {  $orderid = $_GET['orderId'];
      
      
    $query =  "SELECT tableid,amount,ordertime,prodid FROM orders WHERE orderid= '$orderid'";
      
    $result = mysqli_query($conn,$query) ;
    
    $orderRecords = array();
    
    if($result){
        
        while($row = mysqli_fetch_assoc($result)) {
            
            array_push($orderRecords,$row);
    
  }
        
        
    echo json_encode($orderRecords) ;
        
        
    }else{
        
        echo 'Not Orders' ;
    }
      
  }
    else{
        echo ' Problem' ;
    }


?>