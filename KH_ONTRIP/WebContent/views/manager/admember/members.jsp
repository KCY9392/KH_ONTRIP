<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String contextPath = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 - 회원관리</title>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

    <!-- BootStrap 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    <!-- CSS 연결 -->
    <link rel="stylesheet" href="<%= contextPath %>/resources/css/Manager_member.css">
</head>
<body>

<%@ include file="../../common/adnavbar.jsp" %>

<br><br><br><br><br>
    
    <div class="uk-section uk-section-default sl-in2" style="min-width: 90vw; height:20vh;">
        <div class="uk-container">
            <div style="text-align: center; margin-top : -1.5%;">
                <div style="color:darkgray">관리자페이지</div> <br>
                <div>
                	<span style="color: coral; font-size:25px; font-weight:600;">회원관리</span>
                </div>
              
            </div>
        </div>
    </div>
    
    <br>


<div class="main-container">

    <button class="btn-memberList" type="button">회원리스트</button> <br><br>
    <p style="color:grey;"> * 자세한 회원정보는 회원이름을 클릭하세요. </p>



    <div class="center-box" style="margin-left:-50px !important;">

        <table class="table main-table" style="margin:auto; margin-left:2%;">
            <thead >
            <tr style="margin-left:30px;">
                <th scope="col" style="width: 465px;">회원번호</th>
                <th scope="col" style="width: 360px;">회원이름</th>
                <th scope="col" style="padding-left:60px;">가입일자</th>
            </tr>
            </thead>
        </table>

        <div style="width:100%; height: 400px; overflow: auto;">
            <table style="width:100%;">
                <tbody class="table-group-divider" >

                <c:forEach items="${members}" var="list">
                    <tr style="border-bottom:1px solid rgb(239, 237, 237);">
                        <th scope="row" style="width:515px;">
                                ${list.memberNo}
                        </th>
                        <td style="width: 315px;">
                            <button type="button"  onclick="showInfo('${list.memberNo}');" style="border:none;">
                                    ${list.memberName}
                            </button>
                            <button id="modalButton_hidden" data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="display:none"></button>
                        </td>
                        <td style="padding-left:120px;">
                            <fmt:formatDate value="${list.enrollDate}" pattern="yyyy-MM-dd"/>
                        </td>
                    </tr>
                </c:forEach>


                </tbody>
            </table>
        </div>


        <br><br>


        <!-- 모달창 -->
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true""> <!-- -->

    </div>

</div>
</div>

<script>
    /*
       이름을 클릭시에 onclick이벤트로 showInfo 함수가 실행됨. ajax를 통해 코드들이 실행되면서
       #staticBackdrop에 데이터를 html형식으로 전달해주고, display:none 으로 되어있는 버튼이 click 되어
       memberDetailed.jsp 에 있는 모달창이 전달된 데이터를 가지고 화면에 출력되는 형식임.
    */
    function showInfo(no){
        $.ajax({
            url:"/KH_ONTRIP/manager/members/member",
            data:{
                memberNo : no
            },
            dataType:"html",
            success : function(data){
                $("#staticBackdrop").html(data);
                $("#modalButton_hidden").click();
            }
        })

    }


</script>



</body>
</html>