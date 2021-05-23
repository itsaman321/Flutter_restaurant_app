<?php

require_once 'dbconfig.php' ;

$query = "SELECT * FROM foods";

$queryresult = mysqli_query($conn,$query) ;

$foods =[] ;

if($queryresult){
while(  $row = mysqli_fetch_assoc($queryresult)){
  array_push($foods,$row);
} ;
echo json_encode($foods) ;
}else{
  echo 'failed to fecth data' ;
}

?>

