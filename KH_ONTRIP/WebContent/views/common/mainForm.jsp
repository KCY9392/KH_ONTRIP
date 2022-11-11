<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ontrip.member.model.vo.Member"%>
<%
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"> 
<link href="<%= contextPath %>/resources/css/mainForm.css" rel="stylesheet" >

<script
        src="https://code.jquery.com/jquery-3.6.1.min.js"
        integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
        crossorigin="anonymous">j10
</script>

</head>
<body>


<%@ include file="../common/navbar.jsp" %>
	
<br><br><br><br><br><br><br>

<div class="title-text">
<h1 style="font-weight:bold; font-size:30px;">어떤 여행을 원하시나요?</h1>
</div>
<br>
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
  <input type="hidden" value="대한민국 순천">
  <a onclick="" style="color:inherit; text-decoration: none!important;"  aria-expanded="false">
    <div class="card city-card-style hoverable z-depth-2" style="margin:0;">
      <div class="card-image imgbox">
        <img src="resources/image/suncheon.jpg" alt="city" loading="lazy">
      </div>
      <div class="city-card-contents-div">
        <br>
          <div class="citynamefont"><b>Suncheon</b><br>
            <h6 class="city-card-contents-subtitle">대한민국 순천</h6>
          </div>
      </div>
    </div>
  </a>
</div>

<div class="col s12 m6 l3" name="asia">
  <input type="hidden" value="대한민국 전주">
  <a onclick="" style="color:inherit; text-decoration: none!important;" aria-expanded="false">
    <div class="card city-card-style hoverable z-depth-2" style="margin:0;">
      <div class="card-image imgbox">
        <img src="resources/image/jeonju.jpg" alt="city" loading="lazy">
      </div>
      <div class="city-card-contents-div">
        <br>
          <div class="citynamefont"><b>Jeonju</b><br>
            <h6 class="city-card-contents-subtitle">대한민국 전주</h6>
          </div>
      </div>
    </div>
  </a>
</div>



<div class="col s12 m6 l3" name="asia">
  <input type="hidden" value="대한민국 제주도">
  <a onclick="" style="color:inherit; text-decoration: none!important;" aria-expanded="false">
    <div class="card city-card-style hoverable z-depth-2" style="margin:0;">
      <div class="card-image imgbox">
        <img src="resources/image/jeju.jpg" alt="city" loading="lazy">
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
  <input type="hidden" value="대한민국 부산">
  <a onclick="" style="color:inherit; text-decoration: none!important;" aria-expanded="false">
    <div class="card city-card-style hoverable z-depth-2" style="margin:0;">
      <div class="card-image imgbox">
        <img src="resources/image/busan.jpg" alt="city" loading="lazy">
      </div>
      <div class="city-card-contents-div">
        <br>
          <div class="citynamefont"><b>Busan</b><br>
            <h6 class="city-card-contents-subtitle">대한민국 부산</h6>
          </div>
      </div>
    </div>
  </a>
</div>

<div class="col s12 m6 l3" name="asia">
  <input type="hidden" value="대한민국 경주">
  <a onclick="" style="color:inherit; text-decoration: none!important;" aria-expanded="false">
    <div class="card city-card-style hoverable z-depth-2" style="margin:0;">
      <div class="card-image imgbox">
        <img src="resources/image/gyeongju.jpg" alt="city" loading="lazy">
      </div>
      <div class="city-card-contents-div">
        <br>
          <div class="citynamefont"><b>Gyeongju</b><br>
            <h6 class="city-card-contents-subtitle">대한민국 경주</h6>
          </div>
      </div>
    </div>
  </a>
</div>

<div class="col s12 m6 l3" name="asia">
  <input type="hidden" value="대한민국 강릉">
  <a onclick="" style="color:inherit; text-decoration: none!important;" aria-expanded="false">
    <div class="card city-card-style hoverable z-depth-2" style="margin:0;">
      <div class="card-image imgbox">
        <img src="resources/image/gangneung.jpg" alt="city" loading="lazy">
      </div>
      <div class="city-card-contents-div">
        <br>
          <div class="citynamefont"><b>Gangneung</b><br>
            <h6 class="city-card-contents-subtitle">대한민국 강릉</h6>
          </div>
      </div>
    </div>
  </a>
