<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>

<h3>게시글 읽기</h3>

<div id="boardView">

		<h3>${dto.idx } | ${dto.title }</h3>
		<h4>조회수 : ${dto.view_cnt }</h4>
		<h4>작성날짜 : <fmt:formatDate value="${dto.postdate }"/></h4>
		<pre>${dto.content }</pre>
</div>

<div class="menubar">
		<div>
		   <a href="${cpath }/eventBoard"><button>목록</button></a>
		</div>
</div>

</body>
</html>