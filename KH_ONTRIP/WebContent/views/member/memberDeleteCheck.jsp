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
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="<%= request.getContextPath() %>/resources/css/mainForm.css" rel="stylesheet" >

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

<!-- BootStrap 연결 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<!-- Alert 창  -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<style>
    .outer1{
        background-color: white; /* 해당사이트의 고유한 색상으로 작성 */
        color: black;
        width: 1000px;
        height: 600px;
        /* border: 1px solid black; */
        margin: auto;
        box-sizing: border-box;
        text-align: center;
    }
    input{
        margin: 10px;
        padding: 10px 0px;
        width: 100%;
        outline:none;
    }
    #memberId , #memberPwd{
        border-bottom: 1px solid #adadad;
        margin: 10px;
        padding: 10px 0px;
        width: 100%;
        outline:none;
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
    .uk-background-contain{
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
	    transform: translateY(80%);
	  }
	
	  to {
	    transform: translateY(0%);
	  }
	}
</style>
<script
        src="https://code.jquery.com/jquery-3.6.1.min.js"
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
    	String memberId = loginUser.getMemberId() == null ? "" : loginUser.getMemberId();
        String memberPwd = loginUser.getMemberPwd() == null ? "" : loginUser.getMemberPwd();
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
					<span style="color: coral; font-size: 16px; font-weight: 600;">회원탈퇴</span>
				</div>
			</div>
		</div>
	</div>

	<br><br><br>

    <div class="outer1">
        <h1 style = "text-align : center;">회원 탈퇴</h1>
        <br><br><br>
        
        <form id="memberDeleteOk" action="<%=request.getContextPath()%>/memberDeleteOk.me" method="post">
            <div align="center">
                <table align="center">
                    <tr>
                        <td style="font-size:16px; font-weight:bold;">여행자 아이디 : &nbsp;</td>
                        <td><input type="text" id="memberId" name="memberId" ></td>
                    </tr>
                    <tr>
                        <td style="font-size:16px; font-weight:bold;">여행자 비밀번호 : &nbsp;</td>
                        <td><input type="password" id="memberPwd" name="memberPwd" ></td>
                    </tr>
                   
                </table>
            </div>
            <div align = "center">
                <br><br>
                <button type = "button" name = "nCheckPwdb" class = "btn btn-secondary btn-sm" 
                onclick="return memberDeleteCheck();" style="width:130px; height:50px; font-size:16px;">탈퇴하기</button>
            </div>
        </form>
    </div>

    <script>

        function memberDeleteCheck(){
        	
        	  if($("input:text[name=memberId]").val() != "<%=loginUser.getMemberId()%>" || $("input:text[name=memberId]").val() == ""){
        		  
        		  Swal.fire({
		                icon: 'error',
		                title: '아이디가 일치하지않습니다.',
		                text: '아이디를 다시 입력해주세요.',
		            });
        		  
                  $("input:text[name=memberId]").focus();
                  $("input:text[name=memberId]").val("");
                  $("input:password[name=memberPwd]").val("");
                  return false;
                  
              }else if($("input:password[name=memberPwd]").val() != "<%=loginUser.getMemberPwd()%>" || $("input:text[name=memberPwd]").val() == ""){
            	  
            	  Swal.fire({
		                icon: 'error',
		                title: '비밀번호가 일치하지않습니다.',
		                text: '비밀번호를 다시 입력해주세요.',
		            });

                  $("input:text[name=memberPwd]").focus();
                  $("input:text[name=memberId]").val("");
                  $("input:password[name=memberPwd]").val("");
                  return false;
                    
              } else if($("input:text[name=memberId]").val() == "<%=loginUser.getMemberId()%>" && 
        			  		$("input:password[name=memberPwd]").val() == "<%=loginUser.getMemberPwd()%>"){
            	  
            	  
            	   Swal.fire({
	                    title: '정말 회원탈퇴 하시겠습니까?',
	                    icon: 'warning',
	                    showCancelButton: true,
	                    confirmButtonColor: '#3085d6',
	                    cancelButtonColor: '#d33',
	                    confirmButtonText: '확인',
	                    cancelButtonText: '취소'
	                }).then((result) => {
	                    if (result.isConfirmed) {
	                        Swal.fire({
	                        		title: '회원탈퇴가 완료되었습니다.',
	                        		text: '그동안 온트립(OnTrip)을 이용해주셔서 감사드립니다.',
	                        		icon:'success',
	                        		customClass: {
	                        		    confirmButton: 'swal2-confirm swal2-styled swal2-jong',
	                        		    cancelButton: 'btn btn-danger'
		                  		  },		
			                        }).then((result) => {
			                        	
			                        	if(result.isConfirmed){
			    		            		$("#memberDeleteOk").submit();
	                        		
	                        	}  		                        	
	                        })
	                    }
	                }); 
            	    
            	   
              }
        
        	  
        }

    </script>
</body>