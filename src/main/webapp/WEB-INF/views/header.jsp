<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GoCamping</title>

<style>
/* body 전체에 폰트 설정 */

* {
	
}

/*전체 적용*/
body {
	margin: 0;
	padding: 0;
}

ul {
	list-style: none;
	padding-left: 0;
}

a {
	text-decoration: none;
	color: black;
}
/* 타이틀 로고 부터 navbar까지 시작*/
.title_logo {
	display: flex;
	justify-content: center;
	background-color: #3C5944;
	border-bottom: 3px solid #422825;
}

.header_top {
	display: flex;
	justify-content: space-around;
	align-items: center;
	background-color: #3C5944;
	width: 100%;
	height: 80px;
}

.header_top>ul {
	display: flex;
	padding: 10px;
}

.header_top>ul>li {
	list-style: none;
	font-weight: bold;
	color: white;
	transition-duration: 0.5s;
}

.header_top>ul>li>a:hover {
	background-color: #F1BC31;
	color: white;
	text-decoration: initial;
	transition-duration: 0.5s;
}

.header_top>ul>li>a {
	text-decoration: none;
	color: white;
	padding: 28px;
}
/* 타이틀 로고 부터 navbar까지 끝*/
/* 로그인 헤더 시작*/
.header_login {
	display: flex;
	justify-content: flex-end;
	align-items: center;
	width: 100%;
	height: 35px;
	background-color: #F4C752;
	border-bottom: 3px solid #422825;
}

.header_login>ul {
	display: flex;
	list-style: none;
}

.header_login>ul>li {
	margin: 20px;
	color: white;
	font-weight: bold;
}

.header_login>ul>li>a {
	text-decoration: none;
	color: black;
	font-weight: bold;
}


/* 게시판  */

/*리뷰게시판 */

 pre{
	background-color: white;
 }

  #reviewContainer {
  	width: 80%;
    margin: 0 auto;
    padding: 20px;
    background-color: #ffffff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  }
  
  #reviewContainer > h3 {
    font-size: 24px;
    margin-bottom: 20px;
    color: #333;
  }
  
  
  #reviewForm {
  background-color: #f7f7f7;
  padding: 20px;
  border-radius: 5px;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

.inputReview {
  display: flex;
  gap: 10px;
}


.inputReview input[name="title"] {
	width: 400px;
	height: 50px;
}


#reviewContainer textarea[name="review_content"] {
  width: 720px;
  height: 200px;
  padding: 10px;
  margin-top: 15px;
  border: 1px solid #ccc;
  border-radius: 3px;
  box-sizing: border-box;

}

#reviewContainer input[type="file"] {
  width: 100%;
  padding: 10px;
  margin-top: 15px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

#reviewContainer input[type="submit"] {
  background-color: #F4C752;
  color: #3C5944;
  font-weight: 
  border: none;
  border-radius: 10px;
  padding: 10px 20px;
  cursor: pointer;
}
  

 .gocampReview {
  position: relative; /* 컨테이너를 기준으로 삭제 버튼을 배치 */
  border: 1px solid #ccc;
  border-radius: 5px;
  padding: 15px;
  margin: 10px;
  background-color: #f9f9f9;
  box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: flex-start;
}

.reviewHeader {
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
  margin-bottom: 10px;
}

.reviewIdx {
  margin: 0;
  font-size: 0.8rem;
  color: #888;
}

.reviewTitle {
  margin: 0;
  font-size: 1.4rem;
}

.reviewContent {
  margin: 0;
}

.reviewDetails {
  display: flex;
  justify-content: space-between;
  align-items: flex-end;
  width: 100%;
  font-size: 0.9rem;
  color: #555;
  margin-top: 10px;
}

.reviewWriter, .reviewDate {
  margin: 0;
}

.reviewImages {
  display: flex;
  gap: 10px;
  margin-top: 10px;
}

.reviewImage {
  max-height: 150px;
  object-fit: cover;
  border: 1px solid #ddd;
  border-radius: 3px;
}

