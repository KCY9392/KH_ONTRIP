<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>온트립(OnTrip) - 후기관리</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reviewDetail_manager.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<%@ include file="../../common/navbar.jsp" %>
<%@ include file="../../common/managerNavbar.jsp" %>


<div style="text-align:center; margin-top:20px;">
    <b style="font-size:30px; font-weight:900;">관리자페이지 - 등록후기 관리</b>
</div>
<div class="containerBox">
    <div class="title">
        <span style="font-weight:900; font-size:25px;">제목 : ${review.plcName}</span><br>
        <span>작성자 : ${review.memName}</span>
        <!-- <input type="text" name="userName" value="송지호" style="width:50px;"> -->
        <br>
        <span>작성 일시 : <fmt:formatDate value="${review.revDate}" pattern="yyyy-mm-dd" /></span>
        <!-- <input type="text" name="reviewDate" value="2022년 10월 28일" style="width:130px;">-->
        <br><br>
        <span>만족도 : ${review.revStar}</span><br>

        <!-- <i class="fa-solid fa-star"></i>
        <i class="fa-solid fa-star"></i>
        <i class="fa-regular fa-star"></i>
        <i class="fa-regular fa-star"></i>
        <i class="fa-regular fa-star"></i> -->

    </div>
    <br>
    <div class="anotherInfo" style="border:2px solid rgb(0, 166, 25)">
        <span>- 청결 : ${review.revC} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
        <!-- <input type="text" value="3/10"> -->
        <br>
        <span>- 서비스 : ${review.revS} &nbsp;&nbsp;&nbsp;&nbsp;</span>
        <!-- <input type="text" value="3/10"> -->
        <br>
        <span>- 편의 : ${review.revP} &nbsp;</span>
        <!-- <input type="text" value="3/10"> -->
        <br><br>
        <span>- 후기</span><br><br>
        <textarea cols="30" rows="10">
            ${review.revText}
        </textarea>

        <form action="/KH_ONTRIP/manager/reviews/delete?categoryCode=${categoryCode}&revCode=${revCode}" method="post">
            <button style="background-color:blanchedalmond;">삭제</button>
            <!-- 삭제 클릭시 사용자가 작성한 리뷰 삭제. -->
        </form>
    </div>

</div>
</body>
</html>