</div>

<div class="col s12 m6 l3" name="asia">
  <input type="hidden" value="대한민국 여수">
  <a onclick="" style="color:inherit; text-decoration: none!important;" aria-expanded="false">
    <div class="card city-card-style hoverable z-depth-2" style="margin:0;">
      <div class="card-image imgbox">
        <img src="resources/image/yeosu.jpg" alt="city" loading="lazy">
      </div>
      <div class="city-card-contents-div">
        <br>
          <div class="citynamefont"><b>Yeosu</b><br>
            <h6 class="city-card-contents-subtitle">대한민국 여수</h6></div>
      </div>
    </div>
  </a>
</div>

<div class="col s12 m6 l3" name="asia">
  <input type="hidden" value="대한민국 아산">
  <a onclick="" style="color:inherit; text-decoration: none!important;" aria-expanded="false">
    <div class="card city-card-style hoverable z-depth-2" style="margin:0;">
      <div class="card-image imgbox">
        <img src="resources/image/asan.jpg" alt="city" loading="lazy">
      </div>
      <div class="city-card-contents-div">
        <br>
          <div class="citynamefont"><b>Asan</b><br>
            <h6 class="city-card-contents-subtitle">대한민국 아산</h6></div>
      </div>
    </div>
  </a>
</div>

<div class="col s12 m6 l3" name="asia">
  <input type="hidden" value="대한민국 예산">
  <a onclick="" style="color:inherit; text-decoration: none!important;" aria-expanded="false">
    <div class="card city-card-style hoverable z-depth-2" style="margin:0;">
      <div class="card-image imgbox">
        <img src="resources/image/yesan.jpg" alt="city" loading="lazy">
      </div>
      <div class="city-card-contents-div">
        <br>
          <div class="citynamefont"><b>Yesan</b><br>
            <h6 class="city-card-contents-subtitle">대한민국 예산</h6></div>
      </div>
    </div>
  </a>
</div>

<div class="col s12 m6 l3" name="asia">
  <input type="hidden" value="대한민국 천안">
  <a onclick="" style="color:inherit; text-decoration: none!important;" aria-expanded="false">
    <div class="card city-card-style hoverable z-depth-2" style="margin:0;">
      <div class="card-image imgbox">
        <img src="resources/image/cheonan.jpg" alt="city" loading="lazy">
      </div>
      <div class="city-card-contents-div">
        <br>
          <div class="citynamefont"><b>Cheonan</b><br>
            <h6 class="city-card-contents-subtitle">대한민국 천안</h6>
          </div>
      </div>
    </div>
  </a>
</div>

<div class="col s12 m6 l3" name="asia">
  <input type="hidden" value="대한민국 속초">
  <a onclick="" style="color:inherit; text-decoration: none!important;" aria-expanded="false">
    <div class="card city-card-style hoverable z-depth-2" style="margin:0;">
      <div class="card-image imgbox">
        <img src="resources/image/sokcho.jpg" alt="city" loading="lazy">
      </div>
      <div class="city-card-contents-div">
        <br>
          <div class="citynamefont"><b>Sokcho</b><br>
            <h6 class="city-card-contents-subtitle">대한민국 속초</h6>
          </div>
      </div>
    </div>
  </a>
</div>

<div class="col s12 m6 l3" name="asia">
  <input type="hidden" value="대한민국 평창">
  <a onclick="" style="color:inherit; text-decoration: none!important;" aria-expanded="false">
    <div class="card city-card-style hoverable z-depth-2" style="margin:0;">
      <div class="card-image imgbox">
        <img src="resources/image/pyeongchang.jpg" alt="city" loading="lazy">
      </div>
      <div class="city-card-contents-div">
        <br>
          <div class="citynamefont"><b>PyeongChang</b><br>
            <h6 class="city-card-contents-subtitle">대한민국 평창</h6>
          </div>
      </div>
    </div>
  </a>
</div>

<div class="col s12 m6 l3" name="asia">
  <input type="hidden" value="대한민국 대구">
  <a onclick="" style="color:inherit; text-decoration: none!important;" aria-expanded="false">
    <div class="card city-card-style hoverable z-depth-2" style="margin:0;">
      <div class="card-image imgbox">
        <img src="resources/image/daegu.jpg" alt="city" loading="lazy">
      </div>
      <div class="city-card-contents-div">
        <br>
          <div class="citynamefont"><b>Daegu</b><br>
            <h6 class="city-card-contents-subtitle">대한민국 대구</h6>
          </div>
      </div>
    </div>
  </a>
