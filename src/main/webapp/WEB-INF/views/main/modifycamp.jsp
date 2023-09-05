<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="${cpath }/resources/css/main/mainCRUD.css" type="text/css">
<script src="${cpath }/resources/js/addr.js"></script>
<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=x9jrgpo39q&submodules=geocoder"></script>
<script src="${cpath }/resources/js/mainadd.js"></script>


<div style="max-width: 1200px; margin: 30px auto;  border: 2px solid black;padding: 20px 5px;">
	<h1 style="text-align: center; ">캠핑장 수정</h1>
	<form method="POST" enctype="multipart/form-data" id="modifyForm" >
		<div id="modifycamp">
			<div class="division" style="border-bottom: 1px dashed grey;"> <!-- top구획 -->
				<div style="flex:1;"><!-- 이미지 구획 -->
					<strong class="green">기존 이미지</strong>
					<c:if test="${fn:contains(item.firstImageUrl, 'gocamping') }">
						<img src="${item.firstImageUrl }" width="100%" height="auto">
					</c:if>
					<c:if test="${!fn:contains(item.firstImageUrl, 'gocamping') }">
						<img src="${cpath }/resources/upload/camp/${item.firstImageUrl }" width="100%" height="auto">
					</c:if>
					<p></p>
					<label class="image" for="firstimage">이미지 넣기</label>
				    <input type="file" name="imageFile" id="firstimage" accept="image/*" >
				  	<div id="imagePreview">교체할 이미지</div>
				</div>
				<div style="flex:3; min-height: 480px;">  <!-- top의 top 구획 -->
				  	<div class="division"> <!-- 주소 구획 -->
				  		<div style="flex: 1; padding-right: 30px">
				  			<p><strong class="green">캠핑장 ID</strong>
							<input type="number" id="cid" name="contentId" value="${item.contentId }" readonly="readonly" ></p>
							<p><strong class="green">캠핑장 이름</strong>
							<input type="text" name="facltNm" value="${item.facltNm }" placeholder="캠핑장 이름" autocomplete="off" required></p>
							<strong class="green">캠핑장 한줄 소개</strong>
							<p><textarea name="lineIntro" autocomplete="off" placeholder="캠핑장 한줄 소개">${item.lineIntro }</textarea></p>
				  		</div>
				  		<div style="flex:1; ">
				  			<strong class="green">지역(시/군/구)선택</strong>
					  		<p>
								<select name="doNm" required="required">
									<option value="">=== 시 / 도 ===</option>
									<option value="서울시" ${item.doNm == '서울시' ? 'selected' : ''}>서울시</option>
									<option value="부산시" ${item.doNm == '부산시' ? 'selected' : ''}>부산시</option>
									<option value="대구시" ${item.doNm == '대구시' ? 'selected' : ''}>대구시</option>
									<option value="인천시" ${item.doNm == '인천시' ? 'selected' : ''}>인천시</option>
									<option value="광주시" ${item.doNm == '광주시' ? 'selected' : ''}>광주시</option>
									<option value="대전시" ${item.doNm == '대전시' ? 'selected' : ''}>대전시</option>
									<option value="울산시" ${item.doNm == '울산시' ? 'selected' : ''}>울산시</option>
									<option value="세종시" ${item.doNm == '세종시' ? 'selected' : ''}>세종시</option>
									<option value="경기도" ${item.doNm == '경기도' ? 'selected' : ''}>경기도</option>
									<option value="강원도" ${item.doNm == '강원도' ? 'selected' : ''}>강원도</option>
									<option value="충청북도" ${item.doNm == '충청북도' ? 'selected' : ''}>충청북도</option>
									<option value="충청남도" ${item.doNm == '충청남도' ? 'selected' : ''}>충청남도</option>
									<option value="전라북도" ${item.doNm == '전라북도' ? 'selected' : ''}>전라북도</option>
									<option value="전라남도" ${item.doNm == '전라남도' ? 'selected' : ''}>전라남도</option>
									<option value="경상북도" ${item.doNm == '경상북도' ? 'selected' : ''}>경상북도</option>
									<option value="경상남도" ${item.doNm == '경상남도' ? 'selected' : ''}>경상남도</option>
									<option value="제주도" ${item.doNm == '제주도' ? 'selected' : ''}>제주도</option>
								</select>
								<select name="sigunguNm">
									<option value="">=== 군 / 구 ===</option>
								</select>
							</p>
							<strong class="green">전체주소 작성</strong>	
							<p><input type="text" name="addr1" placeholder="전체주소(도로명)" value="${item.addr1 }" autocomplete="off" required></p>
							<p><button type="button" id="findCoordinates" class="checkBtn">위도/경도 조회(필수)</button><span id="coordsCheck" style="margin-left: 10px;"></span></p>	
							<p><input type="text" name="mapX" placeholder="경도(X좌표)-주소를 입력 후 조회" value="${item.mapX }" required readonly="readonly"></p>	
							<p><input type="text" name="mapY" placeholder="위도(Y좌표)-주소를 입력 후 조회" value="${item.mapY }" required readonly="readonly"></p>	
				  		</div>
				  	</div>
					<div> <!-- textarea 구획 -->
						<strong class="green">캠핑장 소개</strong>
						<p><textarea name="intro" autocomplete="off" placeholder="캠핑장 소개">${item.intro }</textarea></p>
						<strong class="green">캠핑장 풍경소개</strong>
						<p><textarea name="featureNm" autocomplete="off" placeholder="캠핑장 풍경소개">${item.featureNm }</textarea></p>
					</div>
				</div>
			</div>  <!-- end of top 구획 -->
			
			<div class="division" style="border-bottom: 1px dashed grey;"> <!-- bottom 구획  -->
				<div style="flex:1;"> <!-- bottom 구획 구분 1 -->
					<strong class="blue">캠핑장 홈페이지 url</strong>
					<p><input type="text" name="homepage" placeholder="캠핑장 url 입력" value="${item.homepage }" autocomplete="off"></p>	
					<br><strong class="blue">전화번호 </strong>
					<p><input type="text" name="tel" placeholder="전화번호 입력(-도 같이 입력)" value="${item.tel }" autocomplete="off"></p>	
					<br><strong class="blue">캠핑장 이용 팁 </strong>
					<p><textarea name="tooltip" autocomplete="off" placeholder="캠핑장 이용 팁">${item.tooltip }</textarea></p>	
					<br><strong class="blue">캠핑장에 오는 길</strong> 
					<p><textarea name="direction" autocomplete="off" placeholder="캠핑장에 오는 길">${item.direction }</textarea></p>			
					<br><strong class="blue">사이트 간 거리(m)</strong>
					<p><input type="number" name="sitedStnc" placeholder="사이트 간 거리" autocomplete="off" value="${item.sitedStnc }"></p>	
					
					<br>
					<p><strong class="blue">트레일러 동반여부</strong>  <input type="checkbox" name="trlerAcmpnyAt" value="Y" ${item.trlerAcmpnyAt == 'Y' ? 'checked' : '' }></p>	
					<p><strong class="blue">카라반 동반여부</strong>  <input type="checkbox" name="caravAcmpnyAt" value="Y" ${item.caravAcmpnyAt == 'Y' ? 'checked' : '' }></p>	
					<p><strong class="blue">체험프로그램 여부</strong>  <input type="checkbox" name="exprnProgrmAt" value="Y" ${item.exprnProgrmAt == 'Y' ? 'checked' : '' }></p>	
					<p><strong class="blue">축제 여부</strong>  <input type="checkbox" name="clturEventAt" value="Y" ${item.clturEventAt == 'Y' ? 'checked' : '' }></p>	
					
					<p><strong class="blue">애완동물 동반여부</strong>
						<select name="animalCmgCl">
							<option value="불가능" ${item.animalCmgCl == '불가능' ? 'selected' : ''}>불가능</option>				
							<option value="가능" ${item.animalCmgCl == '가능' ? 'selected' : ''}>가능</option>				
							<option value="가능(소형견)" ${item.animalCmgCl == '가능(소형견)' ? 'selected' : ''}>가능(소형견)</option>				
						</select>
					</p>
					
					<p><strong class="blue">화로대</strong>
						<select name="brazierCl">
							<option value="" ${item.brazierCl == '' ? 'selected' : ''}>== 별도 안내 ==</option>				
							<option value="개별" ${item.brazierCl == '개별' ? 'selected' : ''}>개별</option>				
							<option value="공동취사장" ${item.brazierCl == '공동취사장' ? 'selected' : ''}>공동취사장</option>				
						</select>
					</p>
					
					<p><strong class="blue">운영구분</strong>
						<select name="facltDivNm">
							<option value="민간" ${item.facltDivNm == '민간' ? 'selected' : '' }>민간</option>									
							<option value="지자체"  ${item.facltDivNm == '지자체' ? 'selected' : '' }>지자체</option>				
							<option value="국립공원"  ${item.facltDivNm == '국립공원' ? 'selected' : '' }>국립공원</option>				
							<option value="자연휴양림"  ${item.facltDivNm == '자연휴양림' ? 'selected' : '' }>자연휴양림</option>				
							<option value="국민여가"  ${item.facltDivNm == '국민여가' ? 'selected' : '' }>국민여가</option>				
						</select>
					</p>
					
					<br><strong class="blue">운영시즌</strong>
					<ul>
						<li><input type="checkbox" name="operPdcl"  
							id="operPdcl01" value="봄" ${fn:contains(item.operPdCl,'봄') ? 'checked' : '' }> <label for="operPdcl01">봄</label>
						</li>
						<li><input type="checkbox" name="operPdcl"  
							id="operPdcl02" value="여름" ${fn:contains(item.operPdCl,'여름') ? 'checked' : '' }> <label for="operPdcl02">여름</label>
						</li>
						<li><input type="checkbox" name="operPdcl"  
							id="operPdcl03" value="가을" ${fn:contains(item.operPdCl,'가을') ? 'checked' : '' }> <label for="operPdcl03">가을</label>
						</li>
						<li><input type="checkbox" name="operPdcl"  
							id="operPdcl04" value="겨울" ${fn:contains(item.operPdCl,'겨울') ? 'checked' : '' }> <label for="operPdcl04">겨울</label>
						</li>
					</ul>
					
					<br><strong class="blue">운영일</strong>
					<ul>
						<li><input type="checkbox" name="operDecl"  
							id="operDeCl01" value="평일" ${fn:contains(item.operDeCl,'평일') ? 'checked' : '' }> <label for="operDeCl01">평일</label>
						</li>
						<li><input type="checkbox" name="operDecl"  
							id="operDeCl02" value="주말" ${fn:contains(item.operDeCl,'주말') ? 'checked' : '' }> <label for="operDeCl02">주말</label>
						</li>
					</ul>
					<br><strong class="blue">예약구분</strong>
					<ul>
						<li><input type="checkbox" name="resveCl"  
							id="resveCl01" value="전화" ${fn:contains(item.resveCl,'전화') ? 'checked' : '' }> <label for="resveCl01">전화</label>
						</li>
						<li><input type="checkbox" name="resveCl"  
							id="resveCl02" value="온라인실시간예약" ${fn:contains(item.resveCl,'온라인실시간예약') ? 'checked' : '' }> <label for="resveCl02">온라인실시간예약</label>
						</li>
						<li><input type="checkbox" name="resveCl"  
							id="resveCl03" value="현장" ${fn:contains(item.resveCl,'현장') ? 'checked' : '' }> <label for="resveCl03">현장</label>
						</li>
					</ul>
				</div>  <!-- bottom 구획 구분 1 -->
				
				
				<div style="flex:1;">  <!-- bottom 구획 구분 2 -->
					<strong class="blue">입지구분</strong>
					<ul>
						<li><input type="checkbox" name="lctcl"  
							id="lctcl01" value="해변" ${fn:contains(item.lctCl,'해변') ? 'checked' : '' }> <label for="lctcl01">해변</label></li>
						<li><input type="checkbox" name="lctcl"  
							id="lctcl02" value="섬" ${fn:contains(item.lctCl,'섬') ? 'checked' : '' }> <label for="lctcl02">섬</label></li>
						<li><input type="checkbox" name="lctcl"  
							id="lctcl03" value="산" ${fn:contains(item.lctCl,'산') ? 'checked' : '' }> <label for="lctcl03">산</label></li>
						<li><input type="checkbox" name="lctcl"  
							id="lctcl04" value="숲" ${fn:contains(item.lctCl,'숲') ? 'checked' : '' }> <label for="lctcl04">숲</label></li>
						<li><input type="checkbox" name="lctcl"  
							id="lctcl05" value="계곡" ${fn:contains(item.lctCl,'계곡') ? 'checked' : '' }> <label for="lctcl05">계곡</label></li>
						<li><input type="checkbox" name="lctcl"  
							id="lctcl06" value="강" ${fn:contains(item.lctCl,'강') ? 'checked' : '' }> <label for="lctcl06">강</label></li>
						<li><input type="checkbox" name="lctcl"  
							id="lctcl07" value="호수" ${fn:contains(item.lctCl,'호수') ? 'checked' : '' }> <label for="lctcl07">호수</label></li>
						<li><input type="checkbox" name="lctcl"  
							id="lctcl08" value="도심" ${fn:contains(item.lctCl,'도심') ? 'checked' : '' }> <label for="lctcl08">도심</label></li>
					</ul>
					
					<br><strong class="blue">야영장 구분</strong>
					<ul>
						<li><input type="checkbox" name="induty"  
							id="induty01" value="일반야영장" ${fn:contains(item.induty,'일반야영장') ? 'checked' : '' }> <label for="induty01">일반야영장</label>
						</li>
						<li><input type="checkbox" name="induty"  
							id="induty02" value="자동차야영장" ${fn:contains(item.induty,'자동차야영장') ? 'checked' : '' }> <label for="induty02">자동차야영장</label>
						</li>
						<li><input type="checkbox" name="induty"  
							id="induty03" value="카라반"  ${fn:contains(item.induty,'카라반') ? 'checked' : '' }> <label for="induty03">카라반</label>
						</li>
						<li><input type="checkbox" name="induty"  
							id="induty04" value="글램핑"  ${fn:contains(item.induty,'글램핑') ? 'checked' : '' }> <label for="induty04">글램핑</label>
						</li>
					</ul>
					
					<br><strong class="blue">부대시설</strong>
					<ul>
						<li><input type="checkbox" name="sbrsCl"  
							id="sbrsCl01" value="전기"  ${fn:contains(item.sbrsCl,'전기') ? 'checked' : '' }> <label for="sbrsCl01">전기</label></li>
						<li><input type="checkbox" name="sbrsCl"  
							id="sbrsCl02" value="무선인터넷" ${fn:contains(item.sbrsCl,'무선인터넷') ? 'checked' : '' }> <label for="sbrsCl02">무선인터넷</label>
						</li>
						<li><input type="checkbox" name="sbrsCl"  
							id="sbrsCl03" value="장작판매" ${fn:contains(item.sbrsCl,'장작판매') ? 'checked' : '' }> <label for="sbrsCl03">장작판매</label>
						</li>
						<li><input type="checkbox" name="sbrsCl"  
							id="sbrsCl04" value="온수" ${fn:contains(item.sbrsCl,'온수') ? 'checked' : '' }> <label for="sbrsCl04">온수</label></li>
						<li><input type="checkbox" name="sbrsCl"  
							id="sbrsCl05" value="트렘폴린" ${fn:contains(item.sbrsCl,'트렘폴린') ? 'checked' : '' }> <label for="sbrsCl05">트렘폴린</label>
						</li>
						<li><input type="checkbox" name="sbrsCl"  
							id="sbrsCl06" value="물놀이장" ${fn:contains(item.sbrsCl,'물놀이장') ? 'checked' : '' }> <label for="sbrsCl06">물놀이장</label>
						</li>
						<li><input type="checkbox" name="sbrsCl"  
							id="sbrsCl07" value="놀이터" ${fn:contains(item.sbrsCl,'놀이터') ? 'checked' : '' }> <label for="sbrsCl07">놀이터</label>
						</li>
						<li><input type="checkbox" name="sbrsCl"  
							id="sbrsCl08" value="산책로" ${fn:contains(item.sbrsCl,'산책로') ? 'checked' : '' }> <label for="sbrsCl08">산책로</label>
						</li>
						<li><input type="checkbox" name="sbrsCl"  
							id="sbrsCl09" value="운동장" ${fn:contains(item.sbrsCl,'운동장') ? 'checked' : '' }> <label for="sbrsCl09">운동장</label>
						</li>
						<li><input type="checkbox" name="sbrsCl"  
							id="sbrsCl10" value="운동시설" ${fn:contains(item.sbrsCl,'운동시설') ? 'checked' : '' }> <label for="sbrsCl10">운동시설</label>
						</li>
						<li><input type="checkbox" name="sbrsCl"  
							id="sbrsCl11" value="마트.편의점" ${fn:contains(item.sbrsCl,'마트.편의점') ? 'checked' : '' }> <label for="sbrsCl11">마트.편의점</label>
						</li>
					</ul>
					
					<p><strong class="blue">부대시설 기타</strong><br><input type="text" name="sbrsEtc" placeholder="부대시설 기타" autocomplete="off" value="${item.sbrsEtc }"></p>
					
					<br><strong class="blue">테마 구분</strong>
					<ul>
						<li>
							<input type="checkbox" name="themaEnvrnCl"	  id="themaEnvrnCl01" value="일출명소" 	${fn:contains(item.themaEnvrnCl,'일출명소') ? 'checked' : '' }>
							<label for="themaEnvrnCl01">일출명소</label>
						</li>
						<li>
							<input type="checkbox" name="themaEnvrnCl"   id="themaEnvrnCl02" value="일몰명소" ${fn:contains(item.themaEnvrnCl,'일몰명소') ? 'checked' : '' }> 
							<label for="themaEnvrnCl02"	>일몰명소</label>
						</li>
						<li>
							<input type="checkbox" name="themaEnvrnCl"	  id="themaEnvrnCl03" value="수상레저" ${fn:contains(item.themaEnvrnCl,'수상레저') ? 'checked' : '' }> 
							<label	for="themaEnvrnCl03" >수상레저</label></li>
						<li>
							<input type="checkbox" name="themaEnvrnCl"	  id="themaEnvrnCl04" value="항공레저" ${fn:contains(item.themaEnvrnCl,'항공레저') ? 'checked' : '' }> 
							<label	for="themaEnvrnCl04" >항공레저</label>
						</li>
						<li>
							<input type="checkbox" name="themaEnvrnCl"	  id="themaEnvrnCl05" value="스키"	${fn:contains(item.themaEnvrnCl,'스키') ? 'checked' : '' }>
							<label for="themaEnvrnCl05">스키</label></li>
						<li>
							<input type="checkbox" name="themaEnvrnCl"	  id="themaEnvrnCl06" value="낚시"	${fn:contains(item.themaEnvrnCl,'낚시') ? 'checked' : '' }>
							<label for="themaEnvrnCl06">낚시</label>
						</li>
						<li>
							<input type="checkbox" name="themaEnvrnCl"	  id="themaEnvrnCl07" value="액티비티"	${fn:contains(item.themaEnvrnCl,'액티비티') ? 'checked' : '' }>
							<label for="themaEnvrnCl07">액티비티</label>
						</li>
						<li>
							<input type="checkbox" name="themaEnvrnCl"	  id="themaEnvrnCl08" value="봄꽃여행"	${fn:contains(item.themaEnvrnCl,'봄꽃여행') ? 'checked' : '' }>
							<label for="themaEnvrnCl08">봄꽃여행</label>
						</li>
						<li>
							<input type="checkbox" name="themaEnvrnCl"	  id="themaEnvrnCl09" value="여름물놀이"	${fn:contains(item.themaEnvrnCl,'여름물놀이') ? 'checked' : '' }>
							<label for="themaEnvrnCl09">여름물놀이</label>
						</li>
						<li>
							<input type="checkbox" name="themaEnvrnCl"	  id="themaEnvrnCl10" value="가을단풍명소"	${fn:contains(item.themaEnvrnCl,'가을단풍명소') ? 'checked' : '' }>
							<label for="themaEnvrnCl10">가을단풍명소</label>
							
						</li>
						<li>
							<input type="checkbox" name="themaEnvrnCl"	  id="themaEnvrnCl11" value="겨울눈꽃명소"	${fn:contains(item.themaEnvrnCl,'겨울눈꽃명소') ? 'checked' : '' }>
							<label for="themaEnvrnCl11">겨울눈꽃명소</label>
						</li>
						<li>
							<input type="checkbox" name="themaEnvrnCl"	  id="themaEnvrnCl12" value="걷기길"	${fn:contains(item.themaEnvrnCl,'걷기길') ? 'checked' : '' }>
							<label for="themaEnvrnCl12">걷기길</label>
						</li>
					</ul>
					
					<br><strong class="blue">장비대여구분</strong>
					<ul>
						<li><input type="checkbox" name="eqpmnLendCl"   ${fn:contains(item.eqpmnLendCl,'텐트') ? 'checked' : '' }
							id="eqpmnLendCl01" value="텐트"> <label for="eqpmnLendCl01">텐트</label>
						</li>
						<li><input type="checkbox" name="eqpmnLendCl"   ${fn:contains(item.eqpmnLendCl,'릴선') ? 'checked' : '' }
							id="eqpmnLendCl02" value="릴선"> <label for="eqpmnLendCl02">릴선</label>
						</li>
						<li><input type="checkbox" name="eqpmnLendCl"   ${fn:contains(item.eqpmnLendCl,'화로대') ? 'checked' : '' }
							id="eqpmnLendCl03" value="화로대"> <label for="eqpmnLendCl03">화로대</label>
						</li>
						<li><input type="checkbox" name="eqpmnLendCl"   ${fn:contains(item.eqpmnLendCl,'난방기구') ? 'checked' : '' }
							id="eqpmnLendCl04" value="난방기구"> <label for="eqpmnLendCl04">난방기구</label>
						</li>
						<li><input type="checkbox" name="eqpmnLendCl"   ${fn:contains(item.eqpmnLendCl,'식기') ? 'checked' : '' }
							id="eqpmnLendCl05" value="식기"> <label for="eqpmnLendCl05">식기</label>
						</li>
						<li><input type="checkbox" name="eqpmnLendCl"   ${fn:contains(item.eqpmnLendCl,'침낭') ? 'checked' : '' }
							id="eqpmnLendCl06" value="침낭"> <label for="eqpmnLendCl06">침낭</label>
						</li>
					</ul>
					
					<br><strong class="blue">주변이용가능시설</strong>
					<ul>
						<li><input type="checkbox" name="posblFcltyCl"   ${fn:contains(item.posblFcltyCl,'산책로') ? 'checked' : '' }
							id="posblFcltyCl01" value="산책로"> <label for="posblFcltyCl01">산책로</label>
						</li>
						<li><input type="checkbox" name="posblFcltyCl"   ${fn:contains(item.posblFcltyCl,'낚시') ? 'checked' : '' }
							id="posblFcltyCl02" value="낚시"> <label for="posblFcltyCl02">낚시</label>
						</li>
						<li><input type="checkbox" name="posblFcltyCl"   ${fn:contains(item.posblFcltyCl, '계곡 물놀이') ? 'checked' : '' }
							id="posblFcltyCl03" value="계곡 물놀이"> <label for="posblFcltyCl03">계곡 물놀이</label>
						</li>
						<li><input type="checkbox" name="posblFcltyCl"   ${fn:contains(item.posblFcltyCl,'강/물놀이') ? 'checked' : '' }
							id="posblFcltyCl04" value="강/물놀이"> <label for="posblFcltyCl04">강/물놀이</label>
						</li>
						<li><input type="checkbox" name="posblFcltyCl"   ${fn:contains(item.posblFcltyCl,'어린이놀이시설') ? 'checked' : '' }
							id="posblFcltyCl05" value="어린이놀이시설"> <label for="posblFcltyCl05">어린이놀이시설</label>
						</li>
						<li><input type="checkbox" name="posblFcltyCl"   ${fn:contains(item.posblFcltyCl,'운동장') ? 'checked' : '' }
							id="posblFcltyCl06" value="운동장"> <label for="posblFcltyCl06">운동장</label>
						</li>
						<li><input type="checkbox" name="posblFcltyCl"   ${fn:contains(item.posblFcltyCl,'청소년체험시설') ? 'checked' : '' }
							id="posblFcltyCl07" value="청소년체험시설"> <label for="posblFcltyCl07">청소년체험시설</label>
						</li>
						<li><input type="checkbox" name="posblFcltyCl"   ${fn:contains(item.posblFcltyCl,'농어촌체험시설') ? 'checked' : '' }
							id="posblFcltyCl08" value="농어촌체험시설"> <label for="posblFcltyCl08">농어촌체험시설</label>
						</li>
						<li><input type="checkbox" name="posblFcltyCl"   ${fn:contains(item.posblFcltyCl,'해수욕') ? 'checked' : '' }
							id="posblFcltyCl09" value="해수욕"> <label for="posblFcltyCl09">해수욕</label>
						</li>
						<li><input type="checkbox" name="posblFcltyCl"   ${fn:contains(item.posblFcltyCl,'수상레저') ? 'checked' : '' }
							id="posblFcltyCl10" value="수상레저"> <label for="posblFcltyCl10">수상레저</label>
						</li>
					</ul>
					
					<p><strong class="blue">주변이용가능시설 기타</strong><br><input type="text" name="posblFcltyEtc" placeholder="주변이용가능시설 기타" autocomplete="off" value="${item.posblFcltyEtc }"></p>
					
					<br><strong class="blue">태그</strong>
					<ul>
						<c:forEach items="${tags }" var="tag" varStatus="st">
							<li><input type="checkbox" name="tag"  
								id="tag${st.index }" value="${tag.tagNum }" ${fn:contains(item.tagName, tag.tagName) ? 'checked' : '' }> <label for="tag${st.index }">#${tag.tagName }</label>
							</li>
						</c:forEach>
					</ul>
				</div>	<!-- end of bottom 구획 구분 2 -->
			</div>  <!-- end of bottom 구획  -->
			<div>
			<p><strong class="green">현재 올라간 이미지</strong></p>
				<div id="currentImagePreview">
					<img >
				</div>
			<p><strong class="green">풍경사진 업로드</strong>
			<label class="image" for="featureImages">풍경 이미지 넣기</label></p>
	        <input type="file" name="featureImages" id="featureImages" multiple accept="image/*">
	        <div id="featureImagesPreview">이미지 미리보기</div>
			</div>
		</div>  <!-- end of modifycamp -->
		<input type="submit" value="수정하기" style="width: 250px; height: 50px; border-radius: 5px; background-color: #4476D5; color: white; font-size: 18px; margin: 20px auto;">
	</form>

