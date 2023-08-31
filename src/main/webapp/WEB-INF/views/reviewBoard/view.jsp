<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>

<div id=boardTitle>
	<div id=board>BOARD > </div><div id=reviewBoard><a href="${cpath}/reviewBoard">reviewBoard</a></div>
</div>

<div id="boardView">
		<h3>${dto.idx } | ${dto.title } | <span id="writer">${dto.writer }</span></h3>
		<h4>조회수 : ${dto.view_cnt }</h4>
		<h4>작성날짜 : <fmt:formatDate value="${dto.reviewdate }"/></h4>
		<pre>${dto.review_content }</pre>
		<c:forTokens var="filePath" items="${dto.filePath}" delims=",">
			<img src="${cpath }/upload/${filePath}" height="200">
		</c:forTokens>
</div>







<div class="menubar">
		<div>
		   <a href="${cpath }/reviewBoard"><button>목록</button></a>
		</div>
</div>


</body>
</html>