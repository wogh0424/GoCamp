<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>

<div id="boardContainer" >
<div id=boardTitle style="background-image: url('${cpath}/resources/image/board/river.jpg');">
<div id=board><a href="${cpath}/freeBoard">Board</a></div>
</div>


    <div class="searchInputContainer">
		<form method="GET" class="boardSearchForm">
		      <input type="search" name="order" value="${param.order}" class="boardSearchInput" placeholder="검색">
		      <button type="submit" class="boardSearchSubmit">🔍</button>
		</form>
    </div>


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
		<button><a href="${cpath }/freeBoard/write">새 글 작성</a></button>
	</c:if>
</div>

<div class="paging">
	<c:if test="${paging.prev }">
		<a href="${cpath }/freeBoard?page=${paging.begin - paging.perPage}&search=${paging.order}"><button class="boardPaging"><</button></a>
	</c:if>
	<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
		<a href="${cpath }/freeBoard?page=${i }&search=${paging.order}"><button>${i }</button></a>
	</c:forEach>
	<c:if test="${paging.next }">
		<a href="${cpath }/freeBoard?page=${paging.end + 1}&search=${paging.order}"><button class="boardPaging">></button></a>
	</c:if>
</div>
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