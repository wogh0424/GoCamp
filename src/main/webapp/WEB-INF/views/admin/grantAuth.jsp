<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style>
	.frame {
		display: flex;
		flex-direction: column;
		width:400px;
		height:700px;
		border: 2px solid black;
		margin: auto;
	}
	.main {
		display: flex;
	}
</style>

<h3>계정권한 페이지</h3>
<div class="frame">
<c:forEach var="dto" items="${list }">
	<div class="main">
	userid = ${dto.userid } | <form action="${cpath }/admin/modifyAuth"><select name="authority">
		<option value="${dto.userid }/ROLE_USER">어드민</option>
		<option value="${dto.userid }/ROLE_ADMIN">일반유저</option>
		<option value="${dto.userid }/enabled">로그인 차단/허용</option>
	</select>
	<button type="submit">권한변경</button></form>
	</div>
</c:forEach>
</div>
</body>
</html>