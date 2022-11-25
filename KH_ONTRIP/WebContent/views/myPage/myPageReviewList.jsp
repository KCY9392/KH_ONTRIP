<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ontrip.review.vo.Review , java.util.ArrayList , com.ontrip.common.model.vo.PageInfo"%>
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
    
    
    <style>
        .outer7{
        background-color: white; /* 해당사이트의 고유한 색상으로 작성 */
        color: black;
        width: 1000px;
        height: 765px;
        /* border: 1px solid black;  */
        margin-top: 50px;
        text-align: center;
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
    
    </style>
</head>
<body>
    <%@ include file="../common/mypageNewNavbar.jsp" %>
	<br><br><br>

       <div class="uk-flex uk-flex-center uk-flex-middle uk-background-cover " style="margin:auto; width: 90vw; height: 60vh; background-image: url(&quot;https://www.myro.co.kr/myro_image/mainN7.jpg&quot;);">
        <h3 style="color:white; font-size:50px;">ONTRIP :</h3> &nbsp;&nbsp;&nbsp;&nbsp; 
        <h1 style="font-size:55px; color:rgb(85, 84, 84);">등록 후기</h1>
    </div>

    <br><br><br>

    <div class="uk-section uk-section-default sl-in2" style="min-width: 90vw; height:20vh;">
        <div class="uk-container">
            <div style="text-align: center; margin-top : -1.5%;">
                <div style="font-size:40px; font-weight:600;">OnTrip</div><br>
                <div style="color:darkgray">MAKE YOUR ROUTE OPTIMIZED</div>
            </div>
        </div>
    </div>

    <br><br><br>
      
      
            <div class="outer2" style="box-shadow:0 0 10px 1px grey; margin:auto; width:1000px; text-align:center;
            	padding-bottom:30px; padding-top:30px;">
	        <span style="font-weight:700; font-size:40px;">등록 후기</span>
                <div class="outer7">
                            <table align = "center" id = "ulTable" class="table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th width="70" height="40" style="background-color: rgb(182, 210, 230);">번호</th>
                                        <th width="400" height="40" style="background-color: rgb(182, 210, 230);">이용시설</th>
                                        <th width="150" height="40" style="background-color: rgb(182, 210, 230);">날짜</th>
                                        <th width="150" height="40" style="background-color: rgb(182, 210, 230);">작성자</th>
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
        <br><br><br><br>
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