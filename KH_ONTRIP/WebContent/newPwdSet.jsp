<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
        src="https://code.jquery.com/jquery-3.6.1.min.js"
        integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
        crossorigin="anonymous">
</script>
</head>

    <body>
        <h1>
            비밀번호 변경
        </h1>

        <p style="color: rgb(177, 174, 174);">새로운 비밀번호를 만들어주세요</p>
        <form action="<%=request.getContextPath() %>/.me" id="find-pwd" method="post">
            <div id = "memberNewPwd"> 
                <br><br>
                <p><label for="password">비밀번호 : &nbsp;</label><input type="password" name="password" id="password" placeholder="password" /> <input type="button" id="showPassword" value="show" class="button" /></p>
    
    <p><label for="password">비밀번호 확인 : &nbsp;</label><input type="password" name="password" id="password" placeholder="password" /> </p>
    
    <p><input type="submit" value="newPwdUpdate" class="button" /></p>
            </div>
        </form>

		<script>
		// Check javascript has loaded
		$(document).ready(function(){

		  // Click event of the showPassword button
		  $('#showPassword').on('click', function(){

		    // Get the password field
		    var passwordField = $('#password');

		    // Get the current type of the password field will be password or text
		    var passwordFieldType = passwordField.attr('type');

		    // Check to see if the type is a password field
		    if(passwordFieldType == 'password')
		    {
		        // Change the password field to text
		        passwordField.attr('type', 'text');

		        // Change the Text on the show password button to Hide
		        $(this).val('Hide');
		    } else {
		        // If the password field type is not a password field then set it to password
		        passwordField.attr('type', 'password');

		        // Change the value of the show password button to Show
		        $(this).val('Show');
		    }
		  });
		});
		</script>
    </body>
</html>