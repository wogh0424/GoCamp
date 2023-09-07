<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<div id="camping_intro_search">
	<div id="simple_search_panel">
		<div>
			<br>
			<h1 style="color: white; font-weight: bolder; text-shadow: 4px 2px 2px grey;">지금은 <span style="font-size: 50px; color:#F0AD33; ">캠핑갈</span> 시간!</h1>
			<h4 style="color: white; font-weight: bold; text-shadow: 2px 2px 2px grey;">더 캠핑에서 다양한 정보를 찾고 경험을 공유해보세요 🧡</h4>
		</div>
		<div style="height: 180px;">
			<a href="${cpath }/main/camp"><button id="thecamp"><h2><b>캠핑장 찾으러 가기 ▶</b></h2></button></a>
		</div>
	</div>
</div>


<div id="monthlyRecommendDation" style="background-color: #eeeeee; width: 100%; height: 660px;">
	<div id="monthlyRecommendDationTT" style="width: 1000px; text-align: center; margin: 0px auto; height: 660px; padding: 60px 0">
		<h1 style="text-shadow: 4px 2px 2px lightgrey; font-weight: bolder;">눈부신 야경 여행</h1>
		<br>
		<p>한국관광공사 추천 9월의 여행</p>
		<br>
		<div id="monthlyRecommendDation" style="display: flex; width: 100%; justify-content: space-around;">
			<div style="width: 230px; height: 370px; display: flex; flex-direction: column; justify-content: space-between; align-items: center;">
				<div style="width: 170px; height: 170px;">
					<img src="${cpath }/resources/image/main/나오라쇼.jpg" style="width: 95%; height: 95%; border-radius: 50%;">
				</div>
				<div style="width: 230px; height: 190px; background-color: white; padding: 0 10px;">
					<h4 style="color:#F0AD33"><b>간현관광지 나오라쇼</b></h4>
					<hr style="background: grey; height:1px; border:0;">
					<h5 style="color: grey;">낮에 소금산출렁다리와 출렁다리가 주인공이라면, 밤에는 미디어 파사드와 음악 분수와 함께 야광조명이 밤을 수놓는다.</h5>
					<a href="${cpath }/main/camp?listTy=MAP&sido=강원도&gungu=원주시"><button style="background-color: #004D91; border: none; color: white;">주변캠핑장 보기 +</button></a>
				</div>
			</div>
			<div style="width: 230px; height: 370px; display: flex; flex-direction: column; justify-content: space-between; align-items: center;">
				<div style="width: 170px; height: 170px;">
					<img src="${cpath }/resources/image/main/디피랑.jpg" style="width: 95%; height: 95%; border-radius: 50%;">
				</div>
				<div style="width: 230px; height: 190px; background-color: white; padding: 0 10px;">
					<h4 style="color:#F0AD33"><b>통영 디피랑</b></h4>
					<hr style="background: grey; height:1px; border:0;">
					<h5 style="color: grey;">매일 밤 인공조명과 미디어 아트를 활용한 전시로 여행자에게 즐길 거리를 제공해, 야간 경관 명소로 자리 잡았다.</h5>
					<a href="${cpath }/main/camp?listTy=MAP&sido=경상남도&gungu=통영시"><button style="background-color: #004D91; border: none; color: white;">주변캠핑장 보기 +</button></a>
				</div>
			</div>
			<div style="width: 230px; height: 370px; display: flex; flex-direction: column; justify-content: space-between; align-items: center;">
				<div style="width: 170px; height: 170px;">
					<img src="${cpath }/resources/image/main/국립세종수목원.jpg" style="width: 95%; height: 95%; border-radius: 50%;">
				</div>
				<div style="width: 230px; height: 190px; background-color: white; padding: 0 10px;">
					<h4 style="color:#F0AD33"><b>국립세종수목원</b></h4>
					<hr style="background: grey; height:1px; border:0;">
					<h5 style="color: grey;">9월 23일까지 금·토요일 야간 개장을 한다. 밤에 돌아볼 수 있는 구역은 사계절전시온실과 축제마당과 한국전통정원</h5>
					<a href="${cpath }/main/camp?listTy=MAP&sido=세종시&gungu=세종시"><button style="background-color: #004D91; border: none; color: white;">주변캠핑장 보기 +</button></a>
				</div>
			</div>
			<div style="width: 230px; height: 370px; display: flex; flex-direction: column; justify-content: space-between; align-items: center;">
				<div style="width: 170px; height: 170px;">
					<img src="${cpath }/resources/image/main/순천.jpg" style="width: 95%; height: 95%; border-radius: 50%;">
				</div>
				<div style="width: 230px; height: 190px; background-color: white; padding: 0 10px;">
					<h4 style="color:#F0AD33"><b>순천의 가을 야경</b></h4>
					<hr style="background: grey; height:1px; border:0;">
					<h5 style="color: grey;">순천만 국가 정원의 화려한 야경 투어. 늦은 오후에 배를 타면 노을이 지는 순천의 경관과 어둠이 깔리기 시작한 박람회</h5>
					<a href="${cpath }/main/camp?listTy=MAP&sido=전라남도&gungu=순천시"><button style="background-color: #004D91; border: none; color: white;">주변캠핑장 보기 +</button></a>
				</div>
			</div>
		</div>
	</div>
</div>



<!-- camping_top_list 시작 -->
<div class="camping_top_wrap" style="margin: 60px auto;">
	<div class="camping_left_list" style="margin-right: 30px;">
		<ul>
			<li style="background-color: #c7ebf1;"><video src="${cpath }/resources/upload/camp/jaeho.mp4" width="100%" height="100%" controls loop></video></li>
			<li class="camping_left_content" style="text-align: center; border-radius: 0 0 0 40px;">
			<h3>🏞️<span class="blue">ojm0827</span>의 여행후기</h3>
				<div style="width: 250px; font-size: 16px; margin:80px auto 0; text-align: center; font-weight: bold;"><a href="${cpath }/main/view/1" style="color: black;">"김OO과 함께해서 아주 즐거운 여행이 되었던 것 같습니다 ^^b"</a></div>
			</li>
		</ul>
		<ul>
			<li class="camping_left_content" style="text-align: center; border-radius: 0 40px 0 0;">
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

<%@ include file="footer.jsp" %>

</body>
</html>