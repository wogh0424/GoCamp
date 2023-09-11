<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>
	.currImages {
		width: 200px;
		height: 200px;
	}
</style>

<div class="modify_wrap">
	<form method="POST" id="update" enctype="multipart/form-data">
		<div class="modify_product">
			<p><span class="modify_title"><strong>상품 수정</strong></span></p>
			<p><input type="text" name="pName" value="${dto.pName }" placeholder="상품 이름 입력"></p>
			<p><input type="text" name="price" value="${dto.price }" placeholder="상품 가격 입력"></p>
			<p><input type="text" name="amount" value="${dto.amount }" placeholder="상품 수량 입력"></p>
			<p><textarea rows="10" name="pContent">${dto.pContent }</textarea></p>
			<input type="hidden" name="idx" value="${dto.idx }">
			<div id="currentImageOverView"></div>
			
			<label class="image" for="thumbnail">상품 이미지 선택</label>
			<input type="file" name="upload" id="addImage" accept="image/*" multiple>
			<div class="image-preview" id="imagePreview">추가된 사진을 확인할 수 있습니다</div>
		    <input class="modify_submit" type="submit" value="상품 등록 수정">
		</div>
	</form>
</div>

<script>

	const pid = '${dto.idx}'
	const imageInput = document.getElementById('addImage');
 	const imagePreview = document.getElementById('imagePreview');
	
 	window.onload = MultiImageViewHandler()
// 	imageInput.onchange = MultiImageViewHandler()
 	imageInput.onchange = imageViewHandler()
	
	async function imageViewHandler() {
		const url = cpath + "/showProductImage/" + pid
		const currImageView = document.getElementById('currentImageOverView')
		await fetch(url)
		.then(resp => resp.json())
		.then(json => {
			currImageView.innerHTML = ''
			json.forEach(ob => {
				const img = document.createElement('img')
				const input = document.createElement('input')
				input.type = 'number'
				input.name = 'imageId'
				input.value = ob.idx
				img.src = cpath + '/resources/upload/' + ob.filePath
				img.classList.add('currImages')
				img.style.width = '200px';
				img.style.height = '200px';
				currImageView.appendChild(img)
			})
			
			const imageId = document.querySelectorAll('input[name="imageId"]')
			const currImages = document.querySelectorAll('img.currImages')
			
			currImages.forEach((ob, index) => ob.addEventListener('click', () => imageDeleteHandler(ob, index)))
		})
 	}
	
	async function imageDeleteHandler(ob, index) {
		if(confirm = '이 이미지를 삭제하겠습니까?') {
			const url = cpath + '/deletefile'
			const src = ob.src

			var SplitUrl = src.split("/");   
			var fileLength = SplitUrl.length;
			var filePathName = SplitUrl[fileLength-1];
			console.log(filePathName)
			
			const requestParam = {
				filePath: filePathName
			}
			await fetch(url, {
				method: 'POST',
				headers: {
					'Content-Type' : 'application/json'
				},
				body: JSON.stringify(requestParam)
			}).then(resp => resp.json())
			.then(json => {
				if (json) {
					alert('이미지가 삭제되었습니다.')
				}
				else {
					alert('삭제가 실패했습니다.')
				}
			})
			imageViewHandler()
		}
	}
	
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

</body>
</html>