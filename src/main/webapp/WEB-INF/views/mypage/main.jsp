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
					<p><b>마이페이지 비밀번호 변경</b></p>
					<p>아이디 : ${dto.userid }</p>
					<p>현재 비밀번호 : <input type="password" name="currentuserpw" placeholder="현재 비밀번호 입력"></p>
					<p>새로운 비밀번호 : <input type="password" name="newuserpw" placeholder="새로운 비밀번호 입력"></p>
					<p>닉네임 : ${dto.nickname }</p>
					<p>이메일 : ${dto.email }</p>
					<p>전화번호 : ${dto.pnum }</p>
					<p>
						<input type="submit" value="비밀번호 변경">
						<input type="reset" value="다시입력">
					</p>
				</form>
			</div>
			<div class="deleted_board">
			<p>운영자에 의해 삭제된 글</p>
				<c:forEach var="board" items="${deleted }">
					<div class="banned_content">
						<div id="title">${board.title }</div>
						<div id="reason">${board.reason }</div>
						<div id="date">${board.deleted_date }</div>
					</div>
				</c:forEach>
			</div>
		</div>
		</div>
		<div class="mypageItems">2
		
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
	   	mypage_form.addEventListener('submit',CheckPwHandler) 
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