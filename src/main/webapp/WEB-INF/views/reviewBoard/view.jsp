<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>

<style>

/* 전체 페이지의 기본 스타일 */
body, html {
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
}

/* 게시판 제목 스타일 */
#boardTitle {
    width: 1200px;
    margin: 40px auto 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-size: 24px;
    padding: 20px 0;
    text-align: center;
    border-bottom: 1px solid #ccc;
}

#boardTitle a {
    text-decoration: none;
    color: inherit;
}

/* 게시판 본문 스타일 */
#boardView {
    width: 1200px;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ccc;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
    display: flex;
    flex-direction: column;
    gap: 10px;
}
#boardViewDetail{
	width: 100%;
	margin:  auto;
    padding: 20px;
    border: 1px solid #ccc;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
    display: flex;
    flex-direction: column;
    gap: 7px;
}

.viewIdx, .viewTitle, .viewReadCount, .viewDate, .viewContent, .viewUpload {
    margin-bottom: 20px;
}

.viewUpload img {
    max-width: 100%;
}

/* 게시판 하단 메뉴 스타일 */
#viewMenubar {
    width: 1200px;
    margin: 0 auto;
    display: flex;
    justify-content: space-between;
    padding: 20px 0;
}

#viewMenubar button {
    cursor: pointer;
    padding: 10px 20px;
    border: none;
    background-color: #007BFF;
    color: #fff;
    border-radius: 5px;
    transition: background-color 0.2s;
}

#viewMenubar button:hover {
    background-color: #0056b3;
}



.viewRow {
    display: flex;
}

.viewCategory {
    width: 20%;
    font-weight: bold;
    display: flex;
    align-items: center;
    padding-left: 10px;
}

.viewData {
    width: 80%;
    display: flex;
    align-items: center;
    border-left: 1px solid #ccc;
    padding-left: 10px; 
}

.viewContentRow .viewData {
    border: none;
     width: 100%;
}

.viewUpload {
    margin-top: 10px;
}


</style>


<div id=boardTitle>
	<div id=board>BOARD > </div><div id=reviewBoard><a href="${cpath}/reviewBoard">ReviewBoard</a></div>
</div>

<div id="boardView">
		<div id="boardViewDetail">
		    <div class="viewRow">
		        <div class="viewCategory">번호</div>
		        <div class="viewData viewIdx">${dto.idx}</div>
		    </div>
		    <div class="viewRow">
		        <div class="viewCategory">제목</div>
		        <div class="viewData viewTitle">${dto.title}</div>
		    </div>
		    <div class="viewRow">
		        <div class="viewCategory">작성자</div>
		        <div class="viewData viewWriter">${dto.writer}</div>
		    </div>
		    <div class="viewRow">
		        <div class="viewCategory">조회수</div>
		        <div class="viewData viewReadCount">${dto.view_cnt}</div>
		    </div>
		    <div class="viewRow">
		        <div class="viewCategory">작성날짜</div>
		        <div class="viewData viewDate"><fmt:formatDate value="${dto.reviewdate}"/></div>
		    </div>
		    <div class="viewRow viewContentRow">
		        <div class="viewCategory">내용</div>
		    </div>
		     
		        <div class="viewData viewContent">${dto.review_content}</div>
		    <c:forTokens var="filePath" items="${dto.filePath}" delims=",">
		        <div class="viewUpload"><img src="${cpath}/upload/${filePath}" height="200"></div>
		    </c:forTokens>
		</div>
</div>







<div class="viewMenubar">
		<div><a href="${cpath }/reviewBoard"><button>목록</button></a></div>
</div>

<%@include file="../footer.jsp"%>

</body>
</html>