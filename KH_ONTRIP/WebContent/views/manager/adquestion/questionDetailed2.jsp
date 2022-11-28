<%--
  Created by IntelliJ IDEA.
  User: jay
  Date: 2022/11/12
  Time: 6:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

    <!-- BootStrap 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    <title>문의사항 상세조회1</title>
    <style>
        .container{
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        <style>
         .container{
             display: flex;
             flex-direction: column;
             align-items: center;
         }
        .panel-title{
            font-size:35px;
        }
        span{
            font-size: 20px;
            font-weight: bold;
        }
        textarea{
            padding:5px;
            border:1px solid rgb(171, 168, 168);
            border-radius: 5px;
            resize: none;
        }
        .btn-5{
            padding:5px;
            width:130px;
            height:50px;
            border:none;
            border-radius: 10px;
            font-weight: 900;
            color:green;
            cursor: pointer;
            font-size: 16px;
        }
        .btn-5:hover{
            background-color: rgb(215, 211, 211) ;
        }
        .btn-5:active{
            background-color: rgb(180, 177, 177) ;
        }
        div>button:nth-child(1){
            background-color: white;
            border:none;
            color:rgb(62, 131, 135);
            font-size: 15px;
            font-weight: 900;
        }
        div>button:nth-child(1):hover{
            cursor: pointer;
            color:rgb(115, 183, 187);
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
	textarea{
		border:none;
		box-shadow:0 0 5px grey;
	}
    </style>
    
</head>
<body>

<%@ include file="../../common/adnavbar.jsp" %>

<br><br><br>
<div class="uk-section uk-section-default sl-in2" style="min-width: 90vw; height:28vh;">
        <div class="uk-container">
            <div style="text-align: center; margin-top : -1.5%;">
                <div style="font-size:40px; font-weight:600;">OnTrip</div><br>
                <div style="color:darkgray">MAKE YOUR ROUTE OPTIMIZED</div> <br><br>
                <div>
                	<span style="color: coral; font-size:16px; font-weight:600;">문의사항 상세조회</span>
                </div>
            </div>
        </div>
    </div>
<br><br>
<div class="container">
    
    <div class="form-group" style="text-align:center;">
        <span style="font-size:30px;"> 제목 : ${questionByCode.qTitle}</span> <br><br><br>
        <span> 내용</span> <br><br>
        <textarea cols="60" rows="10" readonly>${questionByCode.qContent}</textarea>  <br><br>
        <span> 답변 </span> <br><br>
        <textarea cols="60" rows="10"readonly>${questionByCode.aContent}</textarea>

        <br><br>
        <c:if test="${isUpdated}">
        <form action="/KH_ONTRIP/manager/questions/answerform?qCode=${questionByCode.qCode}" method="post">
            <button class="btn-5" type="submit">답변하기</button>
        </form>
        </c:if>

        <br><br><br>
        <form action="/KH_ONTRIP/manager/questions" method="get">
            <div><button type="submit">목록으로</button></div>
        </form>
    </div>
</div>
<br><br><br>
</body>
</html>