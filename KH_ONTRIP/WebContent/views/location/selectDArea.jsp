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
        font-family: Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;  
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
    	margin-right: 50px;
    	background-color:rgb(155, 205, 138);
    	font-weight: bold;
    	font-size:20px;
        border-color: rgb(155, 205, 138);
    }
    
    pre{
        border-radius: 25px;
	    background-color: rgba(227, 226, 226, 0.393);
	    padding:10px;
	    overflow: auto;
	    white-space: pre-wrap;
	    font-weight : bolder;
	    font-size:35px;
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
    <br><br><br><br>
    
    <div class="header">
    
        <h1 class = "locationtitle"><%=localName %></h1>
        <h4>&nbsp;</h4>
        <h6 style="text-align: center; color:lightgrey;">가고싶은 지역을 선택해주세요</h6>
    </div>

    <br><br>

    <div class="sl-in2" style="width: 80%; margin:auto; text-align: center;">
        <div class="row" id="cityList" style=" margin:auto;">
            <table border="1" width="30" height="20">
                <tr>
                    <td style="width:30%;"><img src="<%=filePath.get(0).getFilePath()%><%=filePath.get(0).getOriginName() %>" ></td>
                    <td rowspan="2" style="text-align: center;">
                        <h1></h1>
                        <br>
                        <div class="localText-style">
                        <pre>
<%=localText %>
                        </pre>
						</div>
						
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
                    <td><img src="<%=filePath.get(1).getFilePath()%><%=filePath.get(1).getOriginName()%>"></td>
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