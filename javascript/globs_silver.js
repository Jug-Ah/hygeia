//define functions and global variables here...
var siteloc = "http://localhost/test2";
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

