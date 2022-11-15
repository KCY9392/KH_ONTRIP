<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
    .outer{
        background-color: white; /* 해당사이트의 고유한 색상으로 작성 */
        color: black;
        width: 1000px;
        height: 1900px;
        /* border: 1px solid black; */
        margin: auto;
        margin-top: 350px;
        box-sizing: border-box;
        /* text-align: center; */
    }
    .title{
        height: 4%;
        border: 2px solid black;
        background-color: black;
        border-left: 0;
        border-right: 0;
        border-top: 0;
        /* rgba(143, 212, 143, 0.911); => 연두색 */
    }
    #qnaTitle{
        font-size: 40px;
        color: white;
        font-weight: bold;
        margin-left: 60px;
        margin-top: 30px;
        font-family: 'Noto Sans KR', sans-serif;
    }
    .qna{
        height: 6%;
        /* border: 1px solid blueviolet; */
        font-weight: bold;
        
    }
    #qnap{
        margin-left: 250px;
        margin-top: 60px;
        font-size: 40px;
        margin-top: 30px;
        margin-left: 350px;
        font-family: 'Noto Sans KR', sans-serif;
    }
    #htitle{
        font-size: 30px;
        font-weight: bold;
        margin-left: 150px;
        font-family: 'Noto Sans KR', sans-serif;
    }
    #q{
        margin-left: 150px;  
        width: 700px;
        height: 30px;
    }
    #p{
        margin-left: 150px;  
        font-family: 'Noto Sans KR', sans-serif;
    }
    .divForm1{
        /* background-color: rgb(206, 206, 204); */
        width: 300px;
        height: 30px;
        text-align: center;
        line-height: 30px;
        border: 2px dashed rgb(206, 206, 204);
        border-top: 0;
        border-left: 0;
        border-right: 0;
        border-radius: 3px;
        cursor: pointer;
        font-size: 20px;
    }
    p{
        border: 1px solid rgb(206, 206, 204);
        width: 703px;
        height: 100px;
        margin-top: 5px;
        border-radius: 3px;
        padding: 10px;
        box-sizing: border-box;
        display: none;
        background-color: rgba(248, 248, 248, 0.863);
    }
    #bfont{
        float: left;
        margin-left: 8px;
        font-family: 'Noto Sans KR', sans-serif;
        font-weight: 1000;
    }
</style>
</head>
<body>
    <%@ include file="../common/navbar.jsp" %>


    <div class="outer">
        <div class="title">
            <pre id="qnaTitle">무엇을 도와드릴까요?</pre>
        </div>
        <br><br>
        <div class="qna">
            <br><br><br><br><br>
            <img src="전구.png" width="70px" style="margin-left: 450px;">
            <pre id="qnap">자주 찾는 도움말</pre>
        </div>
        <br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br>
        <pre id="htitle"><img src="숙소.png" width="50px">&nbsp;&nbsp;숙소</pre>
        <hr width="70%" style="margin-top: -10px;">
        <br>
        <c:forEach items="${qnaForAccommodation}" var="acco">
        <div id="q" class="divForm1" name="divForm1"><b id="bfont">Q . 숙소 등급 출처는 어디인가요?</b></div>
        <p id="p" class="divForm2">A . 테스트 중이에요 </p> 
        <br>
        <div id="q" class="divForm1" name="divForm1"><b id="bfont">Q . 숙소 리뷰 평점은 믿을만 한가요?</b></div>
        <p id="p" class="divForm2">A . 테스트 중이에요 </p> 
        <br>
        <div id="q" class="divForm1" name="divForm1"><b id="bfont">Q . 리뷰는 누가 작성하나요?</b></div>
        <p id="p" class="divForm2">A . 테스트 중이에요 </p> 
        <br>
        <div id="q" class="divForm1" name="divForm1"><b id="bfont">Q . 숙소 연락처를 알고 싶습니다.</b></div>
        <p id="p" class="divForm2">A . 테스트 중이에요 </p>
        </c:forEach> 
        <br>
        <br>
        <br>
        <pre id="htitle"><img src="기능.png" width="50px">&nbsp;&nbsp;기능</pre>
        <hr width="70%" style="margin-top: -10px;">
        <br>
        <div id="q" class="divForm1" name="divForm1"><b id="bfont">Q . 찜목록 기능은 어떻게 사용하나요?</b></div>
        <p id="p" class="divForm2">A . 테스트 중이에요 </p>
        <br>
        <div id="q" class="divForm1" name="divForm1"><b id="bfont">Q . 검색 기능은 어떻게 사용하나요?</b></div>
        <p id="p" class="divForm2">A . 테스트 중이에요 </p>
        <br>
        <div id="q" class="divForm1" name="divForm1"><b id="bfont">Q . 예약 기능은 없나요?</b></div>
        <p id="p" class="divForm2">A . 테스트 중이에요 </p>
        <br>
        <div id="q" class="divForm1" name="divForm1"><b id="bfont">Q . 일정 추가는 어떻게 하나요?</b></div>
        <p id="p" class="divForm2">A . 테스트 중이에요 </p>
        <br>
        <br>
        <br>
        <pre id="htitle"><img src="계정.png" width="50px">&nbsp;&nbsp;계정</pre>
        <hr width="70%" style="margin-top: -10px;">
        <br>
        <div id="q" class="divForm1" name="divForm1"><b id="bfont">Q . 계정 정보를 변경하고 싶은데 어떻게 해야하나요?</b></div>
        <p id="p" class="divForm2">A . 테스트 중이에요 </p>
        <br>
        <div id="q" class="divForm1" name="divForm1"><b id="bfont">Q . 비밀번호를 재설정 하고 싶습니다.</b></div>
        <p id="p" class="divForm2">A . 테스트 중이에요 </p>
        <br>
        <div id="q" class="divForm1" name="divForm1"><b id="bfont">Q . 아이디를 재설정 하고 싶습니다.</b></div>
        <p id="p" class="divForm2">A . 테스트 중이에요 </p>
        <br>
        <div id="q" class="divForm1" name="divForm1"><b id="bfont">Q . 탈퇴한 아이디로는 재가입이 되나요?</b></div>
        <p id="p" class="divForm2">A . 테스트 중이에요 </p>
    </div>

    <script>
        $(function(){
            $(document).on("click","div[name=divForm1]",function(){
                // $(this) : 현재 이벤트가 발생한 div요소
                // $(this).next() : 현재 클릭이벤트가 발생한 요소 바로뒤에있는 요소를 반환.

                let $p = $(this).next(); // jQuery방식으로 선택된 요소를 담아둘때 변수명 앞에 $를 붙이곤 함.

                if($p.css("display") == "none"){ // css()메소드 또는 속성명만 매개변수로 넘기면 해당 속성값 반환.

                    // siblings("p").slideUp();

                    $p.siblings("p").slideUp(); // 기존 열려있는 p태그 닫아주기
                    $p.slideDown(1000); // 보여지게하는 메소드

                }else{
                    $p.slideUp(1000); // 사라지게하는 메소드
                }
            });
        });
    </script>
</body>
</html>