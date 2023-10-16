<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>


<div id=boardTitle style="background-image: url('${cpath}/resources/image/board/fireImg.jpg');">
	<div id=boardBigTitle><a href="${cpath}/noticeBoard">Notice</a></div>
</div>

<div id="boardView">
	<div class="boardViewHeader">
		<div class="headerTitle"><c:if test="${dto.pin == 1}"><img src="${cpath}/resources/image/board/notice.png"></c:if>  ${dto.title }</div>
		<div class="headerRight">${dto.idx } | 관리자 | <fmt:formatDate value="${dto.postdate }"/> | 조회수 ${dto.view_cnt }</div>
	</div>
	
	<div class="boardViewContent">
		<c:forTokens var="filePath" items="${dto.filePath}" delims=",">
			<c:choose>
	        <c:when test="${fn:contains(filePath, '더캠핑 정보등록')}">
	            <a href="${cpath}/upload/${filePath}" download>💾 더캠핑 정보등록 양식 .xlsx</a>
	        </c:when>
	        <c:otherwise>
	            <div class="viewUpload"><img src="${cpath}/upload/${filePath}"></div>
	        </c:otherwise>
	  		</c:choose>
		</c:forTokens>
			<div class=viewContent>${dto.content }</div>
	</div>
</div>

<div id="viewMenubar">
			<div class=goBoardList><a href="${cpath }/noticeBoard"><button id="boardListBtn">목록</button></a></div>
		<div class="authBtn">
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