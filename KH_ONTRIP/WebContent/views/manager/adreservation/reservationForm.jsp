<%--
  Created by IntelliJ IDEA.
  User: jay
  Date: 2022/11/15
  Time: 2:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
<div>${placeName}</div>
<form method="post" action="/KH_ONTRIP/reservation/save">
    체크인 : <input type="date" id="sdate" name="sdate" value="">  체크아웃 :<input  type="date" id="edate" name="edate" value="">
  <div> 예약자 이름 : <input type="text" name="rnName"></div>
    성인 : <input type="text" name="rnAdult"> 어린이 : <input type="text" name="rnChild">
    객실수 : <input type="text" name="rnCount">
    객실타입 :<select name="rnType">
              <option value="스탠다드" >스탠다드</option>
              <option value="트윈" >트윈</option>
              <option value="패밀리">패밀리</option>
              <option value="스위트">스위트</option>
           </select>

    연락처 : <input type="text" name="rnPhone">
    <input type="hidden" name ="plcCode" value="${plcCode}">
    <input type="hidden" name="memNo" value="${memNo}">
    <input type="hidden" name="placeName" value="${placeName}">
    <button type="submit">제출하기</button>
</form>






</form>
</body>
</html>
