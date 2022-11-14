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
    <title>온트립(OnTrip) - 예약숙소조회</title>
    <link rel="stylesheet" href="resources/css/res_DetailHotelList.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script
        src="https://code.jquery.com/jquery-3.6.1.min.js"
        integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
        crossorigin="anonymous">
    </script>
</head>
<body>
    <%@ include file="../common/navbar.jsp" %>

      <br><br><br><br>

      <div class="left-categoryBox">
        <div class="userResult">
            <button type="button" id = "n" name="search">여행자 정보</button>
        </div>
        <div class="reserveResult">
            <button type="button" id = "n" name="search">예약 숙소</button>
        </div>
        <div class="heartResult">
            <button type="button" id = "n" name="search">찜 목록</button>
        </div>
        <div class="reviewResult">
            <button type="button" id = "n" name="search">등록 후기</button>
        </div>
        <div class="statusResult">
            <button type="button" id = "n" name="search">회원 탈퇴</button>
        </div>
      </div>

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
                            <tr><span style="font-size:30px; margin-left:20px;">KH호텔</span></tr>
                            <tr>
                                <div style="float:right; width:100px; height:100px; border: 1px solid red;">이미지</div>
                            </tr>
                        </th>

                        <tr>
                            <td>예약자 : &nbsp;</td>
                            <!-- value값은 일부러 만들어 놓은거라 밑에 주석되어있는 코드를 쓰면 됨. -->
                            <td><input type="text" name="userName" value="홍길동"></td>
                            <!-- <td><input type="text" name="userName" value="<%=userName %>"></td> -->
                            <td></td>
                        </tr>
                        <tr>
                            <td>휴대폰번호 : &nbsp;</td>
                            <td><input type="text" name="userPhone" value="010-1234-5678"></td>
                            <!-- <td><input type="text" name="userPhone" value="<%=userPhone %>"></td> -->
                            <td></td>
                        </tr>
                        <tr>
                            <td>성인 : &nbsp;</td>
                            <td><input type="text" name="adult" value="2" size="2">
                            <!-- <td><input type="text" name="adult" value="<%=adult %>"></td> -->
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 어린이 : &nbsp;
                            <input type="text" name="child" value="1" size="2"></td>
                            <!-- <td><input type="text" name="child" value="<%=child %>"></td> -->
                        </tr>
                        <tr>
                            <td>객실수 : &nbsp;</td>
                            <td><input type="text" name="room" value="1" size="2"></td>
                            <!-- <td><input type="text" name="room" value="<%=room %>"></td> -->
                            
                        </tr>
                        <tr>
                            <td>Room Type : &nbsp;</td>
                            <td><input type="text" name="roomType" value="스위트룸" size="2"></td>
                            <!-- <td><input type="text" name="roomType" value="<%=roomType %>"></td> -->
                            <td></td>
                        </tr>
                        <tr>
                            <td>체크인/체크아웃 : &nbsp;</td>
                            <td><input type="text" name="checkInOut" value="2022-10-31 ~ 2022-11-02"></td>
                            <!-- <td><input type="text" name="checkInOut" value="<%=checkInOut %>"></td> -->
                            <td></td>
                        </tr>
                        <tr>
                            <td>가격 : &nbsp;</td>
                            <td><input type="text" name="price" value="2,000,000 KRW"></td>
                            <!-- <td><input type="text" name="price" value="<%=price %>"></td> -->
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