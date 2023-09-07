<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>

<style>



</style>
<div id="boardContainer">
<div id=boardTitle>
	<div id=board>BOARD > </div><div id=noticeBoard><a href="${cpath}/noticeBoard">noticeBoard</a></div>
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
		<div class="boardDate">작성일시</div>
		<div class="boardViewcount">조회수</div>
	</div>
	<c:forEach var="dto" items="${list }">
		<div class="dtoItem">
			<div class="boardIdxPrint">${dto.idx }</div>
			<div class="boardTitlePrint">
				<a href="${cpath}/noticeBoard/view/${dto.idx}">
				<c:if test="${dto.pin == 1 }">⭐필독⭐</c:if> ${dto.title }
				</a>
				
			</div>
			<div class="boardDatePrint">${dto.postdate }</div>
			<div class="boardViewcountPrint">${dto.view_cnt }</div>
		</div>
	</c:forEach>
</div>
<div class="boardMenubar">
	<c:if test="${pageContext.request.userPrincipal.name == 'admin'}">
			<a href="${cpath }/noticeBoard/write"><button>공지 작성</button></a>
	</c:if>
</div>

<div class="paging">
	<c:if test="${paging.prev }">
		<a href="${cpath }/noticeBoard?page=${paging.begin - paging.perPage}&search=${paging.order}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
		<a href="${cpath }/noticeBoard?page=${i }&search=${paging.order}">[${i }]</a>
	</c:forEach>
	<c:if test="${paging.next }">
		<a href="${cpath }/noticeBoard?page=${paging.end + 1}&search=${paging.order}">[다음]</a>
	</c:if>
</div>
</div>
<%@include file="../footer.jsp"%>
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



</html>