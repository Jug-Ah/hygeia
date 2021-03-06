//define functions and global variables here...
var siteloc = "http://localhost/hygeia";
var scriptloc = "/scripts/";





$(document).ready(function () {	
	
    if (sessionStorage.id == "" || sessionStorage.id == undefined){
        alert("Session expired. Please re-login.");
        window.location = "http://localhost/Hygeia/";
    } else{
        $('#page-content').load('pages/profile.html');
        loadProfile()

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
            loadPersonalPlan();
        });

        $("#progressrecord-btn").click(function() {
            $('#page-content').load('pages/progressrecord.html');       
            $("#profile-btn").attr("class","");
            $("#fitnessplan-btn").attr("class","");
            $("#progressrecord-btn").attr("class","active");
            loadPersonalRecord()
        });

    }  
	
});


function loadPersonalPlan() {
  $.ajax({
      url: siteloc + scriptloc + "getpersonalfitnessplan.py",
      data: {userID:sessionStorage.id},
      dataType: 'json',
      success: function (res) {
        
        var EPlan = res[0];
        var DPlan = res[1];
        
        ePlan_table = '<table>';
        ePlan_table += '<thead><strong><center>' + EPlan[0] + '</center></strong></thead><br>'
                 
        for (j = 1; j < EPlan.length; j++)
        {
          ePlan_table += "<tr><td><ul><li>" + EPlan[j] + "</li></ul></td></tr>";
        }
        ePlan_table += "</table>";

        
        dPlan_table = '<table>';
        dPlan_table +=  '<thead><strong><center>' + DPlan[0] + '</center></strong></thead><br>'         
        for (j = 1; j < DPlan.length; j++)
        {
          dPlan_table += "<tr><td><ul><li>" + DPlan[j] + "</li></ul></td></tr>";
        }
        dPlan_table += "</table>";
        

        $("#ExPlan").html(ePlan_table);
        $("#DiPlan").html(dPlan_table);
      }

    });
    
}


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
								 '<th>Status</th>' +
								 '<th>Age</th>' +
								 '<th>Bracket</th>' +
								 '<th>Change %</th>' +
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

function addrecord() {
  $.ajax({
		url: siteloc + scriptloc + "addrecord.py",
		data: {userID:sessionStorage.id, 
			height:$("#height").val(), 
			weight:$("#weight").val()},
		async: true,
		dataType: 'json',
		success: function (res) {
					console.log("Successfully added progress record.");
					$("#height").val('');
					$("#weight").val('');
          loadPersonalRecord();
              }
    });
	
}

function updatepersonalplan() {
  $.ajax({
      url: "http://localhost/hygeia/scripts/updateplan.py",
      data: {userID:sessionStorage.id},
	  async: true,
      dataType: 'json',
      success: function (res) {
					console.log("Successfully updated personal fitness plan.");
					loadPersonalPlan()
              }
    });
  	
}