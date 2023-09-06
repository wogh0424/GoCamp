<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="addProduct_wrap">
	<form method="POST" id="addProduct" enctype="multipart/form-data">
		<div class="addProduct">
			<p><span class="addProduct_title"><strong>상품 등록</strong></span></p>
			<p><input type="text" name="pName" placeholder="상품 이름 입력" required autofocus></p>
			<p><input type="text" name="price" placeholder="상품 가격 입력" required></p>
			<p><input type="text" name="amount" placeholder="상품 수량 입력" required></p>
			<p><textarea rows="10" name="pContent" placeholder="상품 설명 입력" required></textarea></p>
			<p><select name="pCategory" required>
					<option value="텐트">식품</option>
					<option value="침낭/매트">캠핑 용품</option>
					<option value="화로">일반</option>
					<option value="주방 도구">도구</option>
					<option value="계절 용품">계절 용품</option>
					<option value="식품">식품</option>
					<option value="일반">일반</option>
				</select></p>
				<label class="image" for="thumbnail">상품 이미지 선택</label>
			    <input type="file" name="upload" id="thumbnail" accept="image/*" multiple>
			  	<div class="image-preview" id="imagePreview">썸네일 사진을 확인할 수 있습니다</div>
				<p><input class="addProduct_submit" type="submit" value="상품 등록"></p>
		</div>
	</form>
</div>
<script>
 	const imageInput = document.getElementById('thumbnail');
 	const imagePreview = document.getElementById('imagePreview');
	
 	imageInput.onchange = MultiImageViewHandler
	
 	function MultiImageViewHandler() {
 		if (imageInput.files.length > 0) {
 	        imagePreview.innerHTML = '';
 	        
 	       for(let i = 0; i < imageInput.files.length; i++) {
 	        const file = imageInput.files[i];
 	        const reader = new FileReader();
 	    	   

 	        reader.onload = (e) => {
 	            const img = document.createElement('img');
 	            img.src = e.target.result;
 	            img.alt = file.name;
 	            img.style.Width = '200px';
 	            img.style.height = '200px';

 	            imagePreview.appendChild(img);
 	        };

 	        reader.readAsDataURL(file);
 	       }
 	    } else {
 	        imagePreview.innerHTML = '이미지를 넣어주세요';
 	    }
 	}

</script>
</html>
</body>