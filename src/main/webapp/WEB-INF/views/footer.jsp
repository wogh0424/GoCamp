<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
</style>
</head>
<body>

<footer><!-- footer start -->
<div class="footer_top">
	<div class="footer_top_logo"><img src="${cpath }/resources/image/thecamping_logo_grey.png"></div>
	<ul>
		<li>개발자소개</li>
		<li>개인정보처리방침</li>
		<li><a href="${cpath}/noticeBoard/view/32763">캠핑장 등록안내</a></li>
		<li>미등록야영장불법영업신고</li>
	</ul>
	<ul>
		<li><a href=""><img src="${cpath }/resources/image/header_ico/facebook32.png"></a></li>
		<li><a href=""><img src="${cpath }/resources/image/header_ico/instagram32.png"></a></li>
		<li><a href=""><img src="${cpath }/resources/image/header_ico/twitter32.png"></a></li>
		<li><a href=""><img src="${cpath }/resources/image/header_ico/youtube32.png"></a></li>
	</ul>
</div>
<div class="footer_bottom">
	<p>
		부산 해운대구 센텀2로 25 센텀드림월드 11층 (우동 1510) KG아이티뱅크 부산학원 <br>
		SITE : http://busan.kgitbank.com  TEL : 051-744-7799 (상담시간 : 평일 08:30~20:00)<br>
		Copyrights(c) 2023 FINAL PROJECT ALL RIGHTS RESERVED.
	</p>
</div>
</footer><!-- footer end -->

</body>
</html>