<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<div class="pCategory_list">
	<div class="pCategory_items">
		<c:forEach var="dto" items="${list }">
		<ul>
			<li><a href="${cpath }/product/list/${dto.pCategory}">${dto.pCategory}</a></li>
			<li>카테고리 이름</li>
		</ul>
		</c:forEach>
	</div>
</div>

<div class="product_wrap">
   <c:forEach var="dao" items="${list }">
   <div class="product_items">
  		<ul>
  			<li><a href=""><img src="${cpath }/resources/image/${dao.image}"></a></li>
  			<li>${dao.pName }</li>
  			<li>${dao.pContent }</li>
  			<li>가격 : ${dao.price }</li>
  			<li>${dao.views } | ${dao.pick } | ${dao.pStar }</li>
  			<li>상품 등록 날짜 : ${dao.sDate }</li>
  		</ul>
  		<ul>
  			<li>
  				<div class="product_modify_btn"><a href=""><button>수정</button></a></div>
  				<div class="product_delete_btn"><a href="${cpath }/product/delete/${dao.idx}"><button>삭제</button></a></div>
  			</li>
  		</ul>
  	</div>
   </c:forEach>
</div>
<div class="paging">
	<c:if test="${paging.prev }">
		<a href="${cpath }/product/list?page=${paging.begin - paging.perPage}">[이전]</a>
	</c:if>
	
	<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
		<div class="paging_count"><a href="${cpath }/product/list?page=${i}">${i}</a></div>	
	</c:forEach>
	
	<c:if test="${paging.next }">
		<a href="${cpath }/product/list?page=${paging.end + 1}">[다음]</a>
	</c:if>
</div>
<footer>
</footer>
</body>
</html>