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
				<li><details class="view_pContent">${dto.pContent }</details></li>
				<li class="view_amount">${dto.amount }개 구매 가능</li>
<!-- 				<li class="view_und"><button>-</button><input class="view_choice" type="text" name="choice" placeholder="1"><button>+</button></li> -->
				<li class="view_btn"><button>💳 결제하기</button>&nbsp; <%-- <button>💕 찜 ${dto.pick }</button>&nbsp; --%><button id="grocery" class="view_cart" >🧺 장바구니</button></li>
			</ul>
		</div>
	</div>
</div>

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
				img.src = cpath + '/usr/local/tomcat/webapps/upload/' + ob.filePath
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
	const grocery = document.getElementById('grocery')
	const pName = '${dto.pName}'
//	const pid = '${dto.idx}'
	const price = '${dto.price}'
	const userid = '${pageContext.request.userPrincipal.name}'
	const amount = '1'    // amount만 수정

	grocery.onclick = groceryAddHandler
	
	async function groceryAddHandler() {
		if (userid == '') {
			alert('로그인을 해야 장바구니 이용이 가능합니다')
			return
		}
		else {
			const url = cpath + '/grocery';
			const params = {
				userid : userid,
				idx : pid,
				pName : pName,
				price : price,
				amount : amount
			}
			await fetch(url, {
				method: 'POST',
				headers: {
					'Content-Type' : 'application/json'
				},
				body: JSON.stringify(params)
			}).then(resp => resp.json())
			.then(json => {
				if (json) {
					alert('장바구니에 ' + pName + '이(가) ' + amount + '개 추가되었습니다.')
				}
				else {
					alert('장바구니에 추가되지 못했습니다.')				
				}
			})
		}
	}
</script>

</body>
</html>
