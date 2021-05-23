<?php

require_once 'dbconfig.php' ;



if(isset($_GET['searchKey'])){
    
    $searchkeyword =  $_GET['searchKey'] ;
    
    $query = "SELECT id,title,imageurl,price FROM foods WHERE title LIKE '%$searchkeyword%' " ;
    
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