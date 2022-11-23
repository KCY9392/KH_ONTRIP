<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ontrip.member.model.vo.Member"%>
 
 <%
 	String memberPwd = (String)request.getAttribute("memberPwd");
 %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</head>
<body>
	<!-- 비밀번호 변경 버튼 클릭 시 변경을 하기위한 페이지로 연결하기 위한 서블릿 -->
	<form action="<%=request.getContextPath()%>/newPwd.le?memberPwd=<%=memberPwd%>" method="post" style="margin-top: 50px;">
		<div class="modal modal-sheet position-static d-block bg-secondary py-5" tabindex="-1" role="dialog" id="modalSheet">
	  	<div class="modal-dialog" role="document">
	    <div class="modal-content rounded-4 shadow">
	      <div class="modal-header border-bottom-0">
	        <h1 class="modal-title fs-5">My passWord</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body py-0">
	        <p>여행자님의 현재 비밀번호는 <strong>"<%=memberPwd %>"</strong> 입니다.</p><br>
	      </div>
	      <div class="modal-footer flex-column border-top-0">
	        <button type="submit" class="btn btn-lg btn-primary w-100 mx-0 mb-2" >비밀번호 변경</button>
	        <button type="button" class="btn btn-lg btn-light w-100 mx-0" data-bs-dismiss="modal" onclick="loginFormGo();">메인으로</button>
	      </div>
    	</div>
  	</div>
</div>
	</form>
	
	<script>
		function loginFormGo(){
			location.href = "<%=request.getContextPath()%>";
		}
	</script>
</body>
</html>