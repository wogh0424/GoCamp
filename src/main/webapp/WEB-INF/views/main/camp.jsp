<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ page import="java.util.Arrays" %>
<link rel="stylesheet" href="${cpath }/resources/css/main/main.css" type="text/css">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=x9jrgpo39q"></script>
<script src="${cpath }/resources/js/addr.js"></script>
<script src="${cpath }/resources/js/mainpage.js"></script>
<!-- 공공데이터 api -->
<!-- main.js  -->

<div id="modal">  <!-- 상세검색 모달 -->
	<div class="overlay"></div>
	<div class="modal_body">
		<div class="detailed_search_head">
			<h2>🔍 원하는 캠핑장을 더 <span class="highlight">상세하게</span> 검색해보세요</h2>
		</div>
		
		<div class="detailed_search_choice">
			<form id="dtl_search">
				<input type="hidden" name="listTy" value="${listTy }">
				<input type="hidden" name="order" value="${paging.order }">
				<ul class="dtl_searchParams">
					<li>
						<div class="category_wrap">
							<div class="category_name">지역별</div>
							<div class="category_box">
								<ul>
									<li><input type="checkbox" name="dtl_sido" class="check01" id="sido01" value="서울시"> <label for="sido01">서울시</label></li>
									<li><input type="checkbox" name="dtl_sido" class="check01"
										id="sido02" value="부산시"> <label for="sido02">부산시</label>
									</li>
									<li><input type="checkbox" name="dtl_sido" class="check01"
										id="sido03" value="대구시"> <label for="sido03">대구시</label>
									</li>
									<li><input type="checkbox" name="dtl_sido" class="check01"
										id="sido04" value="인천시"> <label for="sido04">인천시</label>
									</li>
									<li><input type="checkbox" name="dtl_sido" class="check01"
										id="sido05" value="광주시"> <label for="sido05">광주시</label>
									</li>
									<li><input type="checkbox" name="dtl_sido" class="check01"
										id="sido06" value="대전시"> <label for="sido06">대전시</label>
									</li>
									<li><input type="checkbox" name="dtl_sido" class="check01"
										id="sido07" value="울산시"> <label for="sido07">울산시</label>
									</li>
									<li><input type="checkbox" name="dtl_sido" class="check01"
										id="sido08" value="세종시"> <label for="sido08">세종시</label>
									</li>
									<li><input type="checkbox" name="dtl_sido" class="check01"
										id="sido09" value="경기도"> <label for="sido09">경기도</label>
									</li>
									<li><input type="checkbox" name="dtl_sido" class="check01"
										id="sido10" value="강원도"> <label for="sido10">강원도</label>
									</li>
									<li><input type="checkbox" name="dtl_sido" class="check01"
										id="sido11" value="충청북도"> <label for="sido11">충청북도</label>
									</li>
									<li><input type="checkbox" name="dtl_sido" class="check01"
										id="sido12" value="충청남도"> <label for="sido12">충청남도</label>
									</li>
									<li><input type="checkbox" name="dtl_sido" class="check01"
										id="sido13" value="전라북도"> <label for="sido13">전라북도</label>
									</li>
									<li><input type="checkbox" name="dtl_sido" class="check01"
										id="sido14" value="전라남도"> <label for="sido14">전라남도</label>
									</li>
									<li><input type="checkbox" name="dtl_sido" class="check01"
										id="sido15" value="경상북도"> <label for="sido15">경상북도</label>
									</li>
									<li><input type="checkbox" name="dtl_sido" class="check01"
										id="sido16" value="경상남도"> <label for="sido16">경상남도</label>
									</li>
									<li><input type="checkbox" name="dtl_sido" class="check01"
										id="sido17" value="제주도"> <label for="sido17">제주도</label>
									</li>
								</ul>
							</div>
						</div>
					</li>
					<li>
						<div class="category_wrap">
							<div class="category_name">운영형태</div>
							<div class="category_box">
								<ul>
									<li><input type="checkbox" name="facltDivNm"
										class="check02" id="divNm01" value="지자체"> <label
										for="divNm01">지자체</label></li>
									<li><input type="checkbox" name="facltDivNm"
										class="check02" id="divNm02" value="국립공원"> <label
										for="divNm02">국립공원</label></li>
									<li><input type="checkbox" name="facltDivNm"
										class="check02" id="divNm03" value="자연휴양림"> <label
										for="divNm03">자연휴양림</label></li>
									<li><input type="checkbox" name="facltDivNm"
										class="check02" id="divNm04" value="국민여가"> <label
										for="divNm04">국민여가</label></li>
									<li><input type="checkbox" name="facltDivNm"
										class="check02" id="divNm05" value="민간"> <label
										for="divNm05">민간</label></li>
								</ul>
							</div>
						</div>
					</li>
					<li>
						<div class="category_wrap">
							<div class="category_name">입지구분</div>
							<div class="category_box">
								<ul>
									<li><input type="checkbox" name="dtl_lctcl"
										class="check03" id="lctcl01" value="해변"> <label
										for="lctcl01">해변</label></li>
									<li><input type="checkbox" name="dtl_lctcl"
										class="check03" id="lctcl02" value="섬"> <label
										for="lctcl02">섬</label></li>
									<li><input type="checkbox" name="dtl_lctcl"
										class="check03" id="lctcl03" value="산"> <label
										for="lctcl03">산</label></li>
									<li><input type="checkbox" name="dtl_lctcl"
										class="check03" id="lctcl04" value="숲"> <label
										for="lctcl04">숲</label></li>
									<li><input type="checkbox" name="dtl_lctcl"
										class="check03" id="lctcl05" value="계곡"> <label
										for="lctcl05">계곡</label></li>
									<li><input type="checkbox" name="dtl_lctcl"
										class="check03" id="lctcl06" value="강"> <label
										for="lctcl06">강</label></li>
									<li><input type="checkbox" name="dtl_lctcl"
										class="check03" id="lctcl07" value="호수"> <label
										for="lctcl07">호수</label></li>
									<li><input type="checkbox" name="dtl_lctcl"
										class="check03" id="lctcl08" value="도심"> <label
										for="lctcl08">도심</label></li>
								</ul>
							</div>
						</div>
					</li>
					<li>
						<div class="category_wrap">
							<div class="category_name">주요시설</div>
							<div class="category_box">
								<ul>
									<li><input type="checkbox" name="induty" class="check04"
										id="induty01" value="일반야영장"> <label for="induty01">일반야영장</label>
									</li>
									<li><input type="checkbox" name="induty" class="check04"
										id="induty02" value="자동차야영장"> <label for="induty02">자동차야영장</label>
									</li>
									<li><input type="checkbox" name="induty" class="check04"
										id="induty03" value="카라반"> <label for="induty03">카라반</label>
									</li>
									<li><input type="checkbox" name="induty" class="check04"
										id="induty04" value="글램핑"> <label for="induty04">글램핑</label>
									</li>
								</ul>
							</div>
						</div>
					</li>
					<li>
						<div class="category_wrap">
							<div class="category_name">테마별</div>
							<div class="category_box">
								<ul>
									<li><input type="checkbox" name="themaEnvrnCl"
										class="check05" id="themaEnvrnCl01" value="일출명소"> <label
										for="themaEnvrnCl01">일출명소</label></li>
									<li><input type="checkbox" name="themaEnvrnCl"
										class="check05" id="themaEnvrnCl02" value="일몰명소"> <label
										for="themaEnvrnCl02">일몰명소</label></li>
									<li><input type="checkbox" name="themaEnvrnCl"
										class="check05" id="themaEnvrnCl03" value="수상레저"> <label
										for="themaEnvrnCl03">수상레저</label></li>
									<li><input type="checkbox" name="themaEnvrnCl"
										class="check05" id="themaEnvrnCl04" value="항공레저"> <label
										for="themaEnvrnCl04">항공레저</label></li>
									<li><input type="checkbox" name="themaEnvrnCl"
										class="check05" id="themaEnvrnCl05" value="스키"> <label
										for="themaEnvrnCl05">스키</label></li>
									<li><input type="checkbox" name="themaEnvrnCl"
										class="check05" id="themaEnvrnCl06" value="낚시"> <label
										for="themaEnvrnCl06">낚시</label></li>
									<li><input type="checkbox" name="themaEnvrnCl"
										class="check05" id="themaEnvrnCl07" value="액티비티"> <label
										for="themaEnvrnCl07">액티비티</label></li>
									<li><input type="checkbox" name="themaEnvrnCl"
										class="check05" id="themaEnvrnCl08" value="봄꽃여행"> <label
										for="themaEnvrnCl08">봄꽃여행</label></li>
									<li><input type="checkbox" name="themaEnvrnCl"
										class="check05" id="themaEnvrnCl09" value="여름물놀이"> <label
										for="themaEnvrnCl09">여름물놀이</label></li>
									<li><input type="checkbox" name="themaEnvrnCl"
										class="check05" id="themaEnvrnCl10" value="가을단풍명소"> <label
										for="themaEnvrnCl10">가을단풍명소</label></li>
									<li><input type="checkbox" name="themaEnvrnCl"
										class="check05" id="themaEnvrnCl11" value="겨울눈꽃명소"> <label
										for="themaEnvrnCl11">겨울눈꽃명소</label></li>
									<li><input type="checkbox" name="themaEnvrnCl"
										class="check05" id="themaEnvrnCl12" value="걷기길"> <label
										for="themaEnvrnCl12">걷기길</label></li>
								</ul>
							</div>
						</div>
					</li>
					<li>
						<div class="category_wrap">
							<div class="category_name">부대시설</div>
							<div class="category_box">
								<ul>
									<li><input type="checkbox" name="sbrsCl" class="check06"
										id="sbrsCl01" value="전기"> <label for="sbrsCl01">전기</label>
									</li>
									<li><input type="checkbox" name="sbrsCl" class="check06"
										id="sbrsCl02" value="무선인터넷"> <label for="sbrsCl02">무선인터넷</label>
									</li>
									<li><input type="checkbox" name="sbrsCl" class="check06"
										id="sbrsCl03" value="장작판매"> <label for="sbrsCl03">장작판매</label>
									</li>
									<li><input type="checkbox" name="sbrsCl" class="check06"
										id="sbrsCl04" value="온수"> <label for="sbrsCl04">온수</label>
									</li>
									<li><input type="checkbox" name="sbrsCl" class="check06"
										id="sbrsCl05" value="트렘폴린"> <label for="sbrsCl05">트렘폴린</label>
									</li>
									<li><input type="checkbox" name="sbrsCl" class="check06"
										id="sbrsCl06" value="물놀이장"> <label for="sbrsCl06">물놀이장</label>
									</li>
									<li><input type="checkbox" name="sbrsCl" class="check06"
										id="sbrsCl07" value="놀이터"> <label for="sbrsCl07">놀이터</label>
									</li>
									<li><input type="checkbox" name="sbrsCl" class="check06"
										id="sbrsCl08" value="산책로"> <label for="sbrsCl08">산책로</label>
									</li>
									<li><input type="checkbox" name="sbrsCl" class="check06"
										id="sbrsCl09" value="운동장"> <label for="sbrsCl09">운동장</label>
									</li>
									<li><input type="checkbox" name="sbrsCl" class="check06"
										id="sbrsCl10" value="운동시설"> <label for="sbrsCl10">운동시설</label>
									</li>
									<li><input type="checkbox" name="sbrsCl" class="check06"
										id="sbrsCl11" value="마트.편의점"> <label for="sbrsCl11">마트.편의점</label>
									</li>
								</ul>
							</div>
						</div>
					</li>
					<li>
						<div class="category_wrap">
							<div class="category_name">기타정보</div>
							<div class="category_box">
								<ul>
									<li><input type="checkbox" name="trlerAcmpnyAt"
										class="check06" id="acmpnyAt01" value="Y"> <label
										for="acmpnyAt01">개인 트레일러 입장 가능</label></li>
									<li><input type="checkbox" name="caravAcmpnyAt"
										class="check06" id="acmpnyAt02" value="Y"> <label
										for="acmpnyAt02">개인 캠핑카 입장 가능</label></li>
									<li><input type="checkbox" name="animalCmgCl"
										class="check06" id="acmpnyAt03" value="Y"> <label
										for="acmpnyAt03">반려동물 동반가능</label></li>
								</ul>
								<div class="notion">(※ 실제 결과는 현장사정 및 계절에 따라 달라질 수 있으니 캠핑장 사업주에 직접 확인 후
									이용바랍니다.)</div>
							</div>
						</div>
					</li>
				</ul>
				<div class="search_btn">
					<input type="submit" value="검색하기"> <input type="reset"
						value="초기화">
				</div>
			</form>
		</div>  <!-- dtl search end -->
	</div> <!-- modal_body end -->
