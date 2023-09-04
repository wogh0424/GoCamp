<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script src="${cpath }/resources/js/mainview.js"></script>
<link rel="stylesheet" href="${cpath }/resources/css/main/main.css"
	type="text/css">
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=x9jrgpo39q"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<div id="viewBg">
	<div id="viewHeader">
		<div id="viewName">${view.facltNm }</div>
		<c:if test="${view.lineIntro != '' }">
			<div id="viewIntro">${view.lineIntro }</div>
		</c:if>
	</div>
	<c:if test="${view.tagName != '' }">
		<div id="viewTags">
			<div class="viewTagsTT">태그</div>
			<div class="viewTagsitem">
				<c:set var="splittags" value="${fn:split(view.tagName, ',') }" />
				<c:forEach items="${ splittags}" var="tag">
					<span class="tagItems">#${tag }</span>
				</c:forEach>
			</div>
		</div>
	</c:if>
</div>


<!-- intro2에서 주변 풍경을 띄워주는 모달창 -->
<div id="imageModal">
	<div id="imageModalOverlay">
		<div id="imageModalTT">
			<div id="imageListPage"></div>
			<div id="viewTitle">${view.facltNm }</div>
			<div id="imageViewClose">X</div>
		</div>
		<div id="imagePrevBtn">◀</div>
		<img id="imageItem">
		<div id="imageNextBtn">▶</div>
	</div>
</div>

