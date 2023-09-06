<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
	#hidden {
		display: none;
	}
	#signForm{
		width: 550px;
		margin: 50px auto;
		border: 1px solid black;
		padding: 20px;
		border-radius: 20px;
	}
	
	.signup_content {
		text-align: center;
		display: flex;
		flex-direction: column;
	}
	
	.signup_content p {
		margin: 10px 0;
	}
	
	.signup_content input[type="text"],
	.signup_content input[type="password"],
	.signup_content input[type="date"],
	.signup_content input[type="email"],
	.signup_content input[type="number"] {
		padding: 10px;
		margin: 5px;
		border: 1px solid #ccc;
		border-radius: 5px;
		width: 370px;
		float: left; 
	}
	
	#dupCheckBtn {
		float: right;
		margin-right: 15px;
		background-color: #4476D5;
		color: white;
		height: 52px;
	}
	
	#dubMessage {
		display: inline-block; /* inline-block으로 설정하여 input과 동일한 줄에 표시 */
		z-index: -1;
	}
	
	#dupCheckBtn,
	#sendAuthNumber,
	#checkAuthNumber,
	input[type="submit"] {
		padding: 10px;
		border: none;
		border-radius: 5px;
		cursor: pointer;
	}
	input[type="submit"] {
		width: 300px;
		background-color: rgb(90, 209, 110);
		margin-top: 20px;
	}
	
	#dupCheckBtn {
		float: right;
		margin-right: 15px;
	}
	
	#sendAuthNumber {
		float: right;
		width: 110px;
		height: 52px;
		background-color: #4476D5;
		color: white;
		text-align: center;
	}
	
	#errorMessage,
	#authMessage {
		color: red;
	}
	
	#authMessage {
		display: inline-block; /* inline-block으로 설정하여 input과 동일한 줄에 표시 */
		z-index: -1;
	}
	
	.hidden {
		display: none;
	}
	
	.wrap_signup {
		display: flex;
		flex-direction: column;
		margin-top: 20px;
	}
	
	#checkAuthNumber {
		float: right;
		color: white;
		height: 52px;
		background-color: #4476D5;
	}
	
	
		</style>
	</head>
	<body>	
			<div class="wrap_signup">
			<form id="signForm" method="POST" action="${cpath}/login/signup">
			<div class="signup_content">
				<h2>회원가입</h2>
				<p>
					<input type="text" name="userid" placeholder="아이디 입력" required autofocus>
					<input type="button" id="dupCheckBtn" value="중복확인">
				</p>
			  
				<span id="dubMessage"></span>
				<p>
					<input type="password" name="userpw" id="userpw" placeholder="비밀번호 입력" required>
				</p>
				<p>
					<input type="password" name="confirmpw" id="confirmpw" placeholder="비밀번호 재확인" required>
				</p>
				<p>
					<input type="text" name="username" placeholder="이름 입력" required>
				</p>
				<p>
					<input type="text" name="nickname" placeholder="닉네임 입력" required>
				</p>
				<p>
					<input type="date" name="birth" placeholder="생일 입력" required>
				</p>
				<p>
					<input type="text" name="pnum" placeholder="전화번호 입력" required>
				</p>
		
				<p>
					<input type="email" name="email" placeholder="이메일 입력" required>
					<input type="button" id="sendAuthNumber" value="인증번호 발송" required>
				</p>
				<div class="hidden" id="authNumber_wrap">
					<input type="number" name="authNumber" placeholder="인증번호 6자리" required>
					<input id="checkAuthNumber" type="button" value="인증번호 확인" required> <br> 
				</div>
				<p>
					<span id="authMessage">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
				</p>
				<p>
					<input id="signupSubmitBtn" type="submit" value="회원가입">
				</p>
			</div>
		</form>
		</div>


	<script>
		const dupCheckBtn = document.getElementById('dupCheckBtn')
		const sendAuthNumber = document.getElementById('sendAuthNumber')
		const userid = document.querySelector('input[name="userid"]')
		// 계정 중복확인
		async function dupCheckHandler() {
			const dupMessage = document.getElementById('dubMessage')
			
			if(userid.value == ''){
				dupCheckBtn.focus()
				alert('먼저 사용할 ID를 입력해주세요')
				return
			}
			const url = '${cpath}/dupCheck/' + userid.value
			const count = await fetch(url).then(resp => resp.text())
			
			if(isNaN(count)){
				alert('처리 도중 문제발생')
				userid.focus()
			}
			if(count == 0) {
				dupMessage.innerText = '사용 가능한 ID입니다'
				dupMessage.classList.add('check')
				dupMessage.style.color = 'blue'
			}
			else {
				dupMessage.innerText = '이미 사용중인 ID입니다'
				dupMessage.style.color = 'red'
				userid.select()
			}
		}
		dupCheckBtn.addEventListener('click', dupCheckHandler)
		
		// 인증번호 발송
		async function sendAuthNumberHandler(){
			const email = document.querySelector('input[name="email"]')
			const url = '${cpath}/sendAuthNumber/' + email.value + '/'
			const json = await fetch(url).then(resp => resp.json())
			alert(json.message)
			
			if(json.success == 1){
				document.querySelector('div.hidden').classList.remove('hidden')
			}
		}
		sendAuthNumber.onclick = sendAuthNumberHandler
		
		// 이메일 인증번호 확인
		const checkAuthNumber = document.getElementById('checkAuthNumber')
		async function checkAuthNumberHandler(){
			const authNumber = document.querySelector('input[name="authNumber"]')
			if(authNumber.value == ''){
				return
			}
			const url = '${cpath}/checkAuthNumber/' + authNumber.value
			const row = await fetch(url).then(resp => resp.text())
			const authMessage = document.getElementById('authMessage')
			if(row != 0){
				authMessage.innerText = '인증 성공'
				authMessage.classList.add('check')
				authMessage.style.color = 'blue'
			}
			else {
				authMessage.innerText = '인증 실패'
				authMessage.style.color = 'red'	
		}
	}
		checkAuthNumber.onclick = checkAuthNumberHandler		
	</script>

	<script>		
			const userpw = document.getElementById('userpw')
			const confirmpw = document.getElementById('confirmpw')
			
			// 비밀번호 재확인 
			function validatepw(){
				if(userpw.value != confirmpw.value){
					confirmpw.setCustomValidity("비밀번호가 일치하지 않습니다")
					// setCustomValidity가 뜨면 함수의 진행을 막을수 있고 텍스트도 같이 뛰워줄수 있다
				} else {
					confirmpw.setCustomValidity('')
				}
			}
			userpw.onchange = validatepw
			// onchange : JS를 통해 변화가 일어났는지 감지한다. addEventListener와 같은 기능
			confirmpw.onkeyup = validatepw
			// onkeyup : 사용자가 키보드의 키를 눌렀다가 땠을 때
	</script>
	
	<script>
		const signForm = document.getElementById('signForm')	
	
		signForm.addEventListener('submit', function(event) {
			event.preventDefault();
			const check = document.querySelectorAll('span.check')
			console.log(check)
			if (check.length == 0) {
				alert('아이디, 인증번호 체크가 완료되지 않았습니다.')
				return
			}
			else if (check.length == 1) {
				alert('필수 항목 인증이 완료되지 않았습니다')
				return
			}
			else {
				alert('회원가입이 성공하였습니다.')
// 				await couponHandler()
			}
			
		})
		
		async function couponHandler() {
			const url = cpath + '/coupon/' + userid.value
			
			await fetch(url)
			.then(resp => resp.json())
			.then(json => {
				if (json) {
					alert('축하합니다! 가입기념쿠폰이 발급되었습니다. 마이페이지에서 확인하세요')
					signForm.submit()
				}
				else {
					alert('회원가입 중 문제가 발생하였습니다')
					return
				}
			})
		}
		
	</script>


</body>
</html>