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
	   
	   // CHECKS IN THE DOCTOR VERIFICTION IF THE USER IS A DOCTOR.
	   
	   $sql2 = "SELECT dv_id from doctor_verification where username = '".$email."' and password = '".$password."'";
	   $valid = mysqli_query($conn,$sql2);
	   if(!$valid){
		  echo  "An Error was encoutered.".mysqli_error($valid);
	   }
	   else{
		   
		    $count = mysqli_num_rows($valid);
		   if( $count == 1){
			   header('location: docDash.php');
		   }
		   else{
			   echo "No user found.";
		   }
	   }
   }
}

?>