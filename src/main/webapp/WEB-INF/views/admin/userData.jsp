<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko"  xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>관리자 홈</title>
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

.user_auth>table {
	text-align: center;
	margin: auto;
}

.user_wrap {
	border: 2px solid red;
	height: 50px;
}

.user_content {
	width: 500px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

#section>article.selected {
	display: none;
}

.back_btn {
	display: flex;
	justify-content: center;
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
			<li>미정</li>
		</ul>
	</div>
	<section id="section">
		<article class="user_auth">
			<table border="1" cellpadding="10" cellspacing="0">
				<tr>
					<th colspan="13">회원관리</th>
				</tr>
				<tr>
					<th>idx</th>
					<th>userid</th>
					<th>username</th>
					<th>nickname</th>
					<th>email</th>
					<th>pnum</th>
					<th>birth</th>
					<th>enabled</th>
					<th>authority</th>
					<th>enabled</th>
					<th>changeBtn</th>
					<th>UserBoardSearch</th>
				</tr>
				<c:forEach var="dto" items="${list}">
    <tr>
        <form action="${cpath}/admin/modifyAuth" method="POST">
            <td>${dto.idx}</td>
            <td>${dto.userid}</td>
            <td>${dto.username}</td>
            <td>${dto.nickname}</td>
            <td>${dto.email}</td>
            <td>${dto.pnum}</td>
            <td>${dto.birth}</td>
            <td>
                <c:if test="${dto.enabled == 1}">
                    접근허용
                </c:if>
                <c:if test="${dto.enabled == 0}">
                    접근금지
                </c:if> 
            </td>
            <td>
                <select name="authority">
                    <option value="ROLE_USER">일반유저</option>
                    <option value="ROLE_BUSINESS">사업자 등록</option>
                </select>
            </td>
            <td>
                <select name="enabled">
                    <option value="1">로그인 허가</option>
                    <option value="0">로그인 금지</option>
                </select>
            </td>
            <td>
                <input type="hidden" name="userid" value="${dto.userid}" />
                <button type="submit">권한변경</button>
            </td>
        </form>
            <input type="hidden" value="${dto.nickname}" />
            <td>
            <form action="${cpath }/admin/ControluserBoard">
            	<input type="hidden" name="nickname" value="${dto.nickname }" />
            	<button type="submit">유저 게시글 조회</button>
            </form>
            </td>
    </tr>
</c:forEach>

			</table>
			<div class="back_btn">
				<button>
					<a href="${cpath }">돌아가기</a>
				</button>
			</div>
			
		</article>

		<article class="control_board">
			<a href="${cpath }/main/addcamp"><button>캠핑장 추가</button></a>
		</article>

		<article class="sales_chart"></article>
		<article class="board_chart"></article>
	</section>


	<script>
        const btnList = document.querySelectorAll('#admin_nav > li')
        const articleList = document.querySelectorAll('#section > article')

        btnList.forEach((element, index) => {
            articleList.forEach(e => e.classList.add('selected'))
            articleList[0].classList.remove('selected')
            element.onclick = function(event) {
                btnList.forEach(e => e.classList.remove('selected'))
                element.classList.add('selected')
                
                articleList.forEach(e => e.classList.add('selected'))
                articleList[index].classList.remove('selected')       
            }
        })
    </script>

	<script>
		
	</script>
</body>


</html>
