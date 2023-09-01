<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>

<div id=boardTitle>
<div id=board>BOARD > </div><div id=freeBoard><a href="${cpath}/freeBoard">FreeBoard</a></div>
</div>

<div id="boardView">
		<h3>${dto.idx } | ${dto.title } | <span id="writer">${dto.writer }</span></h3>
		<h4>조회수 : ${dto.view_cnt }</h4>
		<h4>작성날짜 : <fmt:formatDate value="${dto.date }"/></h4>
		<pre>${dto.content }</pre>
		<c:forTokens var="filePath" items="${dto.filePath}" delims=",">
<%-- 		<h3>${filePath}</h3> --%>
			<img src="${cpath }/upload/${filePath}" height="200">
		</c:forTokens>
</div>


	
<div id="freeBoardReplyinput">
	<hr>
	<h3>댓글</h3>
	<form method="POST" >
		<p><input type="text" name="writer" value="${nickname}" readonly> </p> 
		<input type="hidden" name="board" value="${dto.idx}" />
		<p><textarea name="reply_content" placeholder="댓글작성" required></textarea> </p>
		<p><input type="submit" value="댓글 작성"></p>
	</form> 
</div>


	
	
		<c:forEach var="reply" items="${replyList }">
		<div id="freeBoardReplyview">  
			<h3><span class="replywriter">${reply.writer }</span> | <fmt:formatDate value="${reply.replydate }"/></h3>                                              
			<h3>${reply.reply_content }</h3>
		<c:if test="${reply.writer == nickname }">	
<%-- 			<a href="${cpath }/freeBoard/modifyReply/${reply.idx}"><button class="modifyReplyBtn">수정</button></a> --%>
			<a href="${cpath }/freeBoard/deleteReply/${reply.idx}"><button class="deleteReplyBtn">삭제</button></a>
		</c:if>
		</div>
		</c:forEach>
	


<div class="menubar">
		<div>
		   <a href="${cpath }/freeBoard"><button>목록</button></a>
		</div>
		<div>		
			<a href="${cpath }/freeBoard/modify/${dto.idx}"><button id="modifyBtn">수정</button></a>
			<a href="${cpath }/freeBoard/deleteFreeBoard/${dto.idx}"><button id="deleteBtn">삭제</button></a>
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
			const flag = 	writer.innerText == login
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
</body>
</html>