.deleteReviewLink {
  position: absolute;
  bottom: 0;
  right: 0;
}

.deleteReviewBtn {
  background-color: #F4C752;
  color: #3C5944;
  border: none;
  border-radius: 3px;
  padding: 5px 10px;
  cursor: pointer;
}

/* 리뷰 헤더에 대한 스타일 */
.reviewHeader {
  cursor: pointer; /* 포인터 커서로 클릭 가능하도록 설정 */
  border: 1px solid #ddd; /* 테두리 추가 (선택 사항) */
  padding: 10px; /* 여백 추가 (선택 사항) */
}

/* 숨겨진 리뷰 내용에 대한 스타일 */
.hiddenReview {
  display: none; /* 숨겨진 상태로 시작 */
  padding: 10px; /* 여백 추가 (선택 사항) */
}

/* 리뷰 제목에 대한 스타일 */
.reviewTitle {
  font-weight: bold; /* 제목을 두껍게 표시 */
  font-size: 16px; /* 원하는 글꼴 크기로 조정 */
  margin-bottom: 5px; /* 아래 여백 추가 (선택 사항) */
}


/* 리뷰게시판 끝 */
  
  
/*자유게시판*/

/*/

/* 검색창 */

.search-form {
  display: flex;
  justify-content: flex-end;
  margin-top: 10px;
}

.search-column,
.search-input,
.search-select {
  margin-right: 5px;
}

.search-input-container {
  display: flex;
  align-items: center;
  background-color: #f9f9f9;
  border: 1px solid #3C5944;
  border-radius: 3px;
}

.search-input {
  padding: 8px;
  border: none;
  border-radius: 3px;
}

.search-submit {
  background-color: #f9f9f9;
  border: none;
  border-radius: 3px;
  padding: 8px;
  }

	#boardTitle{
		display: flex;
		gap: 10px;
/* 		justify-content: center;  */
/* 		align-items: center; */
		padding-left: 250px;
		padding-top: 50px;
		
	}
	
	#board{
		font-size: 25pt;
		font-weight: bold;
		line-height: 1
		
	}
	#freeBoard,
	#reviewBoard,
	#eventBoard,
	#noticeBoard {
		font-size: 20pt;
		font-weight: bold;
		line-height: 1
	}
	
	#column {
 		display: flex;
 		gap: 10px;
    }
   
	
	#boardList {
			width: 900px;
			margin: 0 auto;
		}
		.item {
			display: flex;
			padding: 5px 10px;
		}
		.column {
			display: flex;
			
		}
		.columns {
			
			border-bottom: 3px solid #00743D; 
			border-top: 3px solid #00743D; 
		}
		.item > .idx,
		.item > .writer,
		.item > .date,
		.item > .viewCount {
			flex: 1;
		}		
		.item > .title {
			flex: 5;
		}
		.item > .idx{
			color:  #00743D;
		}
		.menubar {
			display: flex;
			width: 900px;
			margin: 20px auto;
 			justify-content: space-between; 
		}
		
		

.flex {
	display: flex;
}

.description {
	width: 600px;
}

.lineIntro {
	display: -webkit-box;
	max-width: 60%;
	-webkit-line-clamp: 1;
	-webkit-box-orient: vertical;
	overflow: hidden;
	text-overflow: ellipsis;
}

.intro {
	display: -webkit-box;
	max-width: 60%;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
	overflow: hidden;
	text-overflow: ellipsis;
}



.item {
	display: flex;
	padding: 5px 10px;
}

.columns {
	background-color: white;
}

.item>.idx, .item>.writer, .item>.writeDate, .item>.viewCount {
	flex: 1;
}

.item>.title {
	flex: 5;
}

.menubar {
	display: flex;
	width: 900px;
	margin: 20px auto;
	justify-content: space-between;
}

