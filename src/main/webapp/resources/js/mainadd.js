// 이미지 미리보기
function imageViewHandler() {
	if (imageInput.files.length > 0) {
        const file = imageInput.files[0];
        const reader = new FileReader();

        reader.onload = (e) => {
            const img = document.createElement('img');
            img.src = e.target.result;
            img.alt = file.name;
            img.style.maxWidth = '100%';

            // 이미지 미리보기 업데이트
            imagePreview.innerHTML = '';
            imagePreview.appendChild(img);
        };

        reader.readAsDataURL(file);
    } else {
        // 이미지를 선택하지 않은 경우 미리보기 제거
        imagePreview.innerHTML = '이미지를 넣어주세요';
    }
}
// 현재 업로드되어 있는 사진들 불러오기
async function imageRequestHandler(id) {   		
	let url = cpath + '/getImageList/' + id
	let arr = await fetch(url)
	.then(resp => resp.json())
	// 이미지가 없는 경우에는 noimage
	const viewImage = document.getElementById('currentImagePreview');
	const noimg = '<div class="noImageNotion"><img src="'+ cpath +'/resources/image/mainView/noimg.gif"></div>'
	
	if (arr.length == 0) {
		viewImage.innerHTML = noimg
	}
	else {
		viewImage.innerHTML = ''
		for(let i = 0; i < arr.length; i++) {
			// api에서 받아온 사진과 db에 내가 넣은 데이터를 구분해주어야 한다.
			let newimgUrl = ''
			if (arr[i].includes('gocamping.or.kr')) { 
				newimgUrl = arr[i]
			}
			else {
				newimgUrl = cpath + '/resources/upload/camp/' + arr[i];
			}
			
			// 이미지 url에 값이 들어왔을 때만 요소를 생성
			if (newimgUrl != '') {
				let div = document.createElement('div');
				div.classList.add('surroundingDivs');
				
				let img = document.createElement('img');
				img.src = newimgUrl;
				img.classList.add('campSurroundingImages');
				div.appendChild(img);
				viewImage.appendChild(div);					
			}
			else {
				continue;
			}
		}; // end of for
	};
	const imageItems = document.querySelectorAll('img.campSurroundingImages')
	if (imageItems.length == 0) {
		// 걸러낸 이후에서 이미지가 없다면 noimg로 바꿔준다.
		viewImage.innerHTML = noimg
	}
	else {
		imageItems.forEach((ob, index) => ob.addEventListener('click', () => imageDeleteHandler(ob, index)));
	}
}

// 이미지 삭제
async function imageDeleteHandler(ob, index) {
	if (confirm(index + 1 + '번 사진을 삭제하시겠습니까?')) {
		const url = cpath + "/deleteImageItem"
		const src = ob.src
		console.log(src)
		// 내 사진과 gocamp에서 받아온 이미지 둘다 /upload/camp/ 를 포함하고 있기에 뒷부분만 전송해서 삭제하게 만든다.
		const divStr = '/upload/camp/'
		const sub = src.substr(src.indexOf(divStr) + divStr.length, src.length)
		
		const requestParam = {
			imageSrc: sub,
			contentId: id
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
		imageRequestHandler(id)
	}
}


// 멀티 이미지 미리보기
function featureImagesHandler() {

    if (featureImages.files.length > 0) {
        featureImagesPreview.innerHTML = ''; // 이미지 미리보기를 초기화

        for (let i = 0; i < featureImages.files.length; i++) {
            const file = featureImages.files[i]; // 현재 파일을 가져옴
            const reader = new FileReader();

            reader.onload = (e) => {
                const img = document.createElement('img');
                img.src = e.target.result;
                img.alt = file.name;
                img.style.width = '200px';
                img.style.height = '150px';
                img.style.margin = '10px';

                featureImagesPreview.appendChild(img);
            };

            reader.readAsDataURL(file); // 파일을 읽어서 데이터 URL로 변환
        }
    } else {
        featureImagesPreview.innerHTML = '이미지 미리보기';
    }
}


// 입력 폼의 필수항목 조회를 확인하는 함수
function validateForm() {
        	 const checks = document.querySelectorAll('span[class="checked"]')
        	 console.log(checks.length)
        	 if (checks.length == 0) {
        		 alert('아이디, 주소를 조회 후 확인해주세요')
        		 return false
        	 }
        	 else if (checks.length == 1) {
        		 alert('필수 항목 조회를 완료해야 합니다.')
        		 return false
        	 }
        	 else {
        		 return true;
        	 }
         }

// 주소의 x 와 y 좌표를 찾는 함수
function findCoordinateHandler() {
	 if (inputAddr.value == '') {
		 return alert('주소를 입력해주세요.')
	 }
	 naver.maps.Service.geocode({
	        query: inputAddr.value
	    }, function(status, response) {
	        if (status !== naver.maps.Service.Status.OK) {
	            return alert('서비스에 문제가 발생했습니다. 잠시 후 이용해주세요.');
	        }
	        var result = response.v2, // 검색 결과의 컨테이너
	            items = result.addresses; // 검색 결과의 배열
	        console.log(items)
	        if (items.length == 0) {
	        	document.getElementById('coordsCheck').innerHTML = '<span class="notChecked">주소입력오류</span>';
	        	document.querySelector('input[name="mapX"]').value = '';
   	        document.querySelector('input[name="mapY"]').value = ''; 
	        	return alert('그런 주소가 없습니다. 다시 입력해주세요.');
	        }
	        else {
	        	document.getElementById('coordsCheck').innerHTML = '<span class="checked">주소조회성공</span>'
   	        document.querySelector('input[name="mapX"]').value = items[0].x;
   	        document.querySelector('input[name="mapY"]').value = items[0].y;
   	        return alert('주소가 조회되었습니다.')
		        }
	    });
}


// camp에서 가져옴  -- 시군구를 채워주는 함수
function sigunguHandler(event) {
    // 시도의 값을 받아옴
    var sido = document.querySelector('select[name="doNm"]').value
        
    // gungu 내부의 값을 초기화
    const gungu = document.querySelector('select[name="sigunguNm"]')
    gungu.innerHTML = '<option value="">=== 군 / 구 ===</option>'
    
    if (sido == '') {
  	  return
    }	  
    var sigungu = addr[sido].split(',')
    
    sigungu.forEach(ob => {
       const option = document.createElement('option')
       option.innerText = ob
       option.value = ob
       if (sigunguNm != '' && sigunguNm == ob) {
    	   option.selected = 'selected'
       }
       gungu.append(option)
    })
 } 

// 콘텐츠 아이디가 겹치는지 확인
async function cidCheckHandler(event) {
	const url = cpath + '/cidDupCheck/' + cid.value
	if (cid.value == '') {
		return alert('id를 입력해주세요')
	}
	await fetch(url)
		.then(resp => resp.json())
		.then(json => {
			if (json) {
				cidCheckResult.innerHTML = '<span class="notChecked">번호중복</span>'
				cid.value == ''
				alert('id가 중복됩니다. 다른 번호를 사용해주세요.')
			}
			else {
				cidCheckResult.innerHTML = '<span class="checked">사용가능</span>'
				alert('사용가능한 id번호입니다.')
			}
		})
}

