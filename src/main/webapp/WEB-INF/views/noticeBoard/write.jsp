<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
<div id=boardTitle>
	<div id=board>BOARD > </div><div id="noticeBoard"><a href="noticeBoard">NoticeBoard</a></div>
</div>

<h3>공지 작성</h3>
<form id="insertBoardForm" method="POST" enctype="multipart/form-data" >
<div>
	<div class=writeTitle><input type="text" name="title" placeholder="제목" required autofocus> </div> 
		<label for="option">옵션 선택:</label>
	<select id="optionNotice" name="pin">
	  <option value="0">일반</option>
	  <option value="1">필독</option>
	</select>

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
    var selectedOption = document.querySelector('input[name="option"]:checked').value;

 
	 console.log(selectedOption);
    
    </script>








<%@include file="../footer.jsp"%>



</body>
</html>