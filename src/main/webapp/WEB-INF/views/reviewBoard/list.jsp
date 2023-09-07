<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>

<style>
/* 전체 컨테이너 스타일 */
#boardContainer {
 
    margin: 0 auto;  
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    background-color: #f5f5f5;
     padding: 20px;
   
  
}

/* 컬럼 레이아웃 설정 */
.boardColumns, .dtoItem {
    display: grid;
    grid-template-columns: 1fr 3fr 2fr 2fr 2fr; 
    gap: 10px; 
    align-items: center;  
    border-bottom: 1px solid #e1e1e1;
     padding: 10px 0;
     text-align: center;
}

/* 키워드 하이라이트 스타일 */
.highlight {
    background-color: yellow;
    padding: 0 5px;
}

.boardSearchForm {
    margin-left: auto;    
}

.boardList {
    width: 1200px;
    margin: 0 auto;
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
}


#boardTitle {
  width: 1200px;
    margin: 40px auto 10px; 
    padding: 20px;
    text-align: center;
    font-size: 24px;
    margin-bottom: 10px;
}

</style>
<div id="boardContainer">
<div id=boardTitle>
	<div id=board>BOARD > </div><div id=reviewBoard><a href="${cpath}/reviewBoard">reviewBoard</a></div>
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
				<a href="${cpath}/reviewBoard/view/${dto.idx}">${dto.title }</a>
			</div>
			<div class="boardWriterPrint">${dto.writer }</div>
			<div class="boardDatePrint">${dto.reviewdate }</div>
			<div class="boardViewcountPrint">${dto.view_cnt }</div>
		</div>
	</c:forEach>
</div>


<div class="paging">
	<c:if test="${paging.prev }">
		<a href="${cpath }/reviewBoard?page=${paging.begin - paging.perPage}&search=${paging.order}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
		<a href="${cpath }/reviewBoard?page=${i }&search=${paging.order}">[${i }]</a>
	</c:forEach>
	<c:if test="${paging.next }">
		<a href="${cpath }/reviewBoard?page=${paging.end + 1}&search=${paging.order}">[다음]</a>
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