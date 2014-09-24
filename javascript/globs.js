//define functions and global variables here...
var siteloc = "http://localhost/Hygeia";
var scriptloc = "/scripts/";

function adduser()
{
  $.ajax({
      url: siteloc + scriptloc + "adduser.py",
      data: {username:$("#login").val(), password:$("#password").val(), email:$("#email").val()},
      dataType: 'json',
	  async: true,
      success: function (res) {	
				if (typeof(Storage) != "undefined") {
					localStorage.id = res;
				} else {
					console.log("Sorry, your browser does not support Web Storage...");
				}
				console.log("Successfully registered.");          
            }
    });
}

$(document).ready(function () {
    jQuery.validator.addMethod("lettersonly", function (value, element) {
        return this.optional(element) || /^[a-z0-9_-]+$/i.test(value);
    }, "Please use only a-z0-9_-");
    $('#form-signin').validate({
        rules: {
            login: {
                minlength: 3,
                maxlength: 15,
                required: true,
                lettersonly: true
            },
            password: {
                minlength: 3,
                maxlength: 15,
                required: true,
                lettersonly: true
            },
			cpassword: {
				required: true,
				equalTo: "#password"
			},			
			email: {
				required: true,
				email: true
			},
        },
        highlight: function (element) {
            $(element).closest('.control-group').addClass('has-error');
        },
        success: function (element) {
            element.closest('.control-group').removeClass('has-error');
			
        }
    });
	
	
});

function setpersonalinfo()
{
  $.ajax({
		url: siteloc + scriptloc + "setpersonalinfo.py",
		data: {userID:localStorage.id, 
			fullname:$("#fullname").val(),
			birthday:$("#year").val() + "-" + $("#month").val() + "-" + $("#day").val(),
			gender:$("#gender").val() }, 
		async: true,
		dataType: 'json',
		success: function (res) {
					console.log("Successfully added personal info.");
              }
    });
}

function addprogressrecord()
{
  $.ajax({
		url: siteloc + scriptloc + "setprogressrecord.py",
		data: {userID:localStorage.id, 
			height:$("#height").val(), 
			weight:$("#weight").val()},
		async: true,
		dataType: 'json',
		success: function (res) {
					console.log("Successfully added progress record.");
              }
    });
}


function fetchprogresshistoryof()
{
  $.ajax({
      url: siteloc + scriptloc + "getprogressrecord.py",
      data: {userID:localStorage.id},
	  async: true,
      dataType: 'json',
      success: function (res) {
                  console.log(res);
                  if(res[0][0] != "None")
                  {
					  table = '<table border="1">';
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
					  table += "</table>";
					  $("#target").html(table); 
				  } // end if
              }
    });
}

function set_personalfitnessplan(id, personalDietPlan, personalExercisePlan)
{
  $.ajax({
      url: siteloc + scriptloc + "personalfitnessplan.py",
	  data: {id: p_id, personalDietPlan: p_personalDietPlan, personalExercisePlan: p_personalExercisePlan},
	  datType: 'json',
	        success: function (res) {
                  console.log(res);
                  if(res[0][0] != "None")	
                  {
					  table = '<table border="1">';
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
					  table += "</table>";
					  $("#target").html(table); 
				  } // end if
              }
    });
}

function fetchfitnessplan_bykey()
{
  $.ajax({
      url: siteloc + scriptloc + "getfitnessplan_bykey.py",
      data: {gender:$("#gender").val(),
             ageBracket:$("#ageBracket").val(),
             healthStatus:$("#healthStatus").val()},
      dataType: 'json',
success: function (res) {
                  console.log(res);
                  if(res[0][0] != "None")
                  {
				      table = '<div class="table-responsive">';
					  table += '<table class="table table-condensed">';
					  table += '<thead>' +
					           '<tr>' +
							     '<th>Exercise Plan</th>' +
								 '<th>Diet Plan</th>' +
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

function fetchexerciseplan_bykey()
{
  $.ajax({
      url: siteloc + scriptloc + "getexerciseplan_bykey.py",
      data: {gender:$("#gender").val(),
             ageBracket:$("#ageBracket").val(),
             healthStatus:$("#healthStatus").val()},
      dataType: 'json',
success: function (res) {
                  console.log(res);
                  if(res[0][0] != "None")
                  {
				      table = '<div class="table-responsive">';
					  table += '<table class="table table-condensed">';
					  table += '<thead>' +
					           '<tr>' +
							     '<th>Exercise Plan</th>' +
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

function fetchdietplan_bykey()
{
  $.ajax({
      url: siteloc + scriptloc + "getdietplan_bykey.py",
      data: {gender:$("#gender").val(),
             ageBracket:$("#ageBracket").val(),
             healthStatus:$("#healthStatus").val()},
      dataType: 'json',
success: function (res) {
                  console.log(res);
                  if(res[0][0] != "None")
                  {
				      table = '<div class="table-responsive">';
					  table += '<table class="table table-condensed">';
					  table += '<thead>' +
					           '<tr>' +
							     '<th>Exercise Plan</th>' +
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




