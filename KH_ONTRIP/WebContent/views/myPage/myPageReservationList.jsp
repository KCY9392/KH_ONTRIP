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
    <title>온트립(OnTrip) - 예약숙소</title>
    <link href="<%= request.getContextPath() %>/resources/css/myPageReservationList.css" rel="stylesheet" >
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
    <%@ include file="../common/navbar.jsp" %>

    <%@ include file="../common/myPageNavbar.jsp" %>


      <br><br><br><br>
      <table class="table" style="width:1000px">
        <span style="font-weight:900; font-size:40px; margin-left:-10%;">예약 숙소</span>
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
            <td><fmt:formatDate value="${vo.rnCheckIn }" pattern="yyyy-mm-dd" /> ~ <fmt:formatDate value="${vo.rnCheckOut }" pattern="yyyy-mm-dd" /></td>
          </tr>
        </c:forEach>
        </tbody>
      </table>

      <br><br><br><br><br>

    <ul class="pagination" style="margin-left:45%; font-size:16px;" >



        <c:if test="${page.prev }">

            <li>
                <a href="/KH_ONTRIP/myPage/reservationList?pageNum=${page.startPage - 1 }&amount=${page.amount}"><</a>
            </li>

        </c:if>

        <c:forEach var="num" begin="${page.startPage }" end="${page.endPage }">

            <li   class="${page.pageNum eq num ? 'active' : '' }" style="margin-left:20px;">
                <a href="/KH_ONTRIP/myPage/reservationList?pageNum=${num }&amount=${page.amount}" style="text-decoration:none; color:black;">${num }</a>
            </li>

        </c:forEach>

        <c:if test="${page.next }">

            <li>
                <a href="/KH_ONTRIP/myPage/reservationList?pageNum=${page.endPage + 1 }&amount=${page.amount}">></a>
            </li>

        </c:if>


    </ul>





</body>
</html>