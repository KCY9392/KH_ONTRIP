<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
  <title>온트립(OnTrip) - 예약페이지</title>

  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

  <!-- jQuery -->
  <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

  <!-- BootStrap 연결 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>


  <!-- css경로 -->
  <link rel="stylesheet" href="<%= contextPath %>/resources/css/reservationform.css">
</head>
<body>
<form action="/KH_ONTRIP/reservation/save" id="enroll-form" method="post">
<div class="rn_navbar" >
  <span class="hotel">${placeName}</span>
  <div class="outer">
    <span id="checkIn">체크인 : </span>
    <input type="date" name="sdate"  value="" required>

    <span id="checkOut">체크아웃 : </span>
    <input type="date" name="edate" value=""  required>
    <span id="day">몇박</span>
  </div>
</div>
<br><br><br><br><br>
<div class="container">
    <div class="centerText">
      <div class="selectRn">
        <br><br><br><br>
        <span class="span_name">예약자 이름 : </span>&nbsp;&nbsp;&nbsp;
        <input type="text" placeholder="여행자 이름" size="14" name="rnName" required>  &nbsp; &nbsp; &nbsp; &nbsp;
        <br><br>
        <hr><br>
        <span class="adult">성인 : </span>&nbsp;&nbsp;&nbsp;
        <select class="select_gender" name="rnAdult">
          <option>인원</option>
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
          <option value="6">6</option>
          <option value="7">7</option>
          <option value="8">8</option>
          <option value="9">9</option>
        </select>

        <span class="child">어린이 : </span> &nbsp;&nbsp;&nbsp;
        <select class="select_gender" name="rnChild">
          <option>인원</option>
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
        </select>
        <br> <br>
        <hr>
        <br>
        <span class="room-no">객실 수 :</span> &nbsp;&nbsp;&nbsp;
        <select class="select_gender" name="rnCount">
          <option>방 갯수</option>
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
        </select>
        <br><br>
        <hr>
        <br>
        <span class="room-type">객실 타입 :</span> &nbsp;&nbsp;&nbsp;
        <select class="select_gender" name="rnType">
          <option>타입</option>
          <option value="스탠다드">스탠다드</option>
          <option value="디럭스">디럭스</option>
          <option value="트윈">트윈</option>
          <option value="패밀리">패밀리</option>
          <option value="스위트">스위트</option>
        </select>
        <br><br>
        <hr>
        <br>
        <span class="span_phone">휴대전화 : </span> &nbsp;&nbsp;&nbsp;
        <input class="input" type="text" placeholder="휴대전화번호 ( ' - ' 포함 )" name="rnPhone" required><br>
        <br>
        <hr><br><br>

        <input type="hidden" name ="plcCode" value="${plcCode}">
        <input type="hidden" name="memNo" value="${memNo}">
        <input type="hidden" name="placeName" value="${placeName}">

        <div id="info" style=" border-radius: 10px;">
          <p style="text-align: left;padding:20px; font-weight: 600">
            <span style="margin-left:35%;">< 객실 기본정보 ></span><br> <br>
            - 3인기준/ 인원추가 불가<br>
            - 에어컨, 중앙난방, TV, 냉장고, 커피포트<br>
            - 욕조, 비대, 드라이기, 가운, 욕실용품<br>
            - 무료 WI-FI<br>
            - 금연객실
          </p>
        </div>
        <br><br>

        <h2 style="text-align: start; margin-left: 80px;">요금정책</h2>
        <div id="info2">
          <p style="text-align: left; padding:20px;">
            상기 요금에 조식은 포함되어있지 않습니다.<br>
            한강 조망(리버뷰) 및 전망 욕실은 추가요금이 발생되며, 예약 희망시 유선 문의 또는 추가 요청
            기재 부탁드립니다.
          </p>
        </div>
        <br><br>
        <h2 style="text-align: start; margin-left: 80px;">취소규정</h2>
        <div id="info2">
          <p style="text-align: left; padding:20px;">
            예약 취소 및 변경은 체크인 하루전 18:00(한국시간)까지 가능합니다.<br>
            예약하신 일자에 체크인 되지 않거나 또는 위의 지정 시간 이후에 예약을 취소했을 경우에는예약 사항에 대해
            노-쇼(No Show)처리되며, 이에 따른 위약금으로 예약 첫날에 해당하는 1박 객실요금이 청구되오니 유의하시기 바랍니다.
          </p>
        </div>

        <br><br><br>

        <div style="text-align:center;">
          <button type="submit" class="btn-pay">결제하러가기</button>
        </div>

        <br><br><br><br><br>
      </div>
    </div>
  </form>
</div>





</form>
</body>
</html>