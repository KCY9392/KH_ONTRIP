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
<style>
	.buttons{
         display: flex;
         justify-content: center;
         align-items: center;

     }
   .btn-click{
     width: 350px;
   	}	
    .outer1{
        background-color: white;
        color: black;
        width: 1000px;
        height: 650px;
        margin: auto;
        box-sizing: border-box;
    }
   td > a{
      color: black;
      text-decoration: none;
   }
   
   tr a{
      color: black;
      text-decoration: none;
   }
    .table{
        width: 500px;
        height:200px;
        text-align: center;
        font-weight: bold;
        margin-left:0 !important;
    }
   #btn{
     width: 335px;
     height: 50px;
     border: 1px solid lightgray;
     border-radius: 0;
     font-weight:bold;
     font-size: 20px;
   }  
    .table thead{
        background: rgba(211, 211, 211, 0.326);
    }
</style>
</head>
<body>

<%@ include file="../../common/adnavbar.jsp" %> 

<br><br><br><br><br>

<div class="uk-section uk-section-default sl-in2" style="min-width: 90vw; height:20vh;">
        <div class="uk-container">
            <div style="text-align: center; margin-top : -1.5%;">
                <div style="color:darkgray">관리자페이지</div> <br>
                <div>
                	<span style="color: coral; font-size:25px; font-weight:600;">등록후기</span>
                </div>
              
            </div>
        </div>
    </div>
    
    <br>

<div class="outer1">
<br>

<br>&nbsp;
<div class="buttons">
	<form action="/KH_ONTRIP/manager/reviews/play?category=PP" method="post">
	    <button class="btn-click btn btn-success" id="btn" name="tb" onclick="show(this);">놀거리</button>
	</form>
	<form action="/KH_ONTRIP/manager/reviews/play?category=HH" method="post">
	    <button class="btn-click btn btn-success" id="btn" name="tb" onclick="show(this);">숙소</button>
	</form>
	<form action="/KH_ONTRIP/manager/reviews/play?category=FF" method="post">
	    <button class="btn-click btn btn-success" id="btn" name="tb" onclick="show(this);">맛집</button>
	</form>
</div>
<br><br><br>
<div class="table1" style="margin-top: -50px;">
    <table class="table table-bordered">

        <thead style="text-align:center;">
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
                <td style="height: 30px;"><a href="/KH_ONTRIP/manager/reviews/review?revCode=${vo.revCode}&categoryCode=${vo.category}">${vo.plcName}</a></td>
                <td>${vo.memName}</td>
                <td><fmt:formatDate value="${vo.rnDate }" pattern="yyyy-MM-dd" /></td>
            </tr>

        </c:forEach>



        </tbody>
    </table>
</div>

    <div class="paging" style="text-align:center;">
        <c:if test="${page.prev }">
            <button class="btn"><a style="color:black; text-decoration: none; font-weight: bold;" href="/KH_ONTRIP/manager/reviews/play?pageNum=${page.startPage - 1 }&amount=${page.amount}&category=${category}">이전</a></button>
        </c:if>

        <c:forEach var="num" begin="${page.startPage }" end="${page.endPage }">
            <button class="btn  ${page.pageNum eq num ? 'active' : '' }">
                <a style="color:black; text-decoration: none; font-weight: bold;" href="/KH_ONTRIP/manager/reviews/play?pageNum=${num }&amount=${page.amount}&category=${category}">${num }</a>
            </button>
        </c:forEach>

        <c:if test="${page.next }">
            <button class="btn "><a style="color:black; text-decoration: none; font-weight: bold;" href="/KH_ONTRIP/manager/reviews/play?pageNum=${page.endPage + 1 }&amount=${page.amount}&category=${category}">다음</a></button>
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