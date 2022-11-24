<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ontrip.image.vo.Image, com.ontrip.place.model.vo.Place , java.util.ArrayList"%>
<%
	ArrayList<Image> placePath = (ArrayList<Image>)request.getAttribute("placePath");
	ArrayList<Place> placeInfo = (ArrayList<Place>)request.getAttribute("placeInfo");
	
	ArrayList<Image> placeHashPath = (ArrayList<Image>)request.getAttribute("placeHashPath");
	ArrayList<Place> placeHashInfo = (ArrayList<Place>)request.getAttribute("placeHashInfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"> 
<style>
    body{
        margin:0;
    }
    div{
        box-sizing: border-box;
    }
    .searchtitle{
        width: 1000px;
        margin: auto;
        margin-top: 50px;
        font-size: 60px;
        text-align: center;
    }
    .bottom{
        width: 1000px;
        height: 750px;
        /* border: 1px solid black; */
        margin: auto;
    }
    .outer7{
        background-color: white; /* 해당사이트의 고유한 색상으로 작성 */
        color: black;
        width: 950px;
        height: 200px;
        border: 1px solid rgb(167, 166, 166);
        margin: auto;
        margin-top: 10px;
        margin-left: 100x;
        display:flex;
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
    #mForm{
        border: none
    }
</style>
</head>
<body>
    <%@ include file="../common/navbar.jsp" %>
    
      <br><br><br><br>
      <h1 class="searchtitle">검색결과</h1>

      <br><br>

	<div class="bottom" style="width: 100%; text-align: center;">
		<fieldset id="mForm">

			
			<% if(!placeHashPath.isEmpty()) { %>
			<% for(int i=0; i<placeHashPath.size(); i++){ %>
                    <div class="outer7 shadow-lg" onclick="movePlace('<%= placeHashInfo.get(i).getPlcName() %>','<%= placeHashInfo.get(i).getDareaName()%>', '<%= loginUser.getMemberNo() %>', '<%= placeHashInfo.get(i).getCategoryCode()%>')">
	               <div class="outer8">
	                     <img
	                        src="<%= request.getContextPath() %>/<%=placeHashPath.get(i).getFilePath()+placeHashPath.get(i).getChangeName() %>"
	                        width="100%" height="198px">
	               </div>
	               <div class="outer10">
	                  <div class="outer11">
	                  <span style="border: 0; font-size: 20px; font-weight: bold;"><%=placeHashInfo.get(i).getPlcName() %></span><br><br>
	                  <span style="font-size: 15px;"><%=placeHashInfo.get(i).getPlcAddress() %><br><%=placeHashInfo.get(i).getPlcPnumber() %></span>
	                  </div>
	               </div>
	            </div> 
				<%} %>
			<%} %>
	
		</fieldset>
	</div>
	<script>
		function movePlace(placeName, dareaName, memberNo, categoryCode){
			if(categoryCode == "PP"){
				location.href= "<%=request.getContextPath()%>"+"/selectPlay.pe?placeName="+ placeName+ "&dareaName=" +dareaName+  "&memberNo=" +memberNo;				
			} else if(categoryCode == "FF"){
				location.href= "<%=request.getContextPath()%>"+"/selectFood.pe?placeName="+ placeName+ "&dareaName=" +dareaName+  "&memberNo=" +memberNo;
			} else{
				location.href= "<%=request.getContextPath()%>"+"/selectHotel.pe?placeName="+ placeName+ "&dareaName=" +dareaName+  "&memberNo=" +memberNo;
			}
		}
	</script>
</body>
</html>