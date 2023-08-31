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
/* body 전체에 폰트 설정 */
<<<<<<< HEAD
* {
	
}

/*전체 적용*/
body {
	margin: 0;
	padding: 0;
}

ul {
	list-style: none;
	padding-left: 0;
}

a {
	text-decoration: none;
	color: black;
}
/* 타이틀 로고 부터 navbar까지 시작*/
.title_logo {
	display: flex;
	justify-content: center;
	background-color: #3C5944;
	border-bottom: 3px solid #422825;
}

.header_top {
	display: flex;
	justify-content: space-around;
	align-items: center;
	background-color: #3C5944;
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
	height: 35px;
	background-color: #F4C752;
	border-bottom: 3px solid #422825;
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
	color: black;
	font-weight: bold;
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
		
		
/*         form#insertForm { */
/*             position: relative; */
/*         } */
/*         #preview { */
/*             width: 300px; */
/*             height: 300px; */
/*             background-size: auto 100%; */
/*             background-position: center; */
/*             background-repeat: no-repeat; */

/*             position: absolute; */
/*             bottom: 0; */
/*             border: 1px solid blue; */
/*         } */
/*         input[name="upload"] { */
/*             border: 1px solid red; */
/*             width: 300px; */
/*             height: 350px; */
/*         } */
    
		

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
>>>>>>> e1476b1f3af0f36fb07c8b1df8acebd748811f7c
a{
	text-decoration: none;
	color: black;
}
#login_btn {
	font-weight: bold;
}
/*2023-08-29 쇼핑몰 페이지 추가 - 재우 */
.product_wrap {
	flex-wrap: wrap;
	width: 100%;
	height: 2600px;
	border: 1px solid black;
}
.product_items {
	display: flex;
	justify-content: center;
	border-top: 1px solid grey;
	
}
.product_items:hover{
	background-color: #D9EEFF;
}
.product_items > ul > li {
	font-size: 12px;
	color: grey;

}
.product_items > ul > li > a > button {
	width: 150px;
}
#product_pContent {
	width: 250px;
	height: 100px;
}
#product_pName{
	font-weight: bold;
}
#product_event_ico {
	display: flex;
}
#event_ico_new,
#event_ico_hot,
#event_ico_event {
	font-size: 10px;
	padding: 3px;
	margin: 2px;
	box-shadow: 1px 1px 1px black;
}
#event_ico_new{
	background-color: yellow;
	color: black;
}
#event_ico_hot {
	background-color: red;
	color: yellow;
}
#event_ico_event{
	background-color: lightgreen;
	color: black;
}
/*list 카테고리 리스트 시작 */
.pCategory_items {
	width: 900px;
	height: 80px;
	border-top: 1px solid white;
	margin: auto;
}

.pCategory_list {
	display: flex;
	justify-content: center;
}
.pCategory_list > ul {
	border-top: 2px solid black;
}
.pCategory_list > ul > li {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 150px;
	height: 30px;
	text-align: center;
	font-size: 12px;
	background-color: #F0F1F3;	
}
.pCategory_search {
	border: 1px solid black;
	background-color: white;
}
.pCategory_search > ul{
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 0;
	padding: 0;
}
.pCategory_search > ul > li {
	font-size: 11px;
	padding: 5px;
	
}
/* 카테고리 리스트 끝 *?

/*footer 시작 */
footer{
	width: 100%;
	height: 100px;
}
.footer_menu > ul	{
	display: flex;
	justify-content: space-around;
}
.footer_top {
	display: flex;
	justify-content: center;
	background-color: #363636;
	border-bottom: 1px solid grey;
}
.footer_top_logo > img{
	width: 150px;
	height: 100px;
}
.footer_top > ul {
	display: flex;
	justify-content: center;
	color: white;
	list-style: none;
	font-size: 13px;
}
.footer_top > ul > li {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 10px;
}
.footer_bottom {
	width: 100%;
	height: 100px;
	background-color: #363636;
}
.footer_bottom {
	color: white;
}
.footer_bottom > p{
	padding: 10px;
	margin: 0;
	text-align: center;
	font-size: 13px;
	
}
/*footer 끝 */
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
/*main_review_rank 페이지 시작 */
.review_rank{
	height: 500px;
	display: flex;
	justify-content: center;
	background-image: url("./resources/image/bg-image.jpg");
	
}
.review_rank_image  {
	padding: 10px;
}
.review_rank_image > img{
	display: block;
	margin: auto;
	width: 150px;
	height: 150px;
	border-radius: 50%;
}
.review_rank_content {
	width: 400px;
	height: 200px;
	background-color: white;
	border: 1px solid black;
	box-shadow: 2px 2px 2px black;
}
.review_rank_items{
	display: flex;
	margin: auto;
}
.review_rank_campingName, 
.review_rank_cityName {
	color: white;
	font-weight: bold;
	text-align: center;
}
/*main_review_rank 페이지 끝 */
/*camping_top_wrap 캠핑장 랭크 시작*/
.camping_top_wrap {
	display: flex;
	justify-content: center;
}
.camping_left_list {
	border: 1px solid black;
	display: flex;
}
.camping_left_list > ul  {
	padding: 0;
	margin: 0;
}
.camping_left_list > ul > li {
	border: 1px solid black;
	width: 400px;
	height: 300px;
}
.camping_left_content {
	background-color: lightgrey;
}
.camping_right_list {
	display: flex;
}
.camping_right_contents > h3,
.camping_right_contents > p {
	padding: 0;
	margin: 0;
}
.camping_right_contents > h3 {
	text-align: center;
}
/*camping_top_wrap 캠핑장 랭크 끝*/
/*메뉴 드랍 다운 시작 */
#menu {
		display: flex;
		justify-content: center;
		align-items: center;
		width:100%;
		height:100%;
		background-color: #3C5944;
		color:black;
		line-height: 50px; 
		margin:0 auto;
		text-align: center;
		
}

