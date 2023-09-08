<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>
<style>
	#mypageBanner {
		width: 100%;
		height: 240px;
		background-image: url('${cpath}/resources/image/main/banner.jpg');
		background-repeat: no-repeat;
		background-position: center;
		background-size: cover;
	}
	#mypageFrame {
		max-width: 1200px;
		height: 600px;
		margin: 50px auto;
		border-radius: 30px;
		display: flex;
		box-shadow: 7px 7px 7px grey;
	}
	#mypageNav {
		flex: 1;
		padding: 20px 0 20px 30px;
		border-radius: 15px 0 0 15px;
		background-color: #3C5944;
		color: white;
		text-align: center;
	}
	#mypageShow {
		flex: 2.5;
		padding: 10px;
		border-radius: 0 15px 15px 0;
		background-color: #E8E289;
	}
	
	li.mypageSection {
		font-weight: bold;
		cursor: pointer;
		padding: 20px 0;
		font-size: 20px;
		height: 60px;
		border-radius: 10px 0 0 10px;
		border-left: 1px solid #3C5944;
	}
	
	li.mypageSection.selected {
		background-color: #E8E289;
		color: black;
	}
	
	li.mypageSection:hover {
		background-color: #E8E289;
		color:#4476D5;
		transition: ease 0.3s;
	}
	
	.mypageItems {
		display: none;
	} 
	
    .mypageItems.selected {
		display: block;
	}
	
	.mypage_items {
		background-color: white;
	}
	
	#personalInfor {
	  width: 100%;
	  margin: 20px auto;
	  border-collapse: collapse;
	  border: 1px solid #ccc;
	}
	
	#personalInfor th,
	#personalInfor td {
	  padding: 10px;
	  text-align: left;
	  border-bottom: 1px solid #ccc;
	}
	
	#personalInfor th {
	  background-color: #f2f2f2;
	  font-weight: bold;
	}
	
	#personalInfor input[type="password"] {
	  width: 100%;
	  padding: 5px;
	  border: 1px solid #ccc;
	  border-radius: 5px;
	}
	#mypage_form input[type="submit"],
	#mypage_form input[type="reset"] {
	  background-color: #007BFF;
	  color: #fff;
	  padding: 10px 20px;
	  border: none;
	  border-radius: 5px;
	  cursor: pointer;
	  margin-right: 10px;
	}
	
	#mypage_form input[type="submit"]:hover,
	#mypage_form input[type="reset"]:hover {
	  background-color: #0056b3;
	}
	
	.deleted_board {
	  margin-top: 10px;
	  background-color: white;
	  max-height: 200px;
	  height: 200px;
	  overflow-y: scroll; 
	  border: 1px solid #ccc;
	  padding: 10px;
	  display: flex;
	  flex-direction: column;
	  position: relative;
	}

	.deleted_list {
		position: absolute;
		top: 0;
	}

	/* 자식 요소인 .banned_content */
	.banned_content {
	  margin: 10px 0;
	  padding: 10px;
	  width: 450px;
	  border: 1px solid #ddd;
	  border-radius: 5px;
	  background-color: #f9f9f9;
	}
	
	#title {
	  font-weight: bold;
	}
	
	#reason {
	  margin-top: 5px;
	}
	
	#date {
	  font-size: 12px;
	  color: #777;
	}
	.red {
		color: red;
	}
	/*  여기  로그인 폼용*/
	
	
	#likesContainer{
		display: flex;
		flex-flow: flex;
		justify-content: flex-start;  /*무조건 왼쪽부터 */
		
	}
	#likeImage > img{
		width: 100px;
		height: 100px;
		}
</style>


<div id="mypageBanner">
	<div style="max-width:1200px; padding: 50px; margin: 0px auto; font-size: 50px; font-weight: bolder; color: white; text-shadow: 4px 2px 2px gray; ">
		마이페이지
	</div>
</div>



<div id="mypageFrame">
	<div id="mypageNav" style=" text-shadow: 2px 2px 2px gray;">
		<h1><b >My Page</b></h1>

		<ul style="margin-top: 100px;">
			<li class="mypageSection selected">내 정보</li>
			<li class="mypageSection">내 찜 목록</li>
			<li class="mypageSection">내 후기</li>
			<li class="mypageSection">내 쿠폰함</li>
		</ul>
	</div>
	<div id="mypageShow">
		<div class="mypageItems selected">
			<div class="mypage_wrap">
			<div class="mypage_items">
				<form id="mypage_form" method="POST" action="${cpath }/changePw">
					<table id="personalInfor">
						<tr>
							<th>아이디</th>
							<td>${dto.userid }</td>
						</tr>
						<tr>
							<th>현재 비밀번호</th>
							<td><input type="password" name="currentuserpw" placeholder="현재 비밀번호 입력"></td>
						</tr>
						<tr>
							<th>새 비밀번호</th>
							<td><input type="password" name="newuserpw" placeholder="새로운 비밀번호 입력"></td>
						</tr>
						<tr>
							<th>내 닉네임</th>
							<td>${dto.nickname }</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>${dto.email }</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>${dto.pnum }</td>
						</tr>
					</table>
					<p>
						<input type="submit" value="비밀번호 변경">
						<input type="reset" value="다시입력">
					</p>
				</form>
			</div>
			<div class="deleted_board">
				<div class="deleted_list">
				<h4>운영자에게 제제를 받은 댓글 : <span class="red">${deleted.size() }</span>개</h4>
				<c:forEach var="board" items="${deleted }">
					<details>
					<div class="banned_content">
							<div id="title">${board.title }</div>
							<div id="reason">${board.reason }</div>
							<div id="date">${board.deleted_date }</div>
					</div>
					</details>
				</c:forEach>
				</div>
			</div>
		</div>
		</div>
		
		
		<div class="mypageItems">2(연지 좋아요)

			<div id ="likesContainer">
			<c:forEach items="${likes}" var="like">
			   <div>${like.facltNm}</div>
			   <div id="likeImage"><img src="${like.firstImageUrl }"></div>
			</c:forEach>
			</div>		
		
		</div>
		<div class="mypageItems">3
		
		</div>
		<div class="mypageItems">4
		
		</div>
	</div>
</div>


<%@ include file="../footer.jsp"%>

<script>
	// 비밀번호를 Service에서  암호화된 Pw와 비교한 다음 submit을 실행
	   	const checkPwBtn = document.getElementById('checkPw')
		const showResult = document.getElementById('showResult')
		const form = document.getElementById('mypage_form')
		
	   	async function CheckPwHandler(event) {
		   	event.preventDefault()
		    const currentuserpw = document.querySelector('input[name="currentuserpw"]')
		    
		   	const url = '${cpath}/checkPw/' + currentuserpw.value
			const result = await fetch(url).then(resp => resp.text())
			if(result == 1){
				alert('변경성공')
				event.target.submit()
			}else {
				alert('변경실패') 
			}
		}
	   	form.addEventListener('submit',CheckPwHandler) 
	</script>
	
	<script>
		const mypageNav = document.querySelectorAll('li.mypageSection')
		const mypageItems = document.querySelectorAll('div.mypageItems')
		
		mypageNav.forEach((element,index) => {
			element.onclick = function() {
				mypageNav.forEach(e => e.classList.remove('selected'))
				mypageItems.forEach(e => e.classList.remove('selected'))
				
				mypageNav[index].classList.add('selected')
				mypageItems[index].classList.add('selected')
			}
		});
	</script>
</body>
</html>