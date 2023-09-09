<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>



<div id=boardTitle style="background-image: url('${cpath}/resources/image/board/house.jpg');">
	<div id=board><a href="${cpath}/reviewBoard">Review</a></div>
</div>
                           

<div id="boardView">
		<div class="boardViewHeader"> 
		   	<div class="headerTitle">${dto.title}</div>
		   	<div class="headerRight"> ${dto.idx} | ${dto.writer} | <fmt:formatDate value="${dto.reviewdate}"/></div> 
		</div>		 
		 
		<div class="boardViewContent">
		    <c:forTokens var="filePath" items="${dto.filePath}" delims=",">
		        <div class="viewUpload"><img src="${cpath}/upload/${filePath}"></div>
		    </c:forTokens>
		     <div class=viewContent>${dto.review_content}</div>
		</div>
</div>







<div class="reviewMenubar">
	<div class=goBoardReview><a href="${cpath }/reviewBoard"><button id="boardListBtn">목록</button></a></div>
	<div></div>
</div>


<%@include file="../footer.jsp"%>

</body>
</html>