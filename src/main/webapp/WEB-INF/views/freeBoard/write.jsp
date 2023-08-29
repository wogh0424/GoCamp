<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>

<!-- 	텍스트에디터 api - summernote -->
	<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<h3>작성</h3>
<!-- enctype="multipart/form-data" -->
<form method="POST" enctype="multipart/form-data" >
	<p><input type="text" name="title" placeholder="제목" required autofocus> </p>
	<p><input type="text" name="writer" value="${nickname}" readonly> </p>
	<p><textarea id="content" name="content" placeholder="내용" required></textarea> </p>
	<p><input name="upload" type="file" multiple ></p>
	
	<p><input type="submit"></p>
</form>	






<script>
$(document).ready(function() {
	$('#content').summernote({
        placeholder: '내용',
        tabsize: 2,
        height: 100
      });   // summernote라는 id 값을 찾아서 적용.
});
</script>











</body>
</html>