</div> <!-- modal end -->


<div id="searchBg" style="background-image: url('${cpath}/resources/image/main/searchBg.jpg');">
	<div id="searchHeader">
		<table class="Calendar">
            <thead>
                <tr>
                    <td onClick="prevCalendar();" style="cursor:pointer;">&#60;</td>
                    <td colspan="5">
                        <span id="calYear"></span>년
                        <span id="calMonth"></span>월
                    </td>
                    <td onClick="nextCalendar();" style="cursor:pointer;">&#62;</td>
                </tr>
                <tr>
                    <td><span class="red">일</span></td>
                    <td>월</td>
                    <td>화</td>
                    <td>수</td>
                    <td>목</td>
                    <td>금</td>
                    <td><span class="blue">토</span></td>
                </tr>
            </thead>

            <tbody>
            </tbody>
        </table>
		<div id="search">
			<ul class="searchNav">
				<li class="selected">🔍 간단검색</li>
				<li>📌 추천태그검색</li>
			</ul>
			<div class="selected">
				<h4>🔍 간단검색</h4>
				<form class="searchOpt">
					<input type="hidden" name="listTy" value="${listTy }">
					<div style="display:flex; flex-flow:wrap;">
					<select name="sido">
						<option value="">=== 시 / 도 ===</option>
						<option value="서울시" ${param.sido == '서울시' ? 'selected' : ''}>서울시</option>
						<option value="부산시" ${param.sido == '부산시' ? 'selected' : ''}>부산시</option>
						<option value="대구시" ${param.sido == '대구시' ? 'selected' : ''}>대구시</option>
						<option value="인천시" ${param.sido == '인천시' ? 'selected' : ''}>인천시</option>
						<option value="광주시" ${param.sido == '광주시' ? 'selected' : ''}>광주시</option>
						<option value="대전시" ${param.sido == '대전시' ? 'selected' : ''}>대전시</option>
						<option value="울산시" ${param.sido == '울산시' ? 'selected' : ''}>울산시</option>
						<option value="세종시" ${param.sido == '세종시' ? 'selected' : ''}>세종시</option>
						<option value="경기도" ${param.sido == '경기도' ? 'selected' : ''}>경기도</option>
						<option value="강원도" ${param.sido == '강원도' ? 'selected' : ''}>강원도</option>
						<option value="충청북도" ${param.sido == '충청북도' ? 'selected' : ''}>충청북도</option>
						<option value="충청남도" ${param.sido == '충청남도' ? 'selected' : ''}>충청남도</option>
						<option value="전라북도" ${param.sido == '전라북도' ? 'selected' : ''}>전라북도</option>
						<option value="전라남도" ${param.sido == '전라남도' ? 'selected' : ''}>전라남도</option>
						<option value="경상북도" ${param.sido == '경상북도' ? 'selected' : ''}>경상북도</option>
						<option value="경상남도" ${param.sido == '경상남도' ? 'selected' : ''}>경상남도</option>
						<option value="제주도" ${param.sido == '제주도' ? 'selected' : ''}>제주도</option>
					</select> 
					<select name="gungu">
						<option value="">=== 군 / 구 ===</option>
					</select>
					<select name="lctcl">
						<option value="">=== 테마 ===</option>
						<option value="해변" ${param.lctcl == '해변' ? 'selected' : ''}>해변</option>
						<option value="섬" ${param.lctcl == '섬' ? 'selected' : ''}>섬</option>
						<option value="산" ${param.lctcl == '산' ? 'selected' : ''}>산</option>
						<option value="숲" ${param.lctcl == '숲' ? 'selected' : ''}>숲</option>
						<option value="계곡" ${param.lctcl == '계곡' ? 'selected' : ''}>계곡</option>
						<option value="강" ${param.lctcl == '강' ? 'selected' : ''}>강</option>
						<option value="호수" ${param.lctcl == '호수' ? 'selected' : ''}>호수</option>
						<option value="도심" ${param.lctcl == '도심' ? 'selected' : ''}>도심</option>
					</select>		
					</div>
					<div id="mainSearchBtn">
						<input list="searchBar" type="search" name="keyword" id="searchKeyword" placeholder="검색어를 입력하세요" value="${param.keyword }" autocomplete="off">
						<datalist id="searchBar"></datalist> 
						<button id="mainSearch">검색</button>
						<button id="openModal">상세조건 +</button>
					</div>
				
				</form>
			</div> <!-- end of simplesearch -->
			<div>
				<div id="tag_search">
					<h4>📌 <span style="color:#1C84C6 ">추천태그</span>를 클릭해서 검색해보세요 </h4>
					<hr>
					<div>
						<ul class="tag_search_choice">
							<c:forEach items="${ tags}" var="tagSelection">
								<li><a href="javascript:void(0)" class="tag_s" id="${tagSelection.tagNum }">#${tagSelection.tagName }</a></li>
							</c:forEach>
						</ul>			
					</div>
				</div>
				<div class="tagBtns" style="display:flex;">
					<button id="tag_resetBtn">🔄️ 태그선택초기화</button>
					<button id="tag_searchBtn">추천태그검색</button>
				</div>
			</div> <!-- end of tag_search -->
		</div> <!-- end of search -->
	</div> <!--  end of searchHeader -->
