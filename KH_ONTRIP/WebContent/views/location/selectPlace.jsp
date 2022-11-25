<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.ontrip.detailArea.vo.DetailArea ,com.ontrip.image.vo.Image,
    com.ontrip.place.model.vo.Place , java.util.ArrayList"%>
<%
   Member User = (Member)session.getAttribute("loginUser");
   String dareaName = (String)request.getAttribute("dareaName");
   ArrayList<Image> filePath = (ArrayList<Image>)request.getAttribute("filePath");
   ArrayList<Image> playPath = (ArrayList<Image>)request.getAttribute("playPath");
   ArrayList<Place> playInfo = (ArrayList<Place>)request.getAttribute("playInfo");
   ArrayList<Image> foodPath = (ArrayList<Image>)request.getAttribute("foodPath");
   ArrayList<Place> foodInfo = (ArrayList<Place>)request.getAttribute("foodInfo");
   ArrayList<Image> hotelPath = (ArrayList<Image>)request.getAttribute("hotelPath");
   ArrayList<Place> hotelInfo = (ArrayList<Place>)request.getAttribute("hotelInfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역 상세선택</title>
<style>
body {
	margin: 0;
}

div {
	box-sizing: border-box;
}

.outer {
	background-color: white; /* 해당사이트의 고유한 색상으로 작성 */
	color: black;
	width: 1000px;
	height: 580px;
	border: 1px solid white;
	margin: auto;
	margin-top: 50px;
	display: flex;
}

.locationtitle {
	width: 1000px;
	margin: auto;
	margin-top: 50px;
	font-size: 60px;
}

.outer1 {
	width: 50%;
	margin: -1;
	/* border: 1px solid black; */
	height: 100%;
	display: inline-block;
}
.right {
	height: 75%;
	width: 100%;
}
.img-box1 img{
   width:497px;
   height:289.91px;
}
.img-box2 img{
   width:996px;
   height:290.5px;
}


.bottom {
	width: 1000px;
	height: 750px;
	/* border: 1px solid black; */
	margin: auto;
}

.selectTitle {
	text-align: center;
}

#mForm {
	border: none
}

#n, #m, #s {
	width: 315px;
	height: 53px;
}

.box {
	width: 930px;
	height: 550px;
	margin: auto;
	margin: 10px;
	padding: 10px;
}
.box2{
	display:none;
}

.outer2 {
	width: 100%;
	/* border: 1px solid black; */
}

.outer7 {
	background-color: white; /* 해당사이트의 고유한 색상으로 작성 */
	color: black;
	width: 950px;
	height: 200px;
	border: 1px solid rgb(167, 166, 166);
	margin: auto;
	margin-top: 10px;
	margin-left: -30px;
	display: flex;
}

.outer8 {
   width: 40%;
   height: 100%;
   border-right: 1px solid rgb(167, 166, 166);
}

.outer10{
   width: 65%;
   height: 100%;
}
.outer11{
   margin-top: 50px;
}

.outer7.shadow-lg :hover{
   background-color: rgb(207, 206, 206);
   cursor : pointer;
}


.sl-in2 {
	  animation: change1 1s ease forwards;
	}
	
	@keyframes change1 {
	  from {
	    transform: translateY(50%);
	  }
	
	  to {
	    transform: translateY(0%);
	  }
	}
