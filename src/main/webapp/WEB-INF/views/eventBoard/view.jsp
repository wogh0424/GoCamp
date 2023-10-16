<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>


<div id="boardTitle" style="background-image: url('${cpath}/resources/image/board/flowers.jpg');">
	<div id="boardBigTitle"><a href="${cpath}/eventBoard">Event</a></div>
</div>

<div id="boardView">
	<div class="boardViewHeader">
		<div class="headerTitle"><c:if test="${dto.pin == 1}">⭐</c:if>${dto.title }</div>
		<div class="headerRight">${dto.idx } | 관리자 | <fmt:formatDate value="${dto.postdate }"/> | 조회수 ${dto.view_cnt }</div>
	</div>
	
	<div class="boardViewContent">
		<c:forTokens var="filePath" items="${dto.filePath}" delims=",">
			<div class=viewUpload><img src="${cpath }/upload/${filePath}"></div>
		</c:forTokens>
			<div class=viewContent>${dto.content }</div>
	</div>
</div>



<div id="viewMenubar">
		<div class=goBoardList><a href="${cpath }/eventBoard"><button id="boardListBtn">목록</button></a></div>
		<div class="authBtn">
			<c:if test="${sessionScope.permission == 'ROLE_ADMIN'}">
				<a href="${cpath }/eventBoard/modify/${dto.idx}">
					<button id="modifyBtn">수정</button></a>
				<a href="${cpath }/eventBoard/delete/${dto.idx}">
					<button id="deleteBtn">삭제</button></a>
			</c:if>
		</div>
</div>


<%@include file="../footer.jsp"%>

</body>
</html>