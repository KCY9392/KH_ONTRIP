<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ontrip.member.model.vo.Member"%>
<%
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>온트립(OnTrip) - 숙소, 즐길거리, 맛집 추천사이트</title>
    <link href="<%= contextPath %>/resources/css/mainForm.css" rel="stylesheet" >
    
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

  <br><br><br><br><br><br><br>

  <div class="title-text">
    <h1>어떤 여행을 원하시나요?</h1>
  </div>

  <hr style="border-bottom:5px solid black; width:600px; margin:auto;"> <br>
  
  <div class="center-hash"># 해시태그를 검색창에 추가해주세요</div>

  <br>

  <div class="input-group mb-3" style="width:700px; height:50px; margin:auto;">
    <input style="border:2px solid rgb(206, 204, 204);" type="text" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
    <button style="border:2px solid rgb(206, 204, 204); color:burlywood; font-weight: bold;" class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
  </div>

  <br><br><br>
<div style="width: 90%; margin:auto; text-align: center; ">
  <div class="row" id="cityList" style=" margin:auto;">
    
    <div class="col s12 m6 l3" name="asia">
      <input type="hidden" value="서울">
      <a onclick="" style="color:inherit; text-decoration: none!important;"  aria-expanded="false">
      <!-- a href=" /mainForm.no?placeValue='서울' " -->
        <div class="card city-card-style" style="margin:0; border: none !important; ">
          <div class="card-image imgbox">
            <img src="resources/image/seoul.jpg" alt="city">
          </div>
          <div class="city-card-contents-div">
            <br>
              <div class="citynamefont"><b>Seoul</b><br>
                <h6 class="city-card-contents-subtitle">대한민국 서울</h6>
              </div>
          </div>
        </div>
      </a>
    </div>

    <div class="col s12 m6 l3" name="asia">
      <input type="hidden" value="제주도">
      <a onclick="" style="color:inherit; text-decoration: none!important;" aria-expanded="false">
        <div class="card city-card-style" style="margin:0; border: none !important; ">
          <div class="card-image imgbox">
            <img src="resources/image/jeju.jpg" alt="city">
          </div>
          <div class="city-card-contents-div">
            <br>
              <div class="citynamefont"><b>Jeju</b><br>
                <h6 class="city-card-contents-subtitle">대한민국 제주도</h6>
              </div>
          </div>
        </div>
      </a>
    </div>

    <div class="col s12 m6 l3" name="asia">
      <input type="hidden" value="경기도">
      <a onclick="" style="color:inherit; text-decoration: none!important;" aria-expanded="false">
        <div class="card city-card-style" style="margin:0; border: none !important; ">
          <div class="card-image imgbox">
            <img src="resources/image/paju.jpg" alt="city">
          </div>
          <div class="city-card-contents-div">
            <br>
              <div class="citynamefont"><b>Gyeonggi-do</b><br>
                <h6 class="city-card-contents-subtitle">대한민국 경기도</h6>
              </div>
          </div>
        </div>
      </a>
    </div>

    

    
    
    <div class="col s12 m6 l3" name="asia">
      <input type="hidden" value="강원도">
      <a onclick="" style="color:inherit; text-decoration: none!important;" aria-expanded="false">
        <div class="card city-card-style" style="margin:0; border: none !important; ">
          <div class="card-image imgbox">
            <img src="resources/image/pyeongchang.jpg" alt="city">
          </div>
          <div class="city-card-contents-div">
            <br>
              <div class="citynamefont"><b>Gangwon-do</b><br>
                <h6 class="city-card-contents-subtitle">대한민국 강원도</h6>
              </div>
          </div>
        </div>
      </a>
    </div>

    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br>

    
    <div class="col s12 m6 l3" name="asia">
      <input type="hidden" value="충청도">
      <a onclick="" style="color:inherit; text-decoration: none!important;" aria-expanded="false">
        <div class="card city-card-style" style="margin:0; border: none !important; ">
          <div class="card-image imgbox">
            <img src="resources/image/yesan.jpg" alt="city">
          </div>
          <div class="city-card-contents-div">
            <br>
              <div class="citynamefont"><b>Chungcheong-do</b><br>
                <h6 class="city-card-contents-subtitle">대한민국 충청도</h6>
              </div>
          </div>
        </div>
      </a>
    </div>

    <div class="col s12 m6 l3" name="asia">
      <input type="hidden" value="전라도">
      <a onclick="" style="color:inherit; text-decoration: none!important;" aria-expanded="false">
        <div class="card city-card-style" style="margin:0; border: none !important; ">
          <div class="card-image imgbox">
            <img src="resources/image/jeonju.jpg" alt="city">
          </div>
          <div class="city-card-contents-div">
            <br>
              <div class="citynamefont"><b>Jeolla-do</b><br>
                <h6 class="city-card-contents-subtitle">대한민국 전라도</h6>
              </div>
          </div>
        </div>
      </a>
    </div>

    <div class="col s12 m6 l3" name="asia">
      <input type="hidden" value="경상도">
      <a onclick="" style="color:inherit; text-decoration: none!important;" aria-expanded="false">
        <div class="card city-card-style" style="margin:0; border: none !important; ">
          <div class="card-image imgbox">
            <img src="resources/image/busan.jpg" alt="city">
          </div>
          <div class="city-card-contents-div">
            <br>
              <div class="citynamefont"><b>Gyeongsang-do</b><br>
                <h6 class="city-card-contents-subtitle">대한민국 경상도</h6></div>
          </div>
        </div>
      </a>
    </div>

</body>
</html>