/* menu태그 자식의 ul의 자식 li를 왼쪽정렬과 넓이 140설정 */
#menu > ul > li {
		display: flex;
		justify-content: center;
		align-items: center;
		float:left;
		width:140px;
		height: 80px;
		position:relative;
		list-style: none;
		padding: 0;
		margin: 0;
}
#menu > ul > li > ul {
		width:140px;
		display:none;
		position: absolute;
		font-size:14px;
		background: white;
		top: 80px;
		left: 0px;
}

#menu > ul > li:hover > ul {
		display:block;
}

#menu > ul > li > ul > li:hover {
		background: orange;
		transition: ease 1s;
}
#menu > ul > li > a {
		text-decoration: none;
		color: white;
		font-weight: bold;
}
aside {
	height: 100%;
	border-left: 0.25px solid black;
	float: right;
}
/*메뉴 드랍 다운 끝*/
</style>
<script>
	const cpath = '${cpath}'
</script>
</head>
<body>




	<header>
		<div class="title_logo">
			<a href="${cpath }/"><img
				src="${cpath }/resources/image/thecamping_logo.png"></a>
		</div>
		<div class="header_login">
			<ul>
				<c:if test="${pageContext.request.userPrincipal != null}">
					<li>현재 접속 아이디 ${pageContext.request.userPrincipal.name}</li>
					<!-- 접속된 아이디 표시를 원하면 여기에 el태그 삽입 -->
				</c:if>
				<sec:authorize access="isAnonymous()">			
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
			<div id="menu">
				<ul>
					<li><a href="#">검색</a>
						<ul>
							<li><a href="${cpath }/main/camp">캠핑장</a></li>
							<li><a href="">SUB_MENU</a></li>
							<li><a href="">SUB_MENU</a></li>
						</ul>
					</li>
					<li><a href="#">게시판</a>
						<ul>
							<li><a href="${cpath }/noticeBoard">공지게시판</a></li>
							<li><a href="${cpath }/eventBoard">이벤트게시판</a></li>
							<li><a href="${cpath }/freeBoard">자유게시판 + 댓글</a></li>
							<li><a href="${cpath }/review">main review + fileupload</a></li>
						</ul>
					</li>
					<li><a href="#">쇼핑몰</a>
						<ul>
							<li><a href="${cpath }/product/list">MENU</a></li>
							<li><a href="">SUB_MENU</a></li>
							<li><a href="">SUB_MENU</a></li>
						</ul>
					</li>
					<li><a href="#">MENU</a>
						<ul>
							<li><a href="#">SUB_MENU</a></li>
							<li><a href="#">SUB_MENU2</a></li>
							<li><a href="#">SUB_MENU3</a></li>
						</ul>
					</li>
					<li><a href="#">MENU</a>
						<ul>
							<li><a href="#">SUB_MENU</a></li>
							<li><a href="#">SUB_MENU2</a></li>
							<li><a href="#">SUB_MENU3</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="header_bottom" style="display: flex; justify-content: right; height: 40px; align-items:center;">
		<form action="${cpath }/main/search">
			<input type="search" name="srchKywrd" placeholder="검색어를 입력하세요">
			<input type="submit" value="검색">
		</form>
	</div>
