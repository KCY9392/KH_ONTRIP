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
    	String userId = loginUser.getMemberId() == null ? "" : loginUser.getMemberId();
        String userPwd = loginUser.getMemberPwd() == null ? "" : loginUser.getMemberPwd();
	%>

    <div class="outer1">
        <h1 style = "text-align : center;">비밀번호 변경</h1>
        <br><br><br>
        <form action="<%=request.getContextPath()%>/myPwdUpdate.me" method="post">
            <div align="center">
                <table align="center">
                    <tr>
                        <td>여행자 아이디 : &nbsp;</td>
                        <td><input type="text" id="userId" name="userId" value="<%=userId %>" readonly></td>
                    </tr>
                    <tr>
                        <td>현재 비밀번호 : &nbsp;</td>
                        <td><input type="text" id="userPwd" name="userPwd" value="<%=userPwd %>" readonly></td>
                    </tr>
                    <tr>
                        <td>새로운 비밀번호 : &nbsp;</td>
                        <td><input type="password" name="newPwd" required></td>
                    </tr>
                    <tr>
                        <td>비밀번호 확인 : &nbsp;</td>
                        <td><input type="password" name="checkPwd" required></td>
                    </tr>
                </table>
            </div>
            <div align = "center">
                <br><br>
                <button type = "submit" name = "nCheckPwdb" class = "btn btn-secondary btn-sm" onclick="return newPwdUpdate();">변경</button>
            </div>
        </form>
    </div>

    <script>
//         $(function(){
//             $("[name=nCheckPwdb]").click(function(){
//                 if($("input:password[name=newPwd]").val() != $("input:password[name=checkPwd]").val()){
//                     alert("비밀번호가 일치하지 않습니다.");
//                     $("input:password[name:newPwd]").focus();
//                     $("input:password[name:newPwd]").val("");
//                     $("input:password[name:checkPwd]").val("");
//                     return false;
//                 }
//                 if($("input:password[name=newPwd]").val() == $("input:password[name=checkPwd]").val() && $("input:password[name=newPwd]").val() != ""){
//                     alert("비밀번호 변경이 완료되었습니다.");
//                 }
//             });
//         })
        function newPwdUpdate(){
        	
        	  if($("input:password[name=newPwd]").val() != $("input:password[name=checkPwd]").val()){
                  alert("비밀번호가 일치하지 않습니다.");
                  $("input:password[name=newPwd]").focus();
                  $("input:password[name=newPwd]").val("");
                  $("input:password[name=checkPwd]").val("");
                  return false;
              }
              if($("input:password[name=newPwd]").val() == $("input:password[name=checkPwd]").val() && $("input:password[name=newPwd]").val() != ""){
                  alert("비밀번호 변경이 완료되었습니다.");
              }
        }
        
        
        
        
    </script>
</body>