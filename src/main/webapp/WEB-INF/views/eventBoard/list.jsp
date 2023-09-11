<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>


<div id="boardContainer" >
<div id="boardTitle" style="background-image: url('${cpath}/resources/image/board/flowers.jpg');">
	<div id="boardBigTitle"><a href="${cpath}/eventBoard">Event</a></div>
</div>

<form method="GET" class="boardSearchForm">
    <div class="searchInputContainer">
      <input class="boardSearchInput" type="search" name="order" value="${param.order}"  placeholder="검색">
      <button class="boardSearchSubmit" type="submit" >🔍</button>
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
				<c:if test="${dto.pin == 1 }">⭐</c:if>
				<c:if test="${dto.pin == 0 }">${dto.idx }</c:if>
			</div>
			
			<div class="boardTitlePrint">
				<a href="${cpath}/eventBoard/view/${dto.idx}" class="searchKey" <c:if test="${dto.pin == 1}">style="font-weight: bold;"</c:if>>
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
		<button><a href="${cpath }/eventBoard/write">새 글 작성</a></button> 
</c:if>
</div>

<div class="paging">
	<c:if test="${paging.prev }">
		<a href="${cpath }/eventBoard?page=${paging.begin - paging.perPage}&search=${paging.order}"><button class="boardPaging"><</button></a>
	</c:if>
	<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
		<a href="${cpath }/eventBoard?page=${i }&search=${paging.order}"><button>${i }</button></a>
	</c:forEach>
	<c:if test="${paging.next }">
		<a href="${cpath }/eventBoard?page=${paging.end + 1}&search=${paging.order}"><button class="boardPaging">></button></a>
	</c:if>
</div>
</div>


<script>
    window.onload = function() {
        const key = '${param.order}';
        keywordMarkHandler(key);
    }
</script>

<%@include file="../footer.jsp"%>

</html>