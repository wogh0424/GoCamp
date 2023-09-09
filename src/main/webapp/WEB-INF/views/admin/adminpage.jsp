<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript"
	src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=x9jrgpo39q&submodules=geocoder"></script>
<link rel="stylesheet" href="${cpath }/resources/css/main/mainCRUD.css" type="text/css">

<style>
body {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

ul {
	list-style: none;
	padding-left: 0;
}

a {
	text-decoration: none;
	color: black;
	!
	important
}

article {
	
}

.admimpage_wrap {
	width: 100%;
	height: 100%;
	border: 1px solid black;
}

.adminpage_items {
	width: 100%;
	height: 100%;
}

.adminpage_list>aside {
	width: 200px;
	height: 100%;
	float: left;
	border: 1px solid black;
}

.adminpage_list>aside>ul>li {
	width: 100%;
	height: 30px;
	transition-duration: 0.5s;
}

.adminpage_list>aside>ul>li:hover {
	background-color: skyblue;
	transition-duration: 0.5s;
}

.adminpage_list>aside>ul>li>a {
	text-decoration: none;
	font-weight: bold;
	color: black;
}

.main_boardlist1 {
	display: flex;
	padding-top: 5px;
	height: 30%;
	justify-content: space-around;
	width: calc(100% - 210px);
	border: 1px solid black;
	background-color: #EEF1F3;
	justify-content: space-around;
}

.main_boardlist2 {
	height: 30%;
}

.boardlist1_left {
	border: 1px solid black;
	background-color: white;
}

.boardlist1_right {
	border: 1px solid black;
	background-color: white;
}

.main_boardlist2 {
	display: flex;
	padding-top: 5px;
	justify-content: space-around;
	width: calc(100% - 210px);
	border: 1px solid black;
	background-color: #EEF1F3;
}

.boardlist2_left {
	border: 1px solid black;
	background-color: white;
}

.boardlist2_right {
	width: 47%;
	height: 100%;
	border: 1px solid black;
	background-color: white;
	overflow: scroll;
	border: 1px solid black;
}

.report_content {
	width: 100%;
	height: 30%;
}

.report_wrap {
	display: flex;
	border: 1px solid black;
	justify-content: space-evenly;
	align-items: center;
	word-wrap: break-word;
	white-space: normal;
	min-height: 40px;
}

#reported_user {
	width: 24%;
	margin-left: 20px;
}

#reported_reason {
	width: 33%;
}

#reportedDate {
	width: 33%;
}

#report_header {
	height: 70px;
	border: 1px solid black;
	text-align: center;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: #B7F0B1;
}

#category_user {
	margin-left: 20px;
	width: 33%;
}

#category_reason {
	width: 33%;
}

#category_date {
	width: 33%;
}

#category {
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 50px;
	background-color: grey;
	color: white;
}

.main_boardlist3 {
	display: flex;
	border: 1px solid black;
	width: calc(100% - 210px);
	background-color: #EEF1F3;
}

.main_boardlist3>ul {
	width: 100%;
	display: flex;
	justify-content: flex-start;
	align-items: center;
	background-color: skyblue;
}

.boardlist3_group>li {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100px;
	height: 30px;
	font-weight: bold;
	color: white;
	text-shadow: 1px 1px 1px black;
}

.main_boardlist4 {
	display: flex;
	width: calc(100% - 210px);
	height: calc(40% - 15px);
	border: 1px solid black;
	font-size: 15px;
	font-weight: bold;
	background-color: #EEF1F3;
}

.boardlist4_tablelist {
	background-color: white;
	border: 1px solid black;
	overflow: scroll;
}

.boardlist4_tablelist>ul {
	display: flex;
}

.hidden {
	display: none;
}

.boardlist4_tablelist>ul>li {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 200px;
	background-color: grey;
	color: white;
	font-weight: bold;
	text-shadow: 1px 1px 1px black;
}

.boardlist4_userlist>form>ul {
	display: flex;
}

.boardlist4_userlist>form>ul>li {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 180px;
	border-bottom: 1px solid lightgrey;
	word-wrap: break-word;
	white-space: normal;
	min-height: 40px;
}

article.selected {
	display: none;
}

#section>article.selected {
	display: none;
}

#campRoot {
     border: 2px solid black;
     width: 900px;
     height: 850px;
     margin: auto;
     overflow-y: auto;
 }
        
.managementCamps {
	display: flex;
	padding: 10px;
	border-bottom: 1px solid grey;
}
</style>

<script src="${cpath }/resources/js/scroll_paging.js"></script>

