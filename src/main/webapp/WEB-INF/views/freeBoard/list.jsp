<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>

<form method="GET" >
	<select name="column">
		<option value="title" ${paging.column == 'title' ? 'selected' : '' }>타이틀</option>
		<option value="content" ${paging.column == 'content' ? 'selected' : '' }>내용</option>
		<option value="writer" ${paging.column == 'writer' ? 'selected' : '' }>작성자</option>
	</select>
		<p><input type="search" name="search" value="${param.search }" placeholder="검색"></p>
		<p><input type="submit"></p>
</form>

<h3>게시판 : ${paging.page } / ${paging.pageCount }</h3>
<h3>${paging.begin }~ ${paging.end }</h3>

<div id="boardList">
	<div class="item columns">
		<div class="idx">번호</div>
		<div class="title">제목</div>
		<div class="writer">작성자</div>
		<div class="date">작성일시</div>
		<div class="view_cnt">조회수</div>
	</div>
	<c:forEach var="dto" items="${list }">
		<div class="item">
			<div class="idx">${dto.idx }</div>
			<div class="title">
				<a href="${cpath}/freeBoard/view/${dto.idx}">${dto.title }</a>
			</div>
			<div class="writer">${dto.writer }</div>
			<div class="writeDate">${dto.date }</div>
			<div class="viewCount">${dto.view_cnt }</div>
		</div>
	</c:forEach>
</div>

<div class="menubar">
	<div>
		
	</div>
	<div>
		<a href="${cpath }/freeBoard/write"><button>새 글 작성</button></a>
	</div>
</div>

<div class="paging">
	<c:if test="${paging.prev }">
		<a href="${cpath }/freeBoard?page=${paging.begin - paging.perPage}&search=${paging.search}&column=${paging.column}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
		<a href="${cpath }/freeBoard?page=${i }&search=${paging.search}&column=${paging.column}">[${i }]</a>
	</c:forEach>
	<c:if test="${paging.next }">
		<a href="${cpath }/freeBoard?page=${paging.end + 1}&search=${paging.search}&column=${paging.column}">[다음]</a>
	</c:if>
</div>

</html>