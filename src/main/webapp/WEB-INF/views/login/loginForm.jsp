<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<style>
a {
	text-decoration: none;
	color: black;
}

#section {
	display: flex;
	margin: 20px 29.5% 50px;
}

.loginForm_frame {
	width: 440px;	
	height: 340px;
	background-color: #3C5944;
	box-sizing: border-box;
	padding: 20px;
	border-radius: 10px 0 0 10px;
}

.loginForm_content {
	text-align: center;
}

.input_wrap {
	display: flex;
	flex-direction: column;
	justify-content: space-around;
}

.id, .password, .businessID {
	width: 80%;
	height: 50px;
	border-radius: 5px;
	border: 1px solid grey;
}

.login_btn_input {
	transform: translate(-50%);
	left: 50%;
	top: 100%;
}

.wrap_account {
	width: 100%;
}

.signup_text {
		display: flex;
		justify-content: space-evenly;
}

.login_btn_input {
	display: block;
	margin: 30px 50%;
	width: 80%;
	padding: 13px 0;
	border-radius: 5px;
	background-color: rgb(90, 209, 110);
	font-size: large;
	font-weight: bolder;
	border: 1px solid grey;
	color: white;
}

input {
	padding-left: 30px;
}

.form-wrap {
	text-align: center;
}

#login_type {
	display: flex;
	text-align: center;
	list-style: none;
	display: flex;
	justify-content: center;
}

#login_type li {
	width: 34%;
	border: 1px solid white;
	background-color: #888888;
	padding: 30px 0;
	color: white;
	font-size: 17px;
	border-collapse: collapse;
}

#login_type li.selected {
	background-color: white;
	border-top: 2px solid black;
	color: black;
}

#section > article.selected {
	display: none;
}

#nav_wrap {
	width:100%;
}
</style>
	
	<div style="margin: 50px auto 30px; text-align: center; font-weight: bolder;">
		<h1>로그인</h1>
		<p style="color: grey;">더캠핑의 다양한 서비스와 혜택을 누리세요</p>
	</div>
	<div style="display:flex; justify-content: center;">
	<div id="section">
		<article class="loginForm_frame">
			<div style="width: 400px; height: 300px; background-color: white; padding: 20px; border-radius: 10px;">
			<div class="loginForm_content">
				<c:url value="/login" var="loginUrl" />
			</div>
			<form:form name="f" action="${loginUrl}" method="POST">
				<div class="form-wrap">
					<c:if test="${param.error != null}">
						<p id="errorMessage">아이디와 비밀번호가 잘못되었습니다.</p>
					</c:if>
					<div class="input_wrap">
					
						<p>
							<input type="text" class="id" name="userid"
								placeholder="Enter ID" required autofocus>
						</p>
						<p>
							<input type="password" class="password" name="userpw"
								placeholder="Enter PW" required>
						</p>
					</div>
				</div>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
				<input type="submit" class="login_btn_input" value="로그인" />
			</form:form>
			<div class="wrap_account">
			<p class="signup_text">
				<a href="${cpath}/login/signup">회원가입</a> | <a
					href="${cpath}/login/findAccount">아이디 찾기</a> | <a
					href="${cpath}/login/resetPw">비밀번호 재발급</a>
				</p>
			</div>
			</div>
		</article>
		<article class="bannerImage" style="height: 340px; background-color:#3C5944; border-radius: 0 10px 10px 0">
			<img src="${cpath }/resources/image/thecamping_logo.png" style="margin: 80px 10px;">
		</article>
	</div>
	</div>
	<%@ include file="../footer.jsp" %>
	
	<!-- id가 errorMessage에서 메시지를 띄우면 3초후 사라짐  -->
	<script>
	    setTimeout(function() {
	        var errorMessageElement = document.getElementById("errorMessage");
	        if (errorMessageElement) {
	            errorMessageElement.style.display = "none";
	        }
	    }, 3000); // 3000 milliseconds = 3 seconds
	</script>
</body>
</html>
