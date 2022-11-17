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
<%--    <script>--%>

<%--        $(function(){--%>
<%--            $("#sdate , #edate" ).datepicker({--%>

<%--                dateFormat: 'yy-mm-dd' //Input Display Format 변경--%>

<%--                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시--%>

<%--                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시--%>

<%--                ,changeYear: true //콤보박스에서 년 선택 가능--%>

<%--                ,changeMonth: true //콤보박스에서 월 선택 가능--%>

<%--                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시--%>

<%--                ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로--%>

<%--                ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함--%>

<%--                ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트--%>

<%--                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트--%>

<%--                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트--%>

<%--                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트--%>

<%--                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트--%>

<%--                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트--%>

<%--                ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)--%>

<%--                ,maxDate: "+1M" , //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)--%>

<%--                onSelect: function(){--%>
<%--                    var date = $(this).datepicker('getDate');--%>
<%--                    document.getElementById("sdate").value=date;--%>
<%--                }--%>

<%--            });--%>

<%--            //초기값을 오늘 날짜로 설정--%>

<%--            $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)--%>

<%--        });--%>



<%--    </script>--%>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
<form method="post" action="/KH_ONTRIP/reservation/save">
    체크인 : <input type="date" id="sdate" name="sdate" value="">  체크아웃 :<input  type="date" id="edate" name="edate" value="">
  <div> 예약자 이름 : <input type="text" name="rnName"></div>
    성인 : <input type="text" name="rnAdult"> 어린이 : <input type="text" name="rnChild">
    객실수 : <input type="text" name="rnCount">
    객실타입 :<select name="rnType">
              <option value="스탠다드" value1 ='100000'>스탠다드</option>
              <option value="트윈" value1 ='120000'>트윈</option>
              <option value="패밀리" value1 = '300000'>패밀리</option>
              <option value="스위트" value1 = '400000'>스위트</option>
           </select>

    연락처 : <input type="text" name="rnPhone">
    <input type="hidden" name ="plcCode" value="${plcCode}">
    <input type="hidden" name="memNo" value="${memNo}">
    <button type="submit">제출하기</button>
</form>






</form>
</body>
</html>
