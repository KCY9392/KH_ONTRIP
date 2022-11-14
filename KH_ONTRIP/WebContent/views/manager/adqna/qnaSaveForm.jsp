<%--
  Created by IntelliJ IDEA.
  User: jay
  Date: 2022/11/14
  Time: 12:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/KH_ONTRIP/manager/qnas/save">
<h3>질문내용</h3>
<div>
    <select name="category">
        <option value="숙소">숙소</option>
        <option value="기능">기능</option>
        <option value="계정">계정</option>
    </select>
    <input type="text" name="question">
</div>
<h4>답변내용</h4>
<div>
    <input type="text" name="answer">
</div>
    <button type="submit">등록하기</button>
</form>

</body>
</html>
