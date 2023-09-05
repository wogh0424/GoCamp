<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="detail_item">
<%--    <div class="pImage"><img src="${cpath }/resource/image/${dto.image}"></div> --%>
   <div><img src="${cpath }/resources/image/noimage.png"></div>
   <div>
      <ul>
         <li>상품명 : ${dto.pName }</li>
         <li>가격 : ${dto.price }</li>
         <li>별점 : ${dto.pStar }</li>
         <li>${dto.amount }</li>
         <li>${dto.views} | ${dto.pick } | <button id="grocery">장바구니</button></li>
      </ul>
   </div>
   <div class="reivew">
      <div class="">유저 정보
         <ul>
            <li>${dto.pStar }</li>
            <li>유저 아이디 | ${dto.sDate }</li>
         </ul>
      </div>
      <div class="">리뷰 내용</div>
      <div class="">리뷰 이미지</div>
   </div>
   <div><img src="${cpath }/resources/image/${dto.image}">상품 설명 사진 위치</div>
</div>

<script>
	const grocery = document.getElementById('grocery')
	const pName = '${dto.pName}'
	const pid = '${dto.idx}'
	const price = '${dto.price}'
	const userid = '${pageContext.request.userPrincipal.name}'
	const amount = '1'    // amount만 수정

	grocery.onclick = groceryAddHandler
	
	async function groceryAddHandler() {
		if (userid == '') {
			alert('로그인을 해야 장바구니 이용이 가능합니다')
			return
		}
		else {
			const url = cpath + "/grocery"
			const params = {
				userid : userid,
				idx : pid,
				pName : pName,
				price : price,
				amount : amount
			}
			await fetch(url, {
				method: 'POST',
				headers: {
					'Content-Type' : 'application/json'
				},
				body: JSON.stringify(params)
			}).then(resp => resp.json())
			.then(json => {
				if (json) {
					alert('장바구니에 ' + pName + '이(가) ' + amount + '개 추가되었습니다.')
				}
				else {
					alert('장바구니에 추가되지 못했습니다.')				
				}
			})
		}
	}
</script>

</body>
</html>