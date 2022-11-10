<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ontrip.location.vo.Location, com.ontrip.detailArea.vo.DetailArea ,com.ontrip.image.vo.Image"%>
    
<%
	String localName = (String)request.getAttribute("localName"); //대표지역 : 대표지역 이름, 상세텍스트 가져오기
	
// 	DetailArea da = (DetailArea)request.getAttribute("da"); //상세지역 : 상세지역 이름 가져오기
	 
// 	Image im = (Image)request.getAttribute("im"); //이미지 : 대표지역 사진 가져오기
	
// 	Array array = 
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

    <nav class="navbar bg-light" style="position:fixed; z-index:9999; width:100vw; ">
        <div class="container-fluid" style="background-color: white; padding-bottom: 7px; border-bottom:1px solid rgb(218, 213, 213);">
          <a class="navbar-brand" href="mainPage.html">
            <b class="nav_b">Ontrip</b>&nbsp;
            <h7 style="font-size:13px; color:rgb(151,154,151);">MAKE YOUR ROUTE OPTIMIZED</h7>
          </a>
          <form class="d-flex" role="click">
            
            <button style="border:none; color:black;" class="btn btn-outline-success" type="submit">마이페이지</button>
            <button style="margin-right: 40px; margin-left:20px; color:black; border:none;" class="btn btn-outline-success" type="submit">로그아웃</button>
          </form>
        </div>
      </nav>

    <br><br><br><br>
    
    <div class="header">
        <h1 class = "locationtitle"><%= localName %></h1>
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
                           <%= lo.getLocalText() %>
                        </p>

                        <br><br><br>

                        <button><%= da.get %></button>
                        <button>서울의 상세지역2</button>
                        <button>서울의 상세지역3</button>
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