<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<style>
	#totalSearchList {
		max-width: 1200px;
		margin: 20px auto;
		border-top: 2px solid black;
		padding: 30px 0;
	}
	#searchAll {
		width: 100%;
		display: flex;
		justify-content: center;
		font-size: 20px;
	}
	#searchAll > div {
		margin: 10px;
		height: 50px; 
		line-height: 50px;
	}
	
	.searchListBody {
		width: 100%;
		margin: 30px 0;
		padding: 30px 0;
		border-top: 1px solid lightgrey;
	}
	
	.searchListTT {
		font-size: 18px;
	}
	
	.searchListItems, .searchListItem {
		font-size: 15px;
		width: 100%;
		min-height : 150px;
		background-color: #F6F8F9;
		margin: 30px 0 20px;;
		padding: 20px 4%;
		box-sizing: border-box;
	}
	
	.searchListItem ul {
		list-style: square;
		padding-left: 10px;
	}
	
	.searchMoreBtn {
		width: 320px;
		height: 50px;
	    box-sizing: border-box;
	    font-size: 15px;
		border-radius: 5px;
		border: none;
		cursor: pointer;
	    padding: 10px 20px;
	    text-align: center;
	    background: #616670;
	    color: #fff;
	}
	.blueT {
		color: #00A6ED;
	}
	.highlight {
		color: #c22187;
		font-weight: bold;
	}
	.campSearchItem {
		width: 100%;
		display: flex;
		padding: 20px 0;
		color: grey;
		border-top: 1px solid lightgrey;
	}
	.campSearchItem a {
		color: grey;
	}
	.searchListBody a:hover {
		cursor: pointer;
		text-decoration: underline;
	}
	.sbrsCl {
		width: 790px;
		margin-top: 20px;
		display: flex;
		padding: 15px;
		flex-flow: wrap;
		justify-content: left;
		text-align: center;
		background-color: white;
		border-radius: 10px;
		border: 1px solid lightgrey;
	}
	
	.sbrsItem {
		font-size: 12px;
		margin: 13px;
	}
</style>

