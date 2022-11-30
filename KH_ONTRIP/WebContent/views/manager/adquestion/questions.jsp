<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String contextPath = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

    <!-- BootStrap 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    <style>
        .outer{
      		margin:auto;

        }
        .container{
            background-color: rgb(255, 255, 255); /* 해당사이트의 고유한 색상으로 작성 */
            color: white;
            width: 1000px;
            height: 100%;
            margin: auto; /* 가운데 자동 정렬 */
            margin-top: 50px; /* 위로부터 50px 아래로 여백 만들기 */
        }
        .row{
            text-align: right;
            margin-left:auto;
            margin-right:auto;
        }
        .list-area{
            border: 1px solid rgb(196, 192, 192);
            margin:auto;
            width: 1000px;
            border-radius: 5px;
            height:600px;
        }
        .list-area>tbody>tr:hover{
            background-color:rgb(241, 241, 241);
            cursor:pointer;
        }
        .titleText{
            margin:auto;

        }
        .main-container{
            width: 65%;
            margin:auto;
            text-align: center;
        }
        .main-container h2{
            font-weight: 900;
            font-size:35px;
        }
        .main-table{
            width:80%;
            margin:auto;
            margin:-50%;
        }
        .btn-memberList{
            border:none;
            background-color:rgb(129, 203, 72);
            border-radius: 10px;
            font-size:20px;
            font-weight: 600;
            padding:10px;
            width:150px;
            color:white;
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
                	<span style="color: coral; font-size:25px; font-weight:600;">문의사항 관리</span>
                </div>
              
            </div>
        </div>
    </div>


<div class="main-container">

    <br><br>

    <br><br><br>

    <div class="center-box">

        <table class="table main-table" style="margin:auto; margin-left:4%;">
            <thead>
            <tr>
                <th scope="col">글번호</th>
                <th scope="col">제목</th>
                <th scope="col">작성일</th>
                <th scope="col">작성자</th>
                <th scope="col">답변상태</th>
            </tr>
            </thead>
            <tbody class="table-group-divider">

            <c:forEach var="vo" items="${list}">
                <tr>
                    <td>${vo.qCode }</td>
                    <td><a style="text-decoration:none; color: green;" href="/KH_ONTRIP/manager/questions/question?qCode=${vo.qCode}">${vo.qTitle}</a></td>
                    <td><fmt:formatDate value="${vo.qDate }" pattern="yyyy-MM-dd" /></td>
                    <td>${vo.memName}</td>
                    <td>
                    <c:choose>
                        <c:when test="${vo.aContent eq null}">
                         <span style="color:red"> 답변대기</span>
                        </c:when>
                        <c:otherwise>
                            답변완료
                        </c:otherwise>
                    </c:choose>
                    </td>
                </tr>
            </c:forEach>


            </tbody>

        </table>

        <br><br><br><br>

        <ul class="pagination" style="margin-left:45%; font-size:16px;" >



            <c:if test="${page.prev }">

                <li>
                    <a href="/KH_ONTRIP/manager/questions?pageNum=${page.startPage - 1 }&amount=${page.amount}"><</a>
                </li>

            </c:if>

            <c:forEach var="num" begin="${page.startPage }" end="${page.endPage }">

                <li   class="${page.pageNum eq num ? 'active' : '' }" style="margin-left:20px;">
                    <a href="/KH_ONTRIP/manager/questions?pageNum=${num }&amount=${page.amount}" style="text-decoration:none; color:black;">${num }</a>
                </li>

            </c:forEach>
			&nbsp;&nbsp;&nbsp;&nbsp;
            <c:if test="${page.next }">

                <li>
                    <a href="/KH_ONTRIP/manager/questions?pageNum=${page.endPage + 1 }&amount=${page.amount}">></a>
                </li>

            </c:if>


        </ul>

        <br><br>


    </div>
</div>

<br><br>



<%--  <script>
     function doPageClick(currentPage){
         location.href = "<%=contextPath%>/list.bo?currentPage="+currentPage;
     }
 </script> --%>

</div>

</body>
</html>