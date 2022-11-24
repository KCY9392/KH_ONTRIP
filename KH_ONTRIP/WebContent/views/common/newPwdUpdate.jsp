<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ontrip.member.model.vo.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<style>
	#outer1{
        background-color: white; /* 해당사이트의 고유한 색상으로 작성 */
        color: black;
        width: 300px;
        height: 800px;
        margin: auto;
        box-sizing: border-box;
        text-align: center;
		margin-top: 200px;
    }
</style>
</head>
<body class="text-center">
	
				<!-- 비밀번호 변경 클릭 시 처음 로그인 폼으로 이동하기 -->
			<form id = "outer1" action="<%=request.getContextPath()%>/newPwdUpdateCheck.le" method="post">
				
				<h1 class="h3 mb-3 fw-normal">새로운 비밀번호</h1>
			<div class="form-floating">
			<input type="password" class="form-control" id="floatingInput" name="newPwd" placeholder="newPassword"><br>
			<h1 class="h3 mb-3 fw-normal">비밀번호 확인</h1>
			</div>
			<div class="form-floating">
			<input type="password" class="form-control" id="floatingPassword" name="checkPwd" placeholder="newPassword Check">
			</div>
			</div>
			<br>
			<button class="w-100 btn btn-lg btn-primary" type="submit" onclick="newPwdUpdate();" style=" background-color: rgb(130, 202, 164); border: 0; ">비밀번호 변경</button>
			<p class="mt-5 mb-3 text-muted">© Ontrip</p>
		</form>
	</div>

	
	<script>
		function newPwdUpdate(){
	    	
	  	  if($("input:password[name=newPwd]").val() != $("input:password[name=checkPwd]").val()){
	            alert("비밀번호가 일치하지 않습니다.");
	            $("input:password[name=newPwd]").focus();
	            $("input:password[name=newPwd]").val("");
	            $("input:password[name=checkPwd]").val("");
	            return false;
	        }
	        if($("input:password[name=newPwd]").val() == $("input:password[name=checkPwd]").val() && $("input:password[name=newPwd]").val() != ""){
	            alert("비밀번호 변경이 완료되었습니다.");
	        }
	  }
	</script>
</body>
</html>