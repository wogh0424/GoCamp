<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file = "../header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>관리자 홈</title>
</head>

<body>

<h1>관리자 홈 화면!</h1>

<a href="${cpath }/admin/grantAuth"><h3>권한부여</h3></a>
<h3>[<a href="<c:url value="/" />">홈</a>]</h3>

</body>
</html>
