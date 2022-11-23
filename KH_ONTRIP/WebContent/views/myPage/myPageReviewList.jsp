<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ontrip.review.vo.Review , java.util.ArrayList , com.ontrip.common.model.vo.PageInfo"%>
    
<%
	int memberNo = Integer.parseInt((String)request.getParameter("memberNo"));
	String memberName = (String) request.getParameter("memberName");
	
	ArrayList<Review> mylist = (ArrayList<Review>) request.getAttribute("mylist");
	
	PageInfo pi2 = (PageInfo) request.getAttribute("pi2");
	
	int currentPage = pi2.getCurrentPage();
	int startPage = pi2.getStartPage();
	int endPage = pi2.getEndPage();
	int maxPage = pi2.getMaxPage();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>온트립(OnTrip) - 예약숙소</title>
    <link href="<%= request.getContextPath() %>/resources/css/myPageReviewList.css" rel="stylesheet" >
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <style>
        .outer7{
        background-color: white; /* 해당사이트의 고유한 색상으로 작성 */
        color: black;
        width: 1000px;
        height: 765px;
        /* border: 1px solid black;  */
        margin-top: 50px;
        text-align: center;
        margin-left: 100px;
    }
    </style>
</head>
<body>
    <%@ include file="../common/navbar.jsp" %>

    <%@ include file="../common/myPageNavbar.jsp" %>

      <br><br><br><br>
        <span style="font-weight:700; font-size:40px; margin-left:-10%;">등록 후기</span>
            <div class="outer2">
                <div class="outer7">
                            <table align = "center" id = "ulTable" class="table-bordered table-hover" style="margin-right: 0px;">
                                <thead>
                                    <tr>
                                        <th width="70" height="40" style="background-color: rgb(87, 226, 152);">번호</th>
                                        <th width="400" height="40" style="background-color: rgb(87, 226, 152);">이용시설</th>
                                        <th width="150" height="40" style="background-color: rgb(87, 226, 152);">날짜</th>
                                        <th width="150" height="40" style="background-color: rgb(87, 226, 152);">작성자</th>
                                    </tr> 
                                </thead>
                                <tbody>
                                         <tr>
                                           <% if(!mylist.isEmpty()) { %>
                                            <% for(int i = 0; i < mylist.size(); i++) { %>
                                                <td height="40"><%=mylist.get(i).getRevCode()%></td>
                                                <td><%=mylist.get(i).getPlaceName()%></td>
                                                <td><%=mylist.get(i).getRevDate() %></td>
                                                <td><%=mylist.get(i).getMemberName() %></td>
                                            </tr>
                                        <% } %>
                                        <% } %>
                                </tbody>
                            </table>
                            <div>
                                <br><br>
                                <div align="center" class="paging-area">
                                    <% if(currentPage !=1) { %>
                                        <button onclick="doPageClick(<%= currentPage-1 %>)" class="btn btn-light">&lt;</button>
                                    <% } %>
                                    <% for(int i = startPage; i <= endPage; i++) { %>
                                        <% if(i != currentPage) { %>
                                            <button onclick="doPageClick(<%=i%>)" class="btn btn-light"><%=i %></button>
                                        <% } else { %>
                                            <button disabled class="btn btn-light"><%=i %></button>
                                        <% } %>
                                    <% } %>
                                    
                                    <% if(currentPage != maxPage) { %>
                                        <button onclick="doPageClick(<%= currentPage+1 %>)" class="btn btn-light">&gt;</button>
                                    <% } %>
                              </div>
                       </div>
                 </div>
        </div>
          <!-- 여기에 
            <tr>
                <th scope="row">3</th>
                <td>kh호텔</td>
                <td>2022-12-24 ~ 2022-12-25</td>
            </tr>

            이 양식으로 추가되면 됩니당.
        -->
      
      	
	<script>
	function doPageClick(currentPage){
		location.href = "<%=request.getContextPath()%>/mypageReviewList.me?memberNo=<%=memberNo%>&memberName=<%=memberName%>&currentPage="+currentPage;
	}
	
	$(function(){
    	$("#ulTable>tbody>tr").click(function(){
    		
    		let revCode = $(this).children().eq(0).text()
    		
    		location.href = '<%=request.getContextPath()%>/detail.bo?memberNo=<%=memberNo%>&revCode='+revCode;
    		
    		
    	});
    }) 
	</script>
      

</body>
</html>