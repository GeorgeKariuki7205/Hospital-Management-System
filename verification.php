<?php
include('phpFiles/databaseConnection.php');
if($_SERVER['REQUEST_METHOD']=="POST"){
    // echo "Submitted.";
    // echo "THE DATA HAS BEEN SUCCESSFULLY SUPPLIED.";
    $email = $_POST['fName'];
    $password = $_POST['password'];
    echo $email;
    echo $password;
	
	// Checking if the user has activated his account.. 
	
	$sql1 = "SELECT isEmailVerified from patient details where email = $";
	 
   $sql = "SELECT pv_id from patient_verification where username = '".$email."' and password = '".$password."'";
   echo $sql;
   $valid = mysqli_query($conn,$sql);
   if(!$valid){
	   die( "SOMETHING WRONG WITH THE QUERY." ).mysqli_error($conn);
   }
   $numRows = mysqli_num_rows($valid);
   echo $numRows;
   if($numRows == 1){
	   echo "LOGIN SUCCESSSFUL.";
	   
	   header('location: logedin.html');
   }
   else{
	   echo"LOGIN FAILED.";
   }
}

?>