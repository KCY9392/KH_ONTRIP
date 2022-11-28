<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ontrip.member.model.vo.Member"%>
<%


	Member loginUser = (Member) session.getAttribute("loginUser");
	// 로그인전 or 로그인 실패 : null
	// 로그인 성공후 : 로그인한 회원의 정보가 담긴 member객체.
	
	String alertMsg = (String) session.getAttribute("alertMsg");
	// 서비스 요청전 : null
	// 서비스 요청성공후 : alert로 띄워줄 메시지 문구.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%= request.getContextPath() %>/resources/css/mainForm.css" rel="stylesheet" >
<!-- 폰트적용  -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
   rel="stylesheet">
<link href="<%= request.getContextPath() %>/resources/css/mainForm.css"
   rel="stylesheet">
<style>

	.btn-outline-success:hover{
		background-color:white;
		font-weight:700;
	}
	.btn-question, .btn-qna{
		font-weight:500;
		color:white;
	}
	.btn-question:hover, .btn-qna:hover{
		font-weight:bold;
	}
</style>

</head>
<body>

	
	
<nav class="navbar bg-light" style="position:fixed; z-index:9999; width:100vw; box-shadow:0 0 4px; ">
    <div class="container-fluid" style="background-color: white; padding-bottom: 7px; ">
      <a class="navbar-brand" href="<%=request.getContextPath()%>/start.me">
        <b class="nav_b">Ontrip</b>&nbsp;
        <h7 style="font-size:13px; color:rgb(151,154,151);">MAKE YOUR ROUTE OPTIMIZED</h7>
      </a>
      <form class="d-flex" role="click">
        
        <button style="font-size:17px; border:none; color:black; margin-top:5%;" class="btn btn-outline-success" type="button" onclick="myPage();">마이페이지</button>
       
        <button style="margin-right: 40px; font-size:17px; margin-left:20px; margin-top:5%; color:black; border:none;" class="btn btn-outline-success" type="button"
        	onclick="logout();">로그아웃</button>
      </form>
    </div>
  </nav>
 
 <!-- side box (Q&A / 고객센터 박스) -->
  <div class="side-box" style="border:none; box-shadow:0 0 5px 2px lightgrey;  border-radius: 10px; 
      display:inline-block; height:100px; position: fixed; margin-top:25%; margin-left:96.5%;">
    <div style="height:50%;">
      <button type="button"  class="btn-qna"
        style="background-color: rgb(181, 206, 178); width:100%; height:100%; 
        border:none; border-bottom:2px solid rgb(238, 236, 236);  border-radius: 10px;" 
        onclick="goQnA();">Q&A</button>
    </div>
    <div style="height:50%;">
      <button type="button" class="btn-question" style=" background-color: rgb(181, 206, 178); height:100%; border:none;
        border-radius: 10px;"
        onclick="goQuestion();">고객센터</button>
    </div>
  </div>
  
  
 <script>
 	function logout(){
 		location.href = "<%=request.getContextPath()%>/logout.me";
 		
 	}
 
 	function myPage(){
 		location.href = "<%=request.getContextPath()%>/mypage.me";
 	}
 	
 	function goQnA(){
		location.href = "<%= request.getContextPath() %>/qnas";
	}
 	
 	function goQuestion(){
		location.href = "<%= request.getContextPath() %>/question/questions";
	}
 	
 </script>
</body>
</html>