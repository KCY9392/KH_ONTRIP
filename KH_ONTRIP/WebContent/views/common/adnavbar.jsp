<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ontrip.member.model.vo.Member"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자용 헤더바</title>
<link href="<%= request.getContextPath() %>/resources/css/mainForm.css" rel="stylesheet" >
<!-- 폰트적용  -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="<%= request.getContextPath() %>/resources/css/mainForm.css" rel="stylesheet" >

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

<!-- BootStrap 연결 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

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
	.uk-flex-middle {
        align-items: center;
    }
    .uk-flex-center {
        justify-content: center;
    }
    .uk-flex {
        display: flex;
    }
    .uk-background-cover {
        background-size: cover;
    }
    .uk-background-contain{
        background-position: 50% 50%;
        background-repeat: no-repeat;
    }
    .uk-section-default {
        background: rgb(250, 250, 250);
    }

    .uk-section {
        padding-top: 70px;
        padding-bottom: 70px;
    }
    .uk-section {
        display: flow-root;
        box-sizing: border-box;
    }
    .sl-in2 {
	  animation: change1 1s ease forwards;
	}
	
	@keyframes change1 {
	  from {
	    transform: translateY(30%);
	  }
	
	  to {
	    transform: translateY(0%);
	  }
	}
	tr>td:nth-child(1) {
		font-weight:900;
		font-size: 16px;
	}
	.btn-pwd:hover{
		font-weight:900;
	}
	
</style>
</head>
<body>

 <nav class="navbar bg-light" style="position:fixed; height:100px; z-index:9999; width:100vw; box-shadow:0 0 4px; ">
    <div class="container-fluid" style="background-color: white; height:100%;padding-bottom: 7px; ">
      <a class="navbar-brand" href="<%=request.getContextPath()%>/placeList.mn?categoryCode=PP">
        <b class="nav_b">Ontrip</b>&nbsp;
        <h7 style="font-size:13px; color:rgb(151,154,151);">MAKE YOUR ROUTE OPTIMIZED</h7>
      </a>
      <form class="d-flex" role="click" style="width:70%;">
        
        <div class="btnDiv" style=" margin-left:15%;">
	        <button type="button" id = "n" name="search" onclick="location.href='/KH_ONTRIP/placeList.mn?categoryCode=PP'"
	        	style="font-size:15px; border:none; color:black; margin-top:10px;">메인 관리</button>
	        
	        <button type="button" id = "n" name="search" onclick="location.href='/KH_ONTRIP/manager/members'"
	        	style="font-size:15px; border:none; color:black; margin-top:10px;">회원 관리</button>
	        
	        <button type="button" id = "n" name="search" onclick="location.href='/KH_ONTRIP/manager/reviews/play?category=PP'"
	        	style="font-size:15px; border:none; color:black; margin-top:10px;">등록 후기</button>
	        
	        <button type="button" id = "n" name="search" onclick="location.href='/KH_ONTRIP/manager/questions'"
	        	style="font-size:15px; border:none; color:black; margin-top:10px;">문의사항 관리</button>
	        
	        <button type="button" id = "n" name="search" onclick="location.href='/KH_ONTRIP/manager/qnas'"
	        	style="font-size:15px; border:none; color:black; margin-top:10px;">Q&A 관리</button>
	        
	   
        </div>
        
        
        
       
        <button class="btn-logout1" style="margin-right: 40px; font-size:17px; margin-top:10px; margin-left:600px;  color:black; border:none;" class="btn btn-outline-success" type="button"
        	onclick="logout();">로그아웃</button>
      </form>
    </div>
  </nav>
 
 
 
 
 
 
 
 <script>
 	function logout(){
 		location.href = "<%=request.getContextPath()%>/logout.me";
 		
 	}
 </script>
</body>
</html>