<%--
  Created by IntelliJ IDEA.
  User: jay
  Date: 2022/11/14
  Time: 7:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Title</title>
    <style>
        .buttons{
            display: flex;
            justify-content: center;
            align-items: center;

        }
    </style>
</head>
<body>
<div class="buttons">
<form action="/KH_ONTRIP/manager/reviews/play?category=PP" method="post">
    <button type="submit">놀거리</button>
</form>
<form action="/KH_ONTRIP/manager/reviews/play?category=HH" method="post">
    <button type="submit">숙소</button>
</form>
<form action="/KH_ONTRIP/manager/reviews/play?category=FF" method="post">
    <button type="submit">맛집</button>
</form>
</div>
<table class="table table-bordered">
    <thead>
    <tr>
        <th>번호</th>
        <th>시설</th>
        <th>작성자</th>
        <th>작성일</th>
    </tr>
    </thead>

    <tbody>
    <c:forEach var="vo" items="${list}">
        <tr>
            <td>${vo.revCode}</td>
            <td><a href="/KH_ONTRIP/manager/reviews/review?revCode=${vo.revCode}&categoryCode=${vo.category}">${vo.plcName}</a></td>
            <td>${vo.memName}</td>
            <td><fmt:formatDate value="${vo.rnDate }" pattern="yyyy-mm-dd" /></td>
        </tr>
    </c:forEach>
    </tbody>

    <tbody>
    <tr class="paging">
        <td colspan="5">
            <ul class="pagination">

                <c:if test="${page.prev }">
                    <li><a href="/KH_ONTRIP/manager/reviews/play?pageNum=${page.startPage - 1 }&amount=${page.amount}&category=${category}">이전</a></li>
                </c:if>

                <c:forEach var="num" begin="${page.startPage }" end="${page.endPage }">
                    <li  class="${page.pageNum eq num ? 'active' : '' }">
                        <a href="/KH_ONTRIP/manager/reviews/play?pageNum=${num }&amount=${page.amount}&category=${category}">${num }</a></li>
                </c:forEach>

                <c:if test="${page.next }">
                    <li><a href="/KH_ONTRIP/manager/reviews/play?pageNum=${page.endPage + 1 }&amount=${page.amount}&category=${category}">다음</a></li>
                </c:if>
            </ul>
        </td>
    </tr>
    </tbody>
</table>
</body>
</html>
