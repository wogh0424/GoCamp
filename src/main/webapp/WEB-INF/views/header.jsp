<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<link rel="icon" href="${cpath }/resources/image/main/favicon.png">
<meta charset="UTF-8">
<title>GoCamping</title>


<script>
	const cpath = '${cpath}'
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<link rel="stylesheet" href="${cpath }/resources/css/main/header.css" type="text/css">

<link rel="icon" href="${cpath }/resources/image/main/favicon.png">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

 <script src="${cpath }/resources/js/board.js"></script>


<!-- jquery 사용 위한 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.slick/1.8.1/slick.min.js"></script>

<!-- 	텍스트에디터 api - summernote -->
	<!-- include libraries(jQuery, bootstrap) -->
<!-- include summernote css/js -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet" >
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<meta charset="UTF-8">
<title>GoCamping</title>


</head>
<body>




	<header>
		<div class="title_logo">
			<a href="${cpath }/"><img
				src="${cpath }/resources/image/thecamping_logo.png"></a>
		</div>
		<div class="header_login" >
			<ul  style="margin-right: 10%;">
				<c:if test="${pageContext.request.userPrincipal != null}">
					<li>${pageContext.request.userPrincipal.name}님 환영합니다.</li>
					<!-- 접속된 아이디 표시를 원하면 여기에 el태그 삽입 -->
				</c:if>
				<sec:authorize access="isAnonymous()">			
					<li id="login_btn">
						<a href="<c:url value="/login/loginForm" />">로그인</a>
					</li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<%-- 			<form:form action="${pageContext.request.contextPath}/logout" method="POST"> --%>
					<li><a href="${pageContext.request.contextPath }/product/basket">장바구니</a></li>
					<li><a href="${cpath }/logout">로그아웃</a></li>
					<%-- 			</form:form> --%>
				</sec:authorize>
				<c:if test="${pageContext.request.userPrincipal == null}">
					<li><a href="${cpath }/login/signup">회원가입</a></li>
				</c:if>
				<c:if test="${sessionScope.permission == 'ROLE_ADMIN'}">
						<li><a href="<c:url value="/admin/adminpage" />">관리자 홈</a></li>
				</c:if>
				<c:if
					test="${sessionScope.permission == 'ROLE_USER' && pageContext.request.userPrincipal != null }">
						<li><a href="${pageContext.request.contextPath}/mypage/main">마이페이지</a></li>
				</c:if>
			</ul>
		</div>
	</header>
	<div class="header_bottom" style="display: flex; justify-content: right; height: 40px; align-items:center; padding-right: 10%; width: 100%; background-color: #3C5944;">
		<form  action="${cpath }/main/search">
			<div style="display: flex; justify-content: space-between; background-color: white; font-size: 16px;  margin-top:10px;">
			<input id="totalsearchInput" type="search" name="srchKywrd" placeholder="검색어를 입력하세요" style="border: none; background-color: white; width: 250px; height: 30px; padding: 10px;">
			<span style="line-height: 30px; cursor: pointer;" onclick="submitForm()">🔍</span>
			</div>
		</form>
	</div>
	<nav>
		<div class="header_top">
			<div id="menu">
				<ul>
					<li><a href="">캠핑장</a>
						<ul>
							<li><a href="${cpath }/main/camp">캠핑장검색</a></li>
						</ul>
					</li>
					<li><a href="">소식</a>
						<ul>
							<li><a href="${cpath }/noticeBoard">공지게시판</a></li>
							<li><a href="${cpath }/eventBoard">이벤트게시판</a></li>

						</ul>
					</li>
					<li><a href="">캠핑도구</a>
						<ul>
							<li><a href="${cpath }/product/list">쇼핑몰</a></li>
						</ul>
					</li>
					<li><a href="">게시판</a>
						<ul>
							<li><a href="${cpath }/freeBoard">자유게시판(+ 댓글)</a></li>
							<li><a href="${cpath }/reviewBoard">전체리뷰게시판</a></li>
<%-- 					<c:if test="${sessionScope.permission == 'ROLE_USER' && pageContext.request.userPrincipal != null }"> --%>
<%-- 							<li><a href="${cpath }/main/like">좋아요</a></li> --%>
<%-- 					</c:if> --%>
						</ul>
					</li>
					<li><a href="">고객센터</a>
						<ul>
							<li><a href="">캠핑장정보 수정요청</a></li>
							<li><a href="">등록 야영장 확인문의</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	
	<script>
	function submitForm() {
        document.getElementById("totalsearchInput").form.submit();
    }
	</script>
