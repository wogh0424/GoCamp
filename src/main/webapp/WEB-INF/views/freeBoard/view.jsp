<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>

<div id=boardTitle style="background-image: url('${cpath}/resources/image/board/river.jpg');">
	<div id=board><a href="${cpath}/freeBoard">Board</a></div>
</div>




<div id="boardView">
	<div class="boardViewHeader">
		<div class="headerTitle">${dto.title }</div>
		<div class="headerRight">${dto.idx } | <span id="writer">${dto.writer }</span> | <fmt:formatDate value="${dto.date }" /> | 조회수  ${dto.view_cnt }</div>
	</div>
	
	<div class="boardViewContent">
		<c:forTokens var="filePath" items="${dto.filePath}" delims=",">
			<div class=viewUpload><img src="${cpath }/upload/${filePath}" ></div>
		</c:forTokens>	
			<div class=viewContent>${dto.content }</div>
	</div>
</div>




<div id="boardReplyInput">
	<hr>
	<div class=reply>댓글</div>
	<form method="POST">
		<div class=replyWriter><input type="text" name="writer" value="${nickname}" readonly></div>
		<input type="hidden" name="board" value="${dto.idx}" />
			<textarea name="reply_content" placeholder="댓글작성" required></textarea>
			<input type="submit" value="댓글 작성">

		
	</form>
</div>


<c:forEach var="reply" items="${replyList }">
	<div id="freeBoardReplyview">
			<div class="replywriter">${reply.writer }</div> | <fmt:formatDate value="${reply.replydate }" />
		<div class="boardReplyView">${reply.reply_content }</div>
		<c:if test="${reply.writer == nickname }">
			<a href="${cpath }/freeBoard/deleteReply/${reply.idx}"><button
					class="deleteReplyBtn">삭제</button></a>
		</c:if>
	</div>
</c:forEach>



<div id="viewMenubar">
	<div class=goBoardList><a href="${cpath }/freeBoard"><button id =boardListBtn>목록</button></a></div>
	<div class="authBtn">
		<a href="${cpath }/freeBoard/modify/${dto.idx}">
			<button id="modifyBtn">수정</button></a> 
		<a href="${cpath }/freeBoard/deleteFreeBoard/${dto.idx}">
			<button id="deleteBtn">삭제</button></a>	
	</div>
</div>



<!-- 게시글 팝업창 -->
<script>
		const modifyBtn = document.getElementById('modifyBtn')
		const deleteBtn = document.getElementById('deleteBtn')
		
		
		const writer = document.getElementById('writer')		
		const login = '${nickname}'
		
		
		// 공통함수
		function loginCheck() {
			const flag = writer.innerText == login
			return flag
		}
		
		// 수정클릭
		modifyBtn.onclick = function(event) {	
			event.preventDefault()                                     
			if(loginCheck() == false) {								
				alert('본인 글만 수정할 수 있습니다.')			
				return														
			}
			location.href = event.target.parentNode.href					
			
		}
		
		// 삭제 클릭 
		deleteBtn.onclick = function(event){
			event.preventDefault()
			const check = loginCheck()
			if(check == false){
				alert('본인의 글만 삭제할 수 있습니다.')
				return
			}
			if(confirm('정말 삭제하시겠습니까')){ 
			location.href = event.target.parentNode.href
		}
		}
		
		
		
	
</script>

<%@include file="../footer.jsp"%>

</body>
</html>