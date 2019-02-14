<?php
if($_SERVER['REQUEST_METHOD']== "POST"){
    echo"DATA HAS SUCCESSFULLY BEEN SENT TO THE DB."."</br>";
    $fname = $_POST['fName'];
    $lName = $_POST['Lname'];
	$surName = $_POST['Sname'];
    $date = $_POST['date'];
	$birthCertNumber = $_POST['birthCertNumber'];
	$nhifNumber  = $_POST['nhifNumber'];
	$kraNumber  = $_POST['kraNumber'];
	$email = $_POST['email'];
	$phone = $_POST['phone'];
	$callTime  = $_POST['callTime'];
	$residence = $_POST['residence'];
	
	//ECHO $fname."</br>".$lName." </br> ".$date." </br> ".$birthCertNumber." </br> ". $nhifNumber." </br> ".$kraNumber." </br> ".$email ." </br> ".$phone." </br> ".$callTime;
	 echo"php loaded." ;
	  $conn = mysqli_connect('localhost:3308','root','7205','monaowano');
	  if($conn){
		  $sql = "insert into patient_details(Fname,Lname,SurName,phone_number,email,Residence,birthCertificateNumber,kraNumber,NhifNumber,callTime,Date_Of_Birth) values('".$fname. "','".$lName."','".$surName."','".$phone."','".$email."','".$residence."','".$birthCertNumber."','".$kraNumber."','".$nhifNumber."','".$callTime."','".$date ."');";
	      $valid = mysqli_query($conn,$sql);
		  if($valid){
			  $sql2 = "insert into patient_verification (username,password,patient_id) values ('".$email."','".$nhifNumber."',". 1 .");";
			  $valid2 = mysqli_query($conn,$sql2);
			  if($valid2){
				  
				   header('Location:login.html'); 
			  }
			 else{
				 mysqli_error($conn);
			 }
		  }
		  else{
			  mysqli_error($conn);
		  }
	  }
	  else{
		  die("The database connection was not successful.");
	  }

}
?>