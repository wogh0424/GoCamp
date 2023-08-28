<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
		
<h3>리뷰작성</h3>
<div id="reviewInputForm">
<form method="POST" enctype="multipart/form-data" action="${cpath }/upload">
	<p><input type="text" name="title" placeholder="제목" required autofocus> </p>
	<p><input type="text" name="writer" placeholder="작성자"> </p>
	<p><textarea name="review_content" placeholder="리뷰작성" required></textarea> </p>
	<p><input type="text" name=gocamp_board  placeholder="contentId"/></p>
	<p><input name="upload" type="file" multiple ></p>
	<p><input type="submit"></p>
</form>
</div>

<fieldset>
	<c:forEach var="review" items="${list }">
		<div id="gocampReview">  
			<hr>
			<h2>${review.idx }</h2>
			<h2>${review.title }| ${review.writer} | <fmt:formatDate value="${review.reviewdate }"/></h2>                                              
			<h3>${review.review_content }</h3>
			<c:forTokens var="filePath" items="${review.filePath }" delims=",">
				<h3>${filePath}</h3>
				<img src="${cpath }/upload/${filePath }" height="200">
			</c:forTokens>	
			<a href="${cpath }/deleteReview/${review.idx }"><button>삭제</button></a>
		</div>
		</c:forEach>
</fieldset>
</body>
</html>