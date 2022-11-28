<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    String contextPath = request.getContextPath();
%>
<% 
	Member loginUser = (Member) session.getAttribute("loginUser");
	// 로그인전 or 로그인 실패 : null
	// 로그인 성공후 : 로그인한 회원의 정보가 담긴 member객체.
	
	String alertMsg = (String) session.getAttribute("alertMsg");
	// 서비스 요청전 : null
	// 서비스 요청성공후 : alert로 띄워줄 메시지 문구.
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 폰트적용  -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link href="<%= request.getContextPath() %>/resources/css/mainForm.css"
	rel="stylesheet">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
	integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
	crossorigin="anonymous"></script>

<!-- BootStrap 연결 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>

<!-- Alert 창  -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<style>
.outer1 {
	background-color: white; /* 해당사이트의 고유한 색상으로 작성 */
	color: black;
	width: 1000px;
	height: 700px;
	/* border: 1px solid black; */
	margin: auto;
	margin-top: 70px;
	box-sizing: border-box;
	text-align: center;
	box-shadow: 0 0 10px 1px yellowgreen;
}

input {
	margin: 10px;
	padding: 10px 0px;
	width: 100%;
	outline: none;
}

#userId, #userPwd {
	border-bottom: 1px solid #adadad;
	margin: 10px;
	padding: 10px 0px;
	width: 100%;
	outline: none;
	border-top: 0;
	border-left: 0;
	border-right: 0;
}

.uk-flex-middle {
	align-items: center;
}

.uk-flex-center {
	justify-content: center;
}

.uk-flex {
	display: flex;
}

.uk-background-cover {
	background-size: cover;
}

.uk-background-contain {
	background-position: 50% 50%;
	background-repeat: no-repeat;
}

.uk-section-default {
	background: rgb(250, 250, 250);
}

.uk-section {
	padding-top: 70px;
	padding-bottom: 70px;
}

.uk-section {
	display: flow-root;
	box-sizing: border-box;
}

.sl-in2 {
	  animation: change1 1s ease forwards;
	}
	
@keyframes change1 {
  from {
    transform: translateY(30%);
  }

  to {
    transform: translateY(0%);
  }
}
tr>td:nth-child(1) {
	font-weight: 900;
	font-size: 16px;
}

.btn-pwd:hover {
	font-weight: 900;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
	integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
	crossorigin="anonymous">
</script>
</head>
<body>
	<%@ include file="../common/mypageNewNavbar.jsp"%>
	<br>
	<br>
	<br>
	<br>

	<%
    	String userId = loginUser.getMemberId() == null ? "" : loginUser.getMemberId();
        String userPwd = loginUser.getMemberPwd() == null ? "" : loginUser.getMemberPwd();
	%>

	<div class="uk-section uk-section-default"
		style="min-width: 90vw; height: 28vh;">
		<div class="uk-container">
			<div style="text-align: center; margin-top: -1.5%;">
				<div style="font-size: 40px; font-weight: 600;">OnTrip</div>
				<br>
				<div style="color: darkgray">MAKE YOUR ROUTE OPTIMIZED</div>
				<br> <br>
				<div>
					<span>회원정보</span> > <span
						style="color: coral; font-size: 16px; font-weight: 600;">비밀번호
						변경</span>
				</div>
			</div>
		</div>
	</div>


	<div class="outer1 sl-in2">
		<h1 style="text-align: center; padding-top: 150px;">비밀번호 변경</h1>
		<br> <br> <br>
		<form id="myPwdUpdate" action="<%=request.getContextPath()%>/myPwdUpdate.me" method="post">
			<div align="center">
				<table align="center">
					<tr>
						<td>여행자 아이디 : &nbsp;</td>
						<td><input type="text" id="userId" name="userId"
							value="<%=userId %>" readonly></td>
					</tr>
					<tr>
						<td>현재 비밀번호 : &nbsp;</td>
						<td><input type="text" id="userPwd" name="userPwd"
							value="<%=userPwd %>" readonly></td>
					</tr>
					<tr>
						<td>새로운 비밀번호 : &nbsp;</td>
						<td><input type="password" name="newPwd" required></td>
					</tr>
					<tr>
						<td>비밀번호 확인 : &nbsp;</td>
						<td><input type="password" name="checkPwd" required></td>
					</tr>
				</table>
			</div>
			<div align="center">
				<br> <br>
				<button type="button" name="nCheckPwdb"
					class="btn btn-secondary btn-sm btn-update"
					onclick="return newPwdUpdate();"
					style="font-size: 17px; width: 150px; height: 40px;">변경</button>
			</div>
		</form>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>

	<script>
	
   
    	
    
    
         function newPwdUpdate(){
        	
        	  if($("input:password[name=newPwd]").val() != $("input:password[name=checkPwd]").val()){
                 /*  alert("비밀번호가 일치하지 않습니다."); */
                 
		                Swal.fire({
    			                icon: 'error',
    			                title: '비밀번호가 일치하지않습니다.',
    			                text: '비밀번호를 다시 입력해주세요.',
    			            });
    			        
		 
                 
                  $("input:password[name=newPwd]").focus();
                  $("input:password[name=newPwd]").val("");
                  $("input:password[name=checkPwd]").val("");
              } 
        	  
              if($("input:password[name=newPwd]").val() == $("input:password[name=checkPwd]").val() 
            		  	&& $("input:password[name=newPwd]").val() != ""){
  		               
  		            	Swal.fire({
  		                    title: '회원정보를 변경하시겠습니까?',
  		                    icon: 'warning',
  		                    showCancelButton: true,
  		                    confirmButtonColor: '#3085d6',
  		                    cancelButtonColor: '#d33',
  		                    confirmButtonText: '변경',
  		                    cancelButtonText: '취소'
  		                }).then((result) => {
  		                    if (result.isConfirmed) {
  		                        Swal.fire({
 		                        		title: '변경이 완료되었습니다.',
 		                        		icon:'success',
 		                        		customClass: {
 		                        		    confirmButton: 'swal2-confirm swal2-styled swal2-jong',
 		                        		    cancelButton: 'btn btn-danger'
                        		  },		
  		                        }).then((result) => {
  		                        	if(result.isConfirmed){
  		    		            		$("#myPwdUpdate").submit();
  		                        		
  		                        	}  		                        	
  		                        })
  		                    }
  		                });
  		            	
  		            	
  		            	
  		          
  		       		
              } 
        }
        
        
        
        
    </script>
</body>