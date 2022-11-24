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

  <title>문의사항 상세조회</title>
  <style>
    .container{
      display: flex;
      flex-direction: column;
      align-items: center;
      /* box-shadow:0 0 5px; */
	  /* background: linear-gradient(90deg, rgb(242, 245, 166) 0%, rgb(245, 245, 245) 35%, rgb(65, 183, 95) 100%); */
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
    div>button:nth-child(1) , .btn-delete{
      background-color: white;
      border:none;
      color:rgb(62, 131, 135);
      font-size: 15px;
      font-weight: 900;
    }
    div>button:nth-child(1):hover, .btn-delete:hover{
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
  </style>

</head>
<body>

<%@ include file="../../common/navbar.jsp" %>


<br><br><br><br><br>

     <div class="uk-flex uk-flex-center uk-flex-middle uk-background-cover " style="margin:auto; width: 90vw; height: 60vh; background-image: url(&quot;https://www.myro.co.kr/myro_image/mainN7.jpg&quot;);">
        <h3 style="color:white; font-size:50px;">ONTRIP &nbsp;&nbsp; 문의사항</h3>
    </div>

    <br><br><br>

    <div class="uk-section uk-section-default" style="min-width: 90vw; height:20vh;">
        <div class="uk-container">
            <div style="text-align: center; margin-top : -1.5%;">
                <div style="font-size:40px; font-weight:600;">OnTrip</div><br>
                <div style="color:darkgray">MAKE YOUR ROUTE OPTIMIZED</div>
            </div>
        </div>
    </div>

    <br><br><br>



<div class="container">
	<br><br>
  <h2 class="panel-title" style="color:rgb(5, 198, 37);">문의사항 상세조회</h2> <br>
  <div class="form-group" style="text-align:center;">
    <form method="post" action="/KH_ONTRIP/question/queUpdateForm">
    <span> 제목 : ${memberQuestionDetailed.qTitle}</span> <br><br>
    <span> 내용</span> <br>
    <textarea cols="50" rows="7" readonly>${memberQuestionDetailed.qContent}</textarea>  <br><br>
    <span> 답변 </span> <br>
    <textarea cols="50" rows="10"readonly>${memberQuestionDetailed.aContent}</textarea>

    <br><br>
      <input type="hidden" name="qCode" value="${memberQuestionDetailed.qCode}">
      <input type="hidden" name="qTitle" value="${memberQuestionDetailed.qTitle}">
      <input type="hidden" name="qContent" value="${memberQuestionDetailed.qContent}">
      
      <div style="display:flex;">
	      <c:if test="${isUpdated}">
	        <button type="submit" class="btn-modify" style="float:left; margin:auto;">수정하기</button>
	      </c:if>
	    </form>
	    
		<form action="/KH_ONTRIP/question/queDelete?qCode=${memberQuestionDetailed.qCode}" method="post">
	      <button type="submit" class="btn-delete" style="margin-right:83px;">삭제하기</button>
	    </form>
	    </div>
    <br><br><br><br>
    
    <form action="/KH_ONTRIP/question/questions" method="get">
      <div><button type="submit">목록으로</button></div>
    </form>
    <br><br>
  </div>
</div>

</body>
</html>