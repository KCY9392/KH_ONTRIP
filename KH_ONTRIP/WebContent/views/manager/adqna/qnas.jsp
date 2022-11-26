<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 Q&A</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <style>
        body{
            /*        text-align:center; */
        }
        div{
            box-sizing:border-box;
        }
        .outer1{ */
        background-color: white; /* 해당사이트의 고유한 색상으로 작성 */
            color: black;
            width: 1000px;
            height: 120vh;
            /* border: 1px solid black; */
            margin: auto;
            margin-top: 50px;
            box-sizing: border-box;
            /* text-align: center; */
        }
        .title{
            margin:auto;
            margin-top:-30px;
            height: 100px;
            border: 2px solid white;
            background-color: rgba(161, 210, 161, 0.911);
			border-radius: 20px;
            /* rgba(143, 212, 143, 0.911); => 연두색 */
        }
        #qnaTitle{
            font-size: 40px;
            color: white;
            font-weight: bold;
            padding:10px;
            font-family: 'Noto Sans KR', sans-serif;
        }
        .qna{
            height: 6%;
            /* border: 1px solid blueviolet; */
            font-weight: bold;

        }
        #qnap{
            text-align:center;
            margin:auto;
            font-size: 40px;
            font-family: 'Noto Sans KR', sans-serif;
        }
        #htitle{
            font-size: 30px;
            font-weight: bold;
            /*         margin-left: 150px; */

            font-family: 'Noto Sans KR', sans-serif;
        }
        #q{
            margin-left: 150px;
            width: 700px;
            height: 50px;
            background-color: rgba(221, 224, 221, 0.911);
            border: 5px solid rgba(221, 224, 221, 0.911);
            
        }
        #p{
            margin-left: 150px;
            font-family: 'Noto Sans KR', sans-serif;
            font-weight:25px;
        }
        .divForm1{
            /* background-color: rgb(206, 206, 204); */
            width: 400px;
            height: 30px;
            text-align: center;
            line-height: 35px;
            border: 2px dashed rgb(206, 206, 204);
            border-top: 0;
            border-left: 0;
            border-right: 0;
            border-radius: 10px;
            cursor: pointer;
            font-size: 20px;
        }
        p{
            border: 1px solid rgb(206, 206, 204);
            width: 703px;
            height: 100px;
            margin-top: 5px;
            border-radius: 10px;
            padding: 10px;
            box-sizing: border-box;
            display: none;
            background-color: rgba(248, 248, 248, 0.863);
            font-size:17px;
        }
        #bfont{
            float: left;
            margin-left: 8px;
            font-family: 'Noto Sans KR', sans-serif;
            font-weight: 1000;
        }
        .fa-lg{
            color:coral;
        }
        .divForm2{
            position:relative;
            margin-left:170px;
        }
        .delete_answer{
            position:absolute;
            text-decoration: none;
            font-weight:900;
            border:none;
            background-color:lightgrey;
            color:white;
            padding:5px;
            border-radius: 10px;
            text-align:right;
            top:63px;
            right:0;
        }
        .delete_answer:hover{
            color:black;
        }
        .btn-enroll{
            border:none;
            padding:5px;
            width:150px;
            height:50px;
            font-weight:600;
            font-size:20px;
            border-radius:5px;
        }
        .btn-enroll:hover{
            background-color:rgba(208, 214, 208, 0.911);
        }
        .btn-enroll:active{
            background-color:rgba(163, 167, 163, 0.911);
        }
    </style>
</head>
<body>
<%@ include file="../../common/adnavbar.jsp" %>
<%@ include file="../../../views/common/managerNavbar.jsp" %>

<div class="outer1" style="margin-left:450px;">

    <div class="title">
         <pre id="qnaTitle" style="text-align:center; margin-top:7px ;">Q & A 관리</pre>
    </div>


    <div class="qna">
        <br><br><br><br>
        <pre id="qnap"><i class="fa-regular fa-lightbulb fa-lg"></i>&nbsp;자주 묻는 질문&nbsp;<i class="fa-regular fa-lightbulb fa-lg"></i></pre>
    </div>

    <br><br><br><br><br><br><br>


	<form method="post" action="/KH_ONTRIP/manager/qnas/saveform" style="text-align:center;">
    <button class="btn-enroll" style="margin-bottom:50px;">등록</button>
	</form>


    <pre id="htitle" style="color:gray; margin-left:-530px;"><img src="<%= request.getContextPath() %>/resources/image/숙소.png" width="30px">&nbsp;&nbsp;숙소</pre>
    <hr width="70%" style="margin-top: -10px; margin-left:170px;">
    <br>

    <c:forEach items="${qnaForAccommodation}" var="acco">
        <div id="q" class="divForm1" name="divForm1" style="margin-left:170px;"><b id="bfont">${acco.qaQuestion}</b></div>
        <p id="p" class="divForm2" style="margin-left:170px;">
                ${acco.qaAnswer}
                <br>
            <a href="/KH_ONTRIP/manager/qnas/delete?qaCode=${acco.qaCode}" class="delete_answer">삭제하기</a>
        </p>
        <br>
    </c:forEach>

    <br><br><br><br>

    <pre id="htitle" style="color:gray; margin-left:-530px;"><img src="<%= request.getContextPath() %>/resources/image/기능.png" width="30px">&nbsp;&nbsp;기능</pre>
    <hr width="70%" style="margin-top: -10px; margin-left:170px;">
    <br>

    <c:forEach items="${qnaForUsing}" var="using">
        <div id="q" class="divForm1" name="divForm1" style="margin-left:170px;"><b id="bfont">${using.qaQuestion}</b></div>
        <p id="p" class="divForm2" style="margin-left:170px;">
                ${using.qaAnswer}
            <br>
            <a href="/KH_ONTRIP/manager/qnas/delete?qaCode=${using.qaCode}" class="delete_answer">삭제하기</a>
        </p>
        <br>
    </c:forEach>
    
    <br><br><br><br>

    <pre id="htitle" style="color:gray; margin-left:-530px;"><img src="<%= request.getContextPath() %>/resources/image/계정.png" width="30px" >&nbsp;&nbsp;계정</pre>
    <hr width="70%" style="margin-top: -10px; margin-left:170px;">
    <br>

    <c:forEach items="${qnaForAccount}" var="account">
        <div id="q" class="divForm1" name="divForm1" style="margin-left:170px;"><b id="bfont">${account.qaQuestion}</b></div>
        
        <p id="p" class="divForm2" style="margin-left:170px;">
                ${account.qaAnswer}
                <br>
            <a href="/KH_ONTRIP/manager/qnas/delete?qaCode=${account.qaCode}" class="delete_answer">삭제하기</a>
        </p>
        <br>
    </c:forEach>

	<br><br><br><br><br><br>
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