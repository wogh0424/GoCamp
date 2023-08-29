<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>



<details>
	<summary><b>프로젝트 진행 현황</b></summary>
	<fieldset>
		<pre>
			<ol>
					<li><a href="${cpath }/freeBoard">자유게시판 + 댓글</a></li>
					<li><a href="${cpath }/noticeBoard">공지게시판</a></li>
					<li><a href="${cpath }/eventBoard">이벤트게시판</a></li>
					<li><a href="${cpath }/review">main review + fileupload</a></li>
				
			</ol>
		</pre>
	</fieldset>
</details>
<footer><!-- footer start -->
<div class="footer_botton">
	<ul>
		<li>개발자소개</li>
		<li>개인정보처리방침</li>
		<li>전자우편무단수집거부</li>
		<li>캠핑장 등록안내</li>
		<li>미등록야영장불법영업신고</li>
	</ul>
</div>
</footer><!-- footer end -->
</body>
</html>