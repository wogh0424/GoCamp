<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<!-- camping_top_list 시작 -->
<div class="camping_top_wrap" style="margin: 60px auto; ">
	<div class="camping_left_list" style="margin-right: 30px;">
		<ul>
			<li style="background-color: #c7ebf1;"><video src="${cpath }/resources/upload/camp/jaeho.mp4" width="100%" height="100%" controls loop></video></li>
			<li class="camping_left_content" style="text-align: center;">
			<h3>🏞️<span class="blue">ojm0827</span>의 여행후기</h3>
				<div style="width: 250px; font-size: 16px; margin:80px auto 0; text-align: center; font-weight: bold;"><a href="${cpath }/main/view/1" style="color: black;">"김OO과 함께해서 아주 즐거운 여행이 되었던 것 같습니다 ^^b"</a></div>
			</li>
		</ul>
		<ul>
			<li class="camping_left_content" style="text-align: center;">
				<h3>🛣️<span class="blue">Jaeho1234</span>의 여행후기</h3>
				<div style="width: 250px; font-size: 16px; margin:60px auto 0; text-align: center; font-weight: bold;"><a href="${cpath }/main/view/1" style="color: black;">"이곳은 자연의 아름다움과 문화의 조화가 빛나며, 푸르른 산과 맑은 계곡이 만들어내는 풍경은 그림 같이 아름다웠습니다. 이곳에서의 경험은 정말 잊지 못할 것입니다."</a></div>
			</li>
			<li style="background-color: #c7ebf1;"><video src="${cpath }/resources/upload/camp/jaeho2.mp4" width="100%" height="100%" controls loop></video></li>
		</ul>
	</div>
	<div class="camping_right_items" style="margin-top: 20px;">
	<!-- c:foreach 만들어야 범위 시작  -->
		<c:forEach items="${ camplist}" var="item">
		<a href="${cpath }/main/view/${item.contentId}" style="text-decoration: none; color: black;">
			<div class="camping_right_list" style="padding: 10px; width: 420px;">
				<div class="camping_right_image"><img src="${item.firstImageUrl}" width="120px" height="90px" style="margin-right: 10px;"></div>
				<div class="camping_right_contents">
					<h4><b>${item.facltNm }</b></h4>
					<p>${item.lineIntro }</p>
				</div>
			</div>
		</a>
		</c:forEach>
	<!-- c:foreach 만들어야 범위 끝 -->
	</div>
</div>
<!-- camping_top_list 끝 -->

<!-- review 페이지 시작  -->
<h3>BEST REVIEW</h3>
<div class="review_rank">
<c:forEach items="${reviewList }" var="list">
 	<a href="${cpath }/reviewBoard/view/${list.idx}">
		<div class="review_rank_image">
		 <c:choose>
       		 <c:when test="${empty list.filePath}">
          	  <img src="${cpath}/resources/image/Review_thecamping.png" height="200">
        </c:when>

       
        <c:otherwise>
        
		<c:forTokens var="filePath" items="${list.filePath}" delims=",">
		        <img src="${cpath}/upload/${filePath}" height="200">
		</c:forTokens>
		 </c:otherwise>
    </c:choose>
		</div>
			<div class="review_rank_content">${list.review_content }</div>
			<div class="review_rank_campingName">${list.title }</div>
			<div class="review_rank_cityName">${list.writer }</div>
	</a>
	</c:forEach>
</div>
<!-- review 페이지 끝  -->
<footer><!-- footer start -->
<div class="footer_top">
	<div class="footer_top_logo"><img src="${cpath }/resources/image/thecamping_logo_grey.png"></div>
	<ul>
		<li>개발자소개</li>
		<li>개인정보처리방침</li>
		<li>캠핑장 등록안내</li>
		<li>미등록야영장불법영업신고</li>
	</ul>
	<ul>
		<li><a href=""><img src="${cpath }/resources/image/header_ico/facebook32.png"></a></li>
		<li><a href=""><img src="${cpath }/resources/image/header_ico/instagram32.png"></a></li>
		<li><a href=""><img src="${cpath }/resources/image/header_ico/twitter32.png"></a></li>
		<li><a href=""><img src="${cpath }/resources/image/header_ico/youtube32.png"></a></li>
	</ul>
</div>
<div class="footer_bottom">
	<p>
		부산 해운대구 센텀2로 25 센텀드림월드 11층 (우동 1510) KG아이디뱅크 부산학원 <br>
		SITE : http://busan.kgitbank.com  TEL : 051-744-7799 (상담시간 : 평일 08:30~20:00)<br>
		Copyrights(c) 2023 FINAL PROJECT ALL RIGHTS RESERVED.
	</p>
</div>
</footer><!-- footer end -->
</body>
</html>