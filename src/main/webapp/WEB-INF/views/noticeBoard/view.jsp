<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>


<div id=boardTitle style="background-image: url('${cpath}/resources/image/board/fireImg.jpg');">
	<div id=board><a href="${cpath}/noticeBoard">Notice</a></div>
</div>

<div id="boardView">

		<div class=viewIdx>${dto.idx }</div>
		<c:if test="${dto.pin == 1}">⭐필독⭐</c:if><div class=viewTitle>${dto.title }</div>
		<div class=viewReadCount>조회수 : ${dto.view_cnt }</div>
		<div class=viewDate>작성날짜 : <fmt:formatDate value="${dto.postdate }"/></div>
		<div class=viewContent>${dto.content }</div>
		<c:forTokens var="filePath" items="${dto.filePath}" delims=",">
			<div class=viewUpload><img src="${cpath }/upload/${filePath}" height="200"></div>
		</c:forTokens>
</div>

<div id="viewMenubar">
		<div><a href="${cpath }/noticeBoard"><button>목록</button></a></div>
		<div>
			<c:if test="${sessionScope.permission == 'ROLE_ADMIN'}">
				 <a href="${cpath }/noticeBoard/modify/${dto.idx}">
				 	<button id="modifyBtn">수정</button></a>
				 <a href="${cpath }/noticeBoard/delete/${dto.idx}">
				 	<button id="deleteBtn">삭제</button></a>
			</c:if>
		</div>
</div>


<%@include file="../footer.jsp"%>

</body>
</html>