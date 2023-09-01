<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>관리자 홈</title>
<style>
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

.user_auth {
	width: 700px;
	height: 800px;
	border: 2px solid blue;
	margin: 50px auto;
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
</style>
</head>

<body>
<body>
    <header>
        <div id="top_left">관리자 페이지</div>
    </header>
    <div id="nav_wrap">
        <ul id="admin_nav">
            <li>사업자 등록/유저밴</li>
            <li>게시글 관리 특정 문제가 생겼을때 블라인드 </li>
            <li>판매통계</li>
            <li>게시글 통계</li> 
        </ul>
    </div>
    <section id="section">
        <article class="user_auth">
            <c:forEach var="dto" items="${list }">
            <div class="user_wrap">
            <div class="user_content">
                <div class="userid">${dto.userid }</div> 
                 <form action="${cpath }/admin/modifyAuth" method="POST">
                <select name="authority">
                    <option value="ROLE_USER">일반유저</option>
                    <option value="ROLE_BUSINESS">사업자 등록</option>
                </select>   
                <select name="enabled">
                    <option value="1">로그인 허가</option>
                    <option value="0">로그인 금지</option>
                </select>
                <input type="hidden" name="userid" value="${dto.userid }"/>
				<button type="submit">권한변경</button>
                </form>
                <form action="${cpath }/admin/ControluserBoard/${userid}">
                <input type="hidden" value="${dto.userid }" />
               <button type="submit" id="userBoardList">유저 게시글 조회</button>
               </form>
                </div>
            </div>
                </c:forEach>  
        </article>

        <article class="control_board">
            
        </article>
        
        <article class="sales_chart">
			
        </article>
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
</body>


</html>
