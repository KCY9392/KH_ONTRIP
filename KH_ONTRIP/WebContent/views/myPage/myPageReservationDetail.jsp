<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>온트립(OnTrip) - 예약숙소조회</title>
    <link href="<%= request.getContextPath() %>/resources/css/myPageReservationDetail.css" rel="stylesheet" >
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script
        src="https://code.jquery.com/jquery-3.6.1.min.js"
        integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
        crossorigin="anonymous">
    </script>
</head>
<body>
    <%@ include file="../common/navbar.jsp" %>

    <%@ include file="../common/myPageNavbar.jsp" %>

      <div class="container">
        <div class="center" style="width:600px; height:650px; margin-left:35%; margin-top:100px; border:1px solid black; ">
                <div class="centerTitle" style="text-align: center; margin-top:20px;">
                    <h2>예약 숙소 정보</h2>
                </div>
                <br><br>

                <div class="centerDiv">
                  <div class="table-div">
                    <table>
                        <th>
                            <tr><span style="font-size:30px; margin-left:20px;">${rev.plcName}</span></tr>
                            <tr>
                               <div style="float:right; width:100%; height:100%; border: 1px solid red;"><img width="597px" src="/KH_ONTRIP/resources/hotel_Img/${image.changeName}"</div>
                            </tr>
                        </th>

                        <tr>
                            <td>예약자 : ${rev.rnName}</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>휴대폰번호 :${rev.rnPhoneNumber} &nbsp;</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>성인 : ${rev.rnAdult}&nbsp; </td>
                            <td>어린이 : ${rev.rnChild}&nbsp; </td>

                        </tr>
                        <tr>
                            <td>객실수 : &nbsp;${rev.rnCount}</td>
                        </tr>
                        <tr>
                            <td>Room Type : ${rev.rnRoomType} &nbsp;</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>체크인/체크아웃 : <fmt:formatDate value="${rev.rnCheckIn }" pattern="yyyy-mm-dd" /> ~ <fmt:formatDate value="${rev.rnCheckOut }" pattern="yyyy-mm-dd" /></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>가격 : ${rev.rnPrice} 원&nbsp;</td>
                            <td></td>
                        </tr>
                      
                        
                    </table>
                  </div>

                </div>
                <br>
                <!-- 모달창 -->
                <div class="main-bg">
                    <button id="login" class="btn btn-danger" style="margin-left:43%;">예약취소</button>
                  </div>
              

                <div class="black-bg">
                  <div class="white-bg">
                    <h4>예약취소</h4>
            
                    <form action="#">
                      <div class="my-3">
                        <span>예약취소 하시겠습니까?</span>
                        </div>
                        <button type="submit" class="btn btn-primary btn-color1" id="send">확인</button>
                        <button type="button" class="btn btn-danger btn-color2" id="close" style="background-color:grey;">취소</button>
                    </form> 
                  
                  </div>
                </div> 
            
            </div>
        </div>

        <script>

            $('#login').on('click', function(){
              $('.black-bg').addClass('show-modal');
              $('.table-div').css('opacity', '0.3');
              $('.table-div').css('transition', '200ms');
            })
            $('#close').on('click', function(){
              $('.black-bg').removeClass('show-modal');
              $('.table-div').css('opacity', '1');
            })
      
          </script>
</body>
</html>