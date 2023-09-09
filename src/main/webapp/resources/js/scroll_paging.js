'use strict';

async function loadHandler() {
    // 초기 페이지 번호와 페이지 크기 설정
    const contents = document.querySelector('.contents');
    contents.setAttribute('pageNo', 1);
    const pageSize = 50;

    // 초기 데이터 로딩
    const arr = await requestDB(1, pageSize);
    appendContent(arr);
}

async function requestDB(pageNo, pageSize) {
    let url = '${cpath}/admin/reqiestCamp?pageNo=${pageNo}&pageSize=${pageSize}'

    const params = {
        pageNo: pageNo,
        pageSize: pageSize
    };

    const arr = await fetch(url)
        .then(resp => resp.json())
        .then(json => json);

    return arr;
}

async function scrollHandler(event) {
    const contents = document.querySelector('.contents');
    const pageNo = +contents.getAttribute('pageNo') + 1;
    const pageSize = 50;

    const ob = {
        scrollTop: event.target.scrollTop,
        clientHeight: event.target.clientHeight,
        scrollHeight: event.target.scrollHeight
    };

    const a = Math.round((ob.scrollTop + ob.clientHeight + 0.5) / 2);
    const b = Math.round(ob.scrollHeight / 2);

    const scrollable = contents.getAttribute('scrollable');

    if (a == b && scrollable == 'true') {
        // 숨겨져있는 로딩 그림 나타내기
        document.getElementById('loading').classList.remove('hidden');
        if (timer == null) {
            contents.setAttribute('scrollable', false);  // 조건에 사용되는 속성 false
            root.style.overflowY = 'hidden';     // 스크롤바 없애기

            timer = setTimeout(async () => {
                timer = null;
                console.log('불러오기 !!');
                const arr = await requestDB(pageNo, pageSize);
                appendContent(arr);
                contents.setAttribute('scrollable', true);
                contents.setAttribute('pageNo', pageNo); // 페이지 번호 업데이트
                document.getElementById('loading').classList.add('hidden');
                root.style.overflowY = 'auto';
            }, 2000);    // 내부 내용을 2초 후에 실행하기
        }
    }
}
