<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 모달창 -->
<div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <h3 style="font-size:26px; font-weight:900; color:cadetblue">< 회원정보 ></h3>
            <br>
            <span>회원 이름 : </span>
            <input type="text" name="userName" value="${member.memberName}" readonly>
            &nbsp;&nbsp;&nbsp;
            <span>성별 : </span>
            <input type="text" name="gender" value="${member.gender}" readonly><br>
            <br>
            <span>생년월일 : </span>
            <input type="text" name="birth" value=" ${member.birthDate}" readonly><br><br>
            <span>아이디 : </span>
            <input type="text" name="userId" value="${member.memberId}" readonly> <br><br>
            <span>휴대폰번호 : </span>
            <input type="text" name="phone" value="${member.phone}" readonly><br><br>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="border:none; background-color:coral;">확인</button>
        </div>
    </div>
</div>
