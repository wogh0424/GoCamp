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
			<li>
				<select name="couponSelect">
				<option>적용할 쿠폰 선택</option>
					<option value="">봄 맞이 쿠폰</option>
					<option value="">신규 회원 가입 쿠폰</option>
					<option value="">런칭 기념 쿠폰</option>					
				</select></li>
				<li><input type="checkbox" class="icheck"></li>
				<li><input type="hidden" name="${dto.idx }"></li> <!-- 히든 처리된 dto.idx -->
				<li><span id="currentImageOverView"></span>이미지</li>
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
					<p>2500원</p>
				</li>
			</ul>
			</c:forEach>
		</div>
		<div class="basket_pay">
			<ul>
				<li>주문 예정 날짜 :[ ]</li>
				<li>선택상품금액
					<p>${dto.price }</p>
				</li>
				<li>+</li>
				<li>총 배송비
					<p>2500원</p>
				</li>
				<li>-</li>
				<li>할인예상금액
					<p>0원</p>
				</li>
				<li></li>
				<li id="totalOrderAmount">주문금액  0원</li>
				<li><a href="${cpath}/product/orderpay"><button id="payAllBtn">TheCamping Market 0건 주문하기</button></a></li>
				<li><a href="${cpath }/product/orderpay"><button>임시 버튼</button></a></li>
			</ul>
		</div>
	</div>
</div>
<script>
// 전체체크 온/오프 기능
var checkboxAll = document.getElementById('checkboxAll');  //  input checkbox id = "checkboxAll"

checkboxAll.addEventListener('click', function() {			// checkboxAll을 클릭했을때 이벤트
    var ichecks = document.querySelectorAll('.icheck');		// checkbox class = .icheck 인것에
    for(var i = 0; i < ichecks.length; i++) {				// .icheck의 갯수만큼 반복해서
        ichecks[i].checked = checkboxAll.checked;			
    }
});
</script>
<script>
	//모든 상품의 가격 요소를 가져옴
	const prices = document.querySelectorAll('.product-price')	// product-price라는 클래스
	const numbersInputs = document.querySelectorAll('.product-number input[type="number"]') // product-number 각각의 input이 number
	
	// 가격을 합산
	let total = 0;	// 총 합계
	let totalnumber = 0; // 총 수량
	
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

<script>
	const gotoOreder = document.getElementById('payAllBtn')
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
			const url = cpath + '/grocery';
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
