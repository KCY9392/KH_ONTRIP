<%--
  Created by IntelliJ IDEA.
  User: jay
  Date: 2022/11/13
  Time: 9:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>QNA</title>
    <style>
        .list{
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }


    </style>
</head>
<body>
<div class="list">
    <h2>QNA</h2>
    <form method="get" action="/KH_ONTRIP/manager/qnas/saveform">
        <button>등록하기</button>
    </form>
<div>
  <h3>숙소</h3>
    <div>-------------------------------------------------</div>
    <c:forEach items="${qnaForAccommodation}" var="acco">
    <div>${acco.qaQuestion}</div>
    <div>${acco.qaAnswer}</div>
        <div>-------------------------------------------------</div>
    </c:forEach>
</div>
<div>
    <h3>기능</h3>
    <div>-------------------------------------------------</div>
    <c:forEach items="${qnaForUsing}" var="using">
         <div>${using.qaQuestion}</div>
         <div>${using.qaAnswer}</div>
         <div>-------------------------------------------------</div>
     </c:forEach>
</div>
<div>
    <h3>계정</h3>
    <div>-------------------------------------------------</div>
    <c:forEach items="${qnaForAccount}" var="account">
        <div>${account.qaQuestion}</div>
        <div>${account.qaAnswer}</div>
        <div>-------------------------------------------------</div>
    </c:forEach>
</div>
</div>
</body>
</html>
