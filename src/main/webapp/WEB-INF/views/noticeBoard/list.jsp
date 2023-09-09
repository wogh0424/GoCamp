<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>


<div id="boardContainer">
<div id=boardTitle style="background-image: url('${cpath}/resources/image/board/fireImg.jpg');">
	<div id=board><a href="${cpath}/noticeBoard">Notice</a></div>
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
			<div class="boardIdxPrint">
				<c:if test="${dto.pin == 1 }"><img src="${cpath}/resources/image/board/notice.png"></c:if>
				<c:if test="${dto.pin == 0 }">${dto.idx }</c:if>
			</div>
			<div class="boardTitlePrint">
				<a href="${cpath}/noticeBoard/view/${dto.idx}" <c:if test="${dto.pin == 1}">style="font-weight: bold;"</c:if>>
				${dto.title }
				</a>
				
			</div>
			<div class="boardWriterPrint">관리자</div>
			<div class="boardDatePrint">${dto.postdate }</div>
			<div class="boardViewcountPrint">${dto.view_cnt }</div>
		</div>
	</c:forEach>
</div>
<div class="boardMenubar">
	<c:if test="${pageContext.request.userPrincipal.name == 'admin'}">
			<a href="${cpath }/noticeBoard/write"><button>새 글 작성</button></a>
	</c:if>
</div>

<div class="paging">
	<c:if test="${paging.prev }">
		<a href="${cpath }/noticeBoard?page=${paging.begin - paging.perPage}&search=${paging.order}"><button class="boardPaging"><</button></a>
	</c:if>
	<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
		<a href="${cpath }/noticeBoard?page=${i }&search=${paging.order}"><button>${i }</button></a>
	</c:forEach>
	<c:if test="${paging.next }">
		<a href="${cpath }/noticeBoard?page=${paging.end + 1}&search=${paging.order}"><button class="boardPaging">></button></a>
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