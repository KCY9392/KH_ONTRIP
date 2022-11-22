<%--
  Created by IntelliJ IDEA.
  User: jay
  Date: 2022/11/19
  Time: 11:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/KH_ONTRIP/question/queUpdateForm">
<div> 제목 : ${memberQuestionDetailed.qTitle} </div>
<div> 내용 : ${memberQuestionDetailed.qContent} </div>
<div> 답변 : ${memberQuestionDetailed.aContent}</div>
<input type="hidden" name="qCode" value="${memberQuestionDetailed.qCode}">
    <input type="hidden" name="qTitle" value="${memberQuestionDetailed.qTitle}">
    <input type="hidden" name="qContent" value="${memberQuestionDetailed.qContent}">
    <c:if test="${isUpdated}">
    <button type="submit">수정하기</button>
    </c:if>
</form>
<form action="/KH_ONTRIP/question/questions" method="get">
    <button type="submit">목록으로</button>
</form>
<form action="/KH_ONTRIP/question/queDelete?qCode=${memberQuestionDetailed.qCode}" method="get">
    <button type="submit">삭제하기</button>
</form>

</body>
</html>
