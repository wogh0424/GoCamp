<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>

<div id=boardTitle>
<div id=board>BOARD > </div><div id=freeBoard><a href="${cpath}/freeBoard">FreeBoard(${dto.idx }번 수정)</a></div>
</div>


<form id="insertForm" method="POST" enctype="multipart/form-data" >
	<div>
			<p><input type="text" name="title" value="${dto.title }" required autofocus></p>
			<p><input type="text" name="writer" value="${dto.writer }" readonly></p>
			<p><input type="date" name="writeDate" value="${dto.date }" readonly></p>
			<label for="upload">수정 첨부파일 미리보기:</label>
<!-- 			<div id="preview"> -->
			
<!-- 			<div> -->
<!-- 			    <p>현재 이미지:</p> -->
<%-- 			    <img src="${dto.filePath}" alt="현재사진" style="max-height: 200px;"> --%>
<!-- 			    <p>이미지 삭제: <input type="checkbox" name="deleteImage"></p> -->
<!-- 			</div> -->
<!-- 			</div> -->
	    <c:forEach var="filePath" items="${dto.filePath}" varStatus="loop">
            <img src="${cpath}/upload/${filePath}" height="200">
            <p>이미지 삭제: <input type="checkbox" name="deleteImage_${loop.index}" value="${filePath}"></p>
            <p>새 이미지 업로드: <input name="upload_${loop.index}" type="file" accept="image/*"></p>
        </c:forEach>
<%-- 			<div><p><input name="upload" type="file" id="upload" value="${dto.filePath }" accept="image/*" multiple ></p></div> --%>
			<p><textarea id="content" name="content" required >${dto.content }</textarea></p>
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







</body>
</html>