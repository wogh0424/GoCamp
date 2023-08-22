<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=x9jrgpo39q"></script>
<script src="${cpath }/resources/js/addr.js"></script>
<!-- 공공데이터 api -->
<%-- <script src="${cpath }/resources/js/main.js/"></script> --%>
<!-- main.js  -->

<div class="modal">
	<div class="overlay"></div>
	<div class="modal_body">
		<div class="detailed_search_head">
			<h2>상세검색 메뉴</h2>
			<!--          <button class="search_close_btn">X</button> -->
		</div>
		<div class="detailed_search_choice">
			<form>
				<input type="hidden" name="listTy" value="${listTy }">
				<input type="hidden" name="order" value="${paging.order }">
				<ul>
					<li>
						<div class="category_wrap">
							<div class="category_name">지역별</div>
							<div class="category_box">
								<ul class="flex">
									<li><input type="checkbox" name="dtl_sido" class="check01"
										id="sido01" value="서울시"> <label for="sido01">서울시</label>
									</li>
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
								<ul class="flex">
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
								<ul class="flex">
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
								<ul class="flex">
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
								<ul class="flex">
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
								<ul class="flex">
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
										id="sbrsCl08" value="산책터"> <label for="sbrsCl08">산책터</label>
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
								<ul class="flex">
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
								<span>(※ 실제 결과는 현장사정 및 계절에 따라 달라질 수 있으니 캠핑장 사업주에 직접 확인 후
									이용바랍니다.)</span>
							</div>
						</div>
					</li>
				</ul>
				<div class="search_btn">
					<input type="submit" value="검색하기"> <input type="reset"
						value="초기화">
				</div>
			</form>
		</div>

	</div>
</div>
<button id="openModal">상세검색</button>


<div id="search">
	<form>
		<input type="hidden" name="listTy" value="${listTy }">
		<p>
			<select name="sido">
				<option value="">== 전체 ==</option>
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
			</select> <select name="gungu">
				<option value="">== 전체 ==</option>
			</select> <select name="lctcl">
				<option value="">== 전체테마 ==</option>
				<option value="해변" ${param.lctcl == '해변' ? 'selected' : ''}>해변</option>
				<option value="섬" ${param.lctcl == '섬' ? 'selected' : ''}>섬</option>
				<option value="산" ${param.lctcl == '산' ? 'selected' : ''}>산</option>
				<option value="숲" ${param.lctcl == '숲' ? 'selected' : ''}>숲</option>
				<option value="계곡" ${param.lctcl == '계곡' ? 'selected' : ''}>계곡</option>
				<option value="강" ${param.lctcl == '강' ? 'selected' : ''}>강</option>
				<option value="호수" ${param.lctcl == '호수' ? 'selected' : ''}>호수</option>
				<option value="도심" ${param.lctcl == '도심' ? 'selected' : ''}>도심</option>
			</select>
		</p>
		<input type="search" name="keyword" placeholder="캠핑장 이름으로 검색해주세요" value="${param.keyword }"> 
		<input type="submit" value="검색">
	</form>
</div>

<select id="orderSelect" name="order">
	<option value="clickCnt" ${param.order == 'clickCnt' ? 'selected' : ''}>조회순</option>
	<option value="recmCnt" ${param.order == 'recmCnt' ? 'selected' : ''}>추천순</option>
	<option value="facltNm" ${param.order == 'facltNm' ? 'selected' : ''}>이름순</option>
</select>

<a href="${cpath }/main?order=${paging.order }&listTy="><button id="listTypeChangeBtn" value="${listTy }">${listTy == 'LIST' ? '지도로 보기' : '리스트로 보기'}</button></a>


