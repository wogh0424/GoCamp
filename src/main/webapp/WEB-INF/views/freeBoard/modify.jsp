<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>

<div id=boardTitle style="background-image: url('${cpath}/resources/image/board/river.jpg');">
	<div id=board><a href="${cpath}/freeBoard">Board</a></div>
</div>


<form class="insertBoardForm" method="POST" enctype="multipart/form-data" >
<div>
   <div class=insertBoardTitle><input type="text" name="title" value="${dto.title}" required autofocus></div>
   <div class="insertBoardWriter"><input type="text" name="writer" value="🤵‍♂️${dto.writer}" readonly></div>
</div>

    <c:forEach var="filePath" items="${dto.filePath}">
	    <div class="boardImageContainer">
        	<img class="modifyImage" src="${cpath}/upload/${filePath}" >
       		<div class="boardSelectImage">삭제 <input type="checkbox" name="deleteImages" value="${filePath}"></div>
 		</div>
    </c:forEach>
    
    <!-- 새로운 이미지 업로드 -->
    <c:if test="${not empty dto.filePath}"> 
  		 <div class="imageModify">수정 이미지 : </div>    
    </c:if>
			<div id="previewModify"></div>
		    <input name="upload" type="file" class="insertBoardFile" accept="image/*" multiple>
	<!-- 새이미지 미리보기  -->
  <textarea id="content" name="content" required>${dto.content}</textarea>
   <input type="submit"  class="boardSubmit">
</form>






<%@include file="../footer.jsp"%>



</body>
</html>