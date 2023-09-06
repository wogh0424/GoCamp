<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>


<div class="basket_wrap">
	<div class="basket_items">
		<div class="basket_status">
			<ul>
				<li><b>장바구니</b></li>
				<li>></li>
				<li>주문/결제</li>
				<li>></li>
				<li>완료</li>
			</ul>
		</div>
		<div class="basket_checklist">
			<ul>
				<li><input type="checkbox" id="checkboxAll">전체선택</li>
				<li><input type="reset" value="X선택삭제"></li>
			</ul>
		</div>
		<div class="basket_title">
			<input type="checkbox">TheCamping Masket
		</div>
		<div class="basket_list">
		<c:forEach var="dto" items="${basketlist }">
			<ul>
				<li><input type="checkbox" class="icheck"></li>
				<li><input type="hidden" name="${dto.idx }"></li>
				<li>이미지</li>
				<li>${dto.pName }</li>
				<li><a href="${cpath }/product/basket/${dto.idx}"><button>X</button></a></li>
				<li>상품설명</li>
				<li class="product-number"><input type="number" value="${dto.amount }" readonly>
<!-- 					<p><button>주문수정</button></p> -->
				</li>
				<li>상품금액
					<p class="product-price">${dto.price }원</p>
					<p><button id="payBtn">주문하기</button></p>
				</li>
				<li>배송비
					<p>10000원</p>
				</li>
			</ul>
			</c:forEach>
		</div>
		<div class="basket_pay">
			<ul>
				<li>주문 예정 날짜 :[ ]</li>
				<li>선택상품금액
					<p>10000원</p>
				</li>
				<li>+</li>
				<li>총 배송비
					<p>10000원</p>
				</li>
				<li>-</li>
				<li>할인예상금액
					<p>0원</p>
				</li>
				<li></li>
				<li id="totalOrderAmount">주문금액  0원</li>
				<li id="payAllBtn"><a href="${cpath }/product/orderpay">TheCamping Market 0건 주문하기</a></li>
			</ul>
		</div>
	</div>
</div>
<script>
var checkboxAll = document.getElementById('checkboxAll');

checkboxAll.addEventListener('click', function() {
    var ichecks = document.querySelectorAll('.icheck');
    for(var i = 0; i < ichecks.length; i++) {
        ichecks[i].checked = checkboxAll.checked;
    }
});
</script>
<script>
	//모든 상품의 가격 요소를 가져옴
	const prices = document.querySelectorAll('.product-price')
	const numbersInputs = document.querySelectorAll('.product-number input[type="number"]')
	
	// 가격을 합산
	let total = 0;
	let totalnumber = 0;
	
	prices.forEach(priceElement => {
	// '원' 문자를 제거하고 숫자만 추출하여 합산
	    total += parseInt(priceElement.innerText.replace('원', '').trim())
	})
	
	numbersInputs.forEach(numberElement => {
		totalnumber += parseInt(numberElement.value)
		console.log(totalnumber)
	})
	
	// 합산된 가격을 주문금액에 표시
	document.getElementById('totalOrderAmount').innerText = '총 주문금액 ' + total + ' 원'
	document.getElementById('payAllBtn').innerText = 'TheCamping Market ' + totalnumber + ' 건' + ' 주문하기'
</script>
</body>
</html>