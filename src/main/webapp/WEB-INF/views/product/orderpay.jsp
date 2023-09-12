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
		</div>
		<div class="orderpay_list_title">
			<ul>
				<li>상품정보</li>
				<li>수량</li>
				<li>상품 금액</li>
			</ul>
		</div>
		<div class="orderpay_list">
			<c:forEach var="order" items="${orderlist }">
			<ul>
				<li>${order.pName }</li>
				<li>${order.amount }개</li>
				<li>${order.price }원</li>
			</ul>
			</c:forEach>
		</div>
		<div class="saleUl">
			<ul>
				<li>배송비</li>
				<li>할인</li>
				<li>상품 금액</li>
				<li>결제 금액(할인포함)</li>
			</ul>
		</div>
		<div class="saleUl_list">
			<ul>
				<li>2500원</li>
				<li id="sale"></li>
				<li id="total">${paylist.totalOrderPrice } 원</li>
				<li><input type="hidden" id="total" value="${paylist.totalOrderPrice}"></li>
			<c:forEach var="price" items="${coupon }">
				<li id="salePrice">${price.discnt }</li>
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
			<ul>
				<li id="deliveryInfo_title">결제상세<li>
				<li id="salePrice">상품금액 : ${paylist.totalOrderPrice }원</li>
	        <li id="finalPrice"></li>
			</ul>
		</div>
			<p><a href="${cpath }/product/lastorder"><button id="orderpayBtn">결제하기</button></a></p>
	</div>
</div>

<script>
	const data = '${paylist}'
	console.log('data : ' + data)
	
    // JavaScript를 사용하여 두 값을 곱합니다.
    const discnt = parseFloat(document.getElementById('salePrice').textContent); // 할인 금액 가져오기
    const totalOrderPrice = parseFloat(document.getElementById('total').textContent); // 총 주문 가격 가져오기

    const finalPrice = discnt * totalOrderPrice;
    const salePrice = discnt * totalOrderPrice;
    const sale = 0.1 * totalOrderPrice;
    
    document.getElementById('salePrice').innerText = salePrice + ' 원'
    document.getElementById('sale').innerText = sale + ' 원'
    document.getElementById('finalPrice').innerText = '최종 결제 금액 : ' + finalPrice + ' 원'
	
			
    // 결과를 표시하거나 사용할 수 있습니다.
    console.log("곱한 결과:", salePrice);
</script>
	



</body>
</html>