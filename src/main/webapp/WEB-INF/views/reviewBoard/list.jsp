<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>

<div id="boardContainer">
<div id=boardTitle style="background-image: url('${cpath}/resources/image/board/house.jpg');">
	<div id=board><a href="${cpath}/reviewBoard">Review</a></div>
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
				<a href="${cpath}/reviewBoard/view/${dto.idx}" class="searchKey">${dto.title }</a>
			</div>
			<div class="boardWriterPrint">${dto.writer }</div>
			<div class="boardDatePrint">${dto.reviewdate }</div>
			<div class="boardViewcountPrint">${dto.view_cnt }</div>
		</div>
	</c:forEach>
</div>


<div class="paging">
	<c:if test="${paging.prev }">
		<a href="${cpath }/reviewBoard?page=${paging.begin - paging.perPage}&search=${paging.order}"><button class="boardPaging"><</button></a>
	</c:if>
	<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
		<a href="${cpath }/reviewBoard?page=${i }&search=${paging.order}"><button>${i }</button></a>
	</c:forEach>
	<c:if test="${paging.next }">
		<a href="${cpath }/reviewBoard?page=${paging.end + 1}&search=${paging.order}"><button class="boardPaging">></button></a>
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