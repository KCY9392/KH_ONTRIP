<%--
  Created by IntelliJ IDEA.
  User: jay
  Date: 2022/11/10
  Time: 2:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>멤버상세조회</title>
</head>
<body>

<div>
     회원이름 : ${member.memberName} 성별 : ${member.gender}
</div>
<div>
    생년월일 : ${member.birthDate}
</div>
<div>
    아이디 : ${member.memberId}
</div>
<div>
    휴대번호 : ${member.phone}
</div>


</body>
</html>
