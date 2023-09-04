<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=x9jrgpo39q&submodules=geocoder"></script>
<script src="${cpath }/resources/js/addr.js"></script>
<script src="${cpath }/resources/js/mainadd.js"></script>
<link rel="stylesheet" href="${cpath }/resources/css/main/mainCRUD.css" type="text/css">

<!-- 파일(multiple X) -->
<!-- firstImageUrl -->

<!-- 텍스트    10  -->  
<!-- contentId -->
<!-- facltNm -->
<!-- lineIntro -->
<!-- intro -->
<!-- featureNm -->
<!-- tel -->
<!-- homepage -->
<!-- tooltip -->
<!-- direction -->
<!-- sitedStnc -->

<!-- 주소관련 -->
<!-- doNm -->
<!-- sigunguNm -->
<!-- addr1 -->
<!-- mapX -->
<!-- mapY -->

<!-- 체크박스(Y/N) 단일옵션 -->
<!-- trlerAcmpnyAt -->
<!-- caravAcmpnyAt -->
<!-- exprnProgrmAt -->
<!-- clturEventAt -->

<!-- select 단일옵션() -->
<!-- animalCmgCl -->
<!-- brazierCl -->
<!-- facltDivNm -->

<!-- 체크박스 중복옵션 -->
<!-- lctcl -->
<!-- induty -->
<!-- sbsCl -->
<!-- sbrsEtc -->
<!-- themaEnvrnCl -->
<!-- eqpmnLendCl -->
<!-- operPdCl -->
<!-- operDeCl -->
<!-- posblFcltyCl -->
<!-- posblFcltyClEtc -->
<!-- resveCl -->
<!-- tags -->
<!-- tagName -->

