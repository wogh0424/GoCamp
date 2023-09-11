<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>

<div id=boardTitle style="background-image: url('${cpath}/resources/image/board/fireImg.jpg');">
	<div id=boardBigTitle><a href="${cpath}/noticeBoard">Notice</a></div>
</div>



<form class="insertBoardForm" method="POST" enctype="multipart/form-data" >

	<div class=insertBoardTitle><input type="text" name="title" placeholder="제목" required autofocus> </div> 
	<label for="option">옵션 선택</label>
	<select id="optionNotice" name="pin">
	  <option value="0">일반</option>
	  <option value="1">중요</option>
	</select>

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