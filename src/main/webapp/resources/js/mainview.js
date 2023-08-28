function viewBannerHandler() {
 	  const mainViewBg = document.getElementById('viewBg');
      let image = '';
      let tmp = '';
      if (lctCl == '') {
    	 tmp = '';
      }
      else {
    	  let type = lctCl.split(',');
    	  tmp = type[0]; 	  
      }
        switch(tmp) {
        case '해변':
        	image = 'url(../resources/image/mainView/해변.jpg)';
        	break;
        case '섬':
        	image = 'url(../resources/image/mainView/섬.jpg)';
        	break;
        case '산':
        	image = 'url(../resources/image/mainView/산.jpg)';
        	break;
   	   	case '숲':
   	   		image = 'url(../resources/image/mainView/숲.jpg)';
   	   		break;
   	   	case '계곡':
   	   		image = 'url(../resources/image/mainView/계곡.jpg)';
   	   		break;
       	case '강':
       		image = 'url(../resources/image/mainView/강.jpg)';
       		break;
       	case '호수':
       		image = 'url(../resources/image/mainView/호수.jpg)';
       		break;
       	case '도심':
       		image = 'url(../resources/image/mainView/도심.jpg)';
       		break;
       	default:
       		image = 'url(../resources/image/mainView/기본.jpg)';
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
		if (arr.length == 0) {
			viewImage.innerHTML = '<div class="noImageNotion"><img src="../resources/image/mainView/noimg.gif"></div>'
		}
		else {
			viewImage.innerHTML = '<div id="campSurroungings">';
			for(let i = 0; i < arr.length; i++) {
				viewImage.innerHTML += '<img class="campSurroundingImages" src="' + arr[i].imageUrl + '">';
			};
			viewImage.innerHTML += '</div>';
		};
    };
    
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
    