<c:if test="${listTy == 'LIST'}">
	<div id="mainList">
		<h3>총 ${paging.boardCount }개 캠핑장이 검색되었습니다.</h3>
		<h3>게시판 : ${paging.page } / ${paging.pageCount }</h3>
		<h3>${paging.begin }~${paging.end }</h3>
	
		<c:forEach items="${list }" var="item">
			<div class="item flex">
				<div class="firstImage">
					<a href="${cpath }/view/${item.contentId}"><img
						src="${item.firstImageUrl }" width="300px" height="200px"></a>
				</div>
				<div class="description">
					<div class="cnts flex">
						<div class="clickCnt">조회수 ${item.clickCnt }</div>
						<div class="recmCnt">추천수 ${item.recmCnt }</div>
					</div>
					<div class="where flex">
						<div class="facltNm">
							<a href="${cpath }/view/${item.contentId}">[${item.doNm } ${item.sigunguNm }] ${item.facltNm }</a>
						</div>
					</div>
					<div class="lineIntro">
						<b>${item.lineIntro }</b>
					</div>
					<div class="intro">${item.intro }</div>
					<div class="address flex">${item.addr1 }</div>
					<div class="sbrsCl">
						<c:set var="splitSbrs" value="${fn:split(item.sbrsCl, ',') }" />
						<c:forEach var="sbrs" items="${splitSbrs}">
							<span>${sbrs }</span>
						</c:forEach>
					</div>
				</div>
			</div>
		</c:forEach>
		<div class="paging frame">
			<c:if test="${paging.prev }">
				<a href="${cpath }/main?listTy=${listTy}&order=${paging.order}"><button class="page" value="${paging.begin - paging.perPage}">[이전]</button></a>
			</c:if>
	
			<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
				<a href="${cpath }/main?listTy=${listTy}&order=${paging.order}"><button class="page" value="${i}">${i }</button></a>
			</c:forEach>
	
			<c:if test="${paging.next }">
				<a href="${cpath }/main?listTy=${listTy}&order=${paging.order}"><button class="page" value="${paging.end + 1}">[다음]</button></a>
			</c:if>
		</div>
	</div>
</c:if>

<c:if test="${listTy == 'MAP' }">
	<div id="mapList">
		<div class="showMap flex">
			<div id="map" style="width: 800px; height: 60vh; padding:0px">
				
			</div>
			<div class="mapInfo">
				<ul id="campInfo">
					<c:forEach items="${list }" var="item">
						<li class="mapItem" x="${item.mapX }" y="${item.mapY }" cid="${item.contentId }">
							<a href="${cpath }/view/${item.contentId}">[${item.doNm } ${item.sigunguNm }] <span class="mapFacltNm">${item.facltNm }</span></a><br>
							<b class="mapAddr1">${item.addr1 }</b><br>
							<b class="mapTel">${item.tel }</b>
						</li>
					</c:forEach>
				</ul>
				<div class="pagingBtns flex">
					<a href="${cpath }/main?listTy=${listTy}&order=${paging.order}"><button class="page" value="${param.page !=  '' || param.page <= 1 ? param.page - 1 : 1}">PREV</button></a>
					<div class="currentMapPage">${paging.page}/${paging.pageCount }</div>
					<a href="${cpath }/main?listTy=${listTy}&order=${paging.order}"><button class="page" value="${param.page != '' || param.page >= paging.pageCount ? param.page + 1 : paging.pageCount}">NEXT</button></a>
				</div>
			</div>
		</div>
	</div>
</c:if>