</div> <!-- end of searchBg -->


<div id="main">
	<div id="campCount">총 <span style="color: #91C148;">${paging.boardCount }</span>개 캠핑장이 조회되었습니다.</div>
	<div id="mainHeader" >
		<select id="orderSelect" name="order">
			<option value="clickCnt" ${param.order == 'clickCnt' ? 'selected' : ''}>조회순</option>
			<option value="recmCnt" ${param.order == 'recmCnt' ? 'selected' : ''}>추천순</option>
			<option value="facltNm" ${param.order == 'facltNm' ? 'selected' : ''}>이름순</option>
		</select>
		
		<a href="${cpath }/main/camp?order=${paging.order }&listTy="><button id="listTypeChangeBtn" value="${listTy }">${listTy == 'LIST' ? '지도로 보기' : '리스트로 보기'}</button></a>
	</div>

	<div id="gocampMain" style="max-width: 100%; margin: 0px auto; ">
	<c:if test="${listTy == 'LIST'}">
		<div id="mainList">
			<c:if test="${list.size() == 0 }"> 
				<div class="noItem" style="width: 100%; height: 100px;text-align: center; font-weight: bold; font-size: 30px; line-height: 100px; margin: 20px; padding: 30px;">
					🥲 검색된 캠핑장이 없습니다. 
				</div>
			</c:if>
			<c:forEach items="${list }" var="item">
				<div class="mainlistItem">
					<div class="firstImage">
						<a href="${cpath }/main/view/${item.contentId}">
						<c:if test="${fn:contains(item.firstImageUrl, 'gocamping') }">
							<img src="${item.firstImageUrl }" width="300px" height="200px" style="margin-right: 30px;">
						</c:if>
						<c:if test="${!fn:contains(item.firstImageUrl, 'gocamping') }">
							<img src="${cpath }/upload/${item.firstImageUrl }" width="300px" height="200px" style="margin-right: 30px;">
						</c:if>
						</a>
					</div>
					<div class="description">
						<div class="cnts">
							<div class="clickCnt">조회수 ${item.clickCnt }</div>
							<div class="recmCnt">추천수 ${item.recmCnt }</div>
							<c:if test="${sessionScope.permission == 'ROLE_ADMIN'}">
								<a href="${cpath }/main/modifycamp/${item.contentId}"><button class="modifyCampBtn">정보 수정</button></a>
								<a href="${cpath }/main/deletecamp/${item.contentId}" onclick="return confirm('정말로 삭제하시겠습니까? 삭제 후 복구는 불가능합니다.')"><button class="delectCampBtn">캠핑장 삭제</button></a>
							</c:if>
						</div>
						<div class="where">
							<div class="facltNm">
								<a href="${cpath }/main/view/${item.contentId}">[${item.doNm } ${item.sigunguNm }] ${item.facltNm }</a>
							</div>
						</div>
						<c:if test="${item.lineIntro != '' }">
						<div class="lineIntro">
							<b>${item.lineIntro }</b>
						</div>
						</c:if>
						<c:if test="${item.intro != '' }">
						<div class="intro">${item.intro }</div>
						</c:if>
						<div class="address">
							<img src="${cpath }/resources/image/main/location.png" width=22px height=22px; style="margin-right: 10px;"> ${item.addr1 } 
							<img src="${cpath }/resources/image/main/phone.png" width=22px height=22px; style="margin: 0 10px 0 20px;"> ${item.tel != '' ? item.tel : '홈페이지 방문 바람' }
						</div>
						<c:if test="${item.sbrsCl != ''}">
						<div class="sbrsCl">
							<c:set var="splitSbrs" value="${fn:split(item.sbrsCl, ',') }" />
							<c:forEach var="sbrs" items="${splitSbrs}">
									<div class="sbrsItem">
										<img src="${cpath }/resources/image/main/${sbrs}.png" width="30px" height="30px"><br>
										<span>${ sbrs}</span>
									</div>
							</c:forEach>
						</div>
						</c:if>
					</div> <!-- end of description -->
				</div> <!-- end of item -->
			</c:forEach>
			
			
			<div class="main_paging">
				<ul class="paging">
				<c:if test="${paging.prev }">
					<li class="np"><a href="${cpath }/main/camp?listTy=${listTy}&order=${paging.order}"><button class="page" value="1" ><b>〈〈</b></button></a><li>
					<li class="np"><a href="${cpath }/main/camp?listTy=${listTy}&order=${paging.order}"><button class="page" value="${paging.begin - paging.perPage}" ><b>〈</b></button></a><li>
				</c:if>

				<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
					<li><a href="${cpath }/main/camp?listTy=${listTy}&order=${paging.order}"><button class="page" value="${i}">${i }</button></a></li>
				</c:forEach>
				
				<c:if test="${paging.next }">
					<li class="np"><a href="${cpath }/main/camp?listTy=${listTy}&order=${paging.order}"><button class="page" value="${paging.end + 1}" ><b>〉</b></button></a><li>
					<li class="np"><a href="${cpath }/main/camp?listTy=${listTy}&order=${paging.order}"><button class="page" value="${paging.pageCount}" ><b>〉〉</b></button></a><li>
				</c:if>
				</ul>
			</div>
			
			
		</div> <!-- end of mainList -->
	</c:if>
	
	<c:if test="${listTy == 'MAP' }">
		<div id="navermap" style="width: 100%;">
			<div class="showMap" style="width: 100%">
				<div id="map">
					
				</div>
				<div class="campList_map">
					<ul id="mapList">
						<c:forEach items="${list }" var="item" varStatus="st">
							<li class="mapItem" x="${item.mapX }" y="${item.mapY }" cid="${item.contentId }" st="${st.index }" facltNm="${item.facltNm }" tel="${item.tel }">
								<a href="${cpath }/main/view/${item.contentId}">[${item.doNm } ${item.sigunguNm }] ${item.facltNm }</a><br>
								<b>${item.addr1 }</b><br>
								<b>${item.tel }</b>
							</li>
						</c:forEach>
					</ul>
					<div class="map_paging">
						<a href="${cpath }/main/camp?listTy=${listTy}&order=${paging.order}"><button class="page" value="${param.page <= 1 ? 1 : paging.page - 1}">PREV</button></a>
						<div class="currentMapPage"><b style="color: #1C84C6;">${paging.page}</b>/${paging.pageCount }</div>
						<a href="${cpath }/main/camp?listTy=${listTy}&order=${paging.order}"><button class="page" value="${param.page > paging.pageCount ? paging.pageCount : paging.page + 1}">NEXT</button></a>
					</div>
				</div>
			</div> <!-- end of showMap -->
		</div> <!-- end of naverMap -->
	</c:if>
	</div> <!-- end of gocampMain -->
