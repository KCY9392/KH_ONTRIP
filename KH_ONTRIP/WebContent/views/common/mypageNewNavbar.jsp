<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date, com.ontrip.member.model.vo.Member"%>
<%
	Member loginUser2 = (Member) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>2022-11-23에 만든 새로운 마이페이지네브바</title>
<link href="<%= request.getContextPath() %>/resources/css/mainForm.css" rel="stylesheet" >
<style>
	.btn-outline-success:hover{
		background-color:white;z
		font-weight:700;
	}
	.btn-mypage1, .btn-logout1{
		background-color:white;
	}
	.btn-mypage1:hover, .btn-logout1:hover{
		background-color:white !important;
		font-weight:700;
	}
	.btnDiv button{
		font-weight:bold !important;
		color: gray !important;
		border-radius:10px !important;
		background-color:rgb(255, 255, 255) !important;
	}
	.btnDiv button:hover{
		background-color:yellowgreen !important;
		color:white !important;
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
      <form class="d-flex" role="click" style="width:70%;">
        
        
        <div class="btnDiv" style=" margin-left:15%;">
	        <button type="button" id = "n"  name="search" onclick="myMember();"
	        	style="font-size:15px; border:none; color:black; margin-top:10px;" class="btn btn-outline-success">여행자 정보</button>
	        
	        <button type="button" id = "n" name="search" onclick="myReservation();"
	        	style="font-size:15px; border:none; color:black; margin-top:10px;" class="btn btn-outline-success">예약 숙소</button>
	        
	        <button type="button" id = "n" name="search" onclick="myHeart();"
	        	style="font-size:15px; border:none; color:black; margin-top:10px;" class="btn btn-outline-success">찜 목록</button>
	        
	        <button type="button" id = "n" name="search" onclick="myReview();"
	        	style="font-size:15px; border:none; color:black; margin-top:10px;" class="btn btn-outline-success">등록 후기</button>
	        
	        <button type="button" id = "n" name="search"  onclick = "deleteMember();"
	        	style="font-size:15px; border:none; color:black; margin-top:10px;" class="btn btn-outline-success">회원 탈퇴</button>
        </div>
        
        
        <button class="btn-mypage1" style="font-size:17px; border:none; color:black; margin-top:10px; margin-left:35%;" class="btn btn-outline-success" type="button" onclick="myPage();">마이페이지</button>
       
        <button class="btn-logout1" style="margin-right: 40px; font-size:17px; margin-top:10px; margin-left:20px;  color:black; border:none;" class="btn btn-outline-success" type="button"
        	onclick="logout();">로그아웃</button>
      </form>
    </div>
  </nav>
 
 <!-- side box (Q&A / 고객센터 박스) -->
  <div class="side-box" style="border:none; box-shadow:0 0 5px 2px lightgrey;  border-radius: 10px; z-index:99999;
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
 	
 	
 </script>
 <script>
            function myMember(){
                location.href = "<%=request.getContextPath()%>/mypage.me";
            }
            
            function myReservation(){
               location.href = "<%=request.getContextPath()%>/myPage/reservationList";
            }
            
            function myHeart(){
               location.href = "<%=request.getContextPath()%>/mypageHeartList.me?memberNo=<%=loginUser2.getMemberNo()%>";
            }
            
            function myReview(){
               location.href = "<%=request.getContextPath()%>/mypageReviewList.me?memberNo=<%= loginUser2.getMemberNo()%>";
            }
            
            function deleteMember(){
                location.href = "<%=request.getContextPath()%>/MemberDelete.me";
            }
            
            
            // Q&A , 고객센터(문의사항) 바 
            
            function goQnA(){
        		location.href = "<%= request.getContextPath() %>/qnas";
        	}
         	
         	function goQuestion(){
        		location.href = "<%= request.getContextPath() %>/question/questions";
        	}
         </script>
</body>
</html>