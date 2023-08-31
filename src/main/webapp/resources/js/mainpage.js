function orderByHandler(event) {
      location.href = cpath + '/main/camp?order=' + event.target.value + orderUrlParameterWriter()
   }
   
   // 시도에 따른 군구 옵션을 채워주는 함수
   function sigunguHandler(event) {
      // 시도의 값을 받아옴
      var sido = document.querySelector('select[name="sido"]').value
          
      // gungu 내부의 값을 초기화
      const gungu = document.querySelector('select[name="gungu"]')
      gungu.innerHTML = '<option value="">=== 군 / 구 ===</option>'
      
      if (sido == '') {
    	  return
      }	  
      var sigungu = addr[sido].split(',')
      const urlParams = new URL(location.href).searchParams.get('gungu')
      
      sigungu.forEach(ob => {
         const option = document.createElement('option')
         option.innerText = ob
         option.value = ob
         if (ob == urlParams) {
        	 option.selected = 'selected'
         }
         gungu.append(option)
      })
   } 
   
   function parameterHandler() {
	   const urlParams = new URL(location.href).searchParams
	   
	   const keys = Array.from(new Set(urlParams.keys()))

	   keys.forEach(ob => {
		   if (ob == 'searchTags') {
			   const tagparams = urlParams.get(ob)
			   if (tagparams != '') {
				   let tags = tagparams.split(',')
				   for (let j = 0; j < tags.length; j++) {
					   tagOptList.forEach(a => {
						   if (a.id == tags[j]) {
							   a.classList.add('ov')
						   }
					   })					   
				   }
			   }
		   }
		   if (ob != 'listTy' && ob != 'order' && ob != 'trlerAcmpnyAt' && ob != 'caravAcmpnyAt' && ob != 'animalCmgCl') {
			   const params = urlParams.getAll(ob)
			   let input = 'input[name=' + ob + ']'
			   const check = document.querySelectorAll(input)
			   check.forEach(i => {
				   if(params.includes(i.value)) {
					   i.checked = 'checked'
				   }
			   })
		   }
		   else if(ob == 'trlerAcmpnyAt' || ob == 'caravAcmpnyAt' || ob == 'animalCmgCl') {
			   const params = urlParams.get(ob)
			   let input = 'input[name=' + ob + ']'
			   const obj = document.querySelector(input)
			   
			   if (params == 'Y') {
				   obj.checked = 'checked'
			   }
		   }
	   }) 
   }
   
   // 복수의 url 파라미터를 자동으로 부여
   function pageUrlParameterWriter(btn) {
      let url = location.href
      const pageParam = 'page=' + btn.value
      
      // 파라미터가 없을 경우(?가 없음)는 page값만 return
      if (url.indexOf('?') == -1) {
         return '&' + pageParam
      }
      
      // 파라미터가 있을 경우 ?를 사용해 파라미터 분리
      let url1 = url.split('?') // [1] 요소가 파라미터들이다.
      
      // '&'으로 파라미터들 분리
      let url2 = url1[1].split('&')
      
      // page나 listTy가 들어가는 경우에는 파라미터에서 제외시킨다.
      for (let i = 0; i < url2.length; i++) {
         if (url2[i].includes('page') || url2[i].includes('listTy') || url2[i].includes('order')) {
        	url2.splice(i, 1)
        	i--
        	}
        }
          
      let returnUrl = '&'
      // 파라미터가 1개 이상일 경우에만 returnUrl에 부여
      if (url2.length > 0) {
    	 for (let i = 0; i < url2.length; i++) {
    	   	 returnUrl += url2[i] + '&'
    	 }  
      }
      returnUrl += pageParam
      return returnUrl
   }
   
   // 정렬을 클릭했을 때 파라미터를 부여
   function orderUrlParameterWriter() {
      let url = location.href
      
  	  // 파라미터가 없을 경우(?가 없음)는 return
      if (url.indexOf('?') == -1) {
          return '' 
      }
      let url1 = url.split('?')
      
      let url2 = url1[1].split('&')
      
      // page나 order나 listTy가 들어가는 경우에는 파라미터에서 제외시킨다.
      for (let i = 0; i < url2.length; i++) {
    	  if (url2[i].includes('page') || url2[i].includes('order')) {
    		  url2.splice(i, 1)
    		  i--
    	  }
      }
      
      let returnUrl = ''
      // 파라미터가 1개 이상일 경우에만 returnUrl에 부여
      if (url2.length > 0) {
	      for (let i = 0; i < url2.length; i++) {
	    	  returnUrl += '&' + url2[i]  
	      }  
      }
      return returnUrl
   }
   
   
   function listTypeUrlWriter() {
	   let url = location.href
	      
	  	  // 파라미터가 없을 경우(?가 없음)는 return
	      if (url.indexOf('?') == -1) {
	          return '' 
	      }
	      let url1 = url.split('?')
	      
	      let url2 = url1[1].split('&')
	      
	      //  order나 listTy가 들어가는 경우에는 파라미터에서 제외시킨다.
	      for (let i = 0; i < url2.length; i++) {
	    	  if (url2[i].includes('order') || url2[i].includes('listTy')) {
	    		  url2.splice(i, 1)
	    		  i--
	    	  }
	      }
	      
	      let returnUrl = ''
	      // 파라미터가 1개 이상일 경우에만 returnUrl에 부여
	      if (url2.length > 0) {
		      for (let i = 0; i < url2.length; i++) {
		    	  returnUrl += '&' + url2[i]  
		      }  
	      }
	      
	      return returnUrl
   }
   
   // 버튼을 클릭하면 리스트로 보기, 지도로 보기 사이에서 전환
   function listTypeHandler() {
  	   const typeBtn = document.getElementById('listTypeChangeBtn')
  	   
  	   if (typeBtn.value == 'LIST') {
  		   typeBtn.parentNode.href += 'MAP' + listTypeUrlWriter()
  	   }
  	   else {
  		   typeBtn.parentNode.href += 'LIST' + listTypeUrlWriter()
  	   }
   }
   
   function mapHandler(event) {
		
		mapItemList.forEach(li => li.classList.remove('selected'))
		event.currentTarget.classList.add('selected')
		const idx = event.currentTarget.getAttribute('st')
		const x = event.currentTarget.getAttribute('x')
		const y = event.currentTarget.getAttribute('y')
		
		for (let i = 0; i < markers.length; i++) {
			if (i == idx) {
			     infoWindows[i].open(map, markers[i]);
			} else {
			     infoWindows[i].close;
			}
		}
		map.setCenter(markers[idx].position)
	}
	
	function markerHandler() {
		mapItemList.forEach(li => {
			const x = li.getAttribute('x')
			const y = li.getAttribute('y')
	
			const coords = new naver.maps.LatLng(y, x)
			
			const facltNm = li.getAttribute('facltNm')
			let tel = li.getAttribute('tel')
			const cid = li.getAttribute('cid')
			
			if (tel == '') {
				tel = '(홈페이지 방문 바람)'
			}
			
			const marker = new naver.maps.Marker({
				position: coords,
				map: map
			})
			const infoWindow = new naver.maps.InfoWindow({
				content: '<div class="marker"><a href="${cpath }/view/' + cid + '"><b>' 
						    + facltNm + '</b></a><br>연락처 : ' + tel + 
			   			 '</div>'
			})
			markers.push(marker)
			infoWindows.push(infoWindow)
		})
		
		for(let i = 0; i < markers.length; i++) {
			naver.maps.Event.addListener(markers[i], 'click', function(e) {
				if (infoWindows[i].getMap()) {
		            infoWindows[i].close();
		        } else {
		            infoWindows[i].open(map, markers[i]);
		        }
			})
		}
		map.setCenter(markers[0].position)
		infoWindows[0].open(map, markers[0])
	}
	
	function tagHandler(event) {
    	const ob = event.target.classList
    	if (ob.contains('ov')) {
    		ob.remove('ov')
    	}
    	else {
    		ob.add('ov')
    	}
    }
	function tagResetHandler() {
    	tagOptList.forEach(a => {
    		a.classList.remove('ov')
    	})
    }
    
    function tagSearchHandler() {
    	let tagList = ''
    	tagOptList.forEach(a => {
    		if (a.classList.contains('ov')) {
    			tagList += ',' + a.id 
    		}
    	})
    	tagList = tagList.substring(1, tagList.length)
    	console.log(tagList)
    	location.href = cpath + '/main/camp?listTy='+ listTy +'&searchTags=' + tagList
    }
    
