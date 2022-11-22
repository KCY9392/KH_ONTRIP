<%--
  Created by IntelliJ IDEA.
  User: jay
  Date: 2022/11/19
  Time: 11:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/KH_ONTRIP/question/queUpdate">
  <div> 제목 : <input type="text" name="qTitle" value="${qTitle}"></div>
  <div> 내용 : <input type="text" name="qContent" value="${qContent}"></div>
  <input type="hidden" name="qCode" value="${qCode}">
  <button type="submit">등록하기</button>
</form>
<form action="/KH_ONTRIP/question/questions" method="get">
    <button type="submit">목록으로</button>
</form>
</body>
</html>
