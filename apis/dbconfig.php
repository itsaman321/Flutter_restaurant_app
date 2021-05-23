<?php

$host = 'localhost' ;
$useranme = 'id16724714_root1' ;
$password = '@AMANverma321';
$dbname = 'id16724714_restaurant' ;

$conn = mysqli_connect($host,$useranme,$password,$dbname) ;

if(!$conn){
  echo 'failed' ;
}

?>
