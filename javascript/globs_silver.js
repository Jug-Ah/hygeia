//define functions and global variables here...
var siteloc = "http://localhost/iGit";
var scriptloc = "/scripts/"

function addUser()
{
  $.ajax({
      url: siteloc + scriptloc + "setUserName.py",
      data: {username:$("#username").val(), password:$("#password").val()},
      dataType: 'json',
      success: function (res) {
                  console.log("Successfully registered");
				  window.location.replace("http://pageAfterRegister.com");
                  
              }
    });
}

