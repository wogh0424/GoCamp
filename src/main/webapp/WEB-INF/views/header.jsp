<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GoCamping</title>

<style>
/* 타이틀 로고 부터 navbar까지 시작*/
.title_logo {
	display: flex;
	justify-content: center;
}

.header_top {
	display: flex;
	justify-content: space-around;
	align-items: center;
	background-color: white;
	width: 100%;
	height: 80px;
}

.header_top>ul {
	display: flex;
	padding: 10px;
}

.header_top>ul>li {
	list-style: none;
	font-weight: bold;
	color: white;
	transition-duration: 0.5s;
}

.header_top>ul>li>a:hover {
	background-color: #F1BC31;
	color: white;
	text-decoration: initial;
	transition-duration: 0.5s;
}

.header_top>ul>li>a {
	text-decoration: none;
	color: grey;
	padding: 28px;
}
/* 타이틀 로고 부터 navbar까지 끝*/
/* 로그인 헤더 시작*/
.header_login {
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 100%;
	height: 35px;
	background-color: black;
	border-bottom: 1px solid white;
}

.header_login>ul {
	display: flex;
	list-style: none;
}

.header_login>ul>li {
	margin: 20px;
	color: white;
	font-weight: bold;
}

.header_login>ul>li>a {
	text-decoration: none;
	color: white;
	font-weight: bold;
}
.header_bottom {
	width: 100%;
	height: 5px;
	background-color: black;
}

/* 게시판  */
	#boardTitle{
		display: flex;
		gap: 10px;
/* 		justify-content: center;  */
/* 		align-items: center; */
		padding-left: 250px;
		padding-top: 50px;
		
	}
	
	#board{
		font-size: 25pt;
		font-weight: bold;
		line-height: 1
		
	}
	#freeBoard{
		font-size: 20pt;
		font-weight: bold;
		line-height: 1
	}
	
	#column {
 		display: flex;
 		gap: 10px;
    }
   
	
	#boardList {
			width: 900px;
			margin: 0 auto;
		}
		.item {
			display: flex;
			padding: 5px 10px;
		}
		.column {
			display: flex;
			
		}
		.columns {
			background-color:#FFFFFF;
			border-bottom: 3px solid #00743D; 
			border-top: 3px solid #00743D; 
		}
		.item > .idx,
		.item > .writer,
		.item > .date,
		.item > .viewCount {
			flex: 1;
		}		
		.item > .title {
			flex: 5;
		}
		.item > .idx{
			color:  #00743D;
		}
		.menubar {
			display: flex;
			width: 900px;
			margin: 20px auto;
 			justify-content: space-between; 
		}
		
.flex {
	display: flex;
}

.description {
	width: 600px;
}

.lineIntro {
	display: -webkit-box;
	max-width: 60%;
	-webkit-line-clamp: 1;
	-webkit-box-orient: vertical;
	overflow: hidden;
	text-overflow: ellipsis;
}

.intro {
	display: -webkit-box;
	max-width: 60%;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
	overflow: hidden;
	text-overflow: ellipsis;
}

#boardList {
	width: 900px;
}

.item {
	display: flex;
	padding: 5px 10px;
}

.columns {
	background-color: #dadada;
}

.item>.idx, .item>.writer, .item>.writeDate, .item>.viewCount {
	flex: 1;
}

.item>.title {
	flex: 5;
}

