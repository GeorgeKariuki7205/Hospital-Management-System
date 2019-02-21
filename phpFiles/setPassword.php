<?php 
session_start();
    include('databaseConnection.php');
	
	if($_SERVER['REQUEST_METHOD']== "POST"){
		 $password = $_POST['password'];
		 $username = $_SESSION["email"];
		if($conn){
			 $sql2 = "insert into patient_verification (username,password,patient_id) values ('".$username."','".$password."','". 1 ."');";
			  $valid2 = mysqli_query($conn,$sql2);
			  if($valid2){
				  
				   header('Location: ..\login.html'); 
			  }
			 else{
				echo mysqli_error($conn);
			 }
	}else{
		die("Connection to database is wrong.");
	}
	}
	
?>