<?php

require_once 'dbconfig.php' ;

$query = "SELECT * FROM category";

$queryresult = mysqli_query($conn,$query) ;

$category =[] ;

if($queryresult){
while(  $row = mysqli_fetch_assoc($queryresult)){
  array_push($category,$row);
} ;
echo json_encode($category) ;
}else{
  echo 'failed to fecth data' ;
}

?>
