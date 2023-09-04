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
				<li>이미지</li>
				<li>상품정보</li>
				<li>판매자</li>
				<li>배송비</li>
				<li>수량</li>
				<li>할인</li>
				<li>상품금액(할인포함)</li>
			</ul>
		</div>
		<div class="orderpay_list">
			<ul>
				<li>이미지</li>
				<li>상품</li>
				<li>관리자</li>
				<li>1000원</li>
				<li>10개</li>
				<li>0원</li>
				<li>1000원</li>
			</ul>
		</div>
		<div class="orderpay_delivery_address">
			<ul>
				<li id="deliveryInfo_title">주문자 및 배송지정보<li>
				<li>홍길동</li>
				<li>010-1234-5678</li>
				<li>asd@asd.co.kr</li>
				<li>부산시 해운대구</li>
				<li>구매할 상품명</li>
				<li>
					<input type="text" placeholder="요청사항을 입력">
				</li>
			</ul>
		</div>
		<div class="orderpay_details">
			<ul>
				<li id="deliveryInfo_title">결제상세<li>
				<li>주문금액 : </li>
				<li>상품금액 : </li>
				<li>할인 : </li>
				<li>결제할 금액 : <li> 
			</ul>
		</div>
			<p><a href="${cpath }/product/lastorder"><button id="orderpayBtn">결제하기</button></a></p>
	</div>
</div>


</body>
</html>