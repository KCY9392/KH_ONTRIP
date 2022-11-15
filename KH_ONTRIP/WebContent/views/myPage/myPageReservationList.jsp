<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>온트립(OnTrip) - 예약숙소</title>
    <link href="<%= request.getContextPath() %>/resources/css/myPageReservationList.css" rel="stylesheet" >
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
    <%@ include file="../common/navbar.jsp" %>

    <%@ include file="../common/myPageNavbar.jsp" %>


      <br><br><br><br>
      <table class="table" style="width:1000px">
        <h1 style="font-weight:900; margin-left:50%;">예약 숙소</h1>
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

      <br><br><br><br><br><br>

      <button class="btn btn-num1">&lt;</button>
      <button class="btn btn-num2">1</button>
      <button class="btn btn-num3">2</button>
      <button class="btn btn-num4">3</button>
      <button class="btn btn-num5">4</button>
      <button class="btn btn-num6">&gt;</button>

      

</body>
</html>