<div class="admimpage_wrap">
	<div class="adminpage_items">
		<div class="adminpage_list">
			<aside>
				<ul id="admin_nav">
					<li><a href="${cpath }/">홈으로</a></li>
					<li>회원관리</li>
					<li>캠핑장 관리</li>
					<li>매출관리</li>
				</ul>
			</aside>
			<section id="section">
				<article></article>
				<article>
					<div class="main_boardlist1">
						<canvas class="boardlist1_left" id="boardlist1_lefts"
							style="height: auto; width: 47%"></canvas>
						<canvas class="boardlist1_right" id="boardlist1_right"
							style="height: auto; width: 47%;">list1_right</canvas>
					</div>
					<div class="main_boardlist2">
						<canvas class="boardlist2_left" id="boardlist2_left"
							style="height: auto; width: 47%;">list2_left</canvas>
						<div class="boardlist2_right">
							<div class="report_content">
								<div id="report_header">
									<p>신고당한 유저</p>
								</div>
								<div id="category">
									<div id="category_user">
										<p>신고당한 유저</p>
									</div>
									<div id="category_reason">
										<p>신고사유</p>
									</div>
									<div id="category_date">
										<p>신고일</p>
									</div>
								</div>
								<div class="report_wrap">
									<c:forEach var="report" items="${adminList }">
										<div id="reported_user">${report.reported_user }</div>
										<div id="reported_reason">${report.reportedReason }</div>
										<div id="reportedDate">${report.reportedDate }</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					<div class="main_boardlist4">
						<div class="boardlist4_tablelist">
							Table Name
							<ul>
								<li><input type="checkbox"></li>
								<li>IDX</li>
								<li>USERID</li>
								<li>USERNAME</li>
								<li>NICNAME</li>
								<li>EMAIL</li>
								<li>PNUM</li>
								<li>BIRTH</li>
								<li>ENABLED</li>
								<li>AUTHORITY</li>
								<li>ENABLED</li>
								<li>BOARD-BAN</li>
							</ul>
							<div class="boardlist4_userlist">
								<!-- c:foreach 시작구간  -->
								<c:forEach var="dto" items="${list}">
									<form action="${cpath}/admin/modifyAuth" method="POST">
										<ul>
											<li><input type="checkbox"></li>
											<li>${dto.idx}</li>
											<li>${dto.userid}</li>
											<li>${dto.username}</li>
											<li>${dto.nickname}</li>
											<li>${dto.email}</li>
											<li>${dto.pnum}</li>
											<li>${dto.birth}</li>
											<li><c:if test="${dto.enabled == 1}">접근허용</c:if> <c:if
													test="${dto.enabled == 0}">접근금지</c:if></li>
											<li><select name="authority">
													<option value="ROLE_USER">일반유저</option>
													<option value="ROLE_BUSINESS">사업자 등록</option>
											</select></li>
											<li><select name="enabled">
													<option value="1">로그인 허가</option>
													<option value="0">로그인 금지</option>
											</select></li>
											<li><input type="hidden" name="userid"
												value="${dto.userid}" />
												<button type="submit">권한변경</button></li>
									</form>
									<li>
										<form action="${cpath }/admin/ControluserBoard">
											<input type="hidden" name="nickname" value="${dto.nickname }" />
											<button type="submit">게시글 조회</button>
										</form>
									</li>
									</ul>
								</c:forEach>
								<!-- c:foreach 끝 구간  -->
							</div>
						</div>
					</div>
				</article>
				<!-- 캠핑장 관리페이지 -->
				<article>
					<div id="campRoot">
						<div class="content" pageNo="0"></div>
					</div>
				</article>
				<article></article>
			</section>
		</div>
	</div>
</div>
<script>
	const cpath = '${cpath}'
	window.onload = loadHandler
	
	function loadHandler() {
		const contents = document.querySelector('div.content')
		const pageNo = +contents.getAttribute('pageNo') + 1
		contents.setAttribute('pageNo', pageNo)
		let url = cpath +  '/admin/getCampList/' + pageNo
		fetch(url)
		.then(resp => resp.json())
		.then(json => {
			let tag = ''
			json.forEach(ob => {
				tag += '<div class="managementCamps">' 
				tag += '	<div class="id">' + ob.contentId  + '</div>'
				tag += '	<div class="nm">' + ob.facltNm  + '</div>'
				tag += '	<div class="addr">' + ob.addr1  + '</div>'
				tag += '	<div class="campManageButtons">'
				tag += '		<a href="' + cpath +  '/main/modifycamp/' + ob.contentId + '">'
				tag += '			<button>수정하기</button>'			
				tag += '		</a>'			
				tag += '		<a href="' + cpath +  '/main/deletecamp/' + ob.contentId + '">'
				tag += '			<button>삭제하기</button>'			
				tag += '		</a>'			
				tag += '	</div>'
				tag += '</div>'
			})
			contents.innerHTML += tag
		})
	}
	
	function scrollHandler(event) {
		const ob = {
                scrollTop: event.target.scrollTop,
                clientHeight: event.target.clientHeight,
                scrollHeight: event.target.scrollHeight
            }
            console.log(ob)
            const flag = ob.scrollTop + ob.clientHeight == ob.scrollHeight

            if (flag) {
                loadHandler()
            }	
	}
	document.getElementById('campRoot').onscroll = scrollHandler
</script>