a{
	text-decoration: none;
	color: black;
}
#login_btn {
	font-weight: bold;
}
/*2023-08-29 쇼핑몰 페이지 추가 - 재우 */
.product_wrap {
	flex-wrap: wrap;
	width: 100%;
	height: 2600px;
	border: 1px solid black;
}
.product_items {
	display: flex-start;
	justify-content: center;
	border-top: 1px solid grey;
	
}
.product_items:hover{
	background-color: #D9EEFF;
}
.product_items > ul > li {
	font-size: 12px;
	color: grey;

}
.product_items > ul > li > a > button {
	width: 150px;
}
#product_pContent {
	width: 250px;
	height: 100px;
}
#product_pName{
	font-weight: bold;
}
#product_event_ico {
	display: flex;
}
#event_ico_new,
#event_ico_hot,
#event_ico_event {
	font-size: 10px;
	padding: 3px;
	margin: 2px;
	box-shadow: 1px 1px 1px black;
}
#event_ico_new{
	background-color: yellow;
	color: black;
}
#event_ico_hot {
	background-color: red;
	color: yellow;
}
#event_ico_event{
	background-color: lightgreen;
	color: black;
}
/*list 카테고리 리스트 시작 */
.pCategory_items {
	width: 900px;
	height: 80px;
	border-top: 1px solid white;
	margin: auto;
}

.pCategory_list {
	display: flex;
	justify-content: center;
}
.pCategory_list > ul {
	border-top: 2px solid black;
}
.pCategory_list > ul > li {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 150px;
	height: 30px;
	text-align: center;
	font-size: 12px;
	background-color: #F0F1F3;	
}
.pCategory_search {
	border: 1px solid black;
	background-color: white;
}
.pCategory_search > ul{
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 0;
	padding: 0;
}
.pCategory_search > ul > li {
	font-size: 11px;
	padding: 5px;
	
}
/* 카테고리 리스트 끝 */

/*footer 시작 */
footer{
	width: 100%;
	height: 100px;
}
.footer_menu > ul	{
	display: flex;
	justify-content: space-around;
}
.footer_top {
	display: flex;
	justify-content: center;
	background-color: #363636;
	border-bottom: 1px solid grey;
}
.footer_top_logo > img{
	width: 150px;
	height: 100px;
}
.footer_top > ul {
	display: flex;
	justify-content: center;
	color: white;
	list-style: none;
	font-size: 13px;
}
.footer_top > ul > li {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 10px;
}
.footer_bottom {
	width: 100%;
	height: 100px;
	background-color: #363636;
}
.footer_bottom {
	color: white;
}
.footer_bottom > p{
	padding: 10px;
	margin: 0;
	text-align: center;
	font-size: 13px;
	
}
/*footer 끝 */
.paging {
	display: flex;
	justify-content: center;
	padding: 10px;
	margin: 10px;
	text-align: center;
}
.paging_count {
	width: 20px;
	height: 20px;
	border: 1px solid black;
	background-color: black;
	margin: 2px;
	
}
.paging_count > a {
	font-weight: bold;
	color: white;
}
/*main_review_rank 페이지 시작 */
.review_rank{
	height: 500px;
	display: flex;
	justify-content: center;
	background-image: url("./resources/image/bg-image.jpg");
	
}
.review_rank_image  {
	padding: 10px;
}
.review_rank_image > img{
	display: block;
	margin: auto;
	width: 150px;
	height: 150px;
	border-radius: 50%;
}
.review_rank_content {
	width: 400px;
	height: 200px;
	background-color: white;
	border: 1px solid black;
	box-shadow: 2px 2px 2px black;
}
.review_rank_items{
	display: flex;
	margin: auto;
}
.review_rank_campingName, 
.review_rank_cityName {
	color: white;
	font-weight: bold;
	text-align: center;
}
/*main_review_rank 페이지 끝 */
/*camping_top_wrap 캠핑장 랭크 시작*/
.camping_top_wrap {
	display: flex;
	justify-content: center;
}
.camping_left_list {
	border: 1px solid black;
	display: flex;
}
.camping_left_list > ul  {
	padding: 0;
	margin: 0;
}
.camping_left_list > ul > li {
	border: 1px solid black;
	width: 400px;
	height: 300px;
}
.camping_left_content {
	background-color: #eeeeee;
	padding: 15px;
}
.camping_right_list {
	display: flex;
}
.camping_right_contents > h3,
.camping_right_contents > p {
	padding: 0;
	margin: 0;
}
.camping_right_contents > h3 {
	text-align: center;
}
.blue {
	color: blue;
}
/*camping_top_wrap 캠핑장 랭크 끝*/
/*메뉴 드랍 다운 시작 */
#menu {
		box-sizing: border-box;
		display: flex;
		justify-content: center;
		align-items: center;
		width:100%;
		height:100%;
		background-color: #3C5944;
		color:black;
		line-height: 50px; 
		margin:0 auto;
		text-align: center;
		
}

