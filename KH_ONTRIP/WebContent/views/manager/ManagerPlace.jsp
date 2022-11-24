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
<style>
    .outer1{
        background-color: white;
        color: black;
        width: 1000px;
        height: 650px;
        margin: auto;
        margin-top: 100px;
        margin-left: 480px;
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

   #insertPlace{
      position: absolute;    /*절대값으로 위치를 설정*/
        left: 1330px;    /* x축 */
        top: 220px;
        width:130px;
        height: 40px;
        background-color:darkseagreen;
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
     width: 350px;
   }

</style>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body> 
  <%@ include file="../common/adnavbar.jsp" %>

  <%@ include file="../common/managerNavbar.jsp" %>  
    
    <div class="outer1">
        <br>
        <h1 style = "text-align : center;">메인관리</h1>
        <br>&nbsp;
        <button type="button" class="btn btn-primary btn-lg" id="insertPlace" onclick="insertPlace();"
        	style="margin-top:40px;">등록하기</button>
        <br><br>


		<div class="buttons">
			<form action="/KH_ONTRIP/placeList.mn?categoryCode=PP"
				method="post">
				<button type="submit" name="btn" id="btn">놀거리</button>
			</form>
			<form action="/KH_ONTRIP/placeList.mn?categoryCode=HH"
				method="post">
				<button type="submit" name="btn" id="btn">숙소</button>
			</form>
			<form action="/KH_ONTRIP/placeList.mn?categoryCode=FF"
				method="post">
				<button type="submit" name="btn" id="btn">맛집</button>
			</form>
		</div>
		<div class="adminList">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>시설</th>
                        <th>등록일</th>
                    </tr>
                </thead>
    
                <tbody>
                    <c:forEach var="plc" items="${placeList}">
                        <tr>
                            <td>${plc.plcCode}</td>
                            <td><a
                                href="<%=request.getContextPath() %>/placeDetail.mn?plcName=${plc.plcName}&categoryCode=${plc.categoryCode}">${plc.plcName}</a></td>
                            <td>${plc.plcDate}</td>
                        </tr>
                    </c:forEach>
                </tbody>
    
                <tbody>
                    <tr class="paging">
                        <td colspan="5">
                            <ul class="pagination">
    
                                <c:if test="${page.prev }">
                                    <li><a
                                        href="<%=request.getContextPath() %>/placeList.mn?pageNum=${page.startPage - 1 }&amount=${page.amount}&categoryCode=${categoryCode}">이전</a></li>
                                </c:if>
    
                                <c:forEach var="num" begin="${page.startPage }"
                                    end="${page.endPage }">
                                    <li class="${page.pageNum eq num ? 'active' : '' }"><a
                                        href="<%=request.getContextPath() %>/placeList.mn?pageNum=${num }&amount=${page.amount}&categoryCode=${categoryCode}">${num }</a></li>
                                </c:forEach>
    
                                <c:if test="${page.next }">
                                    <li><a
                                        href="<%=request.getContextPath() %>/placeList.mn?pageNum=${page.endPage + 1 }&amount=${page.amount}&categoryCode=${categoryCode}">다음</a></li>
                                </c:if>
                            </ul>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

		<br><br><br>
    
        <script>
         function insertPlace(){
            location.href = "<%=request.getContextPath()%>/PlaceEnroll.mn"
         }

         
<%--          let msg = "<%= alertMsg %>"; // let msg = 시설등록에 성공하였습니다. --%>
//      	const Toast = Swal.mixin({
//      		toast: true,
//      		position: 'center-center',
//      		showConfirmButton: false,
//      		timer: 2000,
//      		timerProgressBar: true,
//      		didOpen: (toast) => {
//      			toast.addEventListener('mouseenter', Swal.stopTimer)
//      			toast.addEventListener('mouseleave', Swal.resumeTimer)
//      		}
//      	});

//      	if(msg != "null" && msg == "1"){
//      		Toast.fire({
//      			icon: 'success',
//      			title: '시설등록에 성공하였습니다.'

//      		});

//      	}else if(msg != "null" && msg == "0"){
//      		Toast.fire({
//      			icon: 'error',
//      			title: '시설등록에 실패하였습니다.'

//      		});
//      	}
<%--      	<% session.removeAttribute("alertMsg");%> --%>
      </script>
            
    </div>

</body>
</html>