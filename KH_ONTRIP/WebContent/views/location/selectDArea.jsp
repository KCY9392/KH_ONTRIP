<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ontrip.location.vo.Location, com.ontrip.detailArea.vo.DetailArea ,com.ontrip.image.vo.Image,
    java.util.ArrayList"%>
    
<%
	String localName = (String)request.getParameter("localName");
	String localText = (String)request.getAttribute("localText");
   
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
    }

    table {
        width: 100%;
        table-layout: fixed;
    }
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"> 
</head>
<body>

   <%@ include file="../common/navbar.jsp" %>

    <br><br><br><br>
    
    <div class="header">
    
        <h1 class = "locationtitle"><%=localName %></h1>
        <h4>&nbsp;</h4>
        <h6 style="text-align: center; color:lightgrey;">가고싶은 지역을 선택해주세요</h6>
    </div>

    <br><br>

    <div style="width: 80%; margin:auto; text-align: center;">
        <div class="row" id="cityList" style=" margin:auto;">
            <table border="1" width="30" height="20">
                <tr>
                    <td><img src="views/location/selectDArea/seoul1.jpg" ></td>
                    <td colspan="2" style="text-align: center;">
                        <h1></h1>
                        <br><br>
                        <p>
							<%=localText %>
                        </p>

                        <br><br><br>

                        
            
                  <button> </button>
            
                    </td>
                </tr>
                <tr>
                    <td><img src="views/location/selectDArea/seoul2.jpg"></td>
                </tr>
            </table>
    
        </div>
    </div>
</body>
</html>