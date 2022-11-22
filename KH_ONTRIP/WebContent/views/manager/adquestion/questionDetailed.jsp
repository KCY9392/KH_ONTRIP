<%--
  Created by IntelliJ IDEA.
  User: jay
  Date: 2022/11/12
  Time: 6:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>문의사항 상세조회</title>
    <style>
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
    </style>
</head>
<body>
<div class="container">
    <h3 class="panel-title">문의사항 상세조회</h3>
    <div class="form-group">
        <div> 제목 : ${questionByCode.qTitle}</div>
        <div> 내용 : ${questionByCode.qContent}</div>
        <div> 답변 : ${questionByCode.aContent} </div>
        <c:if test="${isUpdated}">
            <form action="/KH_ONTRIP/manager/questions/answerform?qCode=${questionByCode.qCode}" method="post">
                <button type="submit">답변하기</button>
            </form>
        </c:if>

        <form action="/KH_ONTRIP/manager/questions" method="get">
            <div>
                <button type="submit">목록으로</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
