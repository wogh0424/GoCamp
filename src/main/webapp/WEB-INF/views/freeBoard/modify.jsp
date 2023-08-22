<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>

<h3>${dto.idx }번 게시글 수정 </h3>

<form method="POST">
		<p><input type="text" name="title" value="${dto.title }" required autofocus></p>
		<p><input type="text" name="writer" value="${dto.writer }" readonly></p>
		<p><input type="date" name="writeDate" value="${dto.date }" readonly></p>
		<p><textarea name="content" required >${dto.content }</textarea></p>
		<p><input type="submit"></p>
</form>

</body>
</html>