</div><!-- end of main -->

<%@include file="../footer.jsp" %>

    <a style="display:scroll;position:fixed;bottom:50px;right:50px;text-decoration: none;" rel="nofollow" href="#" title="Back to Top"><span style="width: 80px; height: 80px; font-size: 50px;">⏫</span></a>
<script>
	// 상세검색 모달
   document.getElementById('openModal').addEventListener("click", (event) => {
	  event.preventDefault()
      document.getElementById('modal').style.display = 'flex'
      document.body.style.overflow = 'none'
   })
   // 상세검색 오버레이
   document.querySelector('div[class="overlay"]').addEventListener("click", () => {
      document.getElementById('modal').style.display = 'none'
      document.body.style.overflow = 'auto';	
   })
   // 정렬
   document.getElementById('orderSelect').onchange = orderByHandler
   // 시도에 따라 군구부여
   document.querySelector('select[name="sido"]').onchange = sigunguHandler
   // 파라미터를 유지하기 위해 만든 함수
   window.onload = sigunguHandler
   window.addEventListener("load", parameterHandler)
   // 페이지 변경시 page 버튼들의 파라미터를 설정해준다.
   window.addEventListener("load", () => {
      document.querySelectorAll('button[class="page"]').forEach(btn => {
            btn.parentNode.href += pageUrlParameterWriter(btn)
         })
      })
   // 리스트 보여주는 방식 변경
   document.getElementById('listTypeChangeBtn').onclick = listTypeHandler
