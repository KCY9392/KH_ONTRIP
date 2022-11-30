<%@ page contentType="text/html; charset=UTF-8" language="java"  pageEncoding="UTF-8" %>
<%
    String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>qna 등록화면</title>

	<!-- Alert 창  -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

    <!-- BootStrap 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    <!-- CSS 연결 -->
    <link rel="stylesheet" href="<%= request.getContextPath()%>/resources/css/qnaSave.css?after>">
</head>
<body>

<%@ include file="../../common/adnavbar.jsp"%>

<br><br><br><br><br>

<div class="uk-section uk-section-default sl-in2" style="min-width: 90vw; height:20vh;">
        <div class="uk-container">
            <div style="text-align: center; margin-top : -1.5%;">
                <div style="color:darkgray">관리자페이지</div> <br>
                <div>
                	<span style="color: coral; font-size:25px; font-weight:600;">Q & A 관리</span>
                </div>
              
            </div>
        </div>
    </div>




<br><br>

<div style="text-align:center;">
<form id="qnaSave" method="post" action="/KH_ONTRIP/manager/qnas/save" >
    <h3>질문내용</h3><br>
    <div>
        <select name="category">
            <option value="숙소">숙소</option>
            <option value="기능">기능</option>
            <option value="계정">계정</option>
        </select><br><br>
        <!-- <input type="text" name="question"> -->

        <textarea name="question" cols="50" rows="5"></textarea>
    </div>

    <br><br><br>

    <h3>답변내용</h3><br>

    <div>
        <!-- <input type="text" name="answer"> -->
        <textarea name="answer" cols="50" rows="5"></textarea>
    </div>

    <br><br>

    <button class="btnSubmit" type="button" onclick="alert();">등록하기</button>
</form>
</div>

<br><br><br>
<script>
	function alert(){
		
		Swal.fire({
              title: 'Q&A를 등록하시겠습니까?',
              icon: 'warning',
              showCancelButton: true,
              confirmButtonColor: '#3085d6',
              cancelButtonColor: '#d33',
              confirmButtonText: '등록',
              cancelButtonText: '취소'
          }).then((result) => {
              if (result.isConfirmed) {
                  Swal.fire({
                 		title: '등록이 완료되었습니다.',
                 		icon:'success',
                 		customClass: {
                 		    confirmButton: 'swal2-confirm swal2-styled swal2-jong',
                 		    cancelButton: 'btn btn-danger'
        		  },		
                  }).then((result) => {
                  	if(result.isConfirmed){
		            		$("#qnaSave").submit();
                  		
                  	}  		                        	
                  })
              }
          });
		
	}
</script>
</body>
</html>