</div>
<%@include file="../footer.jsp" %>
<a style="display:scroll;position:fixed;bottom:50px;right:50px;text-decoration: none;" rel="nofollow" href="#" title="Back to Top"><span style="width: 80px; height: 80px; font-size: 50px;">⏫</span></a>

<script>
		// 이미지 미리보기
        const imageInput = document.getElementById('firstimage');
        const imagePreview = document.getElementById('imagePreview');
		const id = '${item.contentId}'
        
        imageInput.onchange = imageViewHandler
        
        // 현재 업로드되어 있는 사진들 불러오기
        
        window.onload = imageRequestHandler(id)
        
        // 도이름과 시군구 설정
        const sigunguNm = '${item.sigunguNm}'
        window.onload = sigunguHandler
        document.querySelector('select[name="doNm"]').onchange = sigunguHandler
        
    	 // x, y좌표 찾기
         const inputAddr = document.querySelector('input[name="addr1"]')
         const findCoordinateBtn = document.getElementById('findCoordinates')
         
         findCoordinateBtn.onclick = findCoordinateHandler
		 
         // 중복된 파일들의 이미지 출력
   		 const featureImages = document.getElementById('featureImages')
         const featureImagesPreview = document.getElementById('featureImagesPreview')
         
         featureImages.onchange = featureImagesHandler
         
         const currentFirstImage = '${item.firstImageUrl}'
         // modifyForm의 컨트롤 제어
         document.getElementById("modifyForm").addEventListener("submit", function(event) {
        		event.preventDefault();
        	    confirm('변경사항들을 적용하시겠습니까?')
        	    document.getElementById("modifyForm").submit()
        	});
         
         
    </script>

</body>
</html>