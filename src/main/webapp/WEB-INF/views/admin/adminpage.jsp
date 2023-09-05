<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<div class="admimpage_wrap">
	<div class="adminpage_items">
		<div class="adminpage_list">
			<aside>
				<ul>
					<li><a href="">로그인</a></li>
					<li><a href="">회원관리</a></li>
					<li><a href="">회원정보수정</a></li>
					<li><a href="">회원관리</a></li>
					<li><a href="">회원탈퇴</a></li>
					<li><a href="">매출관리</a></li>
					<li><a href="">게시판관리</a></li>
				</ul>
			</aside>
			<div class="main_boardlist1">
				<div class="boardlist1_left">list1_left</div>
				<div class="boardlist1_right">list1_right</div>
			</div>
			<div class="main_boardlist2">
				<div class="boardlist2_left">list2_left</div>
				<div class="boardlist2_center">list2_center</div>
				<div class="boardlist2_right">list2_right</div>
			</div>
			<div class="main_boardlist3">
				<ul class="boardlist3_group">
					<li>GROUP :</li>
					<li>GROUP1</li>
					<li>GROUP2</li>
					<li>GROUP3</li>
					<li>DATE :</li>
					<li><input type="date">~</li>
					<li><input type="date"></li>
					<li>등급 :</li>
					<li><select>
							<option>관리자</option>
							<option>일반회원</option>
					</select></li>
					<li>검색어 : </li>
				</ul>
				<ul>
					<li><input type="search"></li>
					<li><input type="submit" value="검색"></li>
				</ul>
			</div>
			<div class="main_boardlist4">
				<div class="boardlist4_tablelist">
					Table Name
					<ul>
						<li><input type="checkbox"></li>
						<li>IDX</li>
						<li>USERID</li>
						<li>USERNAME</li>
						<li>NICNAME</li>
						<li>EMAIL</li>
						<li>PNUM</li>
						<li>BIRTH</li>
						<li>ENABLED</li>
						<li>AUTHORITY</li>
						<li>ENABLED</li>
						<li>CHANGE-BTN</li>
						<li>BOARD-BAN</li>
					</ul>
					<div class="boardlist4_userlist">
					<!-- c:foreach 시작구간  -->
					<c:forEach var="dto" items="${list}">
					<form action="${cpath}/admin/modifyAuth" method="POST">
					<ul>
						<li><input type="checkbox"></li>
						<li>${dto.idx}</li>
						<li>${dto.userid}</li>
						<li>${dto.username}</li>
						<li>${dto.nickname}</li>
						<li>${dto.email}</li>
						<li>${dto.pnum}</li>
						<li>${dto.birth}</li>
						<li>
							<c:if test="${dto.enabled == 1}">접근허용</c:if>
	                		<c:if test="${dto.enabled == 0}">접근금지</c:if>                             
						</li>
						<li>
						<select name="authority">
		                    <option value="ROLE_USER">일반유저</option>
		                    <option value="ROLE_BUSINESS">사업자 등록</option>
		                </select>						
						</li>
						<li>
						<select name="enabled">
		                    <option value="1">로그인 허가</option>
		                    <option value="0">로그인 금지</option>
		                </select>
						</li>
						<li>
						    <input type="hidden" name="userid" value="${dto.userid}" />
                			<button type="submit">권한변경</button>
						</li>
						</form>
						<li>
							<input type="hidden" value="${dto.nickname}" />
						</li>
						<li>
						<form action="${cpath }/admin/ControluserBoard">
			            	<input type="hidden" name="nickname" value="${dto.nickname }" />
			            	<button type="submit">게시글 조회</button>
            			</form>
						</li>
					</ul>
					</c:forEach>
					<!-- c:foreach 끝 구간  -->
				</div>
				</div>
			</div>
		</div>
	</div>
</div>

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