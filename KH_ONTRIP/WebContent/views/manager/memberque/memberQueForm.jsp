<%--
  Created by IntelliJ IDEA.
  User: jay
  Date: 2022/11/19
  Time: 7:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <title>Title</title>
</head>
<body>


<form method="post" action="/KH_ONTRIP/question/write">
<div> 제목 : <input type="text" name="qTitle"> </div>
<div> 내용 : <input type="text" name="qContent"> </div>
  <input type="hidden" name="memName" value="${memName}">
  <input type="hidden" name="memNo" value="${memNo}">
    <button type="submit">등록하기</button>
</form>
<form action="/KH_ONTRIP/question/questions" method="get">
    <button type="submit">목록으로</button>
</form>


</body>
</html>
