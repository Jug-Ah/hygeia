//define functions and global variables here...
var siteloc = "http://localhost/test";
var scriptloc = "/scripts/"

function set_personalfitnessplan(id, personalDietPlan, personalExercisePlan)
{
  $.ajax({
      url: siteloc + scriptloc + "personalfitnessplan.py",
	  data: {id: p_id, personalDietPlan: p_personalDietPlan, personalExercisePlan; p_personalExercisePlan},
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

	  