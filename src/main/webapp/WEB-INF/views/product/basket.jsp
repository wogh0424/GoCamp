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
				<li><input type="checkbox">전체선택</li>
				<li><input type="reset" value="X선택삭제"></li>
			</ul>
		</div>
		<div class="basket_title">
			<input type="checkbox">TheCamping Masket
		</div>
		<div class="basket_list">
		<c:forEach var="dto" items="${basketlist }">
			<ul>
				<li><input type="checkbox"></li>
				<li>이미지</li>
				<li>${dto.pName }</li>
				<li><button>X</button></li>
				<li>상품설명</li>
				<li><input type="number" value="${dto.amount }">
					<p><button>주문수정</button></p>
				</li>
				<li>상품금액
					<p>${dto.price }</p>
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
				<li>주문금액 10000원</li>
				<li id="payAllBtn"><a href="${cpath }/product/orderpay">TheCamping Market 0건 주문하기</a></li>
			</ul>
		</div>
	</div>
</div>
</body>
</html>