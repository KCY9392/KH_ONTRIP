<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ontrip.detailArea.vo.DetailArea ,com.ontrip.image.vo.Image,
    com.ontrip.place.model.vo.Place , com.ontrip.review.vo.Review ,com.ontrip.score.vo.Score , java.util.ArrayList , com.ontrip.common.model.vo.PageInfo"%>
<%
	Place place = (Place)request.getAttribute("place");
	String placeName = (String)request.getParameter("placeName");
	
	int memberNo = Integer.parseInt(request.getParameter("memberNo"));
	
	ArrayList<Review> relist = (ArrayList<Review>) request.getAttribute("reList");
	
	ArrayList<Score> slist = (ArrayList<Score>) request.getAttribute("slist");
	
	// 별점 , 청결 , 서비스 , 시설 총 평점 가져오기 위한 코드
	double avgScore = (double) request.getAttribute("avgScore");
	
	// 페이징 처리가 된 list 가져오기 위한 코드
	ArrayList<Review> plist = (ArrayList<Review>) request.getAttribute("plist");
		
	// 대표사진 띄우기 위한 list 코드
	ArrayList<Image> selectMainImagelist = (ArrayList<Image>) request.getAttribute("selectMainImagelist");
	
	// 시설코드 가져오기 위한 코드
	int placeCode = Integer.parseInt(request.getParameter("placeCode"));
	
	// 찜 개수 가져오기 위한 코드
	int selectHeartCount = (int) request.getAttribute("selectHeartCount");
	
	// 페이징 처리 위한 코드
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[<%=placeName%>]&nbsp;후기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<style>
    .outer{
        background-color: white; /* 해당사이트의 고유한 색상으로 작성 */
        color: black;
        width: 1000px;
        height: 900px;
        border: 1px solid black; 
        margin: auto;
        margin-top: 150px;
        box-sizing: border-box;
    }
    .outer1{
        width: 50%;
        height: 100%;
        border: 1px solid white; /* blue */ /* rgb(87, 226, 152);  초록색 */
        float: left;
    }
    .outer2{
        width: 50%;
        height: 100%;
        border: 1px solid white; /* red */
        /* border-left: 1px solid black; */
        float: left;
    }
    #avgNumberTitle{
        margin-top: 50px;
        margin-left: 50px;
    }
    #avgNumber{
        font-weight: bold;
        font-size: 30px;
        border: 0;
    }
    #text3{
        margin-left: 30px;
        font-size: 20px;
        font-weight: bold;
    }
    #avgGage{
        width: 350px;
        background-color: black;
    }
    #avgNumberTitle{
        margin-top: 50px;
        margin-left: -30px;
    }
    #avgNumber{
        font-weight: bold;
        font-size: 30px;
        border: 0;
    }
    #text3{
        margin-left: 113px;
        font-size: 20px;
        font-weight: bold;
    }
    #avgGage{
        width: 350px;
        background-color: black;
    }
    .outer7{
        background-color: white; /* 해당사이트의 고유한 색상으로 작성 */
        color: black;
        width: 750px;
        height: 765px;
        /* border: 1px solid black;  */
        margin: auto;
        margin-top: 50px;
        box-sizing: border-box;
        text-align: center;
    }
    body{
        line-height:2em;        
        font-family:"맑은 고딕";
    }
    ul, li{ 
        list-style:none;
        text-align:center;
        padding:0;
        margin:0;
    }

    #mainWrapper > ul > li:first-child {
        text-align: center;
        font-size:14pt;
        height:40px;
        vertical-align:middle;
        line-height:30px;
    }

    #ulTable {margin-top:10px;}
    

    #ulTable > li:first-child > ul > li {
        background-color:#c9c9c9;
        font-weight:bold;
        text-align:center;
    }

    #ulTable > li > ul {
        clear:both;
        padding:0px auto;
        position:relative;
        min-width:40px;
    }
    #ulTable > li > ul > li { 
        float:left;
        font-size:10pt;
        border-bottom:1px solid silver;
        vertical-align:baseline;
    }    

    #ulTable > li > ul > li:first-child               {width:10%;} /*No 열 크기*/
    #ulTable > li > ul > li:first-child +li           {width:45%;} /*제목 열 크기*/
    #ulTable > li > ul > li:first-child +li+li        {width:20%;} /*작성일 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li     {width:15%;} /*작성자 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li+li{width:10%;} /*조회수 열 크기*/

    #divPaging {
        clear:both; 
        margin:0 auto; 
        width:220px; 
        height:50px;
    }

    #divPaging > div {
        float:left;
        width: 30px;
        margin:0 auto;
        text-align:center;
    }

    #liSearchOption {clear:both;}
    #liSearchOption > div {
        margin:0 auto; 
        margin-top: 30px; 
        width:auto; 
        height:100px;

    }
    #title{
        font-size: 30px;
    }
    #btn{
        height: 30px;
        width: 100px;
    }
    .outer_top{
       width: 58%;
       height: 240px;
       border: 1px solid white;
       float: left;
    }
    .outer_bottom{
        width: 42%;
        height: 240px;
        border: 1px solid white;
        float: right;
     
    }
