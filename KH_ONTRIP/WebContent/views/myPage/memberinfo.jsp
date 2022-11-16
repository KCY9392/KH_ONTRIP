<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 회원정보</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<style>
    .outer1{
        background-color: white; /* 해당사이트의 고유한 색상으로 작성 */
        color: black;
        width: 1000px;
        height: 800px;
        /* border: 1px solid black; */
        margin: auto;
        box-sizing: border-box;
        text-align: center;
    }
    #num1 , #num2 , #num3 , #num4{
        border-bottom: 1px solid #adadad;
        margin: 10px;
        padding: 10px 0px;
        width: 100%;
        outline:none;
        border-top: 0;
        border-left: 0;
        border-right: 0;
    }
    #updateName , #updatePhoneNumber{
        margin: 10px;
        padding: 10px 0px;
        width: 100%;
    }
    #btn1 , #btn2{
        width: 100px;
    }
    
</style>
</head>
<body>
    <%@ include file="../common/navbar.jsp" %>
    <%@ include file="../common/myPageNavbar.jsp" %>  
    <%
        String userName = loginUser.getMemberName();
    	String userGender = loginUser.getGender() == null ? "" : loginUser.getGender();
    	String userId = loginUser.getMemberId() == null ? "" : loginUser.getMemberId();
    	String userPhoneNumber = loginUser.getPhone() == null ? "" : loginUser.getPhone();
    	String userBirth = loginUser.getBirthDate() == null ? "" : loginUser.getBirthDate();
    	Date userEnrollDate = loginUser.getEnrollDate();
	%>
    <div class="outer1">
        <br><br><br><br><br><br>
        
        <h1 style = "text-align : center; font-size:50px;">여행자 정보</h1>
        <br><br><br>
        
        <form action="<%=request.getContextPath()%>/update.me" method="post">
            <div align="center">
            	<table align = center>
                <tr>
                    <td>여행자 이름 :&nbsp;</td>
                    <td><input type = "text" id="updateName" name = "userName" value = "<%=userName %>"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>성별 :&nbsp;</td>
                    <td><input type = "text" id="num1" name = "userGender" value = "<%=userGender %>" readonly></td>
                    <td></td>
                </tr>
                <tr>
                    <td>아이디 :&nbsp;</td>
                    <td><input type = "text" id="num2" name = "userId" value = "<%=userId %>" readonly></td>
                    <td></td>
                </tr>
                <tr>
                    <td>휴대폰 번호 :&nbsp;</td>
                    <td><input type = "text" id="updatePhoneNumber" name = "userPhoneNumber" value = "<%=userPhoneNumber %>"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>생년월일 :&nbsp;</td>
                    <td><input type = "text" id="num3" name = "userBirth" value = "<%=userBirth %>" readonly></td>
                    <td></td>
                </tr>
                <tr>
                    <td>가입한 날짜 :&nbsp;</td>
                    <td><input type = "text"  id="num4" name = "userEnrollDate" value = "<%=userEnrollDate %>" readonly></td>
                    <td></td>
                </tr>
            </table>
            </div>
            <br>
            <div align = "center">
                <button type = "submit" id="btn1" class = "btn btn-secondary btn-sm" onclick="#">정보 변경</button> &nbsp;&nbsp;&nbsp;
                <button type = "button" id="btn2" class = "btn btn-secondary btn-sm" onclick="myPwdUpdate();">비밀번호 변경</button>
            </div>
        </form>
    </div>

    <script>
//         function myPageUpdate(){
//<%--         	location.href = "<%=request.getContextPath()%>/update.me"; --%>
//         }
        function myPwdUpdate(){
        	location.href = "<%=request.getContextPath()%>/newpwd.me";
        }
    </script>

</body>
</html>