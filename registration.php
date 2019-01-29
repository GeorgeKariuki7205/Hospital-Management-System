<?php

if($_SERVER['REQUEST_METHOD']== "POST"){
    echo"DATA HAS SUCCESSFULLY BEEN SENT TO THE DB."."</br>";
    $fname = $_POST['fName'];
    $lName = $_POST['Lname'];
    $date = $_POST['date'];
	$birthCertNumber = $_POST['birthCertNumber'];
	$nhifNumber  = $_POST['nhifNumber'];
	$kraNumber  = $_POST['kraNumber'];
	$email = $_POST['email'];
	$phone = $_POST['phone'];
	$callTime  = $_POST['callTime'];
	$residence = $_POST['residence'];
	
	ECHO $fname."</br>".$lName." </br> ".$date." </br> ".$birthCertNumber." </br> ". $nhifNumber." </br> ".$kraNumber." </br> ".$email ." </br> ".$phone." </br> ".$callTime;
	

}

?>