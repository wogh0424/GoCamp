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
         <li>${dto.views} | ${dto.pick } | <button>장바구니</button></li>
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
</body>
</html>