$(function(){
	
	var fname = $("#fName");
	var error = $("#error");
	//VALIDATING THE FIRST AME TEXTBOX.
	
	fname.on('blur', function(){
		if(fname.val().length == 0){
		    error.text("Field Cannot Be Empty .");
		    fname.focus();
		    fname.addClass('is-invalid');
		}
		else if(fname.val().length < 8){
		    error.text("String is too Short.");
		    fname.focus();
		    fname.addClass('is-invalid');
            
		}	
        else{
            error.empty();
            fname.addClass('was-validated');
        }
	});
	
});