<div id="totalSearchList">

	<!-- 통합검색 -->
	<div id="totalSearch">
		<form action="${cpath }/main/search" id="searchAll">
			<div>
				<label for="srchKywrd" >통합검색</label>		
			</div>
			<div style="border: 1px solid lightgrey; width: 50%; display: flex; justify-content: space-between;">
				<input type="search" value="${keyword }" name="srchKywrd" id="srchKywrd" placeholder="검색어를 입력하세요" style="border:none; font-size: 18px; padding-left: 20px; width: 100%;">
				<button type="submit" style="border: none; background-color: white; cursor:pointer; font-size: 18px; padding-right: 20px;">🔍</button>
			</div>
		</form>
		
		<!-- 캠핑장 -->
		<div class="searchListBody">
			<div class="searchListTT">
				⛺ 캠핑장 [총 <span class="blueT">${campCnt }</span>건]
			</div>
			
			<div class="searchListItems">
				<ul>
					<c:if test="${campList.size() == 0 }">
						<li>검색된 캠핑장이 없습니다.</li>
					</c:if>
				
					<c:forEach items="${campList }" var="camp" begin="0" end="9">
						<li>
							<div class="campSearchItem">
								<div>
									<a href="${cpath }/main/view/${camp.contentId}"><img src="${camp.firstImageUrl }" style="width: 240px; height: 160px; margin-right: 30px;"></a>
								</div>
								<div>
									<p style="font-size:18px;"><a href="${cpath }/main/view/${camp.contentId}" class="searchKey">${camp.facltNm }</a></p>
									<c:if test="${camp.lineIntro != '' }">
										<p><b>${camp.lineIntro }</b></p>
									</c:if>
									<div style="margin: 20px 0;">🛣️  ${camp.addr1 }</div>
									<c:if test="${camp.sbrsCl != '' }">
									<div class="sbrsCl">
										<c:set var="splitSbrs" value="${fn:split(camp.sbrsCl, ',') }" />
										<c:forEach var="sbrs" items="${splitSbrs}">
												<div class="sbrsItem">
													<img src="${cpath }/resources/image/main/${sbrs}.png" width="30px" height="30px"><br>
													<span>${ sbrs}</span>
												</div>
										</c:forEach>
									</div>
									</c:if>
								</div>
							</div>						
						</li>
					</c:forEach>
				</ul>
			</div>
			<div style="width: 100%; display:flex; justify-content: center;">
				<a href="${cpath }/main/camp?listTy=LIST&keyword=${param.srchKywrd != null ? param.srchKywrd : '' }"><button class="searchMoreBtn">더보기</button></a>		
			</div>
		</div>
		
		<!-- 공지사항 -->
		<div class="searchListBody">
			<div class="searchListTT">
				ℹ️ 공지사항 게시물 검색결과 [총  <span class="blueT">${noticeCnt }</span>건]
			</div>
			<div class="searchListItem">
				<ul>
					<c:if test="${noticelist.size() == 0 }">
						<li>검색된 결과가 없습니다.</li>
					</c:if>
					<c:forEach items="${noticelist }" var="notice" begin="0" end="9">
						<li><a href="${cpath }/noticeBoard/view/${notice.idx}" class="searchKey">${notice.title }</a></li>
					</c:forEach>
				</ul>
			</div>
			<div style="width: 100%; display:flex; justify-content: center;">
				<a href=""><button class="searchMoreBtn">더보기</button></a>		
			</div>
		</div>
		
		<!-- 이벤트 -->
		<div class="searchListBody">
			<div class="searchListTT">
				🎉 이벤트 게시물 검색결과 [총  <span class="blueT">${eventCnt }</span>건]
			</div>
			<div class="searchListItem">
				<ul>
					<c:if test="${eventlist.size() == 0 }">
						<li>검색된 결과가 없습니다.</li>
					</c:if>
					<c:forEach items="${eventlist }" var="event" begin="0" end="9">
						<li><a href="${cpath }/eventBoard/view/${event.idx}" class="searchKey">${event.title }</a></li>
					</c:forEach>
				</ul>
			</div>
			<div style="width: 100%; display:flex; justify-content: center;">
				<a href=""><button class="searchMoreBtn">더보기</button></a>		
			</div>
		</div>
		
		<!-- 캠핑&여행후기 게시물 검색결과 -->
		<div class="searchListBody">
			<div class="searchListTT">
				💭 캠핑&#38;여행후기 게시물 검색결과 [총   <span class="blueT">${reviewCnt }</span>건]
			</div>
			<div class="searchListItem">
				<ul>
					<c:if test="${reviewlist.size() == 0 }">
						<li>검색된 결과가 없습니다.</li>
					</c:if>
					<c:forEach items="${reviewlist }" var="review" begin="0" end="9">
						<li><a href="${cpath }/reviewBoard/view/${review.idx}" class="searchKey">${review.title }</a></li>
					</c:forEach>				
				</ul>
			</div>
			<div style="width: 100%; display:flex; justify-content: center;">
				<a href=""><button class="searchMoreBtn">더보기</button></a>		
			</div>
		</div>
		
		<!-- 자유게시판 -->
		<div class="searchListBody">
			<div class="searchListTT">
				😆 자유게시판 게시물 검색결과 [총   <span class="blueT">${freeCnt }</span>건]
			</div>
			<div class="searchListItem">
				<ul>
					<c:if test="${freelist.size() == 0 }">
						<li>검색된 결과가 없습니다.</li>
					</c:if>
					<c:forEach items="${freelist }" var="free" begin="0" end="9">
						<li><a href="${cpath }/freeBoard/view/${free.idx}" class="searchKey">${free.title }</a></li>
					</c:forEach>				
				</ul>
			</div>
			<div style="width: 100%; display:flex; justify-content: center;">
				<a href=""><button class="searchMoreBtn">더보기</button></a>		
			</div>
		</div>
		
		
		<!-- 쇼핑몰 -->
		<div class="searchListBody">
			<div class="searchListTT">
				🛒 쇼핑몰 상품 검색결과 [총  <span class="blueT">n</span>건]
			</div>
			<div class="searchListItem">
				<ul>
					<li>쇼핑몰 게시물</li>
				</ul>
			</div>
			<div style="width: 100%; display:flex; justify-content: center;">
				<a href=""><button class="searchMoreBtn">더보기</button></a>		
			</div>
		</div>
	</div>
	
</div>

<script>
	window.onload = keywordMarkHandler
	const key = '${keyword}'
	
	function keywordMarkHandler() {
		const links = document.querySelectorAll('a.searchKey')
		links.forEach(a => {
			if (a.innerText.includes(key)) {
				let text = a.innerText.replace(key, '<span class="highlight">' + key + '</span>')
				a.innerHTML = text				
			}
		})
	}
</script>

</body>
</html>