<%--
  Created by IntelliJ IDEA.
  User: jay
  Date: 2022/11/18
  Time: 4:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
</head>
<body>

<div>호텔명 : ${placeName}</div>
<div>예약자명 : ${rnName} </div>
<div>연락처  : ${rnPhone} </div>
<div>총 결제금액 : ${totalPrice} KRW</div>


<form action="/KH_ONTRIP/reservation/pay" method="post">
<input type="hidden" name="placeName" value="${placeName}">
<input type="hidden" name="rnName" value="${rnName}">
<input type="hidden" name="rnPhone" value="${rnPhone}">
<input type="hidden" name="totalPrice" value="${totalPrice}">




    <div><button type="submit">결제하기</button> </div>
</form>




</body>
</html>
