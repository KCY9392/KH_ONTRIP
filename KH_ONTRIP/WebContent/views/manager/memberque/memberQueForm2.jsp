<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: jay
  Date: 2022/11/12
  Time: 6:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


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

  <title>문의사항 등록</title>
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
  </style>
  </style>
</head>
<body>

<%@ include file="../../common/navbar.jsp" %>

<br><br><br><br><br>

<div class="container">
  <h2 class="panel-title" style="color:rgb(5, 198, 37);">문의사항 등록</h2> <br>
  <div class="form-group" style="text-align:center;">
    <form method="post" action="/KH_ONTRIP/question/write">
    <span> 제목 : <input type="text" name="qTitle" required> </span> <br><br>
    <span> 내용</span> <br>

    <textarea cols="50" rows="7" name="qContent" required></textarea>  <br><br>
      <input type="hidden" name="memName" value="${memName}">
      <input type="hidden" name="memNo" value="${memNo}">
      <button type="submit">등록하기</button>
    </form>


    <br><br><br><br>
    <form action="/KH_ONTRIP/question/questions" method="get">
      <div><button type="submit">목록으로</button></div>
    </form>
  </div>
</div>

</body>
</html>