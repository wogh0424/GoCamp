<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
a {
	text-decoration: none;
	color: black;
}

header {
	height: 50px;
	border: 2px solid black;
	margin: 0;
	padding: 0;
}

#nav_wrap {
	text-align: center;
}

#admin_nav {
	display: flex;
	text-align: center;
	list-style: none;
	justify-content: center;
}

#admin_nav li {
	width: 33%;
	border: 1px solid black;
	background-color: #0f953e;
	padding: 23px 0;
	color: white;
	font-size: 17px;
	border-collapse: collapse;
}
</style>
</head>
<body>
<header>
		<div id="top_left">관리자 페이지</div>
	</header>
<div id="nav_wrap">
		<ul id="admin_nav">
			<li>사업자 등록/유저밴</li>
			<li>판매통계</li>
			<li>유저밴 이유</li>
		</ul>
	</div>
	<article class="user_auth"></article>
	<article class="sales_chart"></article>
	<article class="board_chart"></article>

</body>
</html>