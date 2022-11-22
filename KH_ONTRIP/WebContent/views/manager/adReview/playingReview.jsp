<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String contextPath = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>온트립(OnTrip) - 후기관리</title>
    <link rel="stylesheet" href="resources/css/review_manager.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>

<%@ include file="../../common/adnavbar.jsp" %> 

<%@ include file="../../../views/common/managerNavbar.jsp" %>

<br><br><br><br>

<h1 style="font-weight:900; margin-left:50%; margin-top:-20px;">후기 관리</h1><br>

<form action="/KH_ONTRIP/manager/reviews/play?category=PP" method="post">
    <button class="btn-click" id="q" name="tb" onclick="show(this);" style="margin-left:26%;">놀거리</button>
</form>
<form action="/KH_ONTRIP/manager/reviews/play?category=HH" method="post">
    <button class="btn-click" id="w" name="tb" onclick="show(this);">숙소</button>
</form>
<form action="/KH_ONTRIP/manager/reviews/play?category=FF" method="post">
    <button class="btn-click" id="e" name="tb" onclick="show(this);">맛집</button>
</form>

<div class="table1" id="qtb">
    <table class="table" id="qtb" style="width:1000px;">

        <thead>
        <tr class="table-secondary">
            <th scope="col">번호</th>
            <th scope="col">이용시설</th>
            <th scope="col">작성자</th>
            <th scope="col">날짜</th>
        </tr>
        </thead>


        <tbody>

        <c:forEach var="vo" items="${list}">

            <tr>
                <th scope="row">${vo.revCode}</th>
                <td><a href="/KH_ONTRIP/manager/reviews/review?revCode=${vo.revCode}&categoryCode=${vo.category}">${vo.plcName}</a></td>
                <td>${vo.memName}</td>
                <td><fmt:formatDate value="${vo.rnDate }" pattern="yyyy-mm-dd" /></td>
            </tr>

        </c:forEach>



        </tbody>
    </table>

    <br><br><br><br><br><br>

    <div class="paging">
        <c:if test="${page.prev }">
            <button class="btn btn-num1"><a href="/KH_ONTRIP/manager/reviews/play?pageNum=${page.startPage - 1 }&amount=${page.amount}&category=${category}"><</a></button>
        </c:if>

        <c:forEach var="num" begin="${page.startPage }" end="${page.endPage }">
            <button class="btn btn-num2 ${page.pageNum eq num ? 'active' : '' }">
                <a href="/KH_ONTRIP/manager/reviews/play?pageNum=${num }&amount=${page.amount}&category=${category}">${num }</a>
            </button>
        </c:forEach>

        <c:if test="${page.next }">
            <button class="btn btn-num6"><a href="/KH_ONTRIP/manager/reviews/play?pageNum=${page.endPage + 1 }&amount=${page.amount}&category=${category}">></a></button>
        </c:if>
    </div>


</div>



<script>
    function show(element){
        let tag = document.getElementsByClassName("table1");

        for(let i=0; i<tag.length; i++){
            if(element.id+"tb" == tag[i].id){
                tag[i].style.display = "block";
            }else{
                tag[i].style.display = "none";

            }
        }
    }
</script>
</body>
</html>