<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="detail_wrap">
	<div class="detail_items">
		<div class="view_img">
		<div id="currentImageOverView"></div>
		</div>
		<div class="view_info">
			<ul>
				<li class="view_pName"><strong>${dto.pName }</strong></li>
				<li class="view_price">${dto.price }원</li>
				<li>별점 : <strong class="view_pStar">${dto.pStar } / 5</strong></li>
				<li><details class="view_pContent">${dto.pContent }</details></li>
				<li class="view_amount">${dto.amount }개 구매 가능</li>
				<li class="view_und"><button>-</button><input class="view_choice" type="text" name="choice" placeholder="1"><button>+</button></li>
				<li class="view_btn"><button>💳 결제하기</button>&nbsp;<button>💕 찜 ${dto.pick }</button>&nbsp;<button class="view_cart">🧺 장바구니</button></li>
			</ul>
		</div>
	</div>
	<div class="view_review">
		<div class="review_user">
			<ul>
				<li>${dto.pStar } / 5</li>
				<li>유저 아이디 | ${dto.sDate }</li> 
				<li>리뷰 내용</li>
			</ul> 
		<div class="review_img">
		</div>
		</div>
	</div>
	<div class="view_longimg">
	</div>
</div><script>
const productid = '${dto.idx}'
	
	window.onload = imageViewHandler()
	
	async function imageViewHandler() {
		const url = cpath + "/showProductImage/" + productid
		const currImageView = document.getElementById('currentImageOverView')
		await fetch(url)
		.then(resp => resp.json())
		.then(json => {
			currImageView.innerHTML = ''
			json.forEach(ob => {
				const img = document.createElement('img')
				img.src = cpath + '/resources/upload/' + ob.filePath
				img.classList.add('currImages')
				img.style.width = '300px';
				img.style.height = '300px';
				currImageView.appendChild(img)
			})
			
			const currImages = document.querySelectorAll('img.currImages')
			
		})
	}
</script>

<script>
const pid = '${dto.idx}'
	
	window.onload = imageViewHandler()
	
	async function imageViewHandler() {
		const url = cpath + "/showProductImage/" + pid
		const currImageView = document.getElementById('currentImageOverView')
		await fetch(url)
		.then(resp => resp.json())
		.then(json => {
			currImageView.innerHTML = ''
			json.forEach(ob => {
				const img = document.createElement('img')
				img.src = cpath + '/resources/upload/' + ob.filePath
				img.classList.add('currImages')
				img.style.width = '300px';
				img.style.height = '300px';
				currImageView.appendChild(img)
			})
			
			const currImages = document.querySelectorAll('img.currImages')
			
		})
	}
</script>
</body>
</html>