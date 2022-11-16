<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온트립(OnTrip) - 회원정보</title>
<style>
    .outer1{
        background-color: white; /* 해당사이트의 고유한 색상으로 작성 */
        color: black;
        width: 1000px;
        height: 800px;
        /* border: 1px solid black; */
        margin: auto;
        margin-left:27%;
        box-sizing: border-box;
        text-align: center;
    }
    input{
        border-bottom: 1px solid #adadad;
        margin: 10px;
        padding: 10px 0px;
        width: 100%;
        outline:none;
        border-top: 0;
        border-left: 0;
        border-right: 0;
    }
    table{
    	font-size:20px;
    }
    .btn-sm{
    	width:100px;
    	height:50px;
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
        
        <h1 style = "text-align : center; font-size:40px;">여행자 정보</h1>
        <br><br><br>
        
        <form id = "myPage-form" action = "<%=request.getContextPath() %>mypage.me" method = "post">
            <div align="center">
            	<table align = center>
                <tr>
                    <td>여행자 이름 :&nbsp;</td>
                    <td><input type = "text" name = "userName" value = "<%=userName %>" readonly></td>
                    <td></td>
                </tr>
                <tr>
                    <td>성별 :&nbsp;</td>
                    <td><input type = "text" name = "userGender" value = "<%=userGender %>" readonly></td>
                    <td></td>
                </tr>
                <tr>
                    <td>아이디 :&nbsp;</td>
                    <td><input type = "text" name = "userId" value = "<%=userId %>" readonly></td>
                    <td></td>
                </tr>
                <tr>
                    <td>휴대폰 번호 :&nbsp;</td>
                    <td><input type = "text" name = "userPhoneNumber" value = "<%=userPhoneNumber %>" readonly></td>
                    <td></td>
                </tr>
                <tr>
                    <td>생년월일 :&nbsp;</td>
                    <td><input type = "text" name = "userBirth" value = "<%=userBirth %>" readonly></td>
                    <td></td>
                </tr>
                <tr>
                    <td>가입한 날짜 :&nbsp;</td>
                    <td><input type = "text" name = "userEnrollDate" value = "<%=userEnrollDate %>" readonly></td>
                    <td></td>
                </tr>
            </table>
            </div>
            <br><br><br>
            <div align = "center">
                <button type = "button" class = "btn btn-secondary btn-sm" onclick="myPagePwdCheck();">수정하기</button>
            </div>
        </form>

    </div>
    
    <script>
    	function myPagePwdCheck(){
    		location.href = "<%=request.getContextPath()%>/myPwdcheck.me";
    	}
    	
    	
    </script>

</body>
</html>