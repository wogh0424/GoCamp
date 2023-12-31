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
	
	#dupCheckBtn,
	#nicCheckBtn {
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
	#nicCheckBtn,
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
	
	#dupCheckBtn,
	#nicCheckBtn {
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
	#chkpnummsg
	{
		display: flex;
		justify-content: center;
		align-items: center;
		border-radius: 10px;
		width: 380px;
		height: 20px;
		color: white;
		font-weight: bold;
		font-size: 12px;
	}
	#checkpasswordmsg {
		display: flex;
		justify-content: center;
		align-items: center;
		border-radius: 10px;
		width: 380px;
		height: 20px;
		color: white;
		font-weight: bold;
		font-size: 12px;
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
				<span id="chkpnummsg"></span>
				<span id="checkpasswordmsg"></span>
				<p>
					<input type="text" name="username" placeholder="이름 입력" required>
				</p>
				<p>
					<input type="text" name="nickname" placeholder="닉네임 입력" required>
					<input type="button" id="nicCheckBtn" value="중복확인">
				</p>
				<span id="checknicmsg"></span>
				<p>
					<input type="date" name="birth" placeholder="생일 입력" required>
				</p>
				<p>
					<input type="text" name="pnum" placeholder="전화번호 입력" minlength="11" maxlength="11" required>
				</p>
		
				<p>
					<input type="email" name="email" placeholder="이메일 입력" required>
					<input type="button" id="sendAuthNumber" value="인증번호 발송" required>
				</p>
				<div class="hidden" id="authNumber_wrap">
					<input type="number" name="authNumber" placeholder="인증번호 6자리" required>
					<input id="checkAuthNumber" type="button" value="인증번호 확인" required> <br>
				</div>
				<span id="isNumber"></span> 
				<p>
					<span id="authMessage">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
				</p>
				<p>
					<input id="signupSubmitBtn" type="submit" value="회원가입">
				</p>
			</div>
		</form>
		</div>

	<!-- 회원가입 Javascript -->
	<script>
	const userid = document.querySelector('input[name="userid"]');      // 유저id input
	const dupCheckBtn = document.getElementById('dupCheckBtn');		    // 유저id 중복확인 버튼
	const dupMessage = document.getElementById('dubMessage');		    // 중복체크 메시지
	
	const pnum = document.querySelector('input[name="pnum"]');			// 전화번호
	
	const userpw = document.getElementById('userpw')					// 패스워드
	const confirmpw = document.getElementById('confirmpw')				// 패스워드 확인
	
	const nickname = document.querySelector('input[name="nickname"]');  // 닉네임 input
	const nicCheckBtn = document.getElementById('nicCheckBtn');		    // 닉네임 중복확인 버튼
	const checknicmsg = document.getElementById('checknicmsg');			// 중복체크 메시지
	
	const sendAuthNumber = document.getElementById('sendAuthNumber');   // 인증코드
	const isNumber = document.getElementById('isNumber'); 				// 인증코드 입력 여부 메시지
	
	const email = document.querySelector('input[name="email"]');		// email input
	
	const submitBtn = document.getElementById('signupSubmitBtn');		// 메일인증 버튼
	
	// input에 넣어야 될 내용 외 막는 기능
	// 정규표현식 한글 및 특수문자 사용못하도록
	function removeKoreanAndSpecialChars(inputElement) {
	    inputElement.addEventListener('input', function() {
	        inputElement.value = inputElement.value.replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|\W]/g, '');
	    });
	}
	
	// 정규표현식 이메일 전용(영어 + 숫자  + @ + . 까지만 가능 )
	function removeKoreanExceptAtForEmail(inputElement) {
	    inputElement.addEventListener('input', function() {
	    	inputElement.value = inputElement.value.replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]|[^\w@.]/g, '');
	    });
	}
	
	// 정규표현식 전화번호 전용(숫자만 가능)
	function removeNonNumericForPnum(inputElement) {
	    inputElement.addEventListener('input', function() {
	        inputElement.value = inputElement.value.replace(/[^0-9]/g, '');
	    });
	}
	
	removeKoreanAndSpecialChars(userid); 	// userid
	removeKoreanExceptAtForEmail(email);  	// email
	removeNonNumericForPnum(pnum);			// pnum
	
	// 회원가입 핸들러
	async function checkInputHandler() {
	    // ID 검사
	    if (userid.value == '') {
	        dupCheckBtn.focus();
	        alert('먼저 사용할 ID를 입력해주세요');
	        return;
	    }

	    const idUrl = '${cpath}/dupCheck/' + userid.value;
	    const idCount = await fetch(idUrl).then(resp => resp.text());

	    if (idCount != 0) {
	        dupMessage.innerText = '이미 사용중인 ID입니다';
	        dupMessage.style.color = 'red';
	        userid.select();
	        return;  // ID가 중복될 경우 함수 종료
	    }

	    dupMessage.innerText = '사용 가능한 ID입니다';
	    dupMessage.classList.add('check');
	    dupMessage.style.color = 'blue'; 

	    // 닉네임 검사
	    if (nickname.value == '') {
	        nicCheckBtn.focus();
	     	
	        // ID가 사용가능하면 알림 표시
	        alert('사용 가능한 ID입니다. 사용하실 닉네임을 입력해주세요.');			
	        return;
	    }

	    const nicUrl = '${cpath}/dupCheck/' + nickname.value;
	    const nicCount = await fetch(nicUrl).then(resp => resp.text());

	    if (isNaN(nicCount)) {
	        alert('처리 도중 문제발생');
	        nickname.focus();
	        return;
	    }
		// 사용 불가능한 닉네임인 경우
	    if (nicCount != 0) {
	    	// span checknicmsg안에 메시지를 표시
	        checknicmsg.innerText = '이미 사용중인 닉네임입니다';
	    	// 빨간색으로 컬러를 변경
	        checknicmsg.style.color = 'red';
	        nickname.select();
	        return;
	    }
		
		// 사용가능한 닉네임인 경우
		// span checknicmsg안에 메시지를 표시
	    checknicmsg.innerText = '사용 가능한 닉네임입니다';
	    checknicmsg.classList.add('check');
	 	// 파란색으로 컬러를 변경
	    checknicmsg.style.color = 'blue';
	}

	dupCheckBtn.addEventListener('click', checkInputHandler);	// ID중복확인 버튼클릭 이벤트
	nicCheckBtn.addEventListener('click', checkInputHandler);   // 닉네임중복확인 버튼클릭 이벤트
		
		// 인증번호 발송
		async function sendAuthNumberHandler(){
			const email = document.querySelector('input[name="email"]')
			// input userid, uickname이 비어 있다면
			if (!userid.value || !nickname.value) {
				// 알림을 띄움
		        alert('사용할 ID와 닉네임을 먼저 입력해주세요.');
		        return;
		    }
			const url = '${cpath}/sendAuthNumber/' + email.value + '/'
			const json = await fetch(url).then(resp => resp.json())
			alert(json.message)
			
			if(json.success == 1){
				document.querySelector('div.hidden').classList.remove('hidden')
			}
		}
		
		// 이메일 인증번호 확인
		async function checkAuthNumberHandler() {
		    const authNumber = document.querySelector('input[name="authNumber"]');
		    if (authNumber.value === '') {
		        isNumber.innerText = '인증코드를 입력하지 않았습니다.';
		        isNumber.style.color = 'red';
		
		        setTimeout(() => {
		            isNumber.innerText = ''; // 메시지가 3초 후 사라짐
		        }, 3000);
		
		        return;
		    }
		    const url = '${cpath}/checkAuthNumber/' + authNumber.value;
		    const row = await fetch(url).then(resp => resp.text());
		    const authMessage = document.getElementById('authMessage');
		    if (row !== '0') {
		        authMessage.innerText = '인증 성공';
		        authMessage.classList.add('check');
		        authMessage.style.color = 'blue';
		    } else {
		        authMessage.innerText = '인증 실패';
		        authMessage.style.color = 'red';
		    }
		}
		
		// 회원가입 기본동작을 막는 리스터
		submitBtn.addEventListener('click', async function(event) {
		    event.preventDefault(); // 버튼의 기본 동작인 폼 제출을 중단

		    const check = document.querySelectorAll('span.check');
		    console.log(check);
		    
		    // 인증번호가 성공적으로 확인되었는지 확인
		    const authMessage = document.querySelector('#authMessage.check');
		    
		    if (authMessage === null) {
		        alert('인증번호 확인이 완료되지 않았습니다.');
		        return;
		    }

		    if (check.length === 0) {
		        alert('아이디, 인증번호 체크가 완료되지 않았습니다.');
		    } else if (check.length === 1) {
		        alert('필수 항목 인증이 완료되지 않았습니다.');
		    } else {
		        alert('회원가입이 성공하였습니다.');
		        const signForm = document.getElementById('signForm');
		        await couponHandler()
			signForm.submit(); // 폼 제출
		    }
		});
		
		sendAuthNumber.onclick = sendAuthNumberHandler
		checkAuthNumber.onclick = checkAuthNumberHandler		
	</script>

	<!-- 비밀번호 재확인 코드  -->
	<script>					
	// 비밀번호 재확인 
	function validatepw() {
	    if (userpw.value != confirmpw.value) {
	        confirmpw.setCustomValidity("비밀번호가 일치하지 않습니다");
	        checkpasswordmsg.textContent = "비밀번호가 서로 다릅니다";
	        checkpasswordmsg.style.color = "orange";
	    } else {
	        confirmpw.setCustomValidity('');
	        checkpasswordmsg.textContent = "비밀번호가 일치합니다";
	        checkpasswordmsg.style.color = "blue";
	    }
	}
	
	function checkPasswordStrength() {
	    const password = userpw.value;
	    let count = 0;
	
	    // 숫자 체크
	    if (/[0-9]/.test(password)) {
	        count++;
	    }
	
	    // 영어 체크
	    if (/[a-zA-Z]/.test(password)) {
	        count++;
	    }
	
	    // 특수문자 체크
	    if (/[^a-zA-Z0-9]/.test(password)) {
	        count++;
	    }
	
	    switch (count) {
	        case 3:
	            chkpnummsg.textContent = "보안 강도가 높음";
	            chkpnummsg.style.color = "green";
	            break;
	        case 2:
	            chkpnummsg.textContent = "보안 강도가 보통";
	            chkpnummsg.style.color = "orange";
	            break;
	        default:
	            chkpnummsg.textContent = "보안 강도가 낮음";
	            chkpnummsg.style.color = "red";
	            break;
	    }
	}
	
	userpw.oninput = function() {
	    validatepw();
	    checkPasswordStrength();
	}
	// onchange : JS를 통해 변화가 일어났는지 감지한다. addEventListener와 같은 기능
	confirmpw.oninput = validatepw;
	
	// onkeyup : 사용자가 키보드의 키를 눌렀다가 땠을 때
	confirmpw.onkeyup = validatepw
	</script>

	
	<script>
		
		async function couponHandler() {
			const url = cpath + '/coupon/' + userid.value;	
			await fetch(url)
			.then(resp => resp.json())
			.then(json => {
				if (signForm != null) {
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