<script>
	// 정렬 변경용 함수
   function orderByHandler(event) {
      location.href = '${cpath}/main?listTy=${listTy}&order=' + event.target.value + orderUrlParameterWriter()
   }
   
   // 시도에 따른 군구 옵션을 채워주는 함수
   function sigunguHandler() {
      // 시도의 값을 받아옴
      var sido = document.querySelector('select[name="sido"]').value
      if (sido == '') {
         return
      }
      var sigungu = addr[sido].split(',')
      
      // gungu 내부의 값을 초기화
      const gungu = document.querySelector('select[name="gungu"]')
      gungu.innerHTML = ''
      const defaultOpt = document.createElement('option')
      defaultOpt.innerText = '== 전체 =='
      defaultOpt.value = ''
      gungu.append(defaultOpt)
      
      sigungu.forEach(ob => {
         const option = document.createElement('option')
         option.innerText = ob
         option.value = ob
         gungu.append(option)
      })
   } 
   
   // 페이지가 새로고침 되었을 때도 군구 파라미터가 남아있도록 하기 위해서 만든 함수
   function gunguParamSetter() {
      // 군구 파라미터 값을 받아와 옵션의 value와 비교해서 값이 같으면 'selected' 옵션 추가
      sigunguHandler()
      const gungu = document.querySelector('select[name="gungu"]')
      const gunguParam = '${param.gungu}'
      if (gunguParam == '') {
         return
      }
      var gunguOpts = gungu.options
      Object.values(gunguOpts).forEach(ob => {
         if(ob.value == gunguParam) {
            ob.selected = 'selected'
         }
      })
   }
   
   // 복수의 url 파라미터를 자동으로 부여
   function pageUrlParameterWriter(btn) {
      let url = location.href
      const pageParam = 'page=' + btn.value
      
      // 파라미터가 없을 경우(?가 없음)는 page값만 return   
      if (url.indexOf('?') == -1) {
         return '&' + pageParam
      }
      
      // 파라미터가 있을 경우 ?를 사용해 파라미터 분리
      let url1 = url.split('?') // [1] 요소가 파라미터들이다. 
      
      // '&'으로 파라미터들 분리 
      let url2 = url1[1].split('&')
      
      // page나  listTy가 들어가는 경우에는 파라미터에서 제외시킨다.
      for (let i = 0; i < url2.length; i++) {
         if (url2[i].includes('page') || url2[i].includes('listTy') || url2[i].includes('order')) {
        	url2.splice(i, 1)
        	i--
        	}
        }
          
      let returnUrl = '&'
      // 파라미터가 1개 이상일 경우에만 returnUrl에 부여
      if (url2.length > 0) {
    	 for (let i = 0; i < url2.length; i++) {
    	   	 returnUrl += url2[i] + '&'
    	 }  
      }
      returnUrl += pageParam
      return returnUrl
   }
   
   // 정렬을 클릭했을 때 파라미터를 부여
   function orderUrlParameterWriter() {
      let url = location.href
      
  	  // 파라미터가 없을 경우(?가 없음)는 return  
      if (url.indexOf('?') == -1) {
          return '' 
      }
      let url1 = url.split('?')
      
      let url2 = url1[1].split('&')
      
      // page나 order나 listTy가 들어가는 경우에는 파라미터에서 제외시킨다.
      for (let i = 0; i < url2.length; i++) {
    	  if (url2[i].includes('page') || url2[i].includes('order') || url2[i].includes('listTy')) {
    		  url2.splice(i, 1)
    		  i--
    	  }
      }
      
      let returnUrl = ''
      // 파라미터가 1개 이상일 경우에만 returnUrl에 부여
      if (url2.length > 0) {
	      for (let i = 0; i < url2.length; i++) {
	    	  returnUrl += '&' + url2[i]  
	      }  
      }
      
      return returnUrl
   }
   
   
   function listTypeUrlWriter() {
	   let url = location.href
	      
	  	  // 파라미터가 없을 경우(?가 없음)는 return  
	      if (url.indexOf('?') == -1) {
	          return '' 
	      }
	      let url1 = url.split('?')
	      
	      let url2 = url1[1].split('&')
	      
	      // page나 order나 listTy가 들어가는 경우에는 파라미터에서 제외시킨다.
	      for (let i = 0; i < url2.length; i++) {
	    	  if (url2[i].includes('order') || url2[i].includes('listTy')) {
	    		  url2.splice(i, 1)
	    		  i--
	    	  }
	      }
	      
	      let returnUrl = ''
	      // 파라미터가 1개 이상일 경우에만 returnUrl에 부여
	      if (url2.length > 0) {
		      for (let i = 0; i < url2.length; i++) {
		    	  returnUrl += '&' + url2[i]  
		      }  
	      }
	      
	      return returnUrl
   }
   
   // 버튼을 클릭하면 리스트로 보기, 지도로 보기 사이에서 전환
   function listTypeHandler() {
  	   const typeBtn = document.getElementById('listTypeChangeBtn')
  	   
  	   if (typeBtn.value == 'LIST') {
  		   typeBtn.parentNode.href += 'MAP' + listTypeUrlWriter()
  	   }
  	   else {
  		   typeBtn.parentNode.href += 'LIST' + listTypeUrlWriter()
  	   }
   }
   
   
   document.getElementById('openModal').addEventListener("click", () => {
      document.querySelector('div[class="modal"]').style.display='flex'
   })
   document.querySelector('div[class="overlay"]').addEventListener("click", () => {
      document.querySelector('div[class="modal"]').style.display='none'
   })
   document.getElementById('orderSelect').onchange = orderByHandler
   document.querySelector('select[name="sido"]').onchange = sigunguHandler
   window.onload = gunguParamSetter
   window.addEventListener("load", () => {
      document.querySelectorAll('button[class="page"]').forEach(btn => {
            btn.parentNode.href += pageUrlParameterWriter(btn)
         })
      })
   document.getElementById('listTypeChangeBtn').onclick = listTypeHandler
