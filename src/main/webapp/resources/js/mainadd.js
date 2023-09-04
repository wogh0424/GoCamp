/**
 * 
 */

// 입력 폼의 필수항목 조회를 확인하는 함수
function validateForm() {
        	 const checks = document.querySelectorAll('span[class="checked"]')
        	 console.log(checks)
        	 if (checks.length == 0) {
        		 alert('아이디, 주소를 조회 후 확인해주세요')
        		 return false
        	 }
        	 if (checks.length == 1) {
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
	        if (items.length == 0) {
	        	document.getElementById('coordsCheck').innerHTML = '<span class="notChecked">주소입력오류</span>';
	        	document.querySelector('input[name="mapX"]').value = '';
   	        document.querySelector('input[name="mapY"]').value = ''; 
	        	return alert('그런 주소가 없습니다. 다시 입력해주세요.');
	        }
	        else {
	        	document.getElementById('coordsCheck').innerHTML = '<span class="checked">주소입력성공</span>'
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
        imagePreview.innerHTML = '';
    }
}
