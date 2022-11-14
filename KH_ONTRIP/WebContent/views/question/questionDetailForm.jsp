<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    td, th{
        border: 1px solid rgb(196, 192, 192);
        text-align: center;
        padding: 5px;
        border-radius: 8px;
    }
    #detail-area{
        text-align: center;
        border-radius: 8px;
    }
    
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
    <div class = "outer">
		<br>
		<h2 style = "text-align:center; color: rgb(155, 205, 138)">Ontrip 문의사항</h2>
		<br>
        <div style="margin-left: 730;">
            <% if(loginUser != null && loginUser.getUserId().equals(b.getBoardWriter())) { %>
                <!-- 현재 로그인한 사용자가 해당 글을 작성한 작성자일 경우에만 보여진다. -->
                <button onclick="">수정</button>
                <button onclick="">삭제</button>
            <% } %>
        </div>
        <br>
		<table id = "detail-area" align="center" style="border: 1px solid rgb(196, 192, 192)">
            <tr>
				<th width="70">제목</th>
				<td width="550" colspan="3"><%= b.getBoardTitle() %></td>
			</tr>
			<tr>
				<th width="70">작성자 </th>
				<td><%= b.getBoardWriter() %></td>
				<th>작성일</th>
				<td><%= b.getCreateDate() %></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3">
					<p style="height:200px;"><%= b.getBoardContent() %></p>
				</td>
			</tr>
            <tr>
				<th>답변</th>
				<td colspan="3">
					<p style="height:100px;"><%= b.getBoardContent() %></p>
				</td>
			</tr>
		</table>
		
		<br>
		
		<div align="center">
			<button onclick="" >목록</button>
			<br><br>
			
		</div>
</body>
</html>