<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ontrip.location.vo.Location,
    com.ontrip.detailArea.vo.DetailArea ,com.ontrip.image.vo.Image,
    java.util.ArrayList"%>
<%@ page import="com.ontrip.detailArea.vo.DetailArea" %>

<%
	String localName = (String)request.getParameter("localName");
	String localText = (String)request.getAttribute("localText");
	ArrayList<DetailArea> darea = (ArrayList<DetailArea>)request.getAttribute("darea");
	ArrayList<Image> filePath = (ArrayList<Image>)request.getAttribute("filePath");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역 상세선택</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap');
html,
body {
    font-family: 'Noto Sans KR', sans-serif !important;
    -webkit-overflow-scrolling: touch !important;
    touch-action: manipulation;
    margin:0;
}
    .header{
        width: 1000px;
        margin: auto;
        margin-top: 50px;
        font-size: 60px;
        text-align: center;
    }
    
    .row {
        margin-left: auto;
        margin-right: auto;
        margin-bottom: 20px;
        color: black;
    }

    td img {
        width: 100%;
        height:100%;
    }

    table {
        width: 100%;
        table-layout: fixed;
    }
    
    .localText-style{
        /* font-family: Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif; */  
    	font-size : 23px;
    	text-align:center; 
    	width:700; 
    	height:100;
    	margin-left: 70px;
        margin-right: 70px;
    }
    
    #darea-btn{
    	width:150px;
    	height:70px;
    	margin-right: 40px;
    	background-color: rgb(228, 201, 126);
    	font-weight: bold;
    	font-size:20px;
        border:none;
    }
    #darea-btn:hover{
    	background-color:rgb(252, 218, 125);
    	font-size: 22px;
    }	
    #darea-btn:active{
    	background-color:rgb(210, 185, 116);
    }
    pre{
    	font-family: 'Noto Sans KR', sans-serif !important;
        border-radius: 15px;
	    background-color: rgb(250, 250, 250);
	    padding:30px;
	    overflow: auto;
	    white-space: pre-wrap;
	    font-weight : 700;
	    font-size:17.5px !important;
	    color: rgb(74, 74, 74);
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
<!-- 폰트적용  -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<script
        src="https://code.jquery.com/jquery-3.6.1.min.js"
        integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
        crossorigin="anonymous">
</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"> 
</head>
<body>

	 <%@ include file="../common/navbar.jsp" %>
                  
	<br>
    <br><br><br>
    
    <div class="uk-section uk-section-default sl-in2" style="min-width: 90vw; height:20vh;">
        <div class="uk-container">
            <div style="text-align: center; margin-top : -1.5%;">
                <div style="font-size:40px; font-weight:600;"><%=localName %></div><br>
                <div style="color:rgb(168, 167, 167);">Show your beautiful trip!</div>
                
            </div>
        </div>
    </div>
    
  <%--   <div class="header">
    
        <h1 class = "locationtitle" style="font-size:40px;"><%=localName %></h1>
        <h4>&nbsp;</h4>
        <h6 style="text-align: center; color:rgb(168, 167, 167); font-size:15px; font-weight:600;">가고싶은 지역을 선택해주세요</h6>
    </div> --%>

    <br><br>

    <div class="sl-in2" style="width: 80%; margin:auto; text-align: center;">
        <div class="row" id="cityList" style=" margin:auto; border:none;">
            <table width="30" height="20" style="border:none; box-shadow:0 0 7px 1px lightgrey;">
                <tr>
                    <td style="width:30%;">
                    	<img src="<%=filePath.get(0).getFilePath()%><%=filePath.get(0).getOriginName() %>" style="border-radius:10px;" >
                    </td>
                    <td rowspan="2" style="text-align: center;">
                        <h1></h1>
                        <br>
                        <div class="localText-style">
                        <pre>
<%=localText %>
                        </pre>
						</div>
						
						<br>
						<p style="color:grey; margin-left:-5%; font-weight:600;">* 상세지역을 클릭해주세요</p>
						<br>
						
						<% if(!darea.isEmpty()) { %>
                  <% for( DetailArea d : darea){ %>
						
						<button name=<%= d.getLocalCode() %> onclick="movedArea('<%= d.getdAreaCode()%>');" id="darea-btn" type="button" class="btn btn-secondary btn-lg"><%= d.getdAreaName() %></button>
						&nbsp;&nbsp;&nbsp;
				  <% }  %>
				<% } %>
					</td>
                </tr>
                <tr>
                    <td><img src="<%=filePath.get(1).getFilePath()%><%=filePath.get(1).getOriginName()%>" style="border-radius:10px;" ></td>
                </tr>
            </table>
    
    		<script>
    		function movedArea(dareaCode){
    			location.href= "<%=request.getContextPath()%>"+"/selectPlace.no?dareaCode="+ dareaCode;
    		}
    		
    		</script>

        </div>
    </div>
    <br><br><br><br>
</body>
</html>