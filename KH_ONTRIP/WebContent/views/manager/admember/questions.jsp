
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<html>
<head>
    <title>Title</title>
    <style>
        table {
            width: 40%;
            border: 1px solid #444444;
            border-collapse: collapse;

        }
        th, td {
            border: 1px solid #444444;
        }


        ul{
      display: flex;
      list-style:none;
      padding-left:0px;
  }
  .container{
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      position: relative;

  }
  .pagination{
      display: flex;
      justify-content: center;

  }
    </style>
</head>
<body>
<%@ include file="/views/manager/AdminNavbar.jsp" %>
<div class="container">
    <h3>문의사항 관리</h3>

    <table class="table table-bordered">
        <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>등록일</th>
            <th>조회수</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="vo" items="${list}">
            <tr>
                <td><a href="/KH_ONTRIP/manager/questions/question?qCode=${vo.qCode}">${vo.qCode }</a></td>
                <td>${vo.qTitle}</td>
                <td><fmt:formatDate value="${vo.qDate }" pattern="yyyy-mm-dd" /></td>
                <td>${vo.qCount}</td>
            </tr>
        </c:forEach>
        </tbody>

        <tbody>
        <tr>
            <td colspan="5">
                <ul class="pagination">

                    <c:if test="${page.prev }">
                        <li><a href="/KH_ONTRIP/manager/questions?pageNum=${page.startPage - 1 }&amount=${page.amount}">이전</a></li>
                    </c:if>

                    <c:forEach var="num" begin="${page.startPage }" end="${page.endPage }">
                        <li  class="${page.pageNum eq num ? 'active' : '' }">
                            <a href="/KH_ONTRIP/manager/questions?pageNum=${num }&amount=${page.amount}">${num }</a></li>
                    </c:forEach>

                    <c:if test="${page.next }">
                        <li><a href="/KH_ONTRIP/manager/questions?pageNum=${page.endPage + 1 }&amount=${page.amount}">다음</a></li>
                    </c:if>
                </ul>
            </td>
        </tr>
        </tbody>
    </table>
</div>
</body>



</html>
