<%@ page contentType="text/html; charset=UTF-8" language="java"  pageEncoding="UTF-8" %>
<%
    String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>qna 등록화면</title>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

    <!-- BootStrap 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    <!-- CSS 연결 -->
    <link rel="stylesheet" href="<%= request.getContextPath()%>/resources/css/qnaSave.css?after>">
</head>
<body>

<%@ include file="../../common/adnavbar.jsp"%>

<br><br><br><br><br>


<div class="title">
    <pre id="qnaTitle" style="text-align:center;">무엇을 도와드릴까요?</pre>
</div>

<br><br><br>

<form method="post" action="/KH_ONTRIP/manager/qnas/save">
    <h3>질문내용</h3><br>
    <div>
        <select name="category">
            <option value="숙소">숙소</option>
            <option value="기능">기능</option>
            <option value="계정">계정</option>
        </select><br><br>
        <!-- <input type="text" name="question"> -->

        <textarea name="question" cols="50" rows="5"></textarea>
    </div>

    <br><br><br>

    <h3>답변내용</h3><br>

    <div>
        <!-- <input type="text" name="answer"> -->
        <textarea name="answer" cols="50" rows="5"></textarea>
    </div>

    <br><br>

    <button type="submit">등록하기</button>
</form>

<br><br><br>
</body>
</html>