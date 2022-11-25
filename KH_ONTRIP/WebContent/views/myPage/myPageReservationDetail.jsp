<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>온트립(OnTrip) - 예약숙소조회</title>
    <link href="<%= request.getContextPath() %>/resources/css/myPageReservationDetail.css" rel="stylesheet" >
    
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
	tr>td:nth-child(1){
		font-size:16px;
		font-weight:bold;
	}
    </style>
</head>
<body>
   <%@ include file="../common/mypageNewNavbar.jsp" %>
	<br><br><br>


<div class="uk-section uk-section-default sl-in2" style="min-width: 90vw; height:28vh;">
        <div class="uk-container">
            <div style="text-align: center; margin-top : -1.5%;">
                <div style="font-size:40px; font-weight:600;">OnTrip</div><br>
                <div style="color:darkgray">MAKE YOUR ROUTE OPTIMIZED</div>
                <br> <br>
				<div>
					<span style="color: coral; font-size: 16px; font-weight: 600;">예약숙소 확인</span>
				</div>
            </div>
        </div>
    </div>

    <br><br><br>
      <div class="container2" style="margin:auto;">
        <div class="center" style="width:800px; height:900px;  margin:auto;
               border:none; box-shadow: 0 0 5px; ">
                <div class="centerTitle" style="text-align: center; margin-top:20px; padding-top:30px; padding-bottom:30px;" > <br>
                    <h2 style="font-weight:900; color:cadetblue;">예약 숙소 정보</h2><br>
                    <div style="margin:auto; width:80%; height:250px; border: 1px solid rgb(55, 55, 55);">
                      <img style="width:100%; height:100%;" src="/KH_ONTRIP/resources/hotel_Img/${image.changeName}">
                    </div>
                </div>
                <br>

                <div class="centerDiv" style="margin-left:10%;">
                  <div class="table-div" style="margin:auto;">
                    <table>
                        <th>
                            <tr><span style="font-size:30px; margin-left:25%;">${rev.plcName}</span><br></tr>
                        </th>
                        <br>
                        <tr>
                            <td>예약자 : &nbsp;</td>
                            <!-- value값은 일부러 만들어 놓은거라 밑에 주석되어있는 코드를 쓰면 됨. -->
                            <td><input type="text" value="${rev.rnName}"></td>
                            
                            <td></td>
                        </tr>
                        <tr>
                            <td>휴대폰번호 : &nbsp;</td>
                            <td><input type="text" value="${rev.rnPhoneNumber}"></td>
                            
                            <td></td>
                        </tr>
                        <tr>
                            <td>성인 : &nbsp;</td>
                            <td><input type="text" value="${rev.rnAdult}" size="2">
                            
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 어린이 : &nbsp;
                            <input type="text" name="child" value="${rev.rnChild}" size="2"></td>
                            
                        </tr>
                        <tr>
                            <td>객실수 : &nbsp;</td>
                            <td><input type="text" value="${rev.rnCount}" size="2"></td>
                            
                            
                        </tr>
                        <tr>
                            <td>Room Type : &nbsp;</td>
                            <td><input type="text" value="${rev.rnRoomType}" size="2"></td>
                            
                            <td></td>
                        </tr>
                        <tr>
                            <td>체크인/체크아웃 : &nbsp;</td>
                            <td><input type="text" value="<fmt:formatDate value="${rev.rnCheckIn }" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${rev.rnCheckOut }" pattern="yyyy-MM-dd" />"></td>
                            
                            <td></td>
                        </tr>
                        <tr>
                            <td>가격 : &nbsp;</td>
                            <td><input type="text" value="${rev.rnPrice} KRW"></td>
                            
                            <td></td>
                        </tr>
                      
                        
                    </table>
                  </div>

                </div>
                <br><br><br>
                
                <p style="text-align:center; font-weight:600; color:grey;">* 예약취소 관련 문의는 고객센터를 이용해주세요.</p>
               
            
            </div>
        </div>

		<br><br><br><br>
       
</body>
</html>