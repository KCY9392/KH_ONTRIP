<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date, com.ontrip.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
    String contextPath = request.getContextPath();
%>
<% 
   Member loginUser = (Member) session.getAttribute("loginUser");
   // 로그인전 or 로그인 실패 : null
   // 로그인 성공후 : 로그인한 회원의 정보가 담긴 member객체.
   
   String alertMsg = (String) session.getAttribute("alertMsg");
   // 서비스 요청전 : null
   // 서비스 요청성공후 : alert로 띄워줄 메시지 문구.
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>온트립(OnTrip) - 예약숙소</title>
    
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

    <!-- BootStrap 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    
    
    <link href="<%= request.getContextPath() %>/resources/css/myPageReservationList.css" rel="stylesheet" >
    
    <style>
    .btn-outline-success:hover{
      background-color:white;
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
      font-weight:bold;
      color: gray !important;
      border-radius:10px;
      background-color:rgb(246, 246, 246);
   }
   .btnDiv button:hover{
      background-color:yellowgreen;
      color:white !important;
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
       transform: translateY(80%);
     }
   
     to {
       transform: translateY(0%);
     }
   }
   ul{
  	 list-style:none;
   }
   a{
   	 text-decoration:none;
   	 color:black;
   }
    </style>
</head>
<body>

<%@ include file="../common/mypageNewNavbar.jsp" %>
<br><br><br>

   <div class="uk-flex uk-flex-center uk-flex-middle uk-background-cover " style="margin:auto; width: 90vw; height: 60vh;
            background-image: url(&quot;https://www.myro.co.kr/myro_image/mainN7.jpg&quot;);">
        <h3 style="color:white; font-size:50px;">ONTRIP :</h3> &nbsp;&nbsp;&nbsp;&nbsp; 
        <h1 style="font-size:55px; color:rgb(85, 84, 84);">예약 숙소</h1>
    </div>

    <br><br><br>

    <div class="uk-section uk-section-default sl-in2" style="min-width: 90vw; height:20vh;">
        <div class="uk-container">
            <div style="text-align: center; margin-top : -1.5%;">
                <div style="font-size:40px; font-weight:600;">OnTrip</div><br>
                <div style="color:darkgray">MAKE YOUR ROUTE OPTIMIZED</div>
            </div>
        </div>
    </div>

    <br><br><br>


<div style="box-shadow:0 0 10px 1px yellowgreen; width:1000px; margin:auto; text-align:center; padding-top:30px; padding-bottom:30px;">
        <span style="font-weight:900; font-size:40px; ">예약 숙소</span>
        <br><br><br><br>
        
      <table class="table" style="width:1000px; margin:auto;">
        <thead>
          <tr class="table-secondary">
            <th scope="col">번호</th>
            <th scope="col">숙소이름</th>
            <th scope="col">예약날짜</th>
          </tr>
        </thead>
        <tbody>
        
	        <c:forEach var="vo" items="${list}">
	          <tr>
	            <th scope="row">${vo.rnCode}</th>
	              <td><a href="/KH_ONTRIP/myPage/reservationList/Detailed?rnCode=${vo.rnCode}">${vo.plcName}</a></td>
	            <td><fmt:formatDate value="${vo.rnCheckIn }" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${vo.rnCheckOut }" pattern="yyyy-MM-dd" /></td>
	          </tr>
	        </c:forEach>

        </tbody>
      </table>

      <br><br><br>
      
      <ul>
      	<c:if test="${page.prev }">

            <li>
                <a href="/KH_ONTRIP/myPage/reservationList?pageNum=${page.startPage - 1 }&amount=${page.amount}"><</a>
            </li>

        </c:if>

        <c:forEach var="num" begin="${page.startPage }" end="${page.endPage }">

            <li   class="${page.pageNum eq num ? 'active' : '' }">
                <a href="/KH_ONTRIP/myPage/reservationList?pageNum=${num }&amount=${page.amount}" style="text-decoration:none; color:black;">${num }</a>
            </li>

        </c:forEach>

        <c:if test="${page.next }">

            <li>
                <a href="/KH_ONTRIP/myPage/reservationList?pageNum=${page.endPage + 1 }&amount=${page.amount}">></a>
            </li>

        </c:if>


    </ul>
      
      
</div>
      <br><br><br><br><br>

</body>
</html>