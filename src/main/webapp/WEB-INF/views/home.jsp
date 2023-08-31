<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<!-- camping_top_list 시작 -->
<div class="camping_top_wrap">
	<div class="camping_left_list">
		<ul>
			<li>이미지</li>
			<li class="camping_left_content">캠핌장 내용</li>
		</ul>
		<ul>
			<li class="camping_left_content">캠핌장 내용</li>
			<li>이미지</li>
		</ul>
	</div>
	<div class="camping_right_items">
	<!-- c:foreach 만들어야 범위 시작  -->
		<div class="camping_right_list">
			<div class="camping_right_image"><img src="${cpath }/resources/image/noimage1.png"></div>
			<div class="camping_right_contents">
				<h3><b>캠핑장 이름</b></h3>
				<p>Nullam ultricies id turpis nec elementum. Morbi luctus consectetur aliquet.</p>
			</div>
		</div>
		
		<div class="camping_right_list">
			<div class="camping_right_image"><img src="${cpath }/resources/image/noimage1.png"></div>
			<div class="camping_right_contents">
				<h3><b>캠핑장 이름</b></h3>
				<p>Nullam ultricies id turpis nec elementum. Morbi luctus consectetur aliquet.</p>
			</div>
		</div>
		
		<div class="camping_right_list">
			<div class="camping_right_image"><img src="${cpath }/resources/image/noimage1.png"></div>
			<div class="camping_right_contents">
				<h3><b>캠핑장 이름</b></h3>
				<p>Nullam ultricies id turpis nec elementum. Morbi luctus consectetur aliquet.</p>
			</div>
		</div>
		
		<div class="camping_right_list">
			<div class="camping_right_image"><img src="${cpath }/resources/image/noimage1.png"></div>
			<div class="camping_right_contents">
				<h3><b>캠핑장 이름</b></h3>
				<p>Nullam ultricies id turpis nec elementum. Morbi luctus consectetur aliquet.</p>
			</div>
		</div>
		
		<div class="camping_right_list">
			<div class="camping_right_image"><img src="${cpath }/resources/image/noimage1.png"></div>
			<div class="camping_right_contents">
				<h3><b>캠핑장 이름</b></h3>
				<p>Nullam ultricies id turpis nec elementum. Morbi luctus consectetur aliquet.</p>
			</div>
		</div>
	<!-- c:foreach 만들어야 범위 끝 -->
	</div>
</div>
<!-- camping_top_list 끝 -->

<!-- review 페이지 시작  -->
<div class="review_rank">
	<div class="review_rank_items">
		<div class="review_rank_image">
			<img src="${cpath }/resources/image/review_test_image.jpg">
				<div class="review_rank_content">
					Nullam ultricies id turpis nec elementum. Morbi luctus consectetur aliquet. Praesent volutpat congue nunc vitae varius. Integer sit amet malesuada tellus. Fusce felis nisl, interdum porttitor massa eu, commodo tempus turpis. Suspendisse potenti. Aliquam sit amet velit nec erat rhoncus pretium. Integer nec elit id mi posuere scelerisque. Nunc quis sem velit. Proin accumsan, velit et porttitor faucibus, nunc orci pharetra leo, a ultrices elit lacus ut ante.
			</div>
			<div class="review_rank_campingName">캠핑장 이름</div>
			<div class="review_rank_cityName">캠핑장 지역</div>
		</div>
		<div class="review_rank_image">
			<img src="${cpath }/resources/image/review_test_image.jpg">
		<div class="review_rank_content">
					Nullam ultricies id turpis nec elementum. Morbi luctus consectetur aliquet. Praesent volutpat congue nunc vitae varius. Integer sit amet malesuada tellus. Fusce felis nisl, interdum porttitor massa eu, commodo tempus turpis. Suspendisse potenti. Aliquam sit amet velit nec erat rhoncus pretium. Integer nec elit id mi posuere scelerisque. Nunc quis sem velit. Proin accumsan, velit et porttitor faucibus, nunc orci pharetra leo, a ultrices elit lacus ut ante.
			</div>
			<div class="review_rank_campingName">캠핑장 이름</div>
			<div class="review_rank_cityName">캠핑장 지역</div>
		</div>
		<div class="review_rank_image">
			<img src="${cpath }/resources/image/review_test_image.jpg">
				<div class="review_rank_content">
					Nullam ultricies id turpis nec elementum. Morbi luctus consectetur aliquet. Praesent volutpat congue nunc vitae varius. Integer sit amet malesuada tellus. Fusce felis nisl, interdum porttitor massa eu, commodo tempus turpis. Suspendisse potenti. Aliquam sit amet velit nec erat rhoncus pretium. Integer nec elit id mi posuere scelerisque. Nunc quis sem velit. Proin accumsan, velit et porttitor faucibus, nunc orci pharetra leo, a ultrices elit lacus ut ante.
			</div>
			<div class="review_rank_campingName">캠핑장 이름</div>
			<div class="review_rank_cityName">캠핑장 지역</div>
		</div>
	</div>
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