.menubar {
	display: flex;
	width: 900px;
	margin: 20px auto;
	justify-content: space-between;
}
a{
	text-decoration: none;
	color: white;
}
#login_btn {
	font-weight: bold;
}
/*2023-08-29 쇼핑몰 페이지 추가 - 재우 */
/*list 카테고리 리스트 시작 */
.pCategory_list {
	width: 100%;
	height: 420px;
	border-top: 1px solid white;
	background-color: #112a4a;
}
.pCategory_items {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	margin: 0;	
}
.pCategory_items > ul {
	width: 180	px;
	height: 180px;
	border: 1px solid black;
	border-radius: 10px;
	padding: 0;
	margin: 10px;
	background-color: white;
	box-shadow: 2px 2px 2px black;
}
.pCategory_items > ul > li {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 10px;
	color: black;
	font-weight: bold;
}
/* 상품 리스트 시작 */
.product_wrap {
	display: flex;
	flex-wrap: wrap;
	width: 100%;
	border: 1px solid black;
}
.pImage {
	box-sizing: border-box;
}
.product_items {
	width: 300px;
	height: 350px;
	border: 1px solid black;
	margin: 20px;
	box-shadow: 1px 1px 1px black;
	
}
.product_items > ul {
	padding: 15px;
	margin: 0;
}
.product_items > ul > li {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 250px;
	margin: auto;
}
/*list 카테고리 리스트 끝 */
/*footer 시작 */
footer{
	width: 100%;
	height: 150px;
	background-color: black;;
}
.footer_menu > ul	{
	display: flex;
	justify-content: space-around;
}
/*footer 끝 */
/*product_modify, delete btn 시작*/
.product_modify_btn > a > button,
.product_delete_btn > a > button{
	width: 150px;
	height: 20px;
}
.paging {
	display: flex;
	justify-content: center;
	padding: 10px;
	margin: 10px;
	text-align: center;
}
.paging_count {
	width: 20px;
	height: 20px;
	border: 1px solid black;
	background-color: black;
	margin: 2px;
	
}
.paging_count > a {
	font-weight: bold;
	color: white;
}
.footer_botton > ul	{
	display: flex;
	justify-content: center;
	color: orange;
	list-style: none;
	font-size: 12px;
	font-weight: bold;
}
.footer_botton > ul > li {
	padding: 10px;
}
/*2023-08-29 쇼핑몰 페이지 추가 - 재우 */
</style>

</head>
<body>
	<header>
		<div class="title_logo">
			<a href="${cpath }/"><img
				src="${cpath }/resources/image/camping_logo.png"></a>
		</div>
		<div class="header_login">
			<ul>
				<li><a href=""><img src="${cpath }/resources/image/header_ico/facebook32.png"></a></li>
				<li><a href=""><img src="${cpath }/resources/image/header_ico/instagram32.png"></a></li>
				<li><a href=""><img src="${cpath }/resources/image/header_ico/twitter32.png"></a></li>
				<li><a href=""><img src="${cpath }/resources/image/header_ico/youtube32.png"></a></li>
			</ul>
			<ul>
				<c:if test="${pageContext.request.userPrincipal != null}">
					<li>현재 접속 아이디 ${pageContext.request.userPrincipal.name}</li>
					<!-- 접속된 아이디 표시를 원하면 여기에 el태그 삽입 -->
				</c:if>
				<sec:authorize access="isAnonymous()">
					<p>
					<li><a href="<c:url value="/login/loginForm" />">로그인</a></li>
					</p>

					<li id="login_btn">
						<a href="<c:url value="/login/loginForm" />">일반/사업자 로그인</a>
					</li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<%-- 			<form:form action="${pageContext.request.contextPath}/logout" method="POST"> --%>
					<li><a href="${cpath }/logout">로그아웃</a></li>
					<%-- 			</form:form> --%>
				</sec:authorize>
				<c:if test="${pageContext.request.userPrincipal == null}">
					<li><a href="${cpath }/login/signup">회원가입</a></li>
				</c:if>
				<c:if test="${sessionScope.permission == 'ROLE_ADMIN'}">
					<h3>
						<a href="<c:url value="/admin/adminHome" />">관리자 홈</a>
					</h3>
				</c:if>
				<c:if
					test="${sessionScope.permission == 'ROLE_USER' && pageContext.request.userPrincipal != null }">
					<h3>
						<a href="${cpath }/mypage/main">마이페이지</a>
					</h3>
				</c:if>
			</ul>
		</div>
	</header>
	<nav>
		<div class="header_top">
			<ul>
				<li><a href="${cpath }/main">MENU</a></li>
				<li><a href="${cpath }/product/list">MENU</a></li>
				<li><a href="">MENU</a></li>
				<li><a href="">MENU</a></li>
				<li><a href="">MENU</a></li>
				<li><a href="">MENU</a></li>
			</ul>
		</div>
	<div class="header_bottom"></div>
		</section>
		<!-- section end -->

		<footer>
			<!-- footer start -->


	</footer>

		

		<!-- section end -->
