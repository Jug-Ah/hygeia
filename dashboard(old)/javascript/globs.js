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
		$("#fitnessplan-btn").attr("class","");		
		$("#progressrecord-btn").attr("class","");		
		loadProfile()
	});

	$("#edit-profile-btn").click(function() {	  
		$('#page-content').load('pages/edit-profile.html');			
	});
	
	$("#fitnessplan-btn").click(function() {
		$('#page-content').load('pages/fitnessplan.html');
		$("#profile-btn").attr("class","");
		$("#fitnessplan-btn").attr("class","active");
		$("#progressrecord-btn").attr("class","");		
		loadPersonalPlan()
	});

	$("#progressrecord-btn").click(function() {
		$('#page-content').load('pages/progressrecord.html');		
		$("#profile-btn").attr("class","");
		$("#fitnessplan-btn").attr("class","");
		$("#progressrecord-btn").attr("class","active");
		loadPersonalRecord()
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
                $("#bDay").html(bday);
                $("#gender").html(gender);                
                document.getElementById("email").innerHTML = email;
                document.getElementById("email").href = "mailto:" + email;                
              }
    });  	
}

function loadPersonalPlan() {
  $.ajax({
      url: "http://localhost/hygeia/scripts/getpersonalfitnessplan.py",
      data: {userID:sessionStorage.id},
      dataType: 'json',
      success: function (res) {
                  var EPlan = res[0][0];
                  var DPlan = res[0][1];


                  $("#ExPlan").html(EPlan);
                  $("#DiPlan").html(DPlan);
              }
    });
}

function loadPersonalRecord() {
  $.ajax({
      url: "http://localhost/hygeia/scripts/getprogressrecord.py",
      data: {userID:sessionStorage.id},
      dataType: 'json',
		success: function (res) {
                  console.log(res);
                  if(res[0][0] != "None")
                  {
				      table = '<div class="table-responsive">';
					  table += '<table class="table table-condensed">';
					  table += '<thead>' +
					           '<tr>' +
							     '<th>Height</th>' +
								 '<th>Weight</th>' +
								 '<th>BMI</th>' +
								 '<th>Health Status</th>' +
								 '<th>Age</th>' +
								 '<th>Age Bracket</th>' +
								 '<th>Change Percentage</th>' +
							   '</tr>' +
					           '</thead>';
					  table += "<tbody>";		   
					  for (i = 0; i < res.length; i++)
					  {
						  row = res[i];
						  table += "<tr>";
						  for (j = 0; j < row.length; j++)
						  {
							  table += "<td>" + row[j] + "</td>";
						  }
						  table += "</tr>";
					  }
					  table += "</tbody>";
					  table += "</table>";
					  table += "</div>";
					  $("#target").html(table); 
				  }
              }
    });
}