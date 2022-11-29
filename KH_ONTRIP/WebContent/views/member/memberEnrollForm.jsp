<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>온트립 : 회원가입</title>
    
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
        body{
            margin:0;
            text-align: center;
        }
        p{
            font-weight: bold;
        }
        h1{
            color:rgb(155, 205, 138);
            font-size:40px;
        }
        input{
            margin: 10px;
        }
        textarea{
            resize: none;
            border: solid 2px rgb(155, 205, 138);
            border-radius: 5px;
            color:rgb(121, 119, 119);
        }
        span{
            font-weight: 600;
        }
        .btn-1{
            background-color:rgb(155, 205, 138) ;
            border:none;
            width:150px;
            height:40px;
            margin-left: 10px;
            margin-right: 10px;
            font-weight: 900;
            border-radius: 5px;
        }

        .btn-1:hover{
            cursor: pointer;
            background-color: rgb(139, 190, 127);
        }
        .btn-1:active{
            background-color: rgb(164, 224, 150);
        }
        .centerText{
            margin: 0px;

        }
        .centerText>input{
            height:30px;
            border:1px solid #999;
            border-radius: 5px;
        }
        .select_gender{
            width:65px;
            padding: .6em .5em;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            border: 1px solid #999;
            border-radius: 5px;
        }
        .select_birth{
            width: 97px;
            padding: .4em .5em;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            border: 1px solid #999;
            border-radius: 5px;
        }
        .span_name{
            margin-left: -14px;
        }
        .span_birth{
            margin-left: 5px;
        }
        .span_id{
            margin-left:70px;
        }
        .span_pwd{
            margin-left: -35px;
        }
        .span_pwd2{
            margin-left: -72px;
        }
        .span_phone{
            margin-left: -35px;
        }
        .input{
            width:250px;
        }
        .btn_2{
            background-color:rgb(155, 205, 138);
            border:1px solid black;
            border-radius: 5px;
            width:80px;
            height:33px;
            font-weight: 400;
        }
        .btn_3{
            margin-top: 40px;
            background-color:rgb(155, 205, 138) ;
            border:1px solid black;
            width:150px;
            height:40px;
            margin-left: 10px;
            margin-right: 10px;
            font-weight: 900;
            border-radius: 5px;
        }
        .btn_2:hover{
            cursor: pointer;
            background-color:rgb(194, 232, 181);
        }
        .btn_2:active{
            background-color:rgb(173, 222, 155);
        }
        .btn_3:hover{
            cursor: pointer;
            background-color:rgb(194, 232, 181);
        }
        .btn_3:active{
            background-color:rgb(173, 222, 155);
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


    </style>
</head>
<body>
<div class="uk-section uk-section-default sl-in2"
      style="min-width: 90vw; height: 28vh;">
      <div class="uk-container">
         <div style="text-align: center;  margin-top:-20px;">
            <div style="font-size: 40px; font-weight: 600;">OnTrip</div>
            <br>
            <div style="color: darkgray">MAKE YOUR ROUTE OPTIMIZED</div>
            <br> <br>
            <div>
               <span>회원가입</span> > <span
                  style="color: coral; font-size: 16px; font-weight: 600;">회원정보</span>
            </div>
         </div>
      </div>
   </div>

	<br>

    <div class="container">
        <br>
        <form id="memberEnroll" action="<%=request.getContextPath() %>/insert.me" method="post">
           <div class="centerText">
               <span class="span_name">여행자 이름</span>
               <input type="text" placeholder="여행자 이름" size="14" name="memberName" required>  &nbsp; &nbsp; &nbsp; &nbsp;
               <span>성별</span> &nbsp;
               <select class="select_gender" name="gender">
                   <option>성별</option>
                   <option value="남">남</option>
                   <option value="여">여</option>
               </select> <br><br>
   
               <span class="span_birth">생년월일</span> &nbsp;
               <input type="date" name="birthDate"/> <br><br>
   
               <span class="span_id">아이디</span>
               <input class="input" type="text" placeholder="아이디" name="memberId" required>
               <button class="btn_2" type="button" onclick="idCheck();">중복확인</button><br><br>
               <span class="span_pwd">비밀번호</span>
               <input class="input" type="password" placeholder="비밀번호" name="memberPwd" required><br><br>
               <span class="span_pwd2">비밀번호 확인</span>
               <input class="input" type="password" placeholder="비밀번호 확인" name="memberPwd2" required> <br><br>
               <span class="span_phone">휴대전화</span>
               <input class="input" type="text" placeholder="휴대전화번호 ( ' - ' 포함 )" name="phone" required><br>
               
               <button type="reset" onclick="resetBtn();" class="btn_3">초기화</button>
               <button type="button" onclick="btnEnroll();" class="btn_3" disabled name="checkSelct">가입</button>
   
               
           </div>
      </form>
    </div>
    
      <script>
      
      function resetBtn(){
          
          $('input[name=memberId]').attr('readonly', false);
          $("button[name=checkSelct]").attr("disabled", true);
       }

      
         function idCheck(){
            // 아이디 입력하는 input 요소 객체
            let $memberId = $("#memberEnroll input[name=memberId]");
            
            $.ajax({
               url : "idCheck.me",
               data : {checkId : $memberId.val()},
               success : function(result){
            	   
            	   if($memberId.val() == "") {
            		   
            		   Swal.fire({
                           icon: 'error',
                           title: '아이디를 입력해주세요.'
                           
                       });

                       $memberId.focus();
                       
                   }else if(result == "NNNNN"){ // 사용불가능한 아이디
                	   
                	   Swal.fire({
                           icon: 'error',
                           title: '이미 존재하는 아이디입니다.'
                           
                       });
                     $memberId.focus();
                     
                  }else{
                     
                	  Swal.fire({
                          title: '사용가능한 아이디입니다.',
                          text: '사용하시겠습니까?',
                          icon: 'warning',
                          showCancelButton: true,
                          confirmButtonColor: '#3085d6',
                          cancelButtonColor: '#d33',
                          confirmButtonText: '사용',
                          cancelButtonText: '취소'
                      }).then((result) => {
                    	  if(result.isConfirmed){
                              $("button:button[name=checkSelct]").attr("disabled",false);
                              $("input[name=memberId]").attr("readonly", true);
                           }  
                    	  
                      });
                  
                	  
                  }
               },
               error : function(){
                  alert("아이디 중복체크용 ajax 통신 실패");
               }
            });
         }
         
         
         
         function btnEnroll(){
             
        	 if($('input[name=memberName]').val() == ""){
        		 Swal.fire({
                     icon: 'error',
                     title: '이름을 입력해주세요.'                  
                 });
        	 } else if($('.select_gender').val() == "성별"){
        		 Swal.fire({
                     icon: 'error',
                     title: '성별을 입력해주세요.'                  
                 });
        	 } else if($('input[name=birthDate]').val() == ""){
        		 Swal.fire({
                     icon: 'error',
                     title: '생년월일을 입력해주세요.'                  
                 });
        	 } else if($('input[name=memberPwd]').val() == ""){
        		 Swal.fire({
                     icon: 'error',
                     title: '비밀번호를 입력해주세요.'                  
                 });
        	 } else if($('input[name=memberPwd2]').val() == ""){
        		 Swal.fire({
                     icon: 'error',
                     title: '비밀번호확인을 입력해주세요.'                  
                 });
        	 } else if($('input[name=phone]').val() == ""){
        		 Swal.fire({
                     icon: 'error',
                     title: '휴대폰번호를 입력해주세요.'                  
                 });
        	 } else {
        		 Swal.fire({
                     title: '회원가입 하시겠습니까?',
                     icon: 'warning',
                     showCancelButton: true,
                     confirmButtonColor: '#3085d6',
                     cancelButtonColor: '#d33',
                     confirmButtonText: '가입',
                     cancelButtonText: '취소'
                 }).then((result) => {
                     if (result.isConfirmed) {
                         Swal.fire({
                               title: '가입이 완료되었습니다.',
                               text: '로그인 화면으로 이동합니다.',
                               icon:'success',
                               customClass: {
                                   confirmButton: 'swal2-confirm swal2-styled swal2-jong',
                                   cancelButton: 'btn btn-danger'
                                 },    
                         }).then((result) => {
                        	 
                            if(result.isConfirmed){
                            	
                             $("#memberEnroll").submit();
                               
                            }                                   
                         });
                     }
                 });
        	 }
        	 
        	 
        	 
        	 
        	 
             
             
          }
          

         
         
      </script>
</body>
</html>