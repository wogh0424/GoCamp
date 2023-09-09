<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="${cpath }/resources/css/mainpage.css" type="text/css">

<div id="mypageBanner" style="background-image: url('${cpath}/resources/image/main/banner.jpg');">
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
				<h4>운영자에게 제제를 받은 게시글 : <span class="red">${deleted.size() }</span>개</h4>
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
			<div>
				
			</div>
		</div>
		</div>
		
		
		<div class="mypageItems">
			<div id="mypageWrap">
				<div id ="likesContainer">
				<c:if test="${likes.size() != 0 }">
				<h3><b>내 찜 목록🚗</b></h3><br>
				<c:forEach items="${likes}" var="like">
				   <div class="likesItem">
				   		<div class="likesImage">
				   			<a href="${cpath }/main/view/${like.contentId }"><img src="${like.firstImageUrl }"></a>
				   		</div>
				   		<div class="likesContent">
				   			<h4><b><a href="${cpath}/main/view/${like.contentId}">${like.facltNm }</a></b></h4>
				   			<c:if test="${like.lineIntro != '' }">
				   			<p><b>${like.lineIntro }</b></p>
				   			</c:if>
				   			<p><img src="${cpath }/resources/image/main/location.png">${like.addr1 } &nbsp 
				   			<img src="${cpath }/resources/image/main/phone.png">${like.tel }</p>
				   		</div>
				   		<div>
				   			<button class="likesRemove">찜 삭제</button>
				   		</div>
				   </div>
				</c:forEach>
				</c:if>
				<c:if test="${likes.size() == 0 }">
					<br><br><br><br><br><br><br>
					<h3 style="text-align: center;"><b>아직 <span class="red">찜</span>한 캠핑장이 없어요!</b></h3>
					<a href="${cpath }/main/camp"><button id="zzim">캠핑장 찜하러 가기 ▶</button></a>
				</c:if>
				</div>		
			</div>
		</div>
		
		<div class="mypageItems">
			<div id="myReviewBox">
				<div id="myReviews">
					<c:if test="${reviews.size() != 0 }">
						<h3><b>내가 작성한 리뷰💙</b></h3><br>
						<c:forEach items="${reviews}" var="review">
							<div class="myReviewItem">
							   <div class="reviewIdx" style="flex: 1;">${review.idx }</div>
							   <div class="reviewsTitle"style="flex: 6; text-align: left;"><a href="${cpath }/reviewBoard/view/${review.idx}" class="tomyReview">${review.title}</a></div>
							   <div class="reviewsContent" style="flex: 2;">${review.reviewdate}</div>		   
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>
			<c:if test="${reviews.size() == 0 }">
				<div class="noReview">
					<br><br><br><br><br><br><br>
					<h3 style="text-align: center;"><b>아직 작성하신 후기가 없습니다 😭</b></h3>
					<a href="${cpath }/main/camp"><button id="zzim">캠핑장 보러 가기 ▶</button></a>
				</div>
			</c:if>
		</div>
		<div class="mypageItems">
			<div id="couponBox">
				<div id="myCoupon">
					<c:if test="${couponlist.size() != 0 }">
					<c:forEach items="${couponlist}" var="coupon">
						<div class="couponItem">
							<div class="couponimg" style="background-image: url('${cpath}/resources/image/left-rotate-logo.png');">
					
							</div>
							<div class="discount">
							<fmt:formatNumber var="discnt" value="${(1 - coupon.discnt) * 100} " pattern="#"/> 
								<p class="saleRate">${discnt}%</p>
								<p class="couponNumber">${coupon.couponNum }</p>
							</div>
							<div class="couponDetails">
								<c:set var="start" value="${coupon.cDate}" />
								<c:set var="end" value="${coupon.dueDate}" />
								<fmt:parseDate var="startDate" value="${start}" pattern="yyyy-MM-dd"/>
								<fmt:parseDate var="endDate" value="${end}" pattern="yyyy-MM-dd"/>
	  							<fmt:formatDate value="${startDate}" pattern="MM.dd" var="s" />
								<fmt:formatDate value="${endDate}" pattern="MM.dd" var="e" />
	  							
								<div class="dueDate">${s } ~ ${e}</div>
								<div class="couponNm"><h4><b>${coupon.cName }</b></h4></div> 
								<div class="couponConent">모든 결제에 적용</div>
							</div>
						</div>
					</c:forEach>
					</c:if>
					<c:if test="${couponlist.size() == 0 }">
						<div class="noCoupon">
							<br><br><br><br><br><br><br>
							<h3 style="text-align: center;"><b>보유하신 쿠폰이 없습니다 😭</b></h3>
						</div>
					</c:if>
				</div>
			</div>
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