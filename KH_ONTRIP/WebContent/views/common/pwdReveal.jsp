<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ontrip.member.model.vo.Member"%>
 
 <%
 	Member m = (Member)request.getAttribute("m");
 	String memberPwd = m.getMemberPwd();
 	String memberId = m.getMemberId();
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
<style>
	#marjinForm{
		margin-top: 100px;
	}
	.title{
			font-size: 60px;
			margin-top: -20px;
			font-weight: 900;
			color: rgb(130, 202, 164);
			text-align: center;
		}
		
	#modal-title{
	margin-left: 265;
	}
</style>
</head>
<body>
	<form action="<%=request.getContextPath()%>/newPwd.le?memberPwd=<%=memberPwd%>&memberId=<%= memberId %>" method="post" id="marjinForm">
	  	
	  	<div class="modal-dialog" role="document">
	  	
			<div class="title">
				<p>On Trip</p>
			</div>
      <br><br>
			
	    <div class="modal-content rounded-4 shadow" 
      style="margin-left: -100px; width: 700px; height: 450px; text-align:center;">
	    <br><br>
	      <div class="modal-header border-bottom-0">
	        <b><h1 style="margin-left:220px; color:lightgray;">My Password</h1></b>
	      </div>
	      <br><br>
	      <div class="modal-body py-0"
        style="text-align:center; font-size: 25;">
	        <b><p style="font-size:25px;">여행자님의 현재 비밀번호는 <strong style="color:red">"<%=memberPwd %>"</strong> 입니다</p></b>
	      </div>
	      
	      <div class="modal-footer flex-column border-top-0">
	        <button type="submit" class="btn btn-lg btn-success w-100 mx-0 mb-2" style="background-color: rgb(130, 202, 164); border: 0; height:80px" >비밀번호 변경</button>
	        <button type="button" class="btn btn-lg btn-light w-100 mx-0" data-bs-dismiss="modal" onclick="loginFormGo();" style="height:80px">메인으로</button>
	      </div>
	      
	      <br>
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