<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
    .outers{
        height: 100%;
        display: inline-block;
        position: relative;
        position: fixed;
        margin-top: 4.5%;
 
    }
    .userResult , .reserveResult , .heartResult , .reviewResult , .statusResult{
        width: 260px;
        height: 200px;
        /* border: 1px solid green;
        background-color: darkseagreen; */
    }
    #n{
        width: 260px;
        height: 200px;
        background-color: darkseagreen;
        border: 1px solid darkgreen;
        color: white;
        font-size: 35px;
        font-family: 'Noto Sans KR', sans-serif;
        font-weight: bold;
        border-radius: 15px;   
    }
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
 
</head>
<body>
    <fieldset>
        <div class="outer">
            <div class="outers">
                 <div class="userResult"> 
                    <button type="button" id = "n" name="search">여행자 정보</button>
                    <!-- 여행자 정보 페이지 a태그 구간-->
                 </div>
                 <div class="reserveResult"> 
                    <button type="button" id = "n" name="search">예약 숙소</button>
                    <!-- 예약 숙소 페이지 a태그 구간-->
                 </div>
                 <div class="heartResult"> 
                    <button type="button" id = "n" name="search">찜 목록</button>
                    <!-- 찜 목록 페이지 a태그 구간-->
                 </div>
                 <div class="reviewResult"> 
                    <button type="button" id = "n" name="search">등록 후기</button>
                    <!-- 등록 후기 페이지 a태그 구간-->
                 </div>
                 <div class="statusResult"> 
                    <button type="button" id = "n" name="search">회원 탈퇴</button>
                    <!-- 회원 탈퇴 페이지 a태그 구간-->
                 </div>
            </div>
         </div>

    </fieldset>

    
</body>
</html>