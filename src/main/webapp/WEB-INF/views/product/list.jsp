<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<div class="product_wrap">
	<div class="pCategory_items">
		<div class="pCategory_list">
			<ul>
				<li>카테고리 이름</li>
				<li>수량</li>
			</ul>
			<ul>
				<li>카테고리 이름</li>
				<li>수량</li>
			</ul>
			<ul>
				<li>카테고리 이름</li>
				<li>수량</li>
			</ul>
			<ul>
				<li>카테고리 이름</li>
				<li>수량</li>
			</ul>
			<ul>
				<li>카테고리 이름</li>
				<li>수량</li>
			</ul>
			<ul>
				<li>카테고리 이름</li>
				<li>수량</li>
			</ul>
		</div>
		<div class="pCategory_search">
			<ul>
				<li><a href="${cpath }/product/list?sort=views_desc">상품조회순</a></li>
				<li><a href="${cpath }/product/list?sort=price_desc">낮은 가격순</a></li>
				<li><a href="${cpath }/product/list?sort=price">높은 가격순</a></li>
				<li>리뷰 많은순</li>
				<li><a href="${cpath }/product/list?sort=sDate_desc">등록일순</a></li>
				<li><a href="${cpath }/product/list?sort=pStar_desc">별점순</a></li>
				<li>
					<select>
						<option>20개씩</option>
						<option>40개씩</option>
						<option>60개씩</option>
						<option>80개씩</option>
					</select>
				</li>

				<li><input type="search" name="pSearch">
					<button>검색</button></li>
				<li><a href="${cpath}/product/addProduct">상품 등록</a></li>

				<form>
				   
				     <input type="search" name="pName" placeholder="상품 검색">
				     <input type="submit" value="검색">
			
				</form>

			</ul>
		</div>
		<c:forEach var="dao" items="${list }">
			<div class="product_items">
				<ul>
					<li><a href="${cpath }/product/view/${dao.idx}">
					<img src="${cpath }/resources/image/${dao.image}"></a></li>
<%-- 					<li id="currentImageOverView"><a href="${cpath }/product/view/${dao.idx}"></a></li> --%>
				</ul>
				<ul>
					<li id="product_pName"><a href="${cpath }/product/view/${dao.idx}">상품이름 : ${dao.pName }</a></li>
					<li id="product_pContent">상품설명 : ${dao.pContent }</li>
					<li>분류 : ${dao.pCategory } | 조회수 : ${dao.views }</li>
					<li>가격 : ${dao.price }원</li>
					<li>별점 : ${dao.pStar } | 날짜 : ${dao.sDate } | 찜 : ${dao.pick }</li>
					<ul id="product_event_ico">
						<li id="event_ico_new">NEW</li>
						<li id="event_ico_hot">HOT</li>
						<li id="event_ico_event">EVENT</li>
					</ul>
					<li>
						<a href="${cpath }/product/modify/${dao.idx}"><button>수정</button></a>
						<a href="${cpath }/product/delete/${dao.idx}"><button>삭제</button></a>
					</li>
				</ul>
			</div>
		</c:forEach>
		<div class="paging">
			<c:if test="${paging.prev }">
				<a
					href="${cpath }/product/list?page=${paging.begin - paging.perPage}">[이전]</a>
			</c:if>

			<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
				<div class="paging_count">
					<a href="${cpath }/product/list?page=${i}">${i}</a>
				</div>
			</c:forEach>

			<c:if test="${paging.next }">
				<a href="${cpath }/product/list?page=${paging.end + 1}">[다음]</a>
			</c:if>
		</div>
	</div>
	<aside>
		<ul>인기검색어
			<li>1. 상품명</li>
			<li>2. 상품명</li>
			<li>3. 상품명</li>
			<li>4. 상품명</li>
			<li>5. 상품명</li>
			<li>6. 상품명</li>
			<li>7. 상품명</li>
			<li>8. 상품명</li>
			<li>9. 상품명</li>
			<li>10. 상품명</li>
		</ul>
	</aside>
	    <a style="display:scroll;position:fixed;bottom:50px;right:50px;" rel="nofollow" href="#" title="Back to Top"><span style="width: 80px; height: 80px; font-size: 50px;">⏫</span></a>
	
</div>

</body>
</html>
