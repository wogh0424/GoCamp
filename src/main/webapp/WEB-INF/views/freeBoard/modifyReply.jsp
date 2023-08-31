<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>

<h3>1${dto.idx }댓글 수정 </h3>
<form method="POST">
		<p><input type="text" name="writer" value="${nickname}" > </p> 
		<input type="hidden" name="idx" value="${reply.idx}" />
		<p><textarea name="reply_content" required >${reply.reply_content }</textarea></p>
		<p><input type="submit"></p>
</form>

</body>
</html>