<div id="view">
	<div id="viewMain">
		<div id="firstImage">
			<img src="${view.firstImageUrl }">
		</div>
		<div id="viewDescription">
			<table id="viewDescriptionTable">
				<c:if test="${view.addr1 != '' }">
					<tr class="viewAddr1">
						<td>주소</td>
						<td>${view.addr1 }</td>
					</tr>
				</c:if>
				<c:if test="${view.tel != '' }">
					<tr class="tel">
						<td>문의처</td>
						<td>${view.tel }</td>
					</tr>
				</c:if>
				<tr class="envrn">
					<td>캠핑장 환경</td>
					<td>${view.lctCl }/ ${view.facltDivNm }</td>
				</tr>
				<c:if test="${view.induty != '' }">
					<tr class="type">
						<td>캠핑장 유형</td>
						<td>${view.induty }</td>
					</tr>
				</c:if>
				<c:if test="${view.operPdCl != '' }">
					<tr class="season">
						<td>운영 기간</td>
						<td>${view.operPdCl }</td>
					</tr>
				</c:if>
				<c:if test="${view.operDeCl != ''}">
					<tr class="week">
						<td>운영일</td>
						<td>${view.operDeCl }</td>
					</tr>
				</c:if>
				<c:if test="${view.homepage != '' }">
					<tr class="homepage">
						<td>홈페이지</td>
						<td><a href="${view.homepage }" style="color: grey;">홈페이지
								바로가기</a>✨</td>
					</tr>
				</c:if>
				<c:if test="${view.resveCl != '' }">
					<tr class="reserv">
						<td>예약방법</td>
						<td>${view.resveCl }</td>
					</tr>
				</c:if>
				<c:if test="${view.posblFcltyCl != '' }">
					<tr class="posblFclty">
						<td>주변이용가능시설</td>
						<td>${view.posblFcltyCl }</td>
					</tr>
				</c:if>
			</table>
			<div class="rpBtns">
				<button class="recommendBtn">추천하기</button>


				<form method="POST" action="${cpath}/main/like" onsubmit="event.preventDefault(); likeHandler();">
				    <input type="hidden" name="gocamp" value="${view.contentId}">
				    <button id="mypickBtn" type="submit">${isLiked ? '찜 취소' : '찜하기'}</button>					 
				</form>

				<button class="modifyRequest">정보수정요청</button>
			</div>
		</div>
	</div>
	<!--end of viewMain-->
	<div id="campIntro">
		<ul id="campIntroNav">
			<li class="selected">캠핑장 소개</li>
			<li id="viewShowImage">주변풍경</li>
			<li id="viewShowMap">위치/주변정보</li>
			<li>캠핑&#38;여행후기</li>
		</ul>
		<div id="viewIntro">
			<div class="intro1 selected">
				<c:if test="${view.intro != ''}">
					<div id="featureNm">${view.intro  }</div>
					<div class="lastUpdate">최종 정보 수정일 : ${view.modifiedtime }</div>
				</c:if>
				<c:if test="${view.sbrsCl != ''}">
					<div class="viewSbrsContent">
						<div class="sbrsTT">▶️ 캠핑장 시설정보</div>
						<!--forEach문으로 써야할 곳-->
						<div class="viewSbrsCl">
							<c:set var="splitSbrs" value="${fn:split(view.sbrsCl, ',') }" />
							<c:forEach var="sbrs" items="${splitSbrs}">
								<div class="viewsbrsItem">
									<img src="${cpath }/resources/image/mainView/${sbrs }.png"
										width="30px" height="30px"><br> <span>${ sbrs}</span>
								</div>
							</c:forEach>
						</div>
					</div>
					<!-- end of viewSbrsContent-->
				</c:if>
				<div id="otherFeatures">
					<div class="otherFeaturesTT">▶️ 기타 주요시설</div>
					<table id="extraFeaturesTable">
						<tr>
							<td>기타 정보</td>
							<td>개인 트레일러 입장 ${view.trlerAcmpnyAt == 'Y' ? '가능' : '불가능' }
								&nbsp&nbsp 반려동물 동반 ${view.animalCmgCl } <br> (※ 실제 결과는 현장사정
								및 계절에 따라 달라질 수 있으니 캠핑장 사업주에 직접 확인 후 이용바랍니다.)
							</td>
						</tr>
						<c:if test="${view.posblFcltyEtc != '' }">
							<tr>
								<td>기타 주변시설</td>
								<td>${view.posblFcltyEtc }</td>
							</tr>
						</c:if>
						<c:if test="${view.sbrsEtc != '' }">
							<tr>
								<td>기타 부대시설</td>
								<td>${view.sbrsEtc }</td>
							</tr>
						</c:if>
						<c:if test="${view.eqpmnLendCl != '' }">
							<tr>
								<td>캠핑장비 대여</td>
								<td>${view.eqpmnLendCl }</td>
							</tr>
						</c:if>
						<c:if test="${view.brazierCl != ''}">
							<tr>
								<td>화로대</td>
								<td>${view.brazierCl }</td>
							</tr>
						</c:if>
						<c:if test="${view.direction != '' }">
							<tr>
								<td>오시는 길</td>
								<td>${view.direction }</td>
							</tr>
						</c:if>
						<c:if test="${view.sitedStnc > 1 }">
							<tr>
								<td>사이트 간 거리</td>
								<td>${view.sitedStnc }m</td>
							</tr>
						</c:if>
					</table>
				</div>
				<!-- end of otherFeatures -->
				<div class="viewNotion">
					※ 고캠핑에 등록된 정보는 현장상황과 다소 다를 수 있으니 <span style="color: red;">반려동물
						동반 여부, 부가 시설물, 추가차량</span> 등 원활한 캠핑을 위해 꼭 필요한 사항은 해당 캠핑장에서 미리 확인하시기 바랍니다.
				</div>
			</div>
			<!-- end of intro1 -->
			<div class="intro2">
				<div class="viewImageTT">▶️ 주변 사진</div>
				<div id="viewImage"></div>
				<div class="notion">※ 모든 컨텐츠의 저작권은 고캠핑에 있습니다. 무단 사용 및 불법 재배포는
					법적 조치를 받을 수 있습니다.</div>
			</div>
			<div class="intro3">
				<div class="viewmapTT">▶️ 찾아오시는 길</div>
				<div id="viewMap"></div>

			</div>


			<!--               	  캠핑장 리뷰 페이지 - 연지 -->

			<div class="intro4">
				<div id="reviewContainer">
					<h3>리뷰작성</h3>
					<c:if test="${pageContext.request.userPrincipal != null}">
						<form method="POST" enctype="multipart/form-data" id="reviewForm">
							<div class="inputReview">
								<p>
									<input type="text" name="title" placeholder="제목"
										value="[${view.facltNm}]" required autofocus>
								</p>
								<p>
									<input type="text" name="writer" value="${nickname}" readonly>
								</p>
							</div>
							<p>
								<textarea name="review_content" placeholder="리뷰작성" required></textarea>
							</p>
							<input type="hidden" name="gocamp" value="${view.contentId }" />
							<p>
								<input type="file" name="upload" multiple>
							</p>
							<p>
								<input type="submit" id="reviewBtn" value="리뷰 등록">
							</p>

						</form>
					</c:if>

					<c:if test="${pageContext.request.userPrincipal == null}">
						<fieldset id="login-message">
							<p>
								로그인해야 리뷰를 작성할 수 있습니다😄<a href="${cpath }/login/loginForm">
									로그인go</a>
							</p>
						</fieldset>
					</c:if>
				</div>

				<fieldset>
					<c:choose>
						<c:when
							test="${empty list && pageContext.request.userPrincipal != null}">
							<p>아직 등록된 리뷰가 없습니다.</p>
						</c:when>
						<c:otherwise>
							<c:forEach var="review" items="${list }">


								<div class="gocampReview">

									<div class="reviewHeader">
										<div id="reviewIdx">${review.idx}</div>
										<div class="reviewTitle">${review.title}</div>
										<div id="reviewWriter">${review.writer}</div>
										<div id="reviewDate">
											<fmt:formatDate value="${review.reviewdate}"
												pattern="yyyy-MM-dd" />
										</div>
									</div>

									<div class="hiddenReview">
										<div id="reviewContent">${review.review_content}</div>
										<div id="btnRecommend">
											<button>추천하기</button>
										</div>
										<c:if test="${review.writer == nickname}">
											<a class="deleteReviewLink"
												href="${cpath}/main/deleteReview/${review.idx}"><button>삭제</button></a>
										</c:if>

										<div id="reviewImages">
											<c:forTokens var="filePath" items="${review.filePath}"
												delims=",">
												<img id="reviewImage" src="${cpath}/upload/${filePath}"
													alt="Review Image">
											</c:forTokens>
										</div>
									</div>


								</div>



							</c:forEach>
						</c:otherwise>
					</c:choose>
				</fieldset>
			</div>
			<!-- 캠핑자  리뷰페이지 연지 끝  -->

		</div>
		<!--end of view-->
	</div>
	<!-- end of campIntro -->