<div style="max-width: 1200px; margin: 30px auto;  border: 2px solid black;padding: 20px 5px;">
	<h1 style="text-align: center; ">캠핑장 추가</h1>
	<form method="POST" enctype="multipart/form-data" id="addForm" >
		<div id="addcamp">
			<div style="flex: 1;">  <!-- 첫번째 단락 -->
				<label class="image" for="firstimage">메인 이미지 선택</label>
			    <input type="file" name="imageFile" id="firstimage" accept="image/*">
			  	<div class="image-preview" id="imagePreview">이미지를 넣어주세요</div>
			  	<br><strong class="green">캠핑장 ID (1~999999)</strong>
				<p><input type="number" id="cid" name="contentId" placeholder="캠핑장 ID" autocomplete="off" max="999999" min="1" maxlength="6" required></p>
				<p><button type="button" id="cidDupCheck" class="checkBtn">아이디 중복체크(필수)</button><span id="cidCheckResult" style="margin-left: 10px;"></span></p>
				
				<br><strong class="green">캠핑장 이름</strong>
				<p><input type="text" name="facltNm" placeholder="캠핑장 이름" autocomplete="off" required></p>
				<br><strong class="green">캠핑장 한줄 소개</strong>
				<p><textarea name="lineIntro" autocomplete="off" placeholder="캠핑장 한줄 소개"></textarea></p>
				<br><strong class="green">캠핑장 소개</strong>
				<p><textarea name="intro" autocomplete="off" placeholder="캠핑장 소개"></textarea></p>
				<br><strong class="green">캠핑장 풍경소개</strong>
				<p><textarea name="featureNm" autocomplete="off" placeholder="캠핑장 풍경소개"></textarea></p>
				<br><strong class="green">지역(시/군/구)선택</strong>
				<p>
					<select name="doNm" required="required">
						<option value="">=== 시 / 도 ===</option>
						<option value="서울시">서울시</option>
						<option value="부산시">부산시</option>
						<option value="대구시" >대구시</option>
						<option value="인천시">인천시</option>
						<option value="광주시">광주시</option>
						<option value="대전시">대전시</option>
						<option value="울산시">울산시</option>
						<option value="세종시">세종시</option>
						<option value="경기도">경기도</option>
						<option value="강원도">강원도</option>
						<option value="충청북도">충청북도</option>
						<option value="충청남도">충청남도</option>
						<option value="전라북도">전라북도</option>
						<option value="전라남도">전라남도</option>
						<option value="경상북도">경상북도</option>
						<option value="경상남도">경상남도</option>
						<option value="제주도">제주도</option>
					</select>
					<select name="sigunguNm">
						<option value="">=== 군 / 구 ===</option>
					</select>
				</p>
				<br><strong class="green">전체주소 작성</strong>	
				<p><input type="text" name="addr1" placeholder="전체주소(도로명)" autocomplete="off" required></p>
				<p><button type="button" id="findCoordinates" class="checkBtn">위도/경도 조회(필수)</button><span id="coordsCheck" style="margin-left: 10px;"></span></p>	
				<p><input type="text" name="mapX" placeholder="경도(X좌표)-주소를 입력 후 조회" required readonly="readonly"></p>	
				<p><input type="text" name="mapY" placeholder="위도(Y좌표)-주소를 입력 후 조회" required readonly="readonly"></p>	
			</div>
			
			
			<div style="flex: 1;"> <!-- 두번째 단락 -->
				<strong class="blue">캠핑장 홈페이지 url</strong>
				<p><input type="text" name="homepage" placeholder="캠핑장 url 입력" autocomplete="off"></p>	
				<br><strong class="blue">전화번호 </strong>
				<p><input type="text" name="tel" placeholder="전화번호 입력(-도 같이 입력)" autocomplete="off"></p>	
				<br><strong class="blue">캠핑장 이용 팁 </strong>
				<p><textarea name="tooltip" autocomplete="off" placeholder="캠핑장 이용 팁"></textarea>		</p>	
				<br><strong class="blue">캠핑장에 오는 길</strong> 
				<p><textarea name="direction" autocomplete="off" placeholder="캠핑장에 오는 길"></textarea></p>			
				<br><strong class="blue">사이트 간 거리(m)</strong>
				<p><input type="number" name="sitedStnc" placeholder="사이트 간 거리" autocomplete="off"></p>	
				
				<br>
				<p><strong class="blue">트레일러 동반여부</strong>  <input type="checkbox" name="trlerAcmpnyAt" value="Y"></p>	
				<p><strong class="blue">카라반 동반여부</strong>  <input type="checkbox" name="caravAcmpnyAt" value="Y"></p>	
				<p><strong class="blue">체험프로그램 여부</strong>  <input type="checkbox" name="exprnProgrmAt" value="Y"></p>	
				<p><strong class="blue">축제 여부</strong>  <input type="checkbox" name="clturEventAt" value="Y"></p>	
				
				<p><strong class="blue">애완동물 동반여부</strong>
					<select name="animalCmgCl">
						<option value="불가능">불가능</option>				
						<option value="가능">가능</option>				
						<option value="가능(소형견)">가능(소형견)</option>				
					</select>
				</p>
				
				<p><strong class="blue">화로대</strong>
					<select name="brazierCl">
						<option value="개별">개별</option>				
						<option value="공동취사장">공동취사장</option>				
					</select>
				</p>
				
				<p><strong class="blue">운영구분</strong>
					<select name="facltDivNm">
						<option value="민간">민간</option>									
						<option value="지자체">지자체</option>				
						<option value="국립공원">국립공원</option>				
						<option value="자연휴양림">자연휴양림</option>				
						<option value="국민여가">국민여가</option>				
					</select>
				</p>
				
				<br><strong class="blue">운영시즌</strong>
				<ul>
					<li><input type="checkbox" name="operPdcl" class="check04"
						id="operPdcl01" value="봄"> <label for="operPdcl01">봄</label>
					</li>
					<li><input type="checkbox" name="operPdcl" class="check04"
						id="operPdcl02" value="여름"> <label for="operPdcl02">여름</label>
					</li>
					<li><input type="checkbox" name="operPdcl" class="check04"
						id="operPdcl03" value="가을"> <label for="operPdcl03">가을</label>
					</li>
					<li><input type="checkbox" name="operPdcl" class="check04"
						id="operPdcl04" value="겨울"> <label for="operPdcl04">겨울</label>
					</li>
				</ul>
				
				<br><strong class="blue">운영일</strong>
				<ul>
					<li><input type="checkbox" name="operDecl" class="check04"
						id="operDeCl01" value="평일"> <label for="operDeCl01">평일</label>
					</li>
					<li><input type="checkbox" name="operDecl" class="check04"
						id="operDeCl02" value="주말"> <label for="operDeCl02">주말</label>
					</li>
				</ul>
				<br><strong class="blue">예약구분</strong>
				<ul>
					<li><input type="checkbox" name="resveCl" class="check04"
						id="resveCl01" value="전화"> <label for="resveCl01">전화</label>
					</li>
					<li><input type="checkbox" name="resveCl" class="check04"
						id="resveCl02" value="온라인실시간예약"> <label for="resveCl02">온라인실시간예약</label>
					</li>
					<li><input type="checkbox" name="resveCl" class="check04"
						id="resveCl03" value="현장"> <label for="resveCl03">현장</label>
					</li>
				</ul>
			</div>  <!-- end of 두번째 단락 -->
			
			
			<div style="flex: 2;">  <!-- 세번째 단락 -->
			<strong class="blue">입지구분</strong>
			<ul>
				<li><input type="checkbox" name="lctcl" class="check03"
					id="lctcl01" value="해변"> <label for="lctcl01">해변</label></li>
				<li><input type="checkbox" name="lctcl" class="check03"
					id="lctcl02" value="섬"> <label for="lctcl02">섬</label></li>
				<li><input type="checkbox" name="lctcl" class="check03"
					id="lctcl03" value="산"> <label for="lctcl03">산</label></li>
				<li><input type="checkbox" name="lctcl" class="check03"
					id="lctcl04" value="숲"> <label for="lctcl04">숲</label></li>
				<li><input type="checkbox" name="lctcl" class="check03"
					id="lctcl05" value="계곡"> <label for="lctcl05">계곡</label></li>
				<li><input type="checkbox" name="lctcl" class="check03"
					id="lctcl06" value="강"> <label for="lctcl06">강</label></li>
				<li><input type="checkbox" name="lctcl" class="check03"
					id="lctcl07" value="호수"> <label for="lctcl07">호수</label></li>
				<li><input type="checkbox" name="lctcl" class="check03"
					id="lctcl08" value="도심"> <label for="lctcl08">도심</label></li>
			</ul>
			
			<br><strong class="blue">야영장 구분</strong>
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
			
			<br><strong class="blue">부대시설</strong>
			<ul>
				<li><input type="checkbox" name="sbrsCl" class="check06"
					id="sbrsCl01" value="전기"> <label for="sbrsCl01">전기</label></li>
				<li><input type="checkbox" name="sbrsCl" class="check06"
					id="sbrsCl02" value="무선인터넷"> <label for="sbrsCl02">무선인터넷</label>
				</li>
				<li><input type="checkbox" name="sbrsCl" class="check06"
					id="sbrsCl03" value="장작판매"> <label for="sbrsCl03">장작판매</label>
				</li>
				<li><input type="checkbox" name="sbrsCl" class="check06"
					id="sbrsCl04" value="온수"> <label for="sbrsCl04">온수</label></li>
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
			
			<p><strong class="blue">부대시설 기타</strong><br><input type="text" name="sbrsEtc" placeholder="부대시설 기타" autocomplete="off"></p>
			
			<br><strong class="blue">테마 구분</strong>
			<ul>
				<li><input type="checkbox" name="themaEnvrnCl" class="check05"
					id="themaEnvrnCl01" value="일출명소"> <label
					for="themaEnvrnCl01">일출명소</label></li>
				<li><input type="checkbox" name="themaEnvrnCl" class="check05"
					id="themaEnvrnCl02" value="일몰명소"> <label
					for="themaEnvrnCl02">일몰명소</label></li>
				<li><input type="checkbox" name="themaEnvrnCl" class="check05"
					id="themaEnvrnCl03" value="수상레저"> <label
					for="themaEnvrnCl03">수상레저</label></li>
				<li><input type="checkbox" name="themaEnvrnCl" class="check05"
					id="themaEnvrnCl04" value="항공레저"> <label
					for="themaEnvrnCl04">항공레저</label></li>
				<li><input type="checkbox" name="themaEnvrnCl" class="check05"
					id="themaEnvrnCl05" value="스키"> <label for="themaEnvrnCl05">스키</label></li>
				<li><input type="checkbox" name="themaEnvrnCl" class="check05"
					id="themaEnvrnCl06" value="낚시"> <label for="themaEnvrnCl06">낚시</label></li>
				<li><input type="checkbox" name="themaEnvrnCl" class="check05"
					id="themaEnvrnCl07" value="액티비티"> <label
					for="themaEnvrnCl07">액티비티</label></li>
				<li><input type="checkbox" name="themaEnvrnCl" class="check05"
					id="themaEnvrnCl08" value="봄꽃여행"> <label
					for="themaEnvrnCl08">봄꽃여행</label></li>
				<li><input type="checkbox" name="themaEnvrnCl" class="check05"
					id="themaEnvrnCl09" value="여름물놀이"> <label
					for="themaEnvrnCl09">여름물놀이</label></li>
				<li><input type="checkbox" name="themaEnvrnCl" class="check05"
					id="themaEnvrnCl10" value="가을단풍명소"> <label
					for="themaEnvrnCl10">가을단풍명소</label></li>
				<li><input type="checkbox" name="themaEnvrnCl" class="check05"
					id="themaEnvrnCl11" value="겨울눈꽃명소"> <label
					for="themaEnvrnCl11">겨울눈꽃명소</label></li>
				<li><input type="checkbox" name="themaEnvrnCl" class="check05"
					id="themaEnvrnCl12" value="걷기길"> <label for="themaEnvrnCl12">걷기길</label></li>
			</ul>
			
			<br><strong class="blue">장비대여구분</strong>
			<ul>
				<li><input type="checkbox" name="eqpmnLendCl" class="check04"
					id="eqpmnLendCl01" value="텐트"> <label for="eqpmnLendCl01">텐트</label>
				</li>
				<li><input type="checkbox" name="eqpmnLendCl" class="check04"
					id="eqpmnLendCl02" value="릴선"> <label for="eqpmnLendCl02">릴선</label>
				</li>
				<li><input type="checkbox" name="eqpmnLendCl" class="check04"
					id="eqpmnLendCl03" value="화로대"> <label for="eqpmnLendCl03">화로대</label>
				</li>
				<li><input type="checkbox" name="eqpmnLendCl" class="check04"
					id="eqpmnLendCl04" value="난방기구"> <label for="eqpmnLendCl04">난방기구</label>
				</li>
				<li><input type="checkbox" name="eqpmnLendCl" class="check04"
					id="eqpmnLendCl05" value="식기"> <label for="eqpmnLendCl05">식기</label>
				</li>
				<li><input type="checkbox" name="eqpmnLendCl" class="check04"
					id="eqpmnLendCl06" value="침낭"> <label for="eqpmnLendCl06">침낭</label>
				</li>
			</ul>
			
			<br><strong class="blue">주변이용가능시설</strong>
			<ul>
				<li><input type="checkbox" name="posblFcltyCl" class="check04"
					id="posblFcltyCl01" value="산책로"> <label for="posblFcltyCl01">산책로</label>
				</li>
				<li><input type="checkbox" name="posblFcltyCl" class="check04"
					id="posblFcltyCl02" value="낚시"> <label for="posblFcltyCl02">낚시</label>
				</li>
				<li><input type="checkbox" name="posblFcltyCl" class="check04"
					id="posblFcltyCl03" value="계곡 물놀이"> <label for="posblFcltyCl03">계곡 물놀이</label>
				</li>
				<li><input type="checkbox" name="posblFcltyCl" class="check04"
					id="posblFcltyCl04" value="강/물놀이"> <label for="posblFcltyCl04">강/물놀이</label>
				</li>
				<li><input type="checkbox" name="posblFcltyCl" class="check04"
					id="posblFcltyCl05" value="어린이놀이시설"> <label for="posblFcltyCl05">어린이놀이시설</label>
				</li>
				<li><input type="checkbox" name="posblFcltyCl" class="check04"
					id="posblFcltyCl06" value="운동장"> <label for="posblFcltyCl06">운동장</label>
				</li>
				<li><input type="checkbox" name="posblFcltyCl" class="check04"
					id="posblFcltyCl07" value="청소년체험시설"> <label for="posblFcltyCl07">청소년체험시설</label>
				</li>
				<li><input type="checkbox" name="posblFcltyCl" class="check04"
					id="posblFcltyCl08" value="농어촌체험시설"> <label for="posblFcltyCl08">농어촌체험시설</label>
				</li>
				<li><input type="checkbox" name="posblFcltyCl" class="check04"
					id="posblFcltyCl09" value="해수욕"> <label for="posblFcltyCl09">해수욕</label>
				</li>
				<li><input type="checkbox" name="posblFcltyCl" class="check04"
					id="posblFcltyCl10" value="수상레저"> <label for="posblFcltyCl10">수상레저</label>
				</li>
			</ul>
			
			<p><strong class="blue">주변이용가능시설 기타</strong><br><input type="text" name="posblFcltyEtc" placeholder="주변이용가능시설 기타" autocomplete="off"></p>
			
			<br><strong class="blue">태그</strong>
			<ul>
				<c:forEach items="${tags }" var="tag" varStatus="st">
					<li><input type="checkbox" name="tag" class="check04"
						id="tag${st.index }" value="${tag.tagNum }"> <label for="tag${st.index }">#${tag.tagName }</label>
					</li>
				</c:forEach>
			</ul>
			</div>	<!-- end of 세번째 단락 -->
		</div>  <!-- end of addcamp -->
		<div class="notion">※ 캠핑장 풍경사진 추가는 수정탭에서 가능함</div>
		<input type="submit" value="추가" style="width: 250px; height: 50px; border-radius: 5px; background-color: #4476D5; color: white; font-size: 18px; margin: 20px auto;">
	</form>

</div>

<script>
		// 이미지 미리보기
        const imageInput = document.getElementById('firstimage');
        const imagePreview = document.getElementById('imagePreview');
		
        imageInput.onchange = imageViewHandler
        
        // 콘텐츠 아이디 중복 방지
        const cid = document.getElementById('cid')
        const cidCheck = document.getElementById('cidDupCheck')
        const cidCheckResult = document.getElementById('cidCheckResult')
        cidCheck.onclick = (event) => cidCheckHandler(event)
        
        // 도이름과 시군구 
        const sigunguNm = '${item.sigunguNm}'
        document.querySelector('select[name="doNm"]').onchange = sigunguHandler
        
         const inputAddr = document.querySelector('input[name="addr1"]')
         const findCoordinateBtn = document.getElementById('findCoordinates')
         
         // x, y좌표 찾기
         findCoordinateBtn.onclick = findCoordinateHandler
		
         // addForm의 컨트롤 제어
         document.getElementById("addForm").addEventListener("submit", function(event) {
        		event.preventDefault();
        	    if (validateForm()) {
        	    	document.getElementById("addForm").submit()
        	    }
        	});
         
    </script>

</body>
</html>