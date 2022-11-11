<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역 상세선택</title>
<style>
    body{
        margin:0;
    }
    div{
        box-sizing: border-box;
    }
    .outer{
        background-color: white; /* 해당사이트의 고유한 색상으로 작성 */
        color: black;
        width: 1000px;
        height: 800px;
        border: 1px solid black;
        margin: auto;
        margin-top: 50px;
        display:flex;
    }
    .locationtitle{
        width: 1000px;
        margin: auto;
        margin-top: 50px;
        font-size: 60px;
    }
    .outer1{
        width: 50%;
        margin: -1;
        border: 1px solid black;
        height: 100%;
        display: inline-block;
    }
    .right{
        height: 100%;
        width: 50%;
        display: inline-block;
        position: relative;
    }
    .outer2{
        width: 100%;
        border: 1px solid blue;
        height: 70%;
        float: right;
        position: relative;
        
    }
    .outer3{
        width: 100%;
        border: 1px solid red;
        height: 30%;
        float: right;
        position: relative;
    }
    .bottom{
        width: 1000px;
        height: 750px;
        border: 1px solid black;
        margin: auto;
    }
    .selectTitle{
        text-align: center;
    }
    #mForm{
        border: none
    }
    #n , #m , #s{
        width:315px;
        height: 53px;
    }
    .box{
        width: 930px;
        height: 550px;
        margin: auto;
        display: none;
        margin: 10px;
        padding: 10px;
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

    <br><br><br><br><br><br>
    
    <h1 class = "locationtitle">서울(강남)</h1>

    <br>
    <br>
    <br>
    
    <div class = "outer">
            <div class = "outer1">
                

            </div>
       
        <div class = "right">
            <div class = "outer2">
        
            
            </div>
            <div class = "outer3">
        

            </div>
        </div>
    </div>

    <br><br><br><br>

    <div class = "bottom">
        <fieldset id = "mForm">
            <div class = "selectTitle">
                <button type="button" id = "n" name="search" onclick="show(this);">놀거리</button>
                <button type="button" id = "m" name="search" onclick="show(this);">맛집</button>
                <button type="button" id = "s" name="search" onclick="show(this);">숙소</button>

                <div id = "nsearch" class = "box">
                    <img src = "selectPlace/image1.png" width = "930px" height = "550px"> &nbsp;
                    <br><br><br>
                    ◀&nbsp;&nbsp;&nbsp;<strong>1</strong>&nbsp;&nbsp;&nbsp;2&nbsp;&nbsp;&nbsp;3&nbsp;&nbsp;&nbsp;4&nbsp;&nbsp;&nbsp;6&nbsp;&nbsp;&nbsp;7&nbsp;&nbsp;&nbsp;8&nbsp;&nbsp;&nbsp;9&nbsp;&nbsp;&nbsp;10&nbsp;&nbsp;&nbsp;▶
                </div>
            
                <div id = "msearch" class = "box"> 
                    <img src = "selectPlace/image2.png" width = "930px" height = "550px"> &nbsp;
                    <br><br><br>
                    ◀&nbsp;&nbsp;&nbsp;1&nbsp;&nbsp;&nbsp;<strong>2</strong>&nbsp;&nbsp;&nbsp;3&nbsp;&nbsp;&nbsp;4&nbsp;&nbsp;&nbsp;6&nbsp;&nbsp;&nbsp;7&nbsp;&nbsp;&nbsp;8&nbsp;&nbsp;&nbsp;9&nbsp;&nbsp;&nbsp;10&nbsp;&nbsp;&nbsp;▶
                </div>
            
                <div id = "ssearch" class = "box">
                    <img src = "selectPlace/image3.png" width = "930px" height = "550px"> &nbsp;
                    <br><br><br>
                    ◀&nbsp;&nbsp;&nbsp;1&nbsp;&nbsp;&nbsp;2&nbsp;&nbsp;&nbsp;<strong>3</strong>&nbsp;&nbsp;&nbsp;4&nbsp;&nbsp;&nbsp;6&nbsp;&nbsp;&nbsp;7&nbsp;&nbsp;&nbsp;8&nbsp;&nbsp;&nbsp;9&nbsp;&nbsp;&nbsp;10&nbsp;&nbsp;&nbsp;▶
                </div>
            </div>
        </fieldset>
    </div>
 
    <br><br><br>

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

</body>
</html>