/* menu태그 자식의 ul의 자식 li를 왼쪽정렬과 넓이 140설정 */
#menu > ul > li {
		display: flex;
		justify-content: center;
		align-items: center;
		float:left;
		width:140px;
		height: 85px;
		position:relative;
		list-style: none;
		padding: 0;
		margin: 0;
}
#menu > ul > li > ul {
		width:140px;
		display:none;
		position: absolute;
		font-size:14px;
		background: white;
		top: 86px;
		left: 0px;
}
#menu > ul > li:hover {
	background-color: #6f8c77;
}


#menu > ul > li:hover > ul {
		display:block;
		z-index: 1;
}

#menu > ul > li > ul > li {
		background-color: #6f8c77;
		border: 1px solid lightgrey;
		border-top: none;
}

#menu > ul > li > ul > li:hover {
		background: orange;
		transition: ease 0.5s;
}
#menu > ul > li a {
		text-decoration: none;
		color: white;
		font-weight: bold;
}
/*메뉴 드랍 다운 끝*/

aside {
	height: 100%;
	border-left: 0.25px solid black;
	float: left;
}

/*메뉴 드랍 다운 끝*/


/*장바구니 페이지 시작*/
.basket_status > ul{
	display: flex;
	justify-content: flex-end;
}
.basket_checklist > ul{
	display: flex;
	justify-content: space-between;
}
.basket_items {
	width: 1000px;
	height: 1000px;
	margin: auto;
}
.basket_list {
	border-top: 2px solid black;
	border-bottom: 1px solid grey;
}
.basket_list > ul {
	display: flex;
	justify-content: center;
}
.basket_list > ul > li {
	padding: 5px;
	text-align: center;
}
.basket_pay > ul {
	display: flex;
	justify-content: center;
}
.basket_pay > ul > li {
	padding: 5px;
}
#payBtn{
	border: 2px solid green;
	border-radius: 5px;
	background-color: white;
	color: black;
}
#payAllBtn {
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 5px;
	width: 250px;
	height: 50px;
	background-color: #3C5944;
	box-shadow: 1px 1px 1px black;
	font-weight: bold;
}
#payAllBtn > a {
	text-decoration: none;
	color: white;
}
/*장바구니 페이지 끝*/
/*주무녈제 페이지 시작*/
.orderpay_items {
	width: 1000px;
	height: 1000px;
	margin: auto;
}
.orderpay_items > p {
	text-align: center;
}
.orderpay_status {
	display: flex;
	justify-content: space-between;
	border-bottom: 1px solid black;
}
.orderpay_status > ul {
	display: flex;
}
.orderpay_list_title > ul {
	display: flex;
	justify-content: space-around;
}
.orderpay_list {
	border-bottom: 1px dashed black;
}
.orderpay_list > ul {
	display : flex;
	justify-content: space-around;
}
#orderpay_title,
#deliveryInfo_title {
	font-weight: bold;
	font-size: 15px;
}
.orderpay_delivery_address {
	border-bottom: 1px solid black;
}
.orderpay_details {
	border-bottom: 1px dashed black;
}
#orderpayBtn {
	width: 250px;
	height: 50px;
	border-radius: 5px;
	background-color: #3C5944;
	color: white;
	font-weight: bold;
	text-align: center;
}
#lastorderBtn {
	width: 250px;
	height: 50px;
	border-radius: 5px;
	background-color: #3C5944;
	color: white;
	font-weight: bold;
}
.lastorder_items {
	width: 1000px;
	height: 100%;
	margin: auto;
	text-align: center;
}
.lastorder_status > ul{
	display: flex;
	justify-content: flex-end;
}.orderlist_items {
	width: 1000px;
	height: 1000px;
	margin: auto;
}
.orderlist_list {
	border-top: 2px solid black;
	border-bottom: 1px solid grey;
}
.orderlist_list > ul {
	display: flex;
	justify-content: center;
}
.orderlist_list > ul > li {
	padding: 5px;
	text-align: center;
}
.orderlist_pay > ul {
	display: flex;
	justify-content: center;
	margin: 5px;
}
.orderlist_pay > ul > li {
	padding: 5px;
}

