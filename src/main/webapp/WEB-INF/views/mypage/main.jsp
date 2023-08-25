<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="frame">
		<div class="frame_top">
			<div class="first_line">
				<p>${dto.nickname }</p>
				<p>${dto.email }</p>
			</div>
			<div class="second_line">
				<p>${dto.pnum }</p>
			</div>
			<div class="userid">
				 <p>${dto.userid }</p>
			</div>
			<div class="userpw">
				<div id="hidden">
					<form id="form" method="POST" action="${cpath }/changePw">
					<p><input type="password" name="currentuserpw" placeholder="사용중이던 비밀번호 입력" /></p>
					<p><input type="password" name="newuserpw" placeholder="새로운 비밀번호 입력" /></p>
					<p><input type="submit" value="비밀번호 변경" /></p>
					</form>
				</div>
			</div>
		</div>
		<div class="top_frame"></div>
	</div>

	<script>
	// 비밀번호를 Service에서  암호화된 Pw와 비교한 다음 submit을 실행
	   	const checkPwBtn = document.getElementById('checkPw')
		const showResult = document.getElementById('showResult')
		const form = document.getElementById('form')
		
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
	   	form.addEventListener('submit',CheckPwHandler) 
	</script>

</body>
</html>