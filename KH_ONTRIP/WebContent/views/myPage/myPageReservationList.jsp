<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date, com.ontrip.member.model.vo.Member"%>
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
    </style>
</head>
<body>

<%@ include file="../common/mypageNewNavbar.jsp" %>

   


      <br><br><br><br>
      <table class="table" style="width:1000px;">
        <span style="font-weight:900; font-size:40px; text-align:center; margin-left:35%;">예약 숙소</span>
        <thead>
          <tr class="table-secondary">
            <th scope="col">번호</th>
            <th scope="col">숙소이름</th>
            <th scope="col">예약날짜</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th scope="row">1</th>
            <td>롯데호텔</td>
            <td>2022-10-31 ~ 2022-11-02</td>
          </tr>
          <tr>
            <th scope="row">2</th>
            <td>신라호텔</td>
            <td>2022-11-31 ~ 2022-12-02</td>
          </tr>
          <tr>
            <th scope="row">3</th>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <th scope="row">4</th>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <th scope="row">5</th>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <th scope="row">6</th>
            <td></td>
            <td></td>
          </tr>
          <!-- 여기에 
            <tr>
                <th scope="row">3</th>
                <td>kh호텔</td>
                <td>2022-12-24 ~ 2022-12-25</td>
            </tr>

            이 양식으로 추가되면 됩니당.
        -->
        </tbody>
      </table>

      <br><br><br><br><br>

      <button style="margin-left:34%;" class="btn btn-num1">&lt;</button>
      <button class="btn btn-num2">1</button>
      <button class="btn btn-num3">2</button>
      <button class="btn btn-num4">3</button>
      <button class="btn btn-num5">4</button>
      <button class="btn btn-num6">&gt;</button>

      

</body>
</html>