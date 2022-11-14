<%--
  Created by IntelliJ IDEA.
  User: jay
  Date: 2022/11/12
  Time: 7:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>문의사항 상세조회</title>
    <style>
        .container{
            display: flex;
            flex-direction: column;
            align-items: center;
        }

    </style>
</head>
<body>
<div class="container">
                    <h3 class="title">문의사항 상세조회</h3>
                            <div class="form-group">
                                <div> 제목 : ${byCode.qTitle}</div>
                                <div> 내용 : ${byCode.qContent}</div>
                                <form action="/KH_ONTRIP/manager/questions/answerform/answer?qCode=${byCode.qCode}" method="post">
                                <div> 답변 :<input type="text" name="aContent"> </div>
                                <button type="submit">답변등록</button>
                                </form>
                                <form action="/KH_ONTRIP/manager/questions" method="get">
                                    <div><button type="submit">목록으로</button></div>
                                </form>
                            </div>
</div>


</body>
</html>