</script>


<script>
	const mapItemList = document.querySelectorAll('li[class="mapItem"]')
	
	var markers = new Array()
	var infoWindows = new Array()
	
	var map
	
	function mapHandler(event) {
		mapItemList.forEach(li => li.classList.remove('selected'))
		event.target.classList.add('selected')
		
		const x = event.target.getAttribute('x')
		const y = event.target.getAttribute('y')

		const facltNm = event.target.querySelector('span[class="mapFacltNm"]').innerText
		let tel = event.target.querySelector('b[class="mapTel"]').innerText
		const cid = event.target.getAttribute('cid')
		
		if (tel == '') {
			tel = '(홈페이지 방문 바람)'
		}
		
		const coords = new naver.maps.LatLng(y, x)
		const marker = new naver.maps.Marker({
			position: coords,
			map: map
		})
		const infoWindow = new naver.maps.InfoWindow({
			content: '<div class="marker"><a href="${cpath }/view/' + cid + '"><b>' 
					    + facltNm + '</b></a><br>연락처 : ' + tel + 
		   			 '</div>'
		})
		infoWindow.open(map,marker)
		map.setZoom(17)
		map.setCenter(coords)
	}
	
	function markerHandler() {
		map = new naver.maps.Map('map', {
		    zoom: 10,
			zoomControl: true,
			zoomControlOptions : { // 줌 컨트롤 옵션
				position : naver.maps.Position.TOP_RIGHT // 오른쪽 위로 위치 설정
			},
			mapTypeControl : true
		});
		
		mapItemList.forEach(li => {
			const x = li.getAttribute('x')
			const y = li.getAttribute('y')
	
			const coords = new naver.maps.LatLng(y, x)
			
			const facltNm = li.querySelector('span[class="mapFacltNm"]').innerText
			let tel = li.querySelector('b[class="mapTel"]').innerText
			const cid = li.getAttribute('cid')
			
			if (tel == '') {
				tel = '(홈페이지 방문 바람)'
			}
			
			const marker = new naver.maps.Marker({
				position: coords,
				map: map
			})
			const infoWindow = new naver.maps.InfoWindow({
				content: '<div class="marker"><a href="${cpath }/view/' + cid + '"><b>' 
						    + facltNm + '</b></a><br>연락처 : ' + tel + 
			   			 '</div>'
			})
			markers.push(marker)
			infoWindows.push(infoWindow)
		})
		
		for(let i = 0; i < markers.length; i++) {
			naver.maps.Event.addListener(markers[i], 'click', function(e) {
				if (infoWindows[i].getMap()) {
		            infoWindows[i].close();
		        } else {
		            infoWindows[i].open(map, markers[i]);
		        }
			})
		}
		map.setCenter(markers[0].position)
		infoWindows[0].open(map, markers[0])
	}
	
	
	
	if ('${listTy}' == 'MAP') {
		window.onload = markerHandler
	}
	
	mapItemList.forEach(li => li.onclick = mapHandler)
</script>

</body>
</html>