</style>
<link href="<%= request.getContextPath()%>/resources/css/clickHotel.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
</head>
<body>

	<%@ include file="../common/navbar.jsp"%>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<h1 class="locationtitle"><%=dareaName %></h1>

	<br>
	<br>
	<br>

	<div class="outer sl-in2" style="margin: auto;">
		<div class="right">
			<table>
				<tr>
					<td class="img-box1"><img
						src="<%=filePath.get(0).getFilePath()%><%=filePath.get(0).getOriginName() %>"></td>
					<td class="img-box1"><img
						src="<%=filePath.get(1).getFilePath()%><%=filePath.get(1).getOriginName() %>"></td>
				</tr>
				<tr>
					<td class="img-box2" colspan="2"><img
						src="<%=filePath.get(2).getFilePath()%><%=filePath.get(2).getOriginName() %>"></td>
				</tr>
			</table>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>

	<div class="bottom" style="width: 100%">
		<fieldset id="mForm">
			<div class="selectTitle">
				<button type="button" class="btn-div" id="n" name="search"
					onclick="show(this);">놀거리</button>
				<button type="button" class="btn-div" id="m" name="search"
					onclick="show(this);">맛집</button>
				<button type="button" class="btn-div" id="s" name="search"
					onclick="show(this);">숙소</button>
			</div>


			<!-- 놀거리버튼 클릭시 해당상세지역의 놀거리가 뜸 -->
			<div id="nsearch" class="box"
				style="padding: 20px; text-align: center;">
				<!-- border:1px solid black; -->
				<% if(!playPath.isEmpty()) { %>
				<% for(int i=0; i<playPath.size(); i++){ %>
				 <div class="outer7 shadow-lg" onclick="movePlay('<%= playInfo.get(i).getPlcName() %>','<%= dareaName%>', '<%= User.getMemberNo() %>')">
	               <div class="outer8">
	                     <img
	                        src="<%= request.getContextPath() %>/<%=playPath.get(i).getFilePath()+playPath.get(i).getChangeName() %>"
	                        width="100%" height="198px">
	               </div>
	               <div class="outer10">
	                  <div class="outer11">
	                  <span style="border: 0; font-size: 20px; font-weight: bold;"><%=playInfo.get(i).getPlcName() %></span><br><br>
	                  <span style="font-size: 15px;"><%=playInfo.get(i).getPlcAddress() %><br><%=playInfo.get(i).getPlcPnumber() %></span>
	                  </div>
	               </div>
	            </div>
				<%} %>
				<%} %>
			</div>



			<!-- 맛집버튼 클릭시 해당상세지역의 맛집이 뜸 -->
			<div id="msearch" class="box box2" style="padding: 20px; text-align: center;">
				<% if (!foodPath.isEmpty()) { %>
				<% for (int i = 0; i < foodPath.size(); i++) { %>
				<div class="outer7 shadow-lg" onclick="moveFood('<%= foodInfo.get(i).getPlcName() %>','<%= dareaName%>', '<%= User.getMemberNo() %>')">
	               <div class="outer8">
	                     <img
	                        src="<%= request.getContextPath() %>/<%=foodPath.get(i).getFilePath()+foodPath.get(i).getChangeName() %>"
	                        width="100%" height="198px">
	               </div>
	               <div class="outer10">
	                  <div class="outer11">
	                  <span style="border: 0; font-size: 20px; font-weight: bold;"><%=foodInfo.get(i).getPlcName() %></span><br><br>
	                  <span style="font-size: 15px;"><%=foodInfo.get(i).getPlcAddress() %><br><%=foodInfo.get(i).getPlcPnumber() %></span>
	                  </div>
	               </div>
	            </div>
				<% } %>
				<% } %>
			</div>




			<!-- 숙소버튼 클릭시 해당상세지역의 숙소가 뜸 -->
			<div id="ssearch" class="box box2" style="padding: 20px; text-align: center;">
				<% if (!hotelPath.isEmpty()) { %>
				<% for (int i = 0; i < hotelPath.size(); i++) { %>
				<div class="outer7 shadow-lg" onclick="moveHotel('<%= hotelInfo.get(i).getPlcName() %>','<%= dareaName%>', '<%= User.getMemberNo() %>')">
	               <div class="outer8">
	                     <img
	                        src="<%= request.getContextPath() %>/<%=hotelPath.get(i).getFilePath()+hotelPath.get(i).getChangeName() %>"
	                        width="100%" height="198px">
	               </div>
	               <div class="outer10">
	                  <div class="outer11">
	                  <span style="border: 0; font-size: 20px; font-weight: bold;"><%=hotelInfo.get(i).getPlcName() %></span><br><br>
	                  <span style="font-size: 15px;"><%=hotelInfo.get(i).getPlcAddress() %><br><%=hotelInfo.get(i).getPlcPnumber() %></span>
	                  </div>
	               </div>
	            </div>
				<% } %>
				<% } %>
			</div>
		</fieldset>
	</div>

	<script>
        function show(element){
            let tag = document.getElementsByClassName("box");

            for(let i=0; i<tag.length; i++){
                if(element.id+"search" == tag[i].id){
                    tag[i].style.display = "block";
                }else{
                    tag[i].style.display = "none";
                }
            }
        }
    </script>
	<script>
	
	function movePlay(placeName, dareaName, memberNo){
		location.href= "<%=request.getContextPath()%>"+"/selectPlay.pe?placeName="+ placeName+ "&dareaName=" +dareaName+  "&memberNo=" +memberNo;
	}
	
	function moveFood(placeName, dareaName, memberNo){
		location.href= "<%=request.getContextPath()%>"+"/selectFood.pe?placeName="+ placeName+ "&dareaName=" +dareaName+  "&memberNo=" +memberNo;
	}
	
	function moveHotel(placeName, dareaName, memberNo){
		location.href= "<%=request.getContextPath()%>"+"/selectHotel.pe?placeName="+ placeName+ "&dareaName=" +dareaName+  "&memberNo=" +memberNo;
	}

    </script>
</body>
</html>