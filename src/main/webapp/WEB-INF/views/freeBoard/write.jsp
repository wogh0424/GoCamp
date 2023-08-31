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
<form id=insertForm" method="POST" enctype="multipart/form-data" >
<div>
	<p><input type="text" name="title" placeholder="제목" required autofocus> </p>
	<p><input type="text" name="writer" value="${nickname}" readonly> </p>
		<label for="upload">첨부파일 미리보기:</label>
		<div id="preview"></div>
		<div><p><input name="upload" type="file" id="upload" accept="image/*" multiple ></p></div>
	<p><textarea id="content" name="content" required></textarea> </p>
	<p><input type="submit"></p>
</div>
</form>	

    <script>
        const input = document.querySelector('input[name="upload"]')
        const preview = document.getElementById('preview')
     

       	function changeHandler(event) {
  		preview.innerHTML = ''
			
		    if (event.target.files) {
		        const files = event.target.files
		        for (const file of files) {
		            const reader = new FileReader()
		            reader.onload = function(e) {
		                const image = new Image()
		                image.src = e.target.result
		                image.style.height = '200px'
		                preview.appendChild(image)
		            }
		            reader.readAsDataURL(file)
		        }
		      
		    } 
		}
		
		input.onchange = changeHandler
    </script>

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











</body>
</html>