</div>
<!-- end of view -->

<a
	style="display: scroll; position: fixed; bottom: 50px; right: 50px; text-decoration: none;"
	rel="nofollow" href="#" title="Back to Top"><span
	style="width: 80px; height: 80px; font-size: 50px;">⏫</span></a>


<script>
		const mypickBtn = document.getElementById('mypickBtn')
		const loginId = '${pageContext.request.userPrincipal.name}'
		const campin = '${gocamp}'
		
		mypickBtn.onclick = function(event){

		if(loginId == ''){
			const confirmation = confirm('로그인 후 사용하실 수 있는 기능입니다. 로그인 하시겠습니까?')
			if(!confirmation){
			event.preventDefault()
			}
			else {
				event.preventDefault()
				window.location.href = '${cpath}/login/loginForm'
			} 
		}
		
		}
		
		function likeHandler() {
		    const mypickBtn = document.getElementById('mypickBtn');
		    
		    // 현재 상태에 따라 URL 및 메시지 변경
		    let requestUrl = mypickBtn.innerHTML === '찜하기' ? '${cpath}/main/like' : '${cpath}/main/dislike';
		    let successMessage = mypickBtn.innerHTML === '찜하기' ? '찜하기 완료(찜 목록에서 확인해주세요)' : '찜하기 취소 완료';

		    $.post(requestUrl, {gocamp: '${view.contentId}'}, function(data) {
		        alert(successMessage);
		        mypickBtn.innerHTML = mypickBtn.innerHTML === '찜하기' ? '찜 취소' : '찜하기';
		    });
		}
		
		
		
	
	
    </script>
    

