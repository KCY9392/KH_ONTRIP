<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>온트립(OnTrip) - 후기관리</title>
<%--     <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reviewDetail_manager.css"> --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
    .outer1{
        background-color: white;
        color: black;
        width: 1000px;
        height: 650px;
        margin-left: 600px;
        box-sizing: border-box;
    }
    #userId , #userPwd{
        border-bottom: 1px solid #adadad;
        margin: 10px;
        padding: 10px 0px;
        width: 100%;
        outline:none;
        border-top: 0;
        border-left: 0;
        border-right: 0;
    }
    #secessionTitle{
        font-size: 20px;
        font-weight: bold;
    }
    #checkReview{
        font-size: 20px;
        font-weight: bold;
        margin: 11ch;
        margin-top: 100px;
    }
    #treview{
        width: 730px;
        height: 100px;
    }
    #review{
        font-weight: bold;  
    }  
#numreview , #numreview1 , #numreview2 , #numreview3 , #updateStar{
    width: 45px;
    height: 30px; 
    border: 0px; 
    font-size: 20; 
    font-weight: bold;
    color: orangered;
}
.star-rating { width:304px; }
.star-rating,.star-rating span { display:inline-block; height:55px; overflow:hidden; background:url(../../views/review/star.png)no-repeat; }
.star-rating span{ background-position:left bottom; line-height:0; vertical-align:top; }
</style>
</head>
<body>
<%@ include file="../../common/adnavbar.jsp" %>
<%@ include file="../../../views/common/managerNavbar.jsp" %>


<div class="outer1">
        <br><br><br>
        <div id="checkReview" align="center">
                <strong style="float: left; margin-left: 150px;">이용시설 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong> <input type="text" value="${review.plcName}" name="placeName" id = "review" style="height: 30px; border: 0px; font-size: 20; font-weight: bold; margin-left: -295px;" readonly><br> 
                <hr width="60%">
    
                <strong style="float: left; margin-left: 150px;">작성일시 :&nbsp;</strong> <input type="date" value="${review.revDate}"name="reviewSysdate" id = "review" style="height: 30px; border: 0px; font-size: 17; margin-left: -350px;" readonly><br>
                <strong style="float: left; margin-left: 150px;">작성자 &nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong> <input type="text" name = "memberId" value="${review.memName}" id = "review" style="height: 30px; border: 0px; font-size: 20; font-weight: bold; margin-left: -270px;" readonly><br><br><br> 
                &nbsp;만족도&nbsp;&nbsp;&nbsp;<input type="number" id="updateStar" name = "updateStar" value="${review.revStar}" min="1" max="5" style="width: 40px; border: 0;" readonly>/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5<br>
                <div>
                	<div class="star-rating">
                		<span style="width:${review.revStar*2}0%; float:left;"></span>
                	</div>
                    <br>
                </div>
                <br>
    
               <table>
               		<tr>
               			<td>
               				- 청결상태&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" value="${review.revC}"id = "numreview1" name="cScore" min="1" max="10" step="1" style="margin-left:-1px" readonly>/&nbsp;&nbsp;&nbsp;10<br>
               				- 직원 & 서비스&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" id = "numreview2" value="${review.revS}" name="sScroe" min="1" max="10" step="1" readonly>/&nbsp;&nbsp;&nbsp;10<br>
              				- 편의 시설 서비스&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" id = "numreview3" name="pScore" value="${review.revP}" min="1" max="10" step="1" readonly>/&nbsp;&nbsp;&nbsp;10<br><br>
               			</td>
               		</tr>
               </table>
               개선사항<br>
               <input type="text" value="${review.revText}" name="rtext" id="treview" style="width: 440px;" readonly><br><br>
        </div>
    </div>

























<!-- <div style="text-align:center; margin-top:20px;"> -->
<!--     <b style="font-size:30px; font-weight:900;">관리자페이지 - 등록후기 관리</b> -->
<!-- </div> -->
<!-- <div class="containerBox"> -->
<!--     <div class="title"> -->
<%--         <span style="font-weight:900; font-size:25px;">제목 : ${review.plcName}</span><br> --%>
<%--         <span>작성자 : ${review.memName}</span> --%>
<!--         <input type="text" name="userName" value="송지호" style="width:50px;"> -->
<!--         <br> -->
<%--         <span>작성 일시 : <fmt:formatDate value="${review.revDate}" pattern="yyyy-mm-dd" /></span> --%>
<!--         <input type="text" name="reviewDate" value="2022년 10월 28일" style="width:130px;"> -->
<!--         <br><br> -->
<%--         <span>만족도 : ${review.revStar}</span><br> --%>


<!--     </div> -->
</body>
</html>