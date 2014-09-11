//define functions and global variables here...
var siteloc = "http://localhost/iGit";
var scriptloc = "/scripts/"

function addUser()
{
  $.ajax({
      url: siteloc + scriptloc + "setUserName.py",
      data: {username:$("#login").val(), password:$("#password").val()},
      dataType: 'json',
      success: function (res) {
			var newContent = '<div class="ui-widget"><div class="ui-state-highlight ui-corner-all">  <p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>  <strong>Successfully Registered!</strong></p></div></div>';
			$("#message").html(newContent);
			//window.location.replace("http://pageAfterRegister.com");			
			console.log("Successfully registered");
				  
                  
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
        },
        highlight: function (element) {
            $(element).closest('.control-group').addClass('has-error');
        },
        success: function (element) {
            element.closest('.control-group').removeClass('has-error');
			
        }
    });
});

