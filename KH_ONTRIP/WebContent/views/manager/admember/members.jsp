<%--
  Created by IntelliJ IDEA.
  User: jay
  Date: 2022/11/09
  Time: 7:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <style>
        .main{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;

        }

        table {
            width: 40%;
            border: 1px solid #444444;
            border-collapse: collapse;

        }
        th, td {
            border: 1px solid #444444;
        }

    </style>
</head>
<body>
<%@ include file="/views/manager/AdminNavbar.jsp" %>
<div class="main">
<div>
    <h3>회원관리페이지</h3>
</div>
<div>
    회원리스트
</div>

<table>
  <tr>
      <th>회원번호</th>
      <th>회원이름</th>
      <th>가입일자</th>
  </tr>
  <c:forEach items="${members}" var="list">
      <tr>
          <td>
              <a href="/KH_ONTRIP/manager/members/member?memberNo=${list.memberNo}">${list.memberNo}</a>
          </td>
          <td>${list.memberName}</td>
          <td><fmt:formatDate value="${list.enrollDate}" pattern="yyyy-MM-dd"/></td>
      </tr>
  </c:forEach>
</table>
</div>



</body>
</html>
