<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<div id=boardTitle>
<div id=board>BOARD > </div><div id=freeBoard><a href="${cpath}/freeBoard">FreeBoard</a></div>
</div>


<form method="GET" class="boardSearchForm">
    <div class="searchInputContainer">
      <input type="search" name="order" value="${param.order}" class="boardSearchInput" placeholder="검색">
      <button type="submit" class="boardSearchSubmit">🔍</button>
    </div>
</form>


<div class="boardList">
	<div class="boardColumns">
		<div class="boardIdx">번호</div>
		<div class="boardTitle">제목</div>
		<div class="boardWriter">작성자</div>
		<div class="boardDate">작성일시</div>
		<div class="boardViewcount">조회수</div>
	</div>
	<c:forEach var="dto" items="${list }">
		<div class="dtoItem">
			<div class="boardIdxPrint">${dto.idx }</div>
			<div class="boardTitlePrint">
			  <c:if test="${dto.replyCount >= 1}">
				<a href="${cpath}/freeBoard/view/${dto.idx}" class="searchKey">${dto.title }  [${dto.replyCount}]</a>
			 </c:if>
			 <c:if test="${dto.replyCount == 0}">
				<a href="${cpath}/freeBoard/view/${dto.idx}" class="searchKey">${dto.title }</a>
			 </c:if>
			</div>
			<div class="boardWriterPrint">${dto.writer }</div>
			<div class="boardDatePrint">${dto.date }</div>
			<div class="boardViewcountPrint">${dto.view_cnt }</div>
		</div>
	</c:forEach>
</div>

<div class="boardMenubar">
	<c:if test="${pageContext.request.userPrincipal != null}">
		<a href="${cpath }/freeBoard/write"><button>새 글 작성</button></a>
	</c:if>
</div>

<div class="paging">
	<c:if test="${paging.prev }">
		<a href="${cpath }/freeBoard?page=${paging.begin - paging.perPage}&search=${paging.order}" >[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
		<a href="${cpath }/freeBoard?page=${i }&search=${paging.order}">[${i }]</a>
	</c:forEach>
	<c:if test="${paging.next }">
		<a href="${cpath }/freeBoard?page=${paging.end + 1}&search=${paging.order}">[다음]</a>
	</c:if>
</div>

<script>
	window.onload = keywordMarkHandler
	const key = '${param.order}'
	
	function keywordMarkHandler() {
		const links = document.querySelectorAll('a.searchKey')
		links.forEach(a => {
			if (a.innerText.includes(key)) {
				let text = a.innerText.replace(key, '<span class="highlight">' + key + '</span>')
				a.innerHTML = text				
			}
		})
	}
</script>

<%@include file="../footer.jsp"%>



</html>