//define functions and global variables here...
var siteloc = "http://localhost/iGit";
var scriptloc = "/scripts/";
var x = 1;

function fetchprogresshistoryof()
{
  $.ajax({
      url: siteloc + scriptloc + "getprogrec.py",
      data: {userID:x},
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

function addprogressrecord(id)
{
  $.ajax({
      url: siteloc + scriptloc + "setprogrec.py",
      data: {userID:id, 
			height:$("#height").val(), 
			weight:$("#weight").val(), 
			age:$("#age").val()},
      dataType: 'json',
      success: function (res) {
                  console.log("Successfully added.");
              }
    });
}
