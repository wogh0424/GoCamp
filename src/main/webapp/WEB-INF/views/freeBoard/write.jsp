<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>



<div id=boardTitle style="background-image: url('${cpath}/resources/image/board/river.jpg');">
<div id=board><a href="${cpath}/freeBoard">Board</a></div>
</div>


<form class="insertBoardForm" method="POST" enctype="multipart/form-data" >
<div>
	<div class=insertBoardTitle><input type="text" name="title" placeholder="제목" required autofocus> </div>
	<div class="insertBoardWriter"><input type="text" name="writer" value="${nickname}" readonly> </div>
</div>

		<div id="preview"></div>
		<input name="upload" type="file" class="insertBoardFile" accept="image/*" multiple >
	<textarea id="content" name="content" required></textarea> 
	<input type="submit" class="boardSubmit">

</form>	

    <script>
        const input = document.querySelector('input[name="upload"]')
        const preview = document.getElementById('preview')
		
		input.onchange = changeHandler
    </script>










<%@include file="../footer.jsp"%>

</body>
</html>