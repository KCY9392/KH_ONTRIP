<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
    <nav class="navbar bg-light" style="position:fixed; z-index:9999; width:100vw; ">
        <div class="container-fluid" style="background-color: white; padding-bottom: 7px; border-bottom:1px solid rgb(218, 213, 213);">
            <a class="navbar-brand" href="<%=request.getContextPath()%>/start.me">
            <b class="nav_b">Ontrip</b>&nbsp;
            <h7 style="font-size:13px; color:rgb(151,154,151);">MAKE YOUR ROUTE OPTIMIZED</h7>
            </a>
            <form class="d-flex" role="click">
            
            <button style="border:none; color:black;" class="btn btn-outline-success" type="button" onclick="myPage();">마이페이지</button>
            
            <button style="margin-right: 40px; margin-left:20px; color:black; border:none;" class="btn btn-outline-success" type="button"
                onclick="logout();">로그아웃</button>
            </form>
        </div>
    </nav>
    <br><br><br><br>

    <div class="outer">
		<br>
		<h2 style = "text-align:center; color: rgb(155, 205, 138)">Ontrip 문의사항</h2>
		<br>
		
		<form action="<%=contextPath %>/insert.bo" id="enroll-form" method="post" enctype="multipart/form-data">
			
			<!-- 카테고리, 제목, 내용, 첨부파일을 입력받고, 작성자의 회원번호는 hidden으로 넘기기. -->
			<input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>">
			<div align="center">
                <div>
                    <span>제목 : </span>
                    <input type = "text" style="width: 300px; height: 40px;" name = "title" value="<%=%>" required>
                </div>
                <br>
				<div>
                    <span style="vertical-align: top;">내용 :</span>
                    <textarea name="content" style="width: 300px; height: 172px; resize: none;"  style="resize: none;" required><%=%></textarea>
                </div>
                
                <%
                <div>
                    <span style="vertical-align: top;">답변 : </span>
                    <textarea name="content2" style="width: 300px; height: 50px; resize: none;"  style="resize: none;" required><%=%></textarea>
                </div>
                %>
			</div>
			
			<br>
			
			<div style="text-align: center;">
				<button type="rset" style="margin-left: 20;">초기화</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="submit" style="margin-left: 20;">등록</button>
			</div>
			
		</form>
	</div>
    
</body>
</html>