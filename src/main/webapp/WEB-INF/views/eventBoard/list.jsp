<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>

<form method="GET" >
	<select name="column">
		<option value="title" ${paging.column == 'title' ? 'selected' : '' }>타이틀</option>
		<option value="content" ${paging.column == 'content' ? 'selected' : '' }>내용</option>
	</select>
		<p><input type="search" name="search" value="${param.search }" placeholder="검색"></p>
		<p><input type="submit"></p>
</form>

<div id="boardList">
	<div class="item columns">
		<div class="idx">번호</div>
		<div class="title">제목</div>
		<div class="date">작성일시</div>
		<div class="view_cnt">조회수</div>
	</div>
	<c:forEach var="dto" items="${list }">
		<div class="item">
			<div class="idx">${dto.idx }</div>
			<div class="title">
				<a href="${cpath}/eventBoard/view/${dto.idx}">${dto.title }</a>
			</div>
			<div class="writeDate">${dto.postdate }</div>
			<div class="viewCount">${dto.view_cnt }</div>
		</div>
	</c:forEach>
</div>

<div class="paging">
	<c:if test="${paging.prev }">
		<a href="${cpath }/eventBoard?page=${paging.begin - paging.perPage}&search=${paging.search}&column=${paging.column}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
		<a href="${cpath }/eventBoard?page=${i }&search=${paging.search}&column=${paging.column}">[${i }]</a>
	</c:forEach>
	<c:if test="${paging.next }">
		<a href="${cpath }/eventBoard?page=${paging.end + 1}&search=${paging.search}&column=${paging.column}">[다음]</a>
	</c:if>
</div>

</html>