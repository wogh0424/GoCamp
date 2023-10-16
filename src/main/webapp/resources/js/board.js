'use strict';


// summernote 적용 
$(document).ready(function() {
    $('#content').summernote({
        toolbar: [
        	// [groupName, [list of button]]
    	    ['fontname', ['fontname']],
    	    ['fontsize', ['fontsize']],
    	    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
    	    ['color', ['forecolor','color']],
    	    ['table', ['table']],
    	    ['para', ['ul', 'ol', 'paragraph']],
    	    ['height', ['height']],
    	    ['view', ['fullscreen', 'help']]
        ],
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
        fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
        
        placeholder: '내용을 입력하세요',
        tabsize: 2,
        width: 800,
        height: 200
    })
})

// list 검색 하이라이트 

function keywordMarkHandler(key) {
    const links = document.querySelectorAll('a.searchKey');
    links.forEach(a => {
        if (a.innerText.includes(key)) {
            let text = a.innerText.replace(key, '<span class="highlight">' + key + '</span>');
            a.innerHTML = text;				
        }
    });
}


// write 사진 미리보여주기
// main camping reivew 사진 미리보여쥬기


	function changeHandler(event) {
	preview.innerHTML = ''
	
    if (event.target.files) {
        const files = event.target.files  
        for (const file of files) {
            const reader = new FileReader() 
            reader.onload = function(e) {
                const image = new Image() 
                image.src = e.target.result 
                preview.appendChild(image)
                image.classList.add('previewImage');
            }
            reader.readAsDataURL(file)
        }
      
    } 
}
	


// event, notice 상단 고정 
var selectedOption = document.querySelector('input[name="option"]:checked').value

// modify 사진 미리 보여주기 



// freeboard 게시글 수정 삭제
// 없음


// 캠핑장 리뷰 보여주기 


	

