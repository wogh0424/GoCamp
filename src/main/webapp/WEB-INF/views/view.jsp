<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div id="view">
	<h1>${view.facltNm }</h1>
	<c:if test="${images == null}">
		이미지가 없습니다.
	</c:if>

	<c:if test="${images != null}">
		<c:forEach items="${images }" var="image">
			<img src="${image.imageUrl }" width="50px" height="50px">
		</c:forEach>
	</c:if>
</div>

</body>
</html>