//	달력===================================
	
	function buildCalendar() {

        let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);     // 이번달 1일
        let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);  // 이번달 마지막날

        let tbody_Calendar = document.querySelector(".Calendar > tbody");
        document.getElementById("calYear").innerText = nowMonth.getFullYear();             // 연도 숫자 갱신
        document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1);  // 월 숫자 갱신

        while (tbody_Calendar.rows.length > 0) {                        // 이전 출력결과가 남아있는 경우 초기화
            tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
        }

        let nowRow = tbody_Calendar.insertRow();        // 첫번째 행 추가           

        for (let j = 0; j < firstDate.getDay(); j++) {  // 이번달 1일의 요일만큼
            let nowColumn = nowRow.insertCell();        // 열 추가
        }

        for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {   // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복  

            let nowColumn = nowRow.insertCell();        // 새 열을 추가하고


            let newDIV = document.createElement("p");
            newDIV.innerHTML = leftPad(nowDay.getDate());        // 추가한 열에 날짜 입력
            nowColumn.appendChild(newDIV);

            if (nowDay.getDay() == 6) {                 // 토요일인 경우
                nowRow = tbody_Calendar.insertRow();    // 새로운 행 추가
            }

            if (nowDay < today) {                       // 지난날인 경우
                newDIV.className = "pastDay";
            }
            else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) { // 오늘인 경우           
                newDIV.className = "today";
                newDIV.onclick = function () { choiceDate(this); }
            }
            else {                                      // 미래인 경우
                newDIV.className = "futureDay";
                newDIV.onclick = function () { choiceDate(this); }
            }
        }
    }

    // 날짜 선택
    function choiceDate(newDIV) {
        if (document.getElementsByClassName("choiceDay")[0]) {                              // 기존에 선택한 날짜가 있으면
            document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");  // 해당 날짜의 "choiceDay" class 제거
        }
        newDIV.classList.add("choiceDay");           // 선택된 날짜에 "choiceDay" class 추가
    }

    // 이전달 버튼 클릭
    function prevCalendar() {
        nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());   // 현재 달을 1 감소
        buildCalendar();    // 달력 다시 생성
    }
    // 다음달 버튼 클릭
    function nextCalendar() {
        nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());   // 현재 달을 1 증가
        buildCalendar();    // 달력 다시 생성
    }

    // input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
    function leftPad(value) {
        if (value < 10) {
            value = "0" + value;
            return value;
        }
        return value;
    }
	