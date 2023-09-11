<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="orderpay_wrap">
	<div class="orderpay_items">
		<div class="orderpay_status">
			<ul>
				<li>장바구니</li>
				<li>></li>
				<li><b>주문/결제</b></li>
				<li>></li>
				<li>완료</li>
			</ul>
			<ul>
				<li>장바구니</li>
				<li>></li>
				<li><b>주문/결제</b></li>
				<li>></li>
				<li>완료</li>
			</ul>
		</div>
		<div class="orderpay_list_title">
			<ul>
				<li>상품정보</li>
				<li>수량</li>
				<li>배송비</li>
				<li>할인</li>
				<li>상품금액(할인포함)</li>
			</ul>
		</div>
		<div class="orderpay_list">
			<ul>
			<c:forEach var="order" items="${orderlist }">
				<li>${order.pName }</li>
				<li>${order.amount }</li>
				<li class="product-number"><input type="hidden" name="${order.price }"></li>
			</c:forEach>
				<li>2500원</li>
			<c:forEach var="price" items="${coupon }">
				<li id="salePrice">${price.discnt }</li>
				<li>체감가</li>
			</c:forEach>
			</ul>
		</div>
		<div class="orderpay_delivery_address">
			<c:forEach var="user" items="${userInfo }">
			<ul>
				<li id="deliveryInfo_title">주문자 및 배송지정보<li>
				<li id="userName">성함 : ${user.username }</li>
				<li id="userPNum">연락처 : ${user.pnum }</li>
				<li id="userEmail">이메일 : ${user.email }</li>
				<li><input type="text" placeholder="주소 입력" required></li>
				<li>
					<input type="text" placeholder="요청사항을 입력">
				</li>
			</ul>
			</c:forEach>	
		</div>
		<div class="orderpay_details">
			<c:forEach var="paylist" items="${paylist }">
			<ul>
				<li id="deliveryInfo_title">결제상세<li>
				<li id="totalOrderAmount">주문금액 : ${paylist.totalOrderPrice }원</li>
				<li id="totalOrderPrice">상품금액 : 0원</li>
				<li id="discntPrice">할인 : 0원</li>
				<li id="totalOrderAmount">결제할 금액 : 0원<li> 
			</ul>
			</c:forEach>
		</div>
			<p><a href="${cpath }/product/lastorder"><button id="orderpayBtn">결제하기</button></a></p>
	</div>
</div>
<script>
// const price = document.querySelectorAll('.product-price')	// product-price라는 클래스
// const numbersInput = document.querySelectorAll('.product-number input[type="hidden"]')
	
// 	// 가격을 합산
// 	let total = 0;	// 총 합계
// 	let totalnumber = 0; // 총 수량
	
// 	price.forEach(priceElement => {
// 	// '원' 문자를 제거하고 숫자만 추출하여 합산
// 	    total += parseInt(priceElement.innerText.replace('원', '').trim())
// 	})
	
// 	numbersInput.forEach(numberElement => {
// 		totalnumber += parseInt(numberElement.value)
// 		console.log(totalnumber)
// 		console.log(total)
// 	})
	
// 	document.getElementById('totalOrderAmount').innerText = '총 주문금액 : ' + total + ' 원'
// 	document.getElementById('totalOrderPrice').innerText = '상품 금액 : ' + totalnumber + '원'
</script>


</body>
</html>