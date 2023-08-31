function viewBannerHandler() {
 	  const mainViewBg = document.getElementById('viewBg');
      let image = '';
      let tmp = '';
      if (lctCl == '') {
    	 tmp = '';
      }
      else {
    	  let type = lctCl.split(',');
    	  console.log(type)
    	  tmp = type[0]; 	  
      }
        switch(tmp) {
        case '해변':
        	image = 'url(' + cpath + 'resources/image/mainView/해변.jpg)';
        	break;
        case '섬':
        	image = 'url(' + cpath + '/resources/image/mainView/섬.jpg)';
        	break;
        case '산':
        	image = 'url(' + cpath + '/resources/image/mainView/산.jpg)';
        	break;
   	   	case '숲':
   	   		image = 'url(' + cpath + '/resources/image/mainView/숲.jpg)';
   	   		break;
   	   	case '계곡':
   	   		image = 'url(' + cpath + '/resources/image/mainView/계곡.jpg)';
   	   		break;
       	case '강':
       		image = 'url(' + cpath + '/resources/image/mainView/강.jpg)';
       		break;
       	case '호수':
       		image = 'url(' + cpath + '/resources/image/mainView/호수.jpg)';
       		break;
       	case '도심':
       		image = 'url(' + cpath + '/resources/image/mainView/도심.jpg)';
       		break;
       	default:
       		image = 'url(' + cpath + '/resources/image/mainView/기본.jpg)';
       	}
 	       viewBg.style.backgroundImage = image;
   	}

   	async function imageRequestHandler(id) {   		
	    let url = 'https://apis.data.go.kr/B551011/GoCamping/imageList?';
	    const params = {
	        serviceKey: 'NXleNIUe%2Fm77zJ9SgvX9%2BmbB2KiHMu900jEu%2F1GCGQ%2F3eOQD65jRFFN5l5Qrvw5tumPP0dCi%2BjK75haSrtR9IA%3D%3D',
	        pageNo: 1,
	        numOfRows: 50,
	        MobileOS: 'ETC',
	        MobileApp: 'AppTest',
	        _type: 'json',
	        contentId: viewId,
	    };
	    for (let key in params) {
	        url += key + '=' + params[key] + '&';
	    };
		let arr = await fetch(url)
						  .then(resp => resp.json())
						  .then(json => json.response.body.items);
		if (arr != '') {
			arr = arr.item;
		}
		else {
			arr = [];
		};
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
				const src = arr[i].imageUrl
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
					  if (json) {
						  let div1 = document.createElement('div');
						  div1.classList.add('campSurroundingItems');
				            
						  let div2 = document.createElement('div');
						  div2.classList.add('campImageOverlay');
						  div2.innerText = '클릭해서 확대';
						  
				          let img = document.createElement('img');
				          img.src = newUrl;
				          img.classList.add('campSurroundingImages');
				          div1.appendChild(div2);
				          div1.appendChild(img);
				          viewImage.appendChild(div1);
					  }
					  else {
						  console.log('이미지가 없습니다...')
					  }
				  })
					
			};
		};
		const imageOverlays = document.querySelectorAll('div.campImageOverlay')
		if (imageOverlays.length == 0) {
			viewImage.innerHTML = noimg
		}
		else {
		  imageOverlays.forEach((ob, index) => ob.addEventListener('click', () => imageViewHandler(ob, index)));
		}
   	}
   	
    function viewMapHandler() {
    	const map = new naver.maps.Map('viewMap', {
    		zoom: 11,
    		zoomControl:true,
    		zoomControlOptions : {
    			position: naver.maps.Position.TOP_LEFT
    		},
    		mapTypeControl: true
    	})
    	const coords = new naver.maps.LatLng(y, x)
    	const marker = new naver.maps.Marker({
			position: coords,
			map: map
		})
    	if (tel == '') {
			tel = '(홈페이지 방문 바람)'
		}
		const infoWindow = new naver.maps.InfoWindow({
			content: '<div class="marker"><b>' 
					    + facltNm + '</b><br>연락처 : ' + tel + 
		   			 '</div>'
		})
    	map.setCenter(marker.position)
    	infoWindow.open(map, marker)
    }
    
    function imageViewHandler(element, index) {
    	const imageList = document.querySelectorAll('img.campSurroundingImages')
    	const imageModal = document.getElementById('imageModal')
    	const imageListPage = document.getElementById('imageListPage')
    	const imageItem = document.getElementById('imageItem')
        const imagePrevBtn = document.getElementById('imagePrevBtn');
    	const imageNextBtn = document.getElementById('imageNextBtn');
	
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
    		imageItem.style.width = '900px'
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
    	document.body.style.overflow = 'hidden'
    }
    
function modalCloseHandler() {
	document.getElementById('imageModal').style.display = 'none'
    document.body.style.overflow = 'auto';	
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
