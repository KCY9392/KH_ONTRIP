<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제완료화면</title>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

    <!-- BootStrap 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    <!-- CSS 연결 -->
    <link rel="stylesheet" href="<%= contextPath %>/resources/css/reservationstatus.css">

</head>
<body id="page2" class="slide-in">
<div class="container1" >
    <i class="fa-regular fa-circle-check fa-4x" style="color:red;">
        <span style="color:black;">결제가 완료되었습니다.</span>
    </i>

    <br><br><br><br><br><br>

    <form action="/KH_ONTRIP/start.me" style="display:inline-block;">
        <!-- 클릭시 메인페이지로 이동 -->
        <button type="submit">홈화면</button>
    </form>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <form action="<%= request.getContextPath() %>/myPage/reservationList" style="display:inline-block;">
        <!-- 클릭시 마이페이지 예약숙소 목록으로 이동 -->
        <button type="submit">마이페이지</button>
    </form>
</div>
</body>
</html>