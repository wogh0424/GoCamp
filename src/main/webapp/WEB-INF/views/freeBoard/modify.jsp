<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>

<div id=boardTitle>
<div id=board>BOARD > </div><div id=freeBoard><a href="${cpath}/freeBoard">FreeBoard(${dto.idx }번 수정)</a></div>
</div>


<form id="insertForm" method="POST" enctype="multipart/form-data">
  
    <div id="boardTitle"><input type="text" name="title" value="${dto.title}" required autofocus></div>


    <div id="boardWriter"><input type="text" name="writer" value="${dto.writer}" readonly></div>

    <div id="boardDate"><input type="date" name="writeDate" value="${dto.date}" readonly></div>

    <!-- 이미지 미리보기 , 삭제 체크박스 -->
    <c:forEach var="filePath" items="${dto.filePath}" varStatus="loop">
        <img src="${cpath}/upload/${filePath}" height="200">
       <div id="boardSelectImage">이미지 삭제: <input type="checkbox" name="deleteImages" value="${filePath}"></div>
    </c:forEach>

    <!-- 새로운 이미지 업로드 -->
    <label for="upload">새 이미지 업로드:</label>
    <input name="upload" type="file" accept="image/*" multiple>


   <div id="boardContent"><textarea id="content" name="content" required>${dto.content}</textarea></div>
    <div id="boardSubmit"><input type="submit"></div>
</form>

<!-- 미리보기 영역 -->
<div id="preview"></div>

<script>
    document.querySelector('input[name="upload"]').addEventListener('change', function(event) {
        const preview = document.getElementById('preview');
        preview.innerHTML = '';
        
        if (event.target.files) {
            const files = event.target.files;
            for (const file of files) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    const image = new Image();
                    image.src = e.target.result;
                    image.style.height = '200px';
                    preview.appendChild(image);
                }
                reader.readAsDataURL(file);
            }
        } 
    });
</script>







</body>
</html>