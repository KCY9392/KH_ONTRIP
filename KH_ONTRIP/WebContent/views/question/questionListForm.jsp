<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .container{
        background-color: rgb(255, 255, 255); /* 해당사이트의 고유한 색상으로 작성 */
        color: white;
        width: 1000px;
        height: 100%;
        margin: auto; /* 가운데 자동 정렬 */
        margin-top: 50px; /* 위로부터 50px 아래로 여백 만들기 */
    }
    .row{
        text-align: right;
        margin-left:auto; 
        margin-right:auto;
    }
    .list-area{
    	border: 1px solid rgb(196, 192, 192);
    	text-align: center;
        width: 1000px;
        margin-left:auto; 
        margin-right:auto;
		border-radius: 5px;
    }
    .list-area>tbody>tr:hover{
    	background-color:rgb(241, 241, 241);
    	cursor:pointer;
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
		<br> <h2 style = "text-align:center; color: rgb(155, 205, 138)">Ontrip 문의사항</h2> <br>
		
		<% if(loginUser != null) { %>
			<div class="row" style = "width:850px;">
				<button href = "<%=contextPath%>/enrollForm.bo" >작성하기</button>
			</div>
		<% } %>
	
	<table  class = "list-area">
		<thead>
			<tr>
				<th style="background-color: #eeeeee; text-align: center;" width="70">글번호</th>
				<th style="background-color: #eeeeee; text-align: center;" width="300">제목</th>
				<th style="background-color: #eeeeee; text-align: center;" width="100">작성자</th>
                <th style="background-color: #eeeeee; text-align: center;" width="50">조회수</th>
			</tr>
		</thead>
		<tbody>
			<% if(list.isEmpty()) { %>
				<tr>
					<td colspan="6">조회된 리스트가 없습니다</td>
				</tr>
			<% } else { %>
				<% for(Board b : list) { %>
					<tr>
						<td><%= b.getBoardNo() %></td>
						<td><%= b.getCategory() %></td>
						<td><%= b.getBoardTitle() %></td>
						<td><%= b.getBoardWriter() %></td>

					</tr>
				<% } %>
			<% } %>
		</tbody>
	</table>
	
	<script>
		$(function(){
			$(".list-area>tbody>tr").click(function(){
				// 클릭시 해당 공지사항의 번호를 넘겨야함.
				// 해당 tr요소의 자손중에서 첫번째 td의 영역의 내용이 필요.
				
				let bno = $(this).children().eq(0).text() // 1 , 2
				// 현재내가클릭한 tr의 자손들중 0번째에 위치한 자식의 textnode내용을 가져온다.
				// eq는 동위레벨 선택자
				
				// 요청할 url?키=밸류&키=밸류&키=밸류
				// 물음표 뒤의 내용을 쿼리스트링이라고 부른다. => 직접 만들어서 넘겨야함.
				location.href = '<%=contextPath %>/detail.bo?bno='+ bno;
			});
		})
	</script>
	
	<br><br>
	
	<div align="center" class="paging-area">
		<% if(currentPage !=1) { %>
			<button onclick="doPageClick(<%= currentPage-1 %>)">&lt;</button>
		<% } %>
		
		<% for(int i = startPage; i <= endPage; i++) { %>
			<% if(i != currentPage) { %>
				<button onclick="doPageClick(<%=i%>)"><%=i %></button>
			<% } else { %>
				<button disabled><%=i %></button>
			<% } %>
		<% } %>
		
		<% if(currentPage != maxPage) { %>
			<button onclick="doPageClick(<%= currentPage+1 %>)">&gt;</button>
		<% } %>
	</div>
	
	<script>
		function doPageClick(currentPage){
			location.href = "<%=contextPath%>/list.bo?currentPage="+currentPage;
		}
	</script>
	
</div>
    
</body>
</html>