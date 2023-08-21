<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>

<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>로그인 페이지</title>
</head>

<body onload="document.f.id.focus();">

<h3>아이디와 비밀번호를 입력해주세요.</h3>

<c:url value="/login" var="loginUrl" />
<form:form name="f" action="${loginUrl}" method="POST">
    <c:if test="${param.error != null}">
        <p>아이디와 비밀번호가 잘못되었습니다.</p>
    </c:if>
    <c:if test="${param.logout != null}">
        <p>로그아웃 하였습니다.</p>
    </c:if>
    <p>
        <label for="username">아이디</label>
        <input type="text" id="id" name="userid" />
    </p>
    <p>
        <label for="password">비밀번호</label>
        <input type="password" id="password" name="userpw"/>
    </p>
    <%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
   <input type="submit" value="로그인"/>
	<a href="${cpath }/login/signup"><input type="button" value="회원가입"/></a>
</form:form>
</body>
</html>
