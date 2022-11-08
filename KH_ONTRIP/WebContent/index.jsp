<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>온트립(OnTrip) - 숙소, 즐길거리, 맛집 추천사이트</title>

    <script
        src="https://code.jquery.com/jquery-3.6.1.min.js"
        integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
        crossorigin="anonymous">
    </script>
    <style>
        body{
            margin:0px;
        }
        div {
            box-sizing: border-box;
            text-align: center;
        }
        video{
            width: 100%;
            height:100%;
            overflow: hidden;
            padding:0px;
            object-fit: cover;
        }
        a{
            text-decoration: none;
        }
        input{
            background-color: rgb(189, 233, 189);
            border: 2px solid black;
            border-radius: 5px;
            width:200px;
            height:35px;
            margin: 10px;
            margin-top: -5px;
        }
        input[type=text]:focus, input[type=password]:focus{
            background-color: rgb(215, 255, 206);
        }
        button{
            cursor: pointer;
            background-color: rgb(249, 219, 173);
            width:100px;
            height:40px;
            border: 2px solid black;
            border-radius: 5px;
            font-weight:bold;
        }
        .btn:hover, .btn:hover{
            cursor: pointer;
            background-color: rgb(255, 229, 191);
        }
        .btn:active, .btn:active{
            cursor: pointer;
            background-color: rgb(237, 190, 115);
        }
        a>span:nth-child(1){
            color:rgb(155, 205, 138);
            font-weight:600;
        }
        a>span:nth-child(2){
            color:rgb(151, 154, 151);
        }
        .headContainer{
            width:35%;
            height:19.65vh;
            padding:50px;
        }
        .video{
            position: absolute;
            top:0px;
            right:0px;
            width:65%;
            height:100vh;
        }
        .container{
            width:35%;
            height:80vh;
        }
        .headOnTrip{
            font-size:30px;
        }
        .headText{
            font-size:small;
            letter-spacing: 2px;
        }
        .centerText{
            padding-top: 60px;
            font-size: 18px;
            font-weight: 500;
        }
        .title{
            font-size: 60px;
            margin-top: -20px;
            font-weight: 900;
        }
    </style>
</head>
<body>
    <div class="headContainer">
        <a href="index2.html">
            <span class="headOnTrip">OnTrip</span> &nbsp;
            <span class="headText">MAKE YOUR ROUTE OPTIMIZED</span>
        </a>
    </div>

    <div class="video">
        <video src="시퀀스 01.mp4" autoplay muted loop >
        </video>
    </div>
    
<form id="login-form" action="<%= contextPath %>/login.me" method="post">
    <div class="container">
        <div class="centerText">
            <p>바쁜 현대인들을위한</p>
            <p>국내여행 스케줄링 플래너</p>
        </div>

        <div class="title">
            <p>On Trip</p>
        </div>

	
        <div class="input">
            <input type="text" name="userId" placeholder="아이디를 입력하세요." required> <br>
            <input type="password" name="userPwd" placeholder="비밀번호를 입력하세요." required>
        </div>

        <div>
            <button onclick="submitLogin()" class="btn btn-login" type="button">로그인</button>
            <button onclick="enrollPage();" class="btn btn-enroll" type="button">회원가입</button>   
        </div>     
    </div>
</form>

    <script>

        function enrollPage(){
			
        	location.href = "<%=contextPath%>/enrollForm.me";
        }
        
		
        
		
        
    </script>
</body>
</html>