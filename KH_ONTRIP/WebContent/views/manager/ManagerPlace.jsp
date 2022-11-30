<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
   String alertMsg = (String) session.getAttribute("alertMsg");
   // 서비스 요청전 : null
   // 서비스 요청성공후 : alert로 띄워줄 메시지 문구.
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 폰트적용  -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="<%= request.getContextPath() %>/resources/css/mainForm.css" rel="stylesheet" >

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

<!-- BootStrap 연결 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>


<style>
    .outer1{
        background-color: white;
        color: black;
        width: 1000px;
        height: 650px;
        margin: auto;
        box-sizing: border-box;
        
    }

    .table{
        width: 500px;
        height:200px;
        text-align: center;
        font-weight: bold;
        margin-left:0 !important;
    }

    .table thead{
        background: rgba(211, 211, 211, 0.326);
    }
    .selectTitle{
        text-align: center;
    }
    #mForm{
        border: none;
    }
    #play , #eat , #sleep{
        width:315px;
        height: 53px;
        background-color: lightgray;
        border:none;
    }
    .box{
       size: big;
        width: 980px;
        height: 800px;
        margin: auto;
        display: none;
        margin: 10px;
        padding: 10px;
    }
    .num1{
       width:100px;   
    }
    
    .num2{
       width:600px;
    }
    
    .num3{
       width:400px;
    }
	.btn-num1{
	    margin-left:33.3%;
	}	
   #insertPlace{
        width:130px;
        height: 40px;
        border:none;
   }
   .buttons{
            display: flex;
            justify-content: center;
            align-items: center;

        }
   td > a{
      color: black;
      text-decoration: none;
   }
   
   tr a{
      color: black;
      text-decoration: none;
   }
   .adminList{
        
   }
   #btn{
     width: 335px;
     height: 50px;
     border: 1px solid lightgray;
     border-radius: 0;
     font-weight:bold;
     font-size: 20px;
   }
   #insertPlace{
        border: 1;
        margin-left: 23px;
   }

   
</style>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body> 
  <%@ include file="../common/adnavbar.jsp"%> 
    <br><br><br><br><br>
    
    <div class="uk-section uk-section-default sl-in2" style="min-width: 90vw; height:25vh;">
        <div class="uk-container">
            <div style="text-align: center; margin-top : -1.5%;">
                <div style="color:darkgray">관리자페이지</div> <br>
                <div>
                	<span style="color: coral; font-size:25px; font-weight:600;">메인관리</span>
                </div><br><br>
                <button type="button" class="btn btn-dark" id="insertPlace" onclick="insertPlace();"
           			style=" margin:auto; font-weight:bold; font-size: 15px;">등록하기</button>
            </div>
        </div>
    </div>
    
    <br>
    
    <div class="outer1">
        <br>&nbsp;
        
        <br><br>

  
      <div class="buttons">
         <form action="/KH_ONTRIP/placeList.mn?categoryCode=PP"
            method="post">
            <button type="submit" name="btn" id="btn" class="btn btn-success">놀거리</button>
         </form>
         <form action="/KH_ONTRIP/placeList.mn?categoryCode=HH"
            method="post">
            <button type="submit" name="btn" id="btn" class="btn btn-success">숙소</button>
         </form>
         <form action="/KH_ONTRIP/placeList.mn?categoryCode=FF"
            method="post">
            <button type="submit" name="btn" id="btn" class="btn btn-success">맛집</button>
         </form>
      </div>
      <br><br><br>
      <div class="adminList" style="margin-top: -50px;">
            <table class="table table-bordered">
                <thead style="text-align:center;">
                    <tr class="table-secondary">
                        <th scope="col">번호</th>
                        <th scope="col">시설</th>
                        <th scope="col">등록일</th>
                    </tr>
                </thead>
    
                <tbody>
                    <c:forEach var="plc" items="${placeList}">
                        <tr>
                            <td>${plc.plcCode}</td>
                            <td style="height: 30px;">
                            <a href="<%=request.getContextPath() %>/placeDetail.mn?plcName=${plc.plcName}&categoryCode=${plc.categoryCode}">${plc.plcName}</a></td>
                            <td>${plc.plcDate}</td>
                        </tr>
                    </c:forEach>
                </tbody>
    		</table>
    </div>
                <div class="paging" style="text-align:center;">
                                <c:if test="${page.prev }">
                                     <button class="btn"><a style="color:black; text-decoration: none; font-weight: bold;" href="<%=request.getContextPath() %>/placeList.mn?pageNum=${page.startPage - 1 }&amount=${page.amount}&categoryCode=${categoryCode}">이전</a></button>
                                </c:if>
                                <c:forEach var="num" begin="${page.startPage }"
                                    end="${page.endPage }">
                                    <button class="btn ${page.pageNum eq num ? 'active' : '' }"><a style="color:black; text-decoration: none; font-weight: bold;" href="<%=request.getContextPath() %>/placeList.mn?pageNum=${num }&amount=${page.amount}&categoryCode=${categoryCode}">${num }</a></button>
                                </c:forEach>
    
                                <c:if test="${page.next }">
                                    <button class="btn"><a style="color:black; text-decoration: none; font-weight: bold;" href="<%=request.getContextPath() %>/placeList.mn?pageNum=${page.endPage + 1 }&amount=${page.amount}&categoryCode=${categoryCode}">다음</a></button>
                                </c:if>
                     </div>
        </div>

      <br><br><br>
    
        <script>
         function insertPlace(){
            location.href = "<%=request.getContextPath()%>/PlaceEnroll.mn"
         }

         
<%--          let msg = "<%= alertMsg %>"; // let msg = 시설등록에 성공하였습니다. --%>
//         const Toast = Swal.mixin({
//            toast: true,
//            position: 'center-center',
//            showConfirmButton: false,
//            timer: 2000,
//            timerProgressBar: true,
//            didOpen: (toast) => {
//               toast.addEventListener('mouseenter', Swal.stopTimer)
//               toast.addEventListener('mouseleave', Swal.resumeTimer)
//            }
//         });

//         if(msg != "null" && msg == "1"){
//            Toast.fire({
//               icon: 'success',
//               title: '시설등록에 성공하였습니다.'

//            });

//         }else if(msg != "null" && msg == "0"){
//            Toast.fire({
//               icon: 'error',
//               title: '시설등록에 실패하였습니다.'

//            });
//         }
<%--         <% session.removeAttribute("alertMsg");%> --%>
      </script>
            
    </div>

</body>
</html>