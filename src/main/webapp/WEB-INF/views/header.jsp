<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GoCamping</title>
<style>
.flex {
   display: flex;
   flex-flow: wrap;
   margin: auto;
}

.flex > li > input {
   cursor: pointer;
}

ul li {
   list-style: none;
   padding-left: 0;
}

body {
   padding: 0px;
   margin: 0px;
   width: 100%;
   height: 150%;
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

a {
   text-decoration: none;
}

.modal {
   display: none;
}

.overlay {
   position: absolute;
   top: 0;
   left: 0;
   width: 100%;
   height: 150%;
   background-color: rgba(0, 0, 0, 0.4);
}

.modal_body {
   position: absolute;
   top: 50%;
   left: 50%;
   width: 100vh;
   height: 800px;
   padding: 40px;
   text-align: center;
   background-color: rgb(255, 255, 255);
   border-radius: 10px;
   box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
   transform: translate(-50%, -50%);
}
.category_wrap {
   display: flex;
   justify-content: center;
   align-items: center;
}
.category_name {
   width: 100px;
   height: 50px;
   display: flex;
   justify-content: center;
   align-items: center;
}

.category_box {
   width: 800px;
   height: 80px;
   border: 1px solid black;
   border-radius: 10px;
   box-shadow: 2px 2px 2px 0;
   margin: 5px;
}
.search_btn > input {
   border: unest;
   border-radius: 10px;
   background-color: black;
   color: white;
   width: 150px;
   height: 50px;
   font-weight: bold;
   cursor: pointer;
}
/* 타이틀 로고 부터 navbar까지 시작*/
.title_logo {
	display: flex;
	justify-content: center;
}

.header_top {
	display: flex;
	justify-content: space-around;
	align-items: center;
	background-color: rgba(0, 116, 60);
	width: 100%;
	height: 80px;
}
.header_top > ul {
	display: flex;
	padding: 10px;
}
.header_top > ul > li {
	font-weight: bold;
	color: white;
	transition-duration: 0.5s;
}
.header_top > ul > li > a:hover{
	background-color: white;
	color: rgba(0, 116, 60);
	text-decoration: initial;
	transition-duration: 0.5s;
}
.header_top > ul > li > a {
	text-decoration: none;
	color: white;
	padding: 28px;
}
/* 타이틀 로고 부터 navbar까지 끝*/
/* 로그인 헤더 시작*/
.header_login {
	display: flex;
	justify-content: flex-end;
	align-items: center;
	width: 100%;
	height: 40px;
	background-color: rgba(0, 116, 60);
	border-bottom: 1px solid white;
}
.header_login > ul {
	display: flex;
	list-style: none;
}
.header_login > ul > li {
	margin: 20px;
	color: white;
	font-weight: bold;
}
.header_login > ul > li > a{
	text-decoration: none;
	color: white;
	font-weight: bold;
}

/* 게시판  */

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
		.item > .idx,
		.item > .writer,
		.item > .writeDate,
		.item > .viewCount {
			flex: 1;
		}		
		.item > .title {
			flex: 5;
		}
		.menubar {
			display: flex;
			width: 900px;
			margin: 20px auto;
			justify-content: space-between;
		}

</style>
</head>
<body>
	<header>
		<div class="title_logo">
			<a href="${cpath }"><img src="${cpath }/resources/image/camping_logo.png"></a>
		</div>
		<div class="header_login">
			<ul>
			<c:if test="${pageContext.request.userPrincipal != null}">
				<li>현재 접속 아이디 ${pageContext.request.userPrincipal.name}</li> <!-- 접속된 아이디 표시를 원하면 여기에 el태그 삽입 -->
			</c:if>
			<sec:authorize access="isAnonymous()">
				<p><a href="<c:url value="/login/loginForm" />">로그인</a></p>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
<%-- 			<form:form action="${pageContext.request.contextPath}/logout" method="POST"> --%>
    				<li><a href="${cpath }/logout">로그아웃</a></li>
<%-- 			</form:form> --%>
			</sec:authorize>
			<c:if test="${pageContext.request.userPrincipal == null}">
				<li><a href="${cpath }/login/signup">SIGNUP</a></li>
			</c:if>
			<c:if test="${sessionScope.permission == 'ROLE_ADMIN'}">
				 <h3><a href="<c:url value="/admin/adminHome" />">관리자 홈</a></h3> 
			</c:if>
			<c:if test="${sessionScope.permission == 'ROLE_USER' && pageContext.request.userPrincipal != null }">
				<h3><a href="${cpath }/mypage/main">마이페이지</a></h3>
			</c:if>
			</ul>
		</div>
	</header>
	<nav>
		<div class="header_top">
			<ul>
				<li><a href="${cpath }/main">MENU</a></li>
				<li><a href="">MENU</a></li>
				<li><a href="">MENU</a></li>
				<li><a href="">MENU</a></li>
				<li><a href="">MENU</a></li>
			</ul>
		</div>
	</section>
	<!-- section end -->
	<div class="footer_wrap">
		<p>하단메뉴</p>
	</div>
	<footer>
		<!-- footer start -->


	</footer>

