<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer1{
        background-color: white; /* 해당사이트의 고유한 색상으로 작성 */
        color: black;
        width: 1000px;
        height: 800px;
        /* border: 1px solid black; */
        margin: auto;
        margin-top: 150px;
        box-sizing: border-box;
        /* text-align: center; */
    }
    #userId , #userPwd{
        border-bottom: 1px solid #adadad;
        margin: 10px;
        padding: 10px 0px;
        width: 100%;
        outline:none;
        border-top: 0;
        border-left: 0;
        border-right: 0;
    }
    #secessionTitle{
        font-size: 20px;
        font-weight: bold;
    }
    #checkReview{
        font-size: 20px;
        font-weight: bold;
        margin: 11ch;
        margin-top: -0px;
    }
    #treview{
        width: 730px;
        height: 100px;
    }
</style>
</head>
<body>

    <%@ include file="../common/navbar.jsp" %>
    <%@ include file="../common/myPageNavbar.jsp" %>  


    <div class="outer1">
        <h1 style = "text-align : center; margin: auto;">회원탈퇴</h1>
        <br><br><br>
        <pre id = "secessionTitle">
            탈퇴안내
            <br>
            ✔ 사용하고 계신 아이디는 탈퇴할 경우 재사용 및 복구가 불가능합니다.
            ✔ 탈퇴후 회원정보 및 서비스 이용기록은 모두 삭제됩니다.
            ✔ 탈퇴후에도 등록하신 게시물은 그대로 남아있습니다.

            <br>
            탈퇴 사유
        </pre>
        <form id="checkReview">
            <input type="checkbox" ><label>&nbsp;내가 예상했던것과 서비스 내용이 다름.</label><br>
            <input type="checkbox" ><label>&nbsp;사이트 이용이 불편함.</label><br>
            <input type="checkbox" ><label>&nbsp;정보가 부정확함.</label><br><br><br>
            <input type="checkbox" ><label>&nbsp;기타개선사항</label><br>
            <input type="text" id="treview">

            <div align = "center">
                <br><br>
                <button type = "submit" name = "deleteMember" class = "btn btn-secondary btn-sm" onclick="return newPwdUpdate();">탈퇴하기</button>
            </div>
        </form>
    </div>

    <form>
       
    </form>
</body>
</html>