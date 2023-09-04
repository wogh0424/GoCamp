<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<h3>좋아요</h3>

<div id ="likesContainer">
<c:forEach items="${likes}" var="like">
    <div>${like.facltNm}</div>
</c:forEach>
</div>
</body>
</html>