</style>
</head>

<body>
    <%@ include file="../common/navbar.jsp" %>
    
    	<br><br><br>
        	<div class="outer1">
            <form>
                <table>
                    <tr>
                        <div class="outer_top shadow p-3 mb-5 bg-body rounded">
                            <p id ="avgNumberTitle"><strong style="font-size: 30px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;시설이름 :<input type="text" id="avgNumber" value="<%=placeName %>" name="<%=placeName %>" style="margin-left: 30px; width: 350px;" readonly></strong></p>
                            <hr width="95%" style="float: left; margin-left: 10px;">
                            <p id ="avgNumberTitle"><strong style="font-size: 30px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;평균점수 :&nbsp;&nbsp;&nbsp;<input value="<%=avgScore %>" type="text" id="avgNumber" style="width: 62.8px; height: 35px; color: blue;" readonly>&nbsp;&nbsp;/&nbsp;&nbsp;10</strong></p>
                            <hr width="95%" style="float: left; margin-left: 10px;">
                        </div>
                   
                        <div class="outer_bottom shadow p-3 mb-5 bg-body rounded">
                            &nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;
                            <img src="<%=request.getContextPath()%>/<%=selectMainImagelist.get(0).getFilePath()%><%=selectMainImagelist.get(0).getChangeName() %>" style="width: 400px; height:237px; margin-top: -40px; margin-left: 10px;" class="shadow p-3 mb-5 bg-body rounded">
                        </div>

                        <td></td><br><br><br><br><br><br><br><br><br>
                        <!-- <p id="avgNumber"><input value="<%=avgScore %>" type="text" id="avgNumber" style="width: 47px; height: 35px; margin-left: -500px; color: blue;">&nbsp;&nbsp;/&nbsp;&nbsp;10</p>--><br><br>
                        <div class="shadow p-3 mb-5 bg-body rounded" style="margin-top: -10px;">
                        <p id="text3">별점</p>
                        <progress value="<%=slist.get(0).getReviewStar() %>" name="8" style="margin-left: 110px;" max="5" id="avgGage"></progress> &nbsp;<strong><%=slist.get(0).getReviewStar() %></strong>
                        </div>
                        <div class="shadow p-3 mb-5 bg-body rounded" style="margin-top: -10px;">
                        <p id="text3">청결도</p>
                        <progress value="<%=slist.get(0).getReview_c() %>" name="8" style="margin-left: 110px;" max="10" id="avgGage"></progress> &nbsp;<strong><%=slist.get(0).getReview_c() %></strong>
                        </div>
                        <div class="shadow p-3 mb-5 bg-body rounded">
                        <p id="text3">직원 & 서비스</p>
                        <progress value="<%=slist.get(0).getReview_s() %>" style="margin-left: 110px;" max="10" id="avgGage"></progress> &nbsp;<strong><%=slist.get(0).getReview_s() %></strong>
                        </div>
                        <div class="shadow p-3 mb-5 bg-body rounded">
                        <p id="text3">편의시설 서비스</p>
                        <progress value="<%=slist.get(0).getReview_p()  %>" style="margin-left: 110px;" max="10" id="avgGage"></progress> &nbsp;<strong><%=slist.get(0).getReview_p() %></strong>
                        </div>  
                        <div>
                            <!-- <img src="location1.png" style="width: 400px; height:200px; margin-left: 110px;"> -->
                        </div>
                    </tr>
                </table>
            </form>
        </div>
        <div class="outer2 shadow p-3 mb-5 bg-body rounded" >
            <div class="outer7">
                <ul>
                    <p id="title"><strong>❤️&nbsp;:&nbsp;<%=selectHeartCount %></strong></p> 
                    <hr width="100%" style="float: left;"><br>
                    <button class = "btn btn-secondary btn-sm" id="btn" onclick="reviewInsert();">후기작성</button><br><br>
                    <li style="font-size: 20px;"><strong>[<%=placeName%>] 후기들</strong></li><br>
                    <table  id = "ulTable" class="table table-bordered table-hover">
                        <thead>
                            <tr >
                                <th width="70"  style="background-color: rgb(19, 20, 19); color: white;">번호</th>
                                <th width="300" style="background-color: rgb(19, 20, 19); color: white;">이용시설</th>
                                <th width="150" style="background-color: rgb(19, 20, 19); color: white;">날짜</th>
                                <th width="130" style="background-color: rgb(19, 20, 19); color: white;">작성자</th>
                            </tr> 
                        </thead>
                        <tbody>
                                    <tr>
                                   	<% if(!plist.isEmpty()) { %>
                                    <% for(int i = 0; i < plist.size(); i++) { %>
                                        <td><%=plist.get(i).getRevCode()%></td>
                                        <td><%=plist.get(i).getPlaceName()%></td>
                                        <td><%=plist.get(i).getRevDate() %></td>
                                        <td><%=plist.get(i).getMemberName() %></td>
                                    </tr>
                                <% } %>
                                <% } %>
                        </tbody>
                    </table>
                    <br><br>
                        <div>
                            <div align="center" class="paging-area">
                                <% if(currentPage !=1) { %>
                                    <button onclick="doPageClick(<%= currentPage-1 %>)"class="btn btn-dark">&lt;</button>
                                <% } %>
                                <% for(int i = startPage; i <= endPage; i++) { %>
                                    <% if(i != currentPage) { %>
                                        <button onclick="doPageClick(<%=i%>)"class="btn btn-dark"><%=i %></button>
                                    <% } else { %>
                                        <button disabled class="btn btn-dark"><%=i %></button>
                                    <% } %>
                                <% } %>
                                
                                <% if(currentPage != maxPage) { %>
                                    <button onclick="doPageClick(<%= currentPage+1 %>)"class="btn btn-dark">&gt;</button>
                                <% } %>
	                      </div>
                   </div>
           	 </div>
        </div>
       

        <script>
            function reviewInsert(){
            	location.href = "<%=request.getContextPath()%>/insertReview.re?placeName=<%=placeName %>&memberNo=<%=memberNo%>&placeCode=<%=placeCode%>";
            }
            
           $(function(){
            	$("#ulTable>tbody>tr").click(function(){
            		
            		let revCode = $(this).children().eq(0).text()
            		
            		location.href = '<%=request.getContextPath()%>/detail.bo?memberNo=<%=memberNo%>&placeCode=<%=placeCode%>&revCode='+revCode;
            		
            		
            	});
            }) 
            
            function doPageClick(currentPage){
			location.href = "<%=request.getContextPath()%>/review.re?placeName=<%=placeName%>&placeCode=<%=placeCode%>&memberNo=<%=memberNo%>&currentPage="+currentPage;
		}
            
        </script>
        
        

</body>
</html>
