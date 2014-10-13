//define functions and global variables here...
var siteloc = "http://localhost/dashboard";
var scriptloc = "/scripts/";





$(document).ready(function () {	
	


	$('#page-content').load('pages/profile.html');
	loadProfile()


	//$("#dashboard-btn").click(function() {	  
		//$('#page-content').load('pages/index.html');  		
		//$("#profile-btn").attr("class","");
		//$("#dashboard-btn").attr("class","active");
	//}); 

	$("#profile-btn").click(function() {	  
		$('#page-content').load('pages/profile.html');		
		$("#profile-btn").attr("class","active");
		$("#dashboard-btn").attr("class","");		
		loadProfile()
	});

	$("#edit-profile-btn").click(function() {	  
		$('#page-content').load('pages/edit-profile.html');			
	});



  
	
});


function logout()
{
	sessionStorage.id = ""
	window.location = "http://localhost/Hygeia/";
	return false;
}

function loadProfile()
{
  
  $.ajax({
      url:  "http://localhost/hygeia/scripts/getpersonalinfo.py",  // EDIT THIS WHEN TRANSFERRING DASHBOARD TO HYGEIA'S MAIN FOLDER
      data: {userID:sessionStorage.id},
      dataType: 'json',
      success: function (res) {
				
				var name = res[0][0]				
				var bday = res[0][1]
				var gender = res[0][2]
				var email = res[0][3]
				
                $("#complete-name").html(name);
                $("#bday").html(bday);
                $("#gender").html(gender);                
                document.getElementById("email").innerHTML = email;
                document.getElementById("email").href = "mailto:" + email;                
              }
    });  	
}
