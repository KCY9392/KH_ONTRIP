<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
    div {
      box-sizing: border-box;
    }



    .outers{
      height: 100%;
      display: inline-block;
      position: relative;
      position: fixed;
      margin-top: 4.5%;

    }
    .userResult , .reserveResult , .heartResult , .reviewResult , .statusResult{
      width: 260px;
      height: 200px;
      /* border: 1px solid green;
      background-color: darkseagreen; */
    }
    #n{
      width: 260px;
      height: 200px;
      background-color: darkseagreen;
      border: 1px solid darkgreen;
      color: white;
      font-size: 35px;
      font-family: 'Noto Sans KR', sans-serif;
      font-weight: bold;
      border-radius: 15px;
    }
  </style>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

</head>
<body>
<fieldset>
  <div class="outer">
    <div class="outers">
      <div class="adminMain">
        <form method="get" action="/KH_ONTRIP/manager/main">
        <button type="submit" id = "n" name="search">메인 관리</button>
        </form>
      </div>
      <div class="reserveResult">
        <form method="get" action="/KH_ONTRIP/manager/members">
        <button type="submit" id = "n" name="search">회원 관리</button>
        </form>
      </div>
      <div class="heartResult">
        <form method="get" action="/KH_ONTRIP/manager/reviews">
        <button type="submit" id = "n" name="search">등록 후기</button>
        </form>
      </div>
      <div class="reviewResult">
        <form method="get" action="/KH_ONTRIP/manager/questions">
          <button type="submit" id = "n" name="search">문의사항관리</button>
        </form>
      </div>
      <div class="statusResult">
        <form method="get" action="/KH_ONTRIP/manager/qnas">
          <button type="submit" id = "n" name="search">Q&A관리</button>
        </form>
      </div>
    </div>
  </div>

</fieldset>


</body>
</html>