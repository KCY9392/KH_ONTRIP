<%--
  Created by IntelliJ IDEA.
  User: jay
  Date: 2022/11/19
  Time: 4:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <form action="/KH_ONTRIP/question/form" method="post">
        <button type="submit">작성하기</button>
    </form>
</div>
<table  class = "list-area">
    <thead>
    <tr>
        <th style="background-color: #eeeeee; text-align: center;" width="70">글번호</th>
        <th style="background-color: #eeeeee; text-align: center;" width="300">제목</th>
        <th style="background-color: #eeeeee; text-align: center;" width="100">등록일</th>
        <th style="background-color: #eeeeee; text-align: center;" width="50">작성자</th>
        <th style="background-color: #eeeeee; text-align: center;" width="50">답변상태</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="vo" items="${list}">
        <tr>
            <td>${vo.qCode }</td>
            <td><a href="/KH_ONTRIP/question/queDetailed?qCode=${vo.qCode}&memNo=${vo.memNum}">${vo.qTitle}</td>
            <td><fmt:formatDate value="${vo.qDate }" pattern="yyyy-mm-dd" /></td>
            <td>${vo.memName}</td>
            <td>
            <c:choose>
                <c:when test="${vo.aContent eq null}">
                   <span style="color:red">답변대기</span>
                </c:when>
                <c:otherwise>
                    답변완료
                </c:otherwise>
            </c:choose>
            </td>
        </tr>
    </c:forEach>


    </tbody>
    <tbody>
    <tr>
        <td colspan="5">
            <ul class="pagination">

                <c:if test="${page.prev }">
                    <li><a href="/KH_ONTRIP/question/questions?pageNum=${page.startPage - 1 }&amount=${page.amount}">이전</a></li>
                </c:if>

                <c:forEach var="num" begin="${page.startPage }" end="${page.endPage }">
                    <li  class="${page.pageNum eq num ? 'active' : '' }">
                        <a href="/KH_ONTRIP/question/questions?pageNum=${num }&amount=${page.amount}">${num }</a></li>
                </c:forEach>

                <c:if test="${page.next }">
                    <li><a href="/KH_ONTRIP/question/questions?pageNum=${page.endPage + 1 }&amount=${page.amount}">다음</a></li>
                </c:if>
            </ul>
        </td>
    </tr>
    </tbody>
</table>
</body>
</html>
