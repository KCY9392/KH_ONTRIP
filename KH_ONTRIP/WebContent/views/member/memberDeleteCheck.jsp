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
        text-align: center;
    }
    input{
        margin: 10px;
        padding: 10px 0px;
        width: 100%;
        outline:none;
    }
    #memberId , #memberPwd{
        border-bottom: 1px solid #adadad;
        margin: 10px;
        padding: 10px 0px;
        width: 100%;
        outline:none;
        border-top: 0;
        border-left: 0;
        border-right: 0;
    }
</style>
<script
        src="https://code.jquery.com/jquery-3.6.1.min.js"
        integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
        crossorigin="anonymous">
</script>
</head>
<body>
	<%@ include file="../common/navbar.jsp" %>
    <%@ include file="../common/myPageNavbar.jsp" %>  

    <%
    	String memberId = loginUser.getMemberId() == null ? "" : loginUser.getMemberId();
        String memberPwd = loginUser.getMemberPwd() == null ? "" : loginUser.getMemberPwd();
	%>

    <div class="outer1">
        <h1 style = "text-align : center;">회원 탈퇴</h1>
        <br><br><br>
        <form action="<%=request.getContextPath()%>/memberDeleteOk.me" method="post">
            <div align="center">
                <table align="center">
                    <tr>
                        <td>여행자 아이디 : &nbsp;</td>
                        <td><input type="text" id="memberId" name="memberId" ></td>
                    </tr>
                    <tr>
                        <td>여행자 비밀번호 : &nbsp;</td>
                        <td><input type="password" id="memberPwd" name="memberPwd" ></td>
                    </tr>
                   
                </table>
            </div>
            <div align = "center">
                <br><br>
                <button type = "submit" name = "nCheckPwdb" class = "btn btn-secondary btn-sm" onclick="return memberDeleteCheck();">탈퇴하기</button>
            </div>
        </form>
    </div>

    <script>

        function memberDeleteCheck(){
        	
        	  if($("input:text[name=memberId]").val() != "<%=loginUser.getMemberId()%>" || $("input:text[name=memberId]").val() == ""){
                  alert("아이디를 다시 입력해주세요.");
                  $("input:text[name=memberId]").focus();
                  $("input:text[name=memberId]").val("");
                  $("input:password[name=memberPwd]").val("");
                  return false;
              }else if($("input:password[name=memberPwd]").val() != "<%=loginUser.getMemberPwd()%>" || $("input:text[name=memberPwd]").val() == ""){
                  alert("비밀번호를 다시 입력해주세요.");
                  $("input:text[name=memberPwd]").focus();
                  $("input:text[name=memberId]").val("");
                  $("input:password[name=memberPwd]").val("");
                    return false;
              }else if($("input:text[name=memberId]").val() == "<%=loginUser.getMemberId()%>" && $("input:password[name=memberPwd]").val() == "<%=loginUser.getMemberPwd()%>"){
                  alert("그동안 온트립을 이용해주셔서 감사합니다.");
              }
        
        }

    </script>
</body>