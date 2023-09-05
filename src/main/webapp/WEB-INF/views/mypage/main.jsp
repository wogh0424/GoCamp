<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>

<div class="mypage_wrap">
	<div class="mypage_items">
		<form id="mypage_form" method="POST" action="${cpath }/changePw">
			<p><b>마이페이지 비밀번호 변경</b></p>
			<p>아이디 : ${dto.userid }</p>
			<p>현재 비밀번호 : <input type="password" name="currentuserpw" placeholder="현재 비밀번호 입력"></p>
			<p>새로운 비밀번호 : <input type="password" name="newuserpw" placeholder="새로운 비밀번호 입력"></p>
			<p>닉네임 : ${dto.nickname }</p>
			<p>이메일 : ${dto.email }</p>
			<p>전화번호 : ${dto.pnum }</p>
			<p>
				<input type="submit" value="비밀번호 변경">
				<input type="reset" value="다시입력">
			</p>
		</form>
	</div>
	<div class="deleted_board">
	<p>운영자에 의해 삭제된 글</p>
		<c:forEach var="board" items="${deleted }">
			<div class="banned_content">
				<div id="title">${board.title }</div>
				<div id="reason">${board.reason }</div>
				<div id="date">${board.deleted_date }</div>
			</div>
		</c:forEach>
	</div>
</div>

<script>
	// 비밀번호를 Service에서  암호화된 Pw와 비교한 다음 submit을 실행
	   	const checkPwBtn = document.getElementById('checkPw')
		const showResult = document.getElementById('showResult')
		const form = document.getElementById('mypage_form')
		
	   	async function CheckPwHandler(event) {
		   	event.preventDefault()
		    const currentuserpw = document.querySelector('input[name="currentuserpw"]')
		    
		   	const url = '${cpath}/checkPw/' + currentuserpw.value
			const result = await fetch(url).then(resp => resp.text())
			if(result == 1){
				alert('변경성공')
				event.target.submit()
			}else {
				alert('변경실패') 
			}
		}
	   	mypage_form.addEventListener('submit',CheckPwHandler) 
	</script>
</body>
</html>