<script>
	var incomearr = [];
	var date = []
	
	function createIncomeChart() {
	    var incomeparsed = [];
	    const ctx = document.getElementById('boardlist2_left').getContext('2d');
	
	    const myChart = new Chart(ctx, {
	        type: 'line', 
	        data: {
	            labels: date,
	            datasets: [
	                {
	                	label: '수익',
	                    data: incomearr,
	                    borderColor: '#1DDB16',
	                    backgroundColor: '#FFC19E',
	                    pointStyle: 'circle', 
	                    pointHoverRadius: 15 
	                }
	            ]
	        },
	        options: {
		    	  responsive: false,
		    	  plugins: {
		    	    legend: { 
		    	      position: 'top',
		    	    },
		    	    title: {
		    	      display: true,
		    	      text: '주간 수익'
		    	    }
		    	  }
		    	}
	    });
	}
	
	
	
	$.getJSON("${cpath}/admin/requestincome", function(incomeData){
		$.each(incomeData, function(index, obj){
			incomearr.push(obj.income)
			date.push(obj.formattedDate)
		})
		createIncomeChart()
	})
	</script>

<script>
		var reportcnt = []	
		var reportUser = []
	
		function createReportChart(){
			const ctx = document.getElementById('boardlist1_right').getContext('2d')
			const myChart = new Chart(ctx, {
		        type: 'bar', 
		        data: {
		            labels: reportUser,
		            datasets: [
		                {
		                    label: '신고횟수',
		                    data: reportcnt,
		                    borderColor: '#1DDB16',
		                    backgroundColor: [
		                    '#FFC19E',
	                    	'#ABF200',
	                    	'#B5B2FF',
	                    	'#FFD9FA',
	                    	'#B2CCFF',
	                    	'#1DDB16'
	                    	],
		                    pointStyle: 'circle', 
		                    pointHoverRadius: 15 
		                }
		            ]},
		        options: {
		        	indexAxis: 'y',
			    	  responsive: false,
			    	  plugins: {
			    	    legend: { 
			    	      position: 'top',
			    	    },
			    	    title: {
			    	      display: true,
			    	      text: '베스트 신고당한유저'
			    	    }
			    	  }
			    	}
		    });
			
		}
		
		$.getJSON("${cpath}/admin/requestReportedData", function(reportDate) {
			$.each(reportDate, function(index, obj){
				reportcnt.push(obj.reportCount)
				reportUser.push(obj.reported_user)
			})
			createReportChart()
		})
		</script>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
	const btnList = document.querySelectorAll('#admin_nav > li')
	const articleList = document.querySelectorAll('#section > article')
	
	   btnList.forEach((element, index) => {
            articleList.forEach(e => e.classList.add('selected'))
            articleList[1].classList.remove('selected')
            element.onclick = function(event) {
                btnList.forEach(e => e.classList.remove('selected'))
                element.classList.add('selected')
                
                articleList.forEach(e => e.classList.add('selected'))
                articleList[index].classList.remove('selected')       
            }
        })
</script>
<script>
	var TodayData = [];
	var YesterdayDatas = [];
	function createChart() {
		  var Todayarr = [];
		  var YesterDayarr = [];

		  for (let key in TodayData[0]) {
		    Todayarr.push(TodayData[0][key]);
		  }
		  
		  for (let key in YesterdayDatas[0]) {
		    YesterDayarr.push(YesterdayDatas[0][key]);
		  }
		  
		  Todayarr = Todayarr.filter(e => e != null);
		  YesterDayarr = YesterDayarr.filter(e => e != null);


		  const ctx = document.getElementById('boardlist1_lefts').getContext('2d');
		  
		  const myChart = new Chart(ctx, {
		    type: 'bar',
		    data: {
		      labels: ['서울시', '부산시', '대구시', '인천시', '광주시', '대전시', '울산시', '세종시', '제주도'],
		      datasets: [
		        {
		        	label: '어제',
		            data: YesterDayarr,
		            borderColor: 'lightgray',
		            backgroundColor: '#FFC19E',
		            borderWidth: 2,
		            borderRadius: 5,
		            borderSkipped: false,
		        },
		        {
		        	label: '오늘',
		            data: Todayarr,
		            borderColor: 'lightgray',
		            backgroundColor: '#FFBB00',
		            borderWidth: 2,
		            borderRadius: 5,
		            borderSkipped: false,
		        }],
		    },
		    options: {
		    	  responsive: false,
		    	  plugins: {
		    	    legend: { 
		    	      position: 'top',
		    	    },
		    	    title: {
		    	      display: true,
		    	      text: '지역별 검색횟수'
		    	    }
		    	  }
		    	}
		  });
		}

	
	$.getJSON("${cpath}/admin/requestYesternayData", function(yesterdayData) {
	  $.each(yesterdayData, function(index, obj) {
		  YesterdayDatas.push(obj);
	  });
	  $.getJSON("${cpath}/admin/requestTodayChartData", function(todayData) {
	    $.each(todayData, function(index, obj) {
	    	TodayData.push(obj);
	    });
	    createChart();
	  });
	});	
	</script>


</body>
</html>