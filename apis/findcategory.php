<?php

require_once 'dbconfig.php' ;


if(isset($_GET['categoryid'])){
    
    $catid =  $_GET['categoryid'] ;
    
    $query = "SELECT id,title,imageurl,price FROM foods WHERE categoryid ='$catid' " ;
    
    $result = mysqli_query($conn,$query);
    
    $foodarray = array() ;
    
    if($result){
        
        while($row = mysqli_fetch_assoc($result)){
            
            array_push($foodarray , $row) ;
            
        }
    
    echo json_encode($foodarray) ;
   
        
    }else {
        echo ' problem';
    }
    
}

?>