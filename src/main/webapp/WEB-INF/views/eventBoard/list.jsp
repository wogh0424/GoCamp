<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<div id=boardTitle>
	<div id=board>BOARD > </div><div id=eventBoard><a href="${cpath}/eventBoard">eventBoard</a></div>
</div>

<form method="GET" class="search-form">
  <div id="column" class="search-column">
    <select name="column" class="search-select">
      <option value="title" ${paging.column == 'title' ? 'selected' : ''}>타이틀</option>
      <option value="content" ${paging.column == 'content' ? 'selected' : ''}>내용</option>
    </select>
    <div class="search-input-container">
      <input type="search" name="search" value="${param.search}" class="search-input" placeholder="검색">
      <button type="submit" class="search-submit">
        🔍
      </button>
    </div>
  </div>
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

<div class="menubar">
<c:if test="${pageContext.request.userPrincipal.name == 'admin'}">
		<a href="${cpath }/eventBoard/write"><button>event글 작성</button></a> 
</c:if>
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