</div>

<div class="col s12 m6 l3" name="asia">
  <input type="hidden" value="대한민국 종로">
  <a onclick="" style="color:inherit; text-decoration: none!important;" aria-expanded="false">
    <div class="card city-card-style hoverable z-depth-2" style="margin:0;">
      <div class="card-image imgbox">
        <img src="resources/image/jongro.jpg" alt="city" loading="lazy">
      </div>
      <div class="city-card-contents-div">
        <br>
          <div class="citynamefont"><b>Jongro</b><br>
            <h6 class="city-card-contents-subtitle">대한민국 종로</h6>
          </div>
      </div>
    </div>
  </a>
</div>

<div class="col s12 m6 l3" name="asia">
  <input type="hidden" value="대한민국 용산">
  <a onclick="" style="color:inherit; text-decoration: none!important;" aria-expanded="false">
    <div class="card city-card-style hoverable z-depth-2" style="margin:0;">
      <div class="card-image imgbox">
        <img src="resources/image/yongsan.jpg" alt="city" loading="lazy">
      </div>
      <div class="city-card-contents-div">
        <br>
          <div class="citynamefont"><b>Yongsan</b><br>
            <h6 class="city-card-contents-subtitle">대한민국 용산</h6>
          </div>
      </div>
    </div>
  </a>
</div>

<div class="col s12 m6 l3" name="asia">
  <input type="hidden" value="대한민국 강남">
  <a onclick="" style="color:inherit; text-decoration: none!important;" aria-expanded="false">
    <div class="card city-card-style hoverable z-depth-2" style="margin:0;">
      <div class="card-image imgbox">
        <img src="resources/image/gangnam.jpg" alt="city" loading="lazy">
      </div>
      <div class="city-card-contents-div">
        <br>
          <div class="citynamefont"><b>GangNam</b><br>
            <h6 class="city-card-contents-subtitle">대한민국 강남</h6>
          </div>
      </div>
    </div>
  </a>
</div>

<div class="col s12 m6 l3" name="asia">
  <input type="hidden" value="대한민국 포천">
  <a onclick="" style="color:inherit; text-decoration: none!important;" aria-expanded="false">
    <div class="card city-card-style hoverable z-depth-2" style="margin:0;">
      <div class="card-image imgbox">
        <img src="resources/image/pocheon.jpg" alt="city" loading="lazy">
      </div>
      <div class="city-card-contents-div">
        <br>
          <div class="citynamefont"><b>Pocheon</b><br>
            <h6 class="city-card-contents-subtitle">대한민국 포천</h6>
          </div>
      </div>
    </div>
  </a>
</div>

<div class="col s12 m6 l3" name="asia">
  <input type="hidden" value="대한민국 파주">
  <a onclick="" style="color:inherit; text-decoration: none!important;" aria-expanded="false">
    <div class="card city-card-style hoverable z-depth-2" style="margin:0;">
      <div class="card-image imgbox">
        <img src="resources/image/paju.jpg" alt="city" loading="lazy">
      </div>
      <div class="city-card-contents-div">
        <br>
          <div class="citynamefont"><b>Paju</b><br>
            <h6 class="city-card-contents-subtitle">대한민국 파주</h6>
          </div>
      </div>
    </div>
  </a>
</div>

<div class="col s12 m6 l3" name="asia">
  <input type="hidden" value="대한민국 용인">
  <a onclick="" style="color:inherit; text-decoration: none!important;" aria-expanded="false">
    <div class="card city-card-style hoverable z-depth-2" style="margin:0;">
      <div class="card-image imgbox">
        <img src="resources/image/yongin.jpg" alt="city" loading="lazy">
      </div>
      <div class="city-card-contents-div">
        <br>
          <div class="citynamefont"><b>YongIn</b><br>
            <h6 class="city-card-contents-subtitle">대한민국 용인</h6>
          </div>
      </div>
    </div>
  </a>
</div>
</div>

  
</body>
</html>