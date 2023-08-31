<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="../resources/css/main/main.css" type="text/css">
<script src="${cpath }/resources/js/mainview.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=x9jrgpo39q"></script>
    <div id="viewBg">
        <div id="viewHeader">
            <div id="viewName">
                ${view.facltNm } 
            </div>
            <c:if test="${view.lineIntro != '' }">
            <div id="viewIntro">
                ${view.lineIntro }
            </div>
            </c:if>
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
                        <td>${view.lctCl } / ${view.facltDivNm }</td>
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
                        <td><a href="${view.homepage }" style="color: grey;">홈페이지 바로가기</a>✨</td>
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
                    <button class="mypickBtn">찜하기</button>
                    <button class="modifyRequest">정보수정요청</button>
                </div>
            </div>
        </div> <!--end of viewMain-->
        <div id="campIntro">
            <ul id="campIntroNav">
                <li class="selected">캠핑장 소개</li>
                <li id="viewShowImage">주변풍경</li>
                <li id="viewShowMap">위치/주변정보</li>
                <li>캠핑&여행후기</li>
            </ul>
            <div id="viewIntro">
                <div class="intro1 selected">
                    <c:if test="${view.intro != ''}">
                    <div id="featureNm">
                    	${view.intro  }
                    </div>
                    <div class="lastUpdate">
                                                           최종 정보 수정일 : ${view.modifiedtime }
                    </div>
                    </c:if>
                    <c:if test="${view.sbrsCl != ''}">
                    <div class="viewSbrsContent">
                        <div class="sbrsTT"> ▶️ 캠핑장 시설정보</div>
                        <!--forEach문으로 써야할 곳-->
                        <div class="viewSbrsCl">
                            <c:set var="splitSbrs" value="${fn:split(view.sbrsCl, ',') }" />
							<c:forEach var="sbrs" items="${splitSbrs}"> 
							<div class="viewsbrsItem">
								<img src="../resources/image/mainView/${sbrs }.png" width="30px" height="30px"><br>
								<span>${ sbrs}</span>
							</div>
                            </c:forEach>
						</div>
                    </div> <!-- end of viewSbrsContent-->
                    </c:if>
                    <div id="otherFeatures">
                        <div class="otherFeaturesTT"> ▶️ 기타 주요시설</div>
                        <table id="extraFeaturesTable">
                            <tr>
                                <td>기타 정보</td>
                                <td>
                                	개인 트레일러 입장 ${view.trlerAcmpnyAt == 'Y' ? '가능' : '불가능' } &nbsp&nbsp 반려동물 동반 ${view.animalCmgCl  }
                                	<br> (※ 실제 결과는 현장사정 및 계절에 따라 달라질 수 있으니 캠핑장 사업주에 직접 확인 후 이용바랍니다.)
                                </td>
                            </tr>
                            <c:if test="${view.posblFcltyEtc != '' }">
                            <tr>
                            	<td>기타 주변시설</td>
                            	<td>
                            		${view.posblFcltyEtc }
                            	</td>
                            </tr>
                            </c:if>
                            <c:if test="${view.sbrsEtc != '' }">
                            <tr>
                            	<td>기타 부대시설</td>
                            	<td>
                            		${view.sbrsEtc }
                            	</td>
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
                        </table>
                    </div> <!-- end of otherFeatures -->
                    <div class="viewNotion">
                    	    ※ 고캠핑에 등록된 정보는 현장상황과 다소 다를 수 있으니 <span style="color:red;">반려동물 동반 여부, 부가 시설물, 추가차량</span> 등 원활한 캠핑을 위해 꼭 필요한 사항은 해당 캠핑장에서 미리 확인하시기 바랍니다.
                    </div>
                </div>
                <div class="intro2">
                    <div class="viewImageTT">
                        	 ▶️ 주변 사진
                    </div>
                    <div id="viewImage">
						
                    </div>
                    <div class="notion">
                    	※ 모든 컨텐츠의 저작권은 고캠핑에 있습니다. 무단 사용 및 불법 재배포는 법적 조치를 받을 수 있습니다.
                    </div>
                </div>
                <div class="intro3">
                    <div class="viewmapTT">
                        	 ▶️ 찾아오시는 길
                    </div>
                    <div id="viewMap">

                    </div>
                    
                </div>
                
                <div class="intro4">
                    <div class="viewReviewTT">
                        	 ▶️ 최근 n건
                    </div>
                    <div id="campReview">
                        <!--forEach로 구현-->
                        <div class="campReviewItems">
                            <ul class="campReviewRow">
                                <li class="reviewRow">1</li>
                                <li class="reviewTT">리뷰 제목</li>
                                <li class="reviewDate">리뷰 작성 날짜</li>
                            </ul>
                        </div>
                        <div class="campReviewItems">
                            <ul class="campReviewRow">
                                <li class="reviewRow">2</li>
                                <li class="reviewTT">리뷰 제목</li>
                                <li class="reviewDate">리뷰 작성 날짜</li>
                            </ul>
                        </div>
                        <div class="campReviewItems">
                            <ul class="campReviewRow">
                                <li class="reviewRow">3</li>
                                <li class="reviewTT">리뷰 제목</li>
                                <li class="reviewDate">리뷰 작성 날짜</li>
                            </ul>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div> <!--end of view-->
    <a style="display:scroll;position:fixed;bottom:50px;right:50px;" rel="nofollow" href="#" title="Back to Top" style="font-size:2em"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMnxaUftutrJ-gMYQrt2loxz_W88m6_z9jFt5PwITMqtwMeZXRxZjCuC3C6LqUSUfsxbY&usqp=CAU" style="width: 80px; height: 80px;"></a>
    <script>
    	const lctCl = '${view.lctCl}';
        // 헤더의 배경이미지 설정용 자바스크립트
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
        viewShowImage.addEventListener('click', imageRequestHandler)
        
        // 지도를 띄워주는 intro3
        const x = '${view.mapX}'
        const y = '${view.mapY}'
        const facltNm = '${view.facltNm}'
        const tel = '${view.tel}'
        const viewShowMap = document.getElementById('viewShowMap')
        viewShowMap.addEventListener('click', viewMapHandler)

    </script>
</body>
</html>