.admimpage_wrap {
	width: 1920px;
	height: 1300px;
	border: 1px solid black;
}
.adminpage_items {
	width: 100%;
	height: 100%;
}
.adminpage_list > aside {
	width: 10%;
	height: 1300px;
	float: left;
	border: 1px solid black;
}
.adminpage_list > aside > ul > li {
	width: 100%;
	height: 30px;
	transition-duration: 0.5s;
}
.adminpage_list > aside > ul > li:hover{
	background-color: skyblue;
	transition-duration: 0.5s;
}

.adminpage_list > aside > ul > li > a {
	text-decoration: none;
	font-weight: bold;
	color: black;
}
.main_boardlist1 {
	padding: 5px;
	display: flex;
	justify-content: center;
	width: 90%;
	height: 400px;
 	border: 1px solid black;
 	background-color: #EEF1F3;
}
.boardlist1_left {
	margin: 5px;
	width: 70%;
	border: 1px solid black;
	background-color: white;
}
.boardlist1_right {
	margin: 5px;
	width: 30%;
	border: 1px solid black;
	background-color: white;
}
.main_boardlist2 {
	display: flex;
	justify-content: center;
	width: 90%;
	height: 400px;
 	border: 1px solid black;
 	background-color: #EEF1F3;
}
.boardlist2_left {
	margin: 10px;
	width: 33%;
	border: 1px solid black;
	background-color: white;
}
.boardlist2_center{
	margin: 10px;
	width: 33%;
	border: 1px solid black;
	background-color: white;
}
.boardlist2_right{
	margin: 10px;
	width: 33%;
	border: 1px solid black;
	background-color: white;
}
.main_boardlist3 {
	padding: 5px;
	display: flex;
	border: 1px solid black;
	width: 90%;
	background-color: #EEF1F3;
}
.main_boardlist3 > ul {
	width: 100%;
	display: flex;
	justify-content: flex-start;
	align-items: center;
	background-color: skyblue;
}
.boardlist3_group > li {
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
	padding: 5px;
	display: flex;
	width: 90%;
	height: 462px;
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
.boardlist4_tablelist > ul {
	display: flex;
}
.boardlist4_tablelist > ul > li {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 132px;
	height: 30px;
	background-color: grey;
	color: white;
	font-weight: bold;
	text-shadow: 1px 1px 1px black;
}
.boardlist4_userlist > form > ul {
	display: flex;
}
.boardlist4_userlist > form > ul > li {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 132px;
	height: 30px;
	border-bottom: 1px solid lightgrey;
}
/*주무녈제 페이지 끝*/

.camping_right_list:hover {
	background-color: #F4C752;
	color: #1146D5;
	transition: ease 0.3s;
}
</style>

<script>
	const cpath = '${cpath}'
</script>

</head>
<body>

<!-- jquery 사용 위한 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- 	텍스트에디터 api - summernote -->
	<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>



<script>

$(document).ready(function() {
    $('#content').summernote({
        toolbar: [
        	// [groupName, [list of button]]
    	    ['fontname', ['fontname']],
    	    ['fontsize', ['fontsize']],
    	    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
    	    ['color', ['forecolor','color']],
    	    ['table', ['table']],
    	    ['para', ['ul', 'ol', 'paragraph']],
    	    ['height', ['height']],
    	    ['view', ['fullscreen', 'help']]
        ],
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
        fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
        
        placeholder: '내용을 입력하세요',
        tabsize: 2,
        width: 800,
        height: 200
    });
});
</script>

<!-- 텍스트 에디터 끝 -->


	<header>
		<div class="title_logo">
			<a href="${cpath }/"><img
				src="${cpath }/resources/image/thecamping_logo.png"></a>
		</div>
		<div class="header_login" >
			<ul  style="margin-right: 10%;">
				<c:if test="${pageContext.request.userPrincipal != null}">
					<li>현재 접속 아이디 ${pageContext.request.userPrincipal.name}</li>
					<!-- 접속된 아이디 표시를 원하면 여기에 el태그 삽입 -->
				</c:if>
				<sec:authorize access="isAnonymous()">			
					<li id="login_btn">
						<a href="<c:url value="/login/loginForm" />">로그인</a>
					</li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<%-- 			<form:form action="${pageContext.request.contextPath}/logout" method="POST"> --%>
					<li><a href="${cpath }/product/basket">장바구니</a></li>
					<li><a href="${cpath }/logout">로그아웃</a></li>
					<%-- 			</form:form> --%>
				</sec:authorize>
				<c:if test="${pageContext.request.userPrincipal == null}">
					<li><a href="${cpath }/login/signup">회원가입</a></li>
				</c:if>
				<c:if test="${sessionScope.permission == 'ROLE_ADMIN'}">
					<h3>
						<a href="<c:url value="/admin/adminpage" />">관리자 홈</a>
					</h3>
				</c:if>
				<c:if
					test="${sessionScope.permission == 'ROLE_USER' && pageContext.request.userPrincipal != null }">
					<h3>
						<a href="${cpath }/mypage/main">마이페이지</a>
					</h3>
				</c:if>
			</ul>
		</div>
	</header>
	<div class="header_bottom" style="display: flex; justify-content: right; height: 40px; align-items:center; padding-right: 10%; width: 100%; background-color: #3C5944;">
		<form action="${cpath }/main/search">
			<div style="display: flex; justify-content: space-between; background-color: white; font-size: 16px;">
			<input type="search" name="srchKywrd" placeholder="검색어를 입력하세요" style="border: none; background-color: white; width: 250px; height: 30px;">
			<span style="line-height: 30px;">🔍</span>
			</div>
		</form>
	</div>
	<nav>
		<div class="header_top">
			<div id="menu">
				<ul>
					<li><a href="">검색</a>
						<ul>
							<li><a href="${cpath }/main/camp">캠핑장</a></li>
							<li><a href="">SUB_MENU</a></li>
							<li><a href="">SUB_MENU</a></li>
						</ul>
					</li>
					<li><a href="">게시판</a>
						<ul>
							<li><a href="${cpath }/noticeBoard">공지게시판</a></li>
							<li><a href="${cpath }/eventBoard">이벤트게시판</a></li>
							<li><a href="${cpath }/freeBoard">자유게시판(+ 댓글)</a></li>
							<li><a href="${cpath }/reviewBoard">전체리뷰게시판</a></li>
							<li><a href="${cpath }/main/like">좋아요</a></li>
						</ul>
					</li>
					<li><a href="">쇼핑몰</a>
						<ul>
							<li><a href="${cpath }/product/list">MENU</a></li>
							<li><a href="${cpath }/product/basket">SUB_MENU</a></li>
							<li><a href="">SUB_MENU</a></li>
						</ul>
					</li>
					<li><a href="">MENU</a>
						<ul>
							<li><a href="">SUB_MENU</a></li>
							<li><a href="">SUB_MENU2</a></li>
							<li><a href="">SUB_MENU3</a></li>
						</ul>
					</li>
					<li><a href="">MENU</a>
						<ul>
							<li><a href="">SUB_MENU</a></li>
							<li><a href="">SUB_MENU2</a></li>
							<li><a href="">SUB_MENU3</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	
	
	