</script>


<script>
	const mapItemList = document.querySelectorAll('li[class="mapItem"]')
	const mapList = document.getElementById('')
	const listTy = '${listTy}'
	var markers = new Array()
	var infoWindows = new Array()
	
	var map
	
	// listTy가 map일 때 map을 로드
	if (listTy == 'MAP') {
		map =  new naver.maps.Map('map', {
		    zoom: 11,
			zoomControl: true,
			zoomControlOptions : { // 줌 컨트롤 옵션
				position : naver.maps.Position.TOP_RIGHT // 오른쪽 위로 위치 설정
			},
			mapTypeControl : true
		});
		window.onload = markerHandler
	}
	// 지도의 아이템들을 관리
	mapItemList.forEach(li => li.onclick = mapHandler)
	
	const searchNavList = document.querySelectorAll('ul.searchNav > li');
    const searchDivList =  document.querySelectorAll('div#search > div');
    
    // 선택된 창에만 selected를 부여
    searchNavList.forEach((element, index) => {
        element.onclick = function() {
            // 모든 탭의 selected 클래스를 제거한다
            searchNavList.forEach(e => e.classList.remove('selected'));
            searchDivList.forEach(e => e.classList.remove('selected'));

            // 클릭된 항목은 selected 클래스를 추가한다
            searchNavList[index].classList.add('selected');
            searchDivList[index].classList.add('selected');
        }
    });
	
    const tagOptList = document.querySelectorAll('a.tag_s');
    const tag_reset = document.getElementById('tag_resetBtn')
    const tag_search = document.getElementById('tag_searchBtn')
    
    // 태그들의 설정을 관리
    tag_reset.onclick = tagResetHandler
    tag_search.onclick = tagSearchHandler
    
    tagOptList.forEach(a => a.onclick = tagHandler)
</script>

<script>
   // 검색어 자동완성 기능
	const dataList = document.getElementById('searchBar')
	const search = document.getElementById('searchKeyword')
	
	search.onkeyup = autoCompletionHandler
	
</script>

<script>
		window.addEventListener('load', function () {
			    buildCalendar();
			});    // 웹 페이지가 로드되면 buildCalendar 실행

        let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
        let today = new Date();     // 페이지를 로드한 날짜를 저장
        today.setHours(0, 0, 0, 0);    // 비교 편의를 위해 today의 시간을 초기화

        // 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
</script>

</body>
</html>