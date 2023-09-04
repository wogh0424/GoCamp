// 입지에 따라 사진의 url을 바꿔준다.
function viewBannerHandler() {
 	  const mainViewBg = document.getElementById('viewBg');
      let image = 'url(' + cpath + '/resources/image/mainView/';
      let tmp = '';
      if (lctCl == '') {
    	 tmp = '';
      }  // lctcl이 없을 경우 기본이미지를 부여한다.
      else {
    	  let type = lctCl.split(',');
    	  tmp = type[0]; 	// 여러개의 입지 구분 중 처음 것만 가져온다.
      }
        switch(tmp) {
        case '해변':
        	image += tmp;
        	break;
        case '섬':
        	image += tmp;
        	break;
        case '산':
        	image += tmp;
        	break;
   	   	case '숲':
   	   		image += tmp;
   	   		break;
   	   	case '계곡':
   	   		image += tmp;
   	   		break;
       	case '강':
       		image += tmp;
       		break;
       	case '호수':
       		image += tmp;
       		break;
       	case '도심':
       		image += tmp;
       		break;
       	default:
       		image += '기본';
       	}
 	       viewBg.style.backgroundImage = image + '.jpg)';
   	}

   	
    function viewMapHandler() {
    	// view에서 지도를 띄우는 부분
    	const map = new naver.maps.Map('viewMap', {
    		zoom: 11,
    		zoomControl:true,
    		zoomControlOptions : {
    			position: naver.maps.Position.TOP_LEFT
    		},
    		mapTypeControl: true
    	})
    	const coords = new naver.maps.LatLng(y, x)
    	// 마커 생성
    	const marker = new naver.maps.Marker({
			position: coords,
			map: map
		})
    	if (tel == '') {
			tel = '(홈페이지 방문 바람)'
		}
    	// 정보창 생성
		const infoWindow = new naver.maps.InfoWindow({
			content: '<div class="marker"><b>' 
					    + facltNm + '</b><br>연락처 : ' + tel + 
		   			 '</div>'
		})
    	map.setCenter(marker.position)
    	infoWindow.open(map, marker)
    }
 // 사진========================================   
	async function imageRequestHandler(id) {   		
		let url = cpath + '/getImageList/' + id
		let arr = await fetch(url)
		.then(resp => resp.json())
		// 이미지가 없는 경우에는 noimage
		const viewImage = document.getElementById('viewImage');
		const noimg = '<div class="noImageNotion"><img src="'+ cpath +'/resources/image/mainView/noimg.gif"></div>'
		if (arr.length == 0) {
			viewImage.innerHTML = noimg
		}
		else {
			viewImage.innerHTML = ''
			const thumb = 'thumb/thumb_1000_';
			const camp = '/upload/camp/' + id + '/'
			for(let i = 0; i < arr.length; i++) {
				// api에서 받아온 사진과 db에 내가 넣은 데이터를 구분해주어야 한다.
				let newimgUrl = ''
				if (arr[i].includes('gocamping.or.kr')) {
					const src = arr[i]
					const newUrl = src.replace(camp, camp + thumb); // 이미지를 썸네일용으로 바꿔서 넣어준다.
					// https://gocamping.or.kr/upload/camp/7783/7236jMdhsUL2GEb5qRtxSIKX.jpg   =>   https://gocamping.or.kr/upload/camp/7783/thumb/thumb_1000_7236jMdhsUL2GEb5qRtxSIKX.jpg
					
					const requestStatus = cpath + '/imageStatus'
					const requestUrl = {
							imageUrl: newUrl
					}
					// imageStatus에 요청을 보내서 url에 이미지가 있는지 확인한다.
					await fetch(requestStatus, {
						method: 'POST',
						headers: {
							'Content-Type' : 'application/json'
						},
						body: JSON.stringify(requestUrl)
					}).then(resp => resp.json())
					.then(json => {
						console.log(json)
						if (json) {
							newimgUrl = newUrl
						}
						else {
							newimgUrl = ''
						}
					})
				}
				else {
					newimgUrl = cpath + '/resources/upload/camp/' + arr[i];
				}
				
				// 이미지 url에 값이 들어왔을 때만 요소를 생성
				if (newimgUrl != '') {
					let div1 = document.createElement('div');
					div1.classList.add('campSurroundingItems');
					
					let div2 = document.createElement('div');
					div2.classList.add('campImageOverlay');
					div2.innerText = '클릭해서 확대';
					
					let img = document.createElement('img');
					img.src = newimgUrl;
					img.classList.add('campSurroundingImages');
					div1.appendChild(div2);
					div1.appendChild(img);
					viewImage.appendChild(div1);					
				}
				else {
					continue;
				}
			}; // end of for
		};
		const imageOverlays = document.querySelectorAll('div.campImageOverlay')
		if (imageOverlays.length == 0) {
			// 걸러낸 이후에서 이미지가 없다면 noimg로 바꿔준다.
			viewImage.innerHTML = noimg
		}
		else {
			imageOverlays.forEach((ob, index) => ob.addEventListener('click', () => imageViewHandler(ob, index)));
		}
	}

    
    function imageViewHandler(element, index) {
    	const imageList = document.querySelectorAll('img.campSurroundingImages')
    	const imageModal = document.getElementById('imageModal')
    	const imageListPage = document.getElementById('imageListPage')
    	const imageItem = document.getElementById('imageItem')
        const imagePrevBtn = document.getElementById('imagePrevBtn');
    	const imageNextBtn = document.getElementById('imageNextBtn');
	
    	imageItem.style.width = '900px'  // 초기 이미지 크기 900px;
    	let currentIndex = index;
    	
    	function updateImage() {
    		if (currentIndex < 0) {
    			currentIndex = imageList.length - 1;
    		} else if (currentIndex >= imageList.length) {
    			currentIndex = 0;
    		}
    		imageListPage.innerText = currentIndex + 1 + ' / ' + imageList.length;
    		imageItem.src = imageList[currentIndex].src;
    	}
	
    	imagePrevBtn.addEventListener('click', () => {
    		imageItem.style.width = '900px'  // 이미지 크기가 스크롤로 줄어들었다면 다시 맞춰준다.
    		currentIndex--;
    		updateImage();
    	});
	
    	imageNextBtn.addEventListener('click', () => {
    		imageItem.style.width = '900px'
    		currentIndex++;
    		updateImage();
    	});
	
    	updateImage();
	    	
    	imageModal.style.display = 'block';
    	document.body.style.overflow = 'hidden'  // body의 스크롤 제거
    }
    function imageScrollHandler(event) {
    	if (event.deltaY < 0) {
    		currentWidth += 100; // 이미지 폭 증가
    	} else {
    		currentWidth -= 100; // 이미지 폭 감소
    	}
    	currentWidth = Math.min(Math.max(300, currentWidth), 1300); // 폭 범위 제한 (200px부터 1200px까지)
    	
    	imageItem.style.width = currentWidth + 'px'
    }
    
function modalCloseHandler() {  // 모달을 닫고 body의 스크롤을 복구한다.
	document.getElementById('imageModal').style.display = 'none'
    document.body.style.overflow = 'auto';	 
}

