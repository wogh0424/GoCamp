<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div id="view">
	<h1>${camp }</h1>
</div>

<script>
	async function requestAPI() {
		let url = "https://apis.data.go.kr/B551011/GoCamping/searchList?"
		const keyword = '${camp}'
		const params = {
		 	pageNo: 1,
		 	numOfRows: 5,
		 	_type: 'json',
		 	serviceKey: 'NXleNIUe%2Fm77zJ9SgvX9%2BmbB2KiHMu900jEu%2F1GCGQ%2F3eOQD65jRFFN5l5Qrvw5tumPP0dCi%2BjK75haSrtR9IA%3D%3D',
		 	MobileOS: 'ETC',
		 	MobileApp: 'AppTest',
		 	keyword: keyword
		}
		for (let key in params) {
			url += key + '=' + params[key] + '&'
		}
		const arr = await fetch(url)
						.then(resp => resp.json())
						.then(json => json.response.body.items.item)
		return arr
	}
	
	async function viewHandler() {
		const arr = await requestAPI()
		const contentId = '${contentId}'
		let view = ''
		arr.forEach(ob => {
			if(ob.contentId == contentId) {
				view = ob
			}
		})
		console.log(view)
	}
	
	window.onload = viewHandler()
</script>

</body>
</html>