<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>

<h3>게시글 읽기</h3>

<div id="boardView">

		<h3>${dto.idx } | ${dto.title } | <span id="writer">${dto.writer }</span></h3>
		<h4>조회수 : ${dto.view_cnt }</h4>
		<h4>작성날짜 : <fmt:formatDate value="${dto.date }"/></h4>
		<pre>${dto.content }</pre>
</div>


	
<div id="freeBoardReplyinput">
	<hr>
	<h3>댓글</h3>
	<form method="POST" >
		<p><input type="text" name="writer" value="${pageContext.request.userPrincipal.name}" readonly> </p> 
		<p><textarea name="reply_content" placeholder="댓글작성" required></textarea> </p>
		<p><input type="submit" value="댓글 작성"></p>
	</form> 
</div>


	
	
		<c:forEach var="reply" items="${replyList }">
		<div id="freeBoardReplyview">  
			<h3>${reply.writer} | <fmt:formatDate value="${reply.replydate }"/></h3>                                              
			<h3>${reply.reply_content }</h3>
		</div>
		</c:forEach>
	





<div class="menubar">
		<div>
		   <a href="${cpath }/freeBoard"><button>목록</button></a>
		</div>
		<div>		
			<a href="${cpath }/freeBoard/modify/${dto.idx}"><button id="modifyBtn">수정</button></a>
			<a href="${cpath }/freeBoard/delete/${dto.idx}"><button id="deleteBtn">삭제</button></a>
		</div>
</div>

<!-- LOGIN 연결되면 구현-->
<script>


		const modifyBtn = document.getElementById('modifyBtn')
		const deleteBtn = document.getElementById('deleteBtn')
		const writer = document.getElementById('writer')
		const login = '${pageContext.request.userPrincipal.name}'
		
		function loginCheck() {
			const flag = 	writer.innerText == login
			return flag
		}
		// 공통되는 코드를 하나의 함수로 묶어놨다.
		
		modifyBtn.onclick = function(event) {	
			event.preventDefault()                                       // 1) 일단 이벤트의 기본작동을 막는다(버튼 눌려서 링크 이동)
			if(loginCheck() == false) {									   // 2) 로그인 체크여부에 따라
				alert('본인 글만 수정할 수 있습니다.')			   //			경고 메시지를 출력하고 
				return															   // 	        함수를 종료한다.
			}
			location.href = event.target.parentNode.href						// 3) 원래 이동하려던 주소로 이동시킨다.
			
			// event : clickEvent
			// event.target : <button>
			// .parentNode : <a href="">
			// .href = "${cpath}/board/modify/{dto.idx}"  - 자바코드가 제일 먼저 실행 되므로 주석안에서 틀려도 js보다 먼저 실행돼서 오류가 발생
			// 주소창의 내용이 바꼈으니 getMapping	
		}
		
		
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