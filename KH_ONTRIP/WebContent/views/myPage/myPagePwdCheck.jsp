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
</style>
<script
        src="https://code.jquery.com/jquery-3.6.1.min.js"
        integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
        crossorigin="anonymous">j10
</script>
</head>
<body>
    <%@ include file="../common/navbar.jsp" %>
    <%@ include file="../common/myPageNavbar.jsp" %>  

    <div class="outer1">
        <h1 style = "text-align : center;">비밀번호 확인</h1>
        <br><br><br>
        <form>
            <div align="center">
                <table align="center">
                    <tr>
                        <td>비밀번호 : &nbsp;</td>
                        <td><input type="password" name="checkPwd"></td>
                    </tr>
                </table>
            </div>
            <div align = "center">
                <br><br>
                <button type = "button" name = "checkPwdb" class = "btn btn-secondary btn-sm">확인</button>
            </div>
        </form>
    </div>
    
    <script>
    	$(function(){
    		$("[name=checkPwdb]").click(function(){
    			if($("input:password[name=checkPwd]").val() == "<%=loginUser.getMemberPwd()%>"){
    				alert("일치하네용.");
                    location.href = "<%=request.getContextPath()%>/update.me";
    			}else{
    				alert("다시 입력해주세요.");
    				$("input:password[name=checkPwd]").focus();
                    $("input:password[name=checkPwd]").val("");
    			}
    		});
    	})
    	
    </script>

</body>
</html>