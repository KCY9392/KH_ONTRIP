<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ontrip.member.model.vo.Member"%>
<%
	Member m = (Member)request.getAttribute("m");
	String memberId = m.getMemberId();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<style>

    #marjinForm{
		margin-top: 100px;
	}
	.title{
			font-size: 60px;
			margin-top: -20px;
			font-weight: 900;
			color: rgb(130, 202, 164);
			text-align: center;
		}
		
</style>
</head>
<body class="text-center">
	
		<!-- 비밀번호 변경 클릭 시 처음 로그인 폼으로 이동하기 -->
        <form  action="<%=request.getContextPath()%>/newPwdUpdateCheck.le?memberId=<%= memberId %>" method="post" id="marjinForm">
	  	
            <div class="modal-dialog" role="document">
                            
                            <div class="title">
                                <p>On Trip</p>
                            </div>
                            <br><br>

                <div class="modal-content rounded-4 shadow" 
                    style="margin-left: -100px; width: 700px; height: 450px; text-align:center;">
                        
                    <br><br>
                    
                    <div id="content" style="margin-left:220px; margin-right:220px;">
                        
                        <p class="h3 fw-bold" style="font-weight: 1000;">새로운 비밀번호</p><br>
                        <input type="password" class="form-control" id="floatingInput" name="newPwd" placeholder="새로운 비밀번호"
                        style="width:230px; margin-left:20px;" ><br>
                        
                        <br>
                    
                        <p class="h3 fw-normal" style="font-weight: 1000;">비밀번호 확인</p><br>
                        <input type="password" class="form-control" id="floatingPassword" name="checkPwd" placeholder="비밀번호 확인"
                        style="width:230px; margin-left:20px;">
                    
                        <br><br>

                        <button class="w-100 btn btn-lg btn-primary" type="submit" onclick="newPwdUpdate();" 
                        style=" background-color: rgb(130, 202, 164); border: 0;">비밀번호 변경</button>
                    
                        <br>

                
                    </div>
                    
                </div>
            </div>
            <p class="mt-5 mb-3 text-muted">© Ontrip</p>

        </form>
	

	
	<script>
	
		$(function(){
			if($("input:password[name=userPwd]").val() == $("input:password[name=newPwd]").val()){
	  		  alert("이전비밀번호와 동일합니다. 다시 작성해주세요.");
	  		  $("input:password[name=newPwd]").focus();
	            $("input:password[name=newPwd]").val("");
	  	  }
		});
	
		function newPwdUpdate(){
			
	  	  if($("input:password[name=newPwd]").val() != $("input:password[name=checkPwd]").val()){
	            alert("비밀번호가 일치하지 않습니다.");
	            $("input:password[name=newPwd]").focus();
	            $("input:password[name=newPwd]").val("");
	            $("input:password[name=checkPwd]").val("");
	            return false;
	        }
	        if($("input:password[name=newPwd]").val() == $("input:password[name=checkPwd]").val() && $("input:password[name=newPwd]").val() != ""){
	            alert("성공적으로 비밀번호 재설정되었습니다.");
	        }
	  }
	</script>
</body>
</html>