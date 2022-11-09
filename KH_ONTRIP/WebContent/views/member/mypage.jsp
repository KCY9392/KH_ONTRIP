<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        background-color: white; /* 해당사이트의 고유한 색상으로 작성 */
        color: black;
        width: 20px;
        height: 700px;
        border: 1px solid black;
        margin-top: 50px;
        box-sizing: border-box;
    }
    .outers{
        height: 100%;
        display: inline-block;
        position: relative;
    }
    .userResult , .reserveResult , .heartResult , .reviewResult , .statusResult{
        width: 250px;
        height: 170px;
        border: 1px solid green;
        background-color: darkseagreen;
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

    <fieldset>
        <div class="outer">
            <div class="outers">
                 <div class="userResult"> 
                     
                 </div>
                 <div class="reserveResult"> 
             
                 </div>
                 <div class="heartResult"> 
             
                 </div>
                 <div class="reviewResult"> 
             
                 </div>
                 <div class="statusResult"> 
             
                 </div>
            </div>
         </div>

    </fieldset>

    
</body>
</html>