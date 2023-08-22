<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>


<h3>Version : ${version }</h3>

<details>
	<summary><b>프로젝트 진행 현황</b></summary>
	<fieldset>
		<pre>
			<ol>
				<li>mariaDB 버전 띄우기</li>
				<li>정민 - main 페이지 불러오기 완료</li>
					<li><a href="${cpath }/freeBoard">자유게시판 + 댓글</a></li>
				
			</ol>
		</pre>
	</fieldset>
</details>

</body>
</html>