<!--    연지 리뷰 보여주기  scipt -->
<script>
    document.addEventListener('DOMContentLoaded', function() {
    	  // 모든 리뷰 헤더를 가져옵니다.
    	  const reviewHeaders = document.querySelectorAll('.reviewHeader');

    	  // 각 리뷰 헤더에 대한 이벤트 리스너를 등록합니다.
    	  reviewHeaders.forEach(function(reviewHeader) {
    	    reviewHeader.addEventListener('click', function() {
    	      // 클릭한 리뷰 아이템에서만 숨겨진 리뷰 내용을 토글합니다.
    	      const hiddenReview = reviewHeader.nextElementSibling; // 다음 형제 요소 가져오기
    	      if (hiddenReview.style.display !== 'block') {
    	        hiddenReview.style.display = 'block'
    	      } else {
    	        hiddenReview.style.display = 'none'
    	      }
    	    })
    	  })
    	})
    	
    	function likeHandler(){
    		const mypickBtn = document.getElementById('mypickBtn')
    		
    		if(mypickBtn.innerHTML === '찜하기'){
    			mypickBtn.innerHTML = '찜 취소'
    			
    			$.post('${cpath}/main/like',
    					{gocamp: '${view.contentId}'},
    					function(data){
    						alert('찜하기 완료(찜 목록에서 확인해주세요)')
    					})
    		}
    		else{
    			mypickBtn.innerHTML = '찜하기'

    			$.post('${cpath}/main/dislike',
    					{gocamp: '${view.contentId}'},
    					function(data){
    						alert('찜하기 취소 완료')

    					})
    		}
    }






    </script>


<script>
    	const lctCl = '${view.lctCl}'
        // 헤더의 배경이미지 설정용 자바스크립트
        const id = '${view.contentId}'
        window.onload = viewBannerHandler;
              
        const introNavList = document.querySelectorAll('ul#campIntroNav > li');
        const introDivList =  document.querySelectorAll('div#viewIntro > div');
        
        introNavList.forEach((element, index) => {
            element.onclick = function() {
                // 모든 탭의 selected 클래스를 제거한다
                introNavList.forEach(e => e.classList.remove('selected'));
                introDivList.forEach(e => e.classList.remove('selected'));

                // 클릭된 항목은 selected 클래스를 추가한다
                introNavList[index].classList.add('selected');
                introDivList[index].classList.add('selected');
            }
        });

        // 주변 풍경 띄워주는 intro2
        const viewId = '${view.contentId}';
        const viewShowImage = document.getElementById('viewShowImage')
        viewShowImage.addEventListener('click', imageRequestHandler(id))
        const imageOverlay = document.getElementById('imageModalOverlay')
        imageOverlay.addEventListener('click', (event) => {
        	if (event.target === imageOverlay) {  // 이벤트를 오로지 오버레이에만 적용
        		modalCloseHandler()
        	}
        })
		document.getElementById('imageViewClose').addEventListener('click', () => {
        	modalCloseHandler()	
		})
		
		// 사진의 크기를 스크롤로 조정
		const imageItem = document.getElementById('imageItem');
		 // 초기 이미지 폭
		let currentWidth = 800;
		 
		imageItem.addEventListener('wheel', (event) => {
			imageScrollHandler(event)
		});
			
        // 지도를 띄워주는 intro3
        const x = '${view.mapX}'
        const y = '${view.mapY}'
        const facltNm = '${view.facltNm}'
        let tel = '${view.tel}'
        const viewShowMap = document.getElementById('viewShowMap')
        viewShowMap.addEventListener('click', viewMapHandler)
    </script>




</body>
</html>