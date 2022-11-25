<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String contextPath = request.getContextPath();
%>
<% 
   Member loginUser = (Member) session.getAttribute("loginUser");
   // 로그인전 or 로그인 실패 : null
   // 로그인 성공후 : 로그인한 회원의 정보가 담긴 member객체.
   
   String alertMsg = (String) session.getAttribute("alertMsg");
   // 서비스 요청전 : null
   // 서비스 요청성공후 : alert로 띄워줄 메시지 문구.
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- 폰트적용  -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="<%= request.getContextPath() %>/resources/css/mainForm.css" rel="stylesheet" >

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

<!-- BootStrap 연결 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<!-- Alert 창  -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


<style>
    .outer1{
        background-color: white; /* 해당사이트의 고유한 색상으로 작성 */
        color: black;
        width: 1000px;
        height: 800px;
        /* border: 1px solid black; */
        margin: auto;
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
    .uk-flex-middle {
        align-items: center;
    }
    .uk-flex-center {
        justify-content: center;
    }
    .uk-flex {
        display: flex;
    }
    .uk-background-cover {
        background-size: cover;
    }
    .uk-background-contain{
        background-position: 50% 50%;
        background-repeat: no-repeat;
    }
    .uk-section-default {
        background: rgb(250, 250, 250);
    }

    .uk-section {
        padding-top: 70px;
        padding-bottom: 70px;
    }
    .uk-section {
        display: flow-root;
        box-sizing: border-box;
    }
    .sl-in2 {
     animation: change1 1s ease forwards;
   }
   
   @keyframes change1 {
     from {
       transform: translateY(80%);
     }
   
     to {
       transform: translateY(0%);
     }
   }
   input[type=checkbox]{
      display: inline-block;
      width: 18px;
      height: 18px;
      border: 2px solid #bcbcbc;
      cursor: pointer;
   }

</style>
</head>
<body>
<%@ include file="../common/mypageNewNavbar.jsp" %>
<br><br><br>
  
 <div class="uk-section uk-section-default sl-in2"
      style="min-width: 90vw; height: 28vh;">
      <div class="uk-container">
         <div style="text-align: center; margin-top: -1.5%;">
            <div style="font-size: 40px; font-weight: 600;">OnTrip</div>
            <br>
            <div style="color: darkgray">MAKE YOUR ROUTE OPTIMIZED</div>
            <br> <br>
            <div>
               <span style="color: coral; font-size: 16px; font-weight: 600;">회원탈퇴</span>
            </div>
         </div>
      </div>
   </div>

    <br><br><br>

    <div class="outer1">
        <h1 style = "text-align : center; margin: auto;">회원탈퇴</h1>
        <br><br><br>
        <form id="checkReview" action="<%=request.getContextPath()%>/MemberDeleteCheckController.me" method="post">
            탈퇴안내
            <hr><br>

            ✔ 사용하고 계신 아이디는 탈퇴할 경우 재사용 및 복구가 불가능합니다.<br>
            ✔ 탈퇴후 회원정보 및 서비스 이용기록은 모두 삭제됩니다.<br>
            ✔ 탈퇴후에도 등록하신 게시물은 그대로 남아있습니다.<br><br>

            탈퇴 사유
            <hr><br>
            <input type="checkbox" ><label>&nbsp;내가 예상했던것과 서비스 내용이 다름.</label><br>
            <input type="checkbox" ><label>&nbsp;사이트 이용이 불편함.</label><br>
            <input type="checkbox" ><label>&nbsp;정보가 부정확함.</label><br><br><br>
            ✔ 기타 개선사항
            <input type="text" id="treview"><br>
            
        
            <div align = "center">
                <br><br>
                <button type = "submit" name = "deleteMember" class = "btn btn-secondary btn-sm"
                   style="width:130px; height:50px; font-size:16px;">다음으로</button>
            </div>
        </form>
    </div>
   <br><br><br><br>
</body>
</html>