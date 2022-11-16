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
<style>
	.btn-outline-success:hover{
		background-color:white;
		font-size:16px;
		font-weight:700;
		transition: all 200ms;
	}
</style>

</head>
<body>

	
	
<nav class="navbar bg-light" style="position:fixed; z-index:9999; width:100vw; ">
    <div class="container-fluid" style="background-color: white; padding-bottom: 7px; border-bottom:1px solid rgb(218, 213, 213);">
      <a class="navbar-brand" href="<%=request.getContextPath()%>/start.me">
        <b class="nav_b">Ontrip</b>&nbsp;
        <h7 style="font-size:13px; color:rgb(151,154,151);">MAKE YOUR ROUTE OPTIMIZED</h7>
      </a>
      <form class="d-flex" role="click">
        
        <button style="border:none; color:black;" class="btn btn-outline-success" type="button" onclick="myPage();">마이페이지</button>
       
        <button style="margin-right: 40px; margin-left:20px; color:black; border:none;" class="btn btn-outline-success" type="button"
        	onclick="logout();">로그아웃</button>
      </form>
    </div>
  </nav>
 
 <script>
 	function logout(){
 		location.href = "<%=request.getContextPath()%>/logout.me";
 		
 	}
 
 	function myPage(){
 		location.href = "<%=request.getContextPath()%>/mypage.me";
 	}
 	
 	
 </script>
</body>
</html>