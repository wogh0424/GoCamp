<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>

<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>로그인 페이지</title>
<style>
a {
	text-decoration: none;
	color: black;
}

#section {
	width: 400px;
	margin: 5% auto;
}

.loginForm_frame {
	position: relative;
	height: 500px;
	border: 2px solid rgb(162, 154, 154);
	border-radius: 70px;
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
	width: 250px;
	height: 50px;
	border-radius: 50px;
	border: 1px solid rgb(184, 167, 167);
}

.btn_wrap {
	position: relative;
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
	width: 70%;
	padding: 13px 0;
	border-radius: 10px;
	background-color: rgb(90, 209, 110);
	font-size: large;
	font-weight: bolder;
	border: 1px solid rgb(60, 116, 69);
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
</head>

<body>
   <div id="nav_wrap">
	<ul id="login_type">
		<li id="nomal_login">일반 로그인</li>
		<li id="businessLogin">사업자 로그인</li>
	</ul>
	</div>
	<section id="section">
		<article class="loginForm_frame">
			<div class="loginForm_content">
				<div class="input_account">
					<h3>아이디와 비밀번호를 입력해주세요.</h3>
				</div>
				<c:url value="/login" var="loginUrl" />
			</div>
			<form:form name="f" action="${loginUrl}" method="POST">
				<div class="form-wrap">
					<c:if test="${param.error != null}">
						<p>아이디와 비밀번호가 잘못되었습니다.</p>
					</c:if>
					<div class="input_wrap">
						<p>
							<input type="text" class="id" name="userid"
								placeholder="Enter ID" />
						</p>
						<p>
							<input type="password" class="password" name="userpw"
								placeholder="Enter PW" />
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
		</article>

		<article class="loginForm_frame">
			<div class="loginForm_content">
				<div id="input_account">
					<h3>아이디와 비밀번호를 입력해주세요.</h3>
				</div>
				<c:url value="/login" var="loginUrl" />
			</div>
			<form:form name="f" action="${loginUrl}" method="POST">
				<div class="form-wrap">
					<c:if test="${param.error != null}">
						<p>아이디와 비밀번호가 잘못되었습니다.</p>
					</c:if>
					<div id="input_wrap">
						<p>
							<input type="text" class="businessID" name="businessID"
								placeholder="사업자 번호 입력" />
						</p>
						<p>
							<input type="text" class="id" name="userid" placeholder="ID입력" />
						</p>
						<p>
							<input type="password" class="password" name="userpw"
								placeholder="비밀번호 입력" />
						</p>
					</div>
				</div>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
				<input type="submit" class="login_btn_input" value="사업자 로그인" />
			</form:form>
		</article>
	</section>

	<script>
	 const btnList = document.querySelectorAll('#login_type > li')
     const articleList = document.querySelectorAll('#section > article')

     
     btnList.forEach((element, index) => {
         articleList.forEach(e => e.classList.add('selected'))
          articleList[0].classList.remove('selected');
         element.onclick = function(event) {
             btnList.forEach(e => e.classList.remove('selected'))
             element.classList.add('selected')

             articleList.forEach(e => e.classList.add('selected'))
             articleList[index].classList.remove('selected')
         }
     })
</script>

</body>
</html>
