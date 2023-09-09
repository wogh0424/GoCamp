<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<style>
	#shopbannerwrap {
		width: 100%;
		background-color: #A7BCFF;
	}
	#shoppingbanner {
		width: 590px;
		margin: 0px auto;
		height: 400px;
		background-repeat: no-repeat;
		background-position: center;
		background-size: cover;
	}
</style>

<div id="shopbannerwrap">
	<div id="shoppingbanner" style="background-image: url('${cpath}/resources/image/main/shoppingmallBanner.jpg')">
		
	</div>
</div>

<div class="product_wrap">
	<div class="pCategory_items">
		<div class="pCategory_search">
			<ul>
				<li><a href="${cpath }/product/list?sort=price&pName=${param.pName}">가격순</a></li>
				<li><a href="${cpath }/product/list?sort=sDate&pName=${param.pName}">등록일순</a></li>
				<li><a href="${cpath}/product/addProduct">상품 등록</a></li>
				<li>
				<form>
				     <input type="search" name="pName" placeholder="상품 검색" value="${param.pName }">
				     <input type="submit" value="검색">
				</form>
				</li>
			</ul>
		</div>
		<c:forEach var="dao" items="${list }">
			<div class="product_items">
				<div style="flex: 1;">
					<a href="${cpath }/product/view/${dao.idx}"><img src="${cpath }/resources/image/${dao.image}" width="150px" height="150px"></a>
				</div>
				<div style="flex: 3;">
					<p class="product_pName"><a href="${cpath }/product/view/${dao.idx}">상품이름 : ${dao.pName }</a></p>
					<p class="product_pContent">상품설명 : ${dao.pContent }</p>
					<p>가격 : ${dao.price }원</p>
					<p>날짜 : ${dao.sDate }</p>
					<p>
						<a href="${cpath }/product/modify/${dao.idx}"><button>수정</button></a>
						<a href="${cpath }/product/delete/${dao.idx}"><button>삭제</button></a>
					</p>
				</div>
			</div>
		</c:forEach>
		<div class="paging">
			<c:if test="${paging.prev }">
				<a
					href="${cpath }/product/list?sort=${param.sort }&pName=${param.pName}&page=${paging.begin - paging.perPage}">[이전]</a>
			</c:if>

			<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
				<div class="paging_count">
					<a href="${cpath }/product/list?sort=${param.sort }&pName=${param.pName}&page=${i}">${i}</a>
				</div>
			</c:forEach>

			<c:if test="${paging.next }">
				<a href="${cpath }/product/list?sort=${param.sort }&pName=${param.pName}&page=${paging.end + 1}">[다음]</a>
			</c:if>
		</div>
	</div>
	
</div>
<script>
async function imageRequestHandler(id) {   		
	let url = cpath + '/getImageList/' + id
	let arr = await fetch(url)
	.then(resp => resp.json())
	const viewImage = document.getElementById('currentImagePreview');
	const noimg = '<div class="noImageNotion"><img src="'+ cpath +'/resources/image/mainView/noimg.gif"></div>'
	
	if (arr.length == 0) {
		viewImage.innerHTML = noimg
	}
	else {
		viewImage.innerHTML = ''
			let newimgUrl = ''
			newimgUrl = cpath + '/resources/upload/camp/' + arr[0];

	};

}
</script>
</body>
</html>
