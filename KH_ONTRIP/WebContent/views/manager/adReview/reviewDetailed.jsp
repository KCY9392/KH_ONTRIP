<%--
  Created by IntelliJ IDEA.
  User: jay
  Date: 2022/11/17
  Time: 3:47 PM
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
<div>제목 : ${review.plcName}</div>
<div>작성자 : ${review.memName}</div>
<div>작성일시 : <fmt:formatDate value="${review.revDate}" pattern="yyyy-mm-dd" /></div>
<div>만족도 : ${review.revStar}</div>
<div>청결 : ${review.revC}</div>
<div>서비스 : ${review.revS}</div>
<div>편의 : ${review.revP}</div>
<div>후기  ${review.revText}</div>
</body>
<form action="/KH_ONTRIP/manager/reviews/delete?categoryCode=${categoryCode}&revCode=${revCode}" method="post">
    <button type="submit">삭제하기</button>
</form>
</html>
