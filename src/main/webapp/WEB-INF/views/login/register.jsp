<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="register_wrap">
	<div class="register_items">
		<div class="register_list">
			<div>
				<ul>
					<li>약관 동의(필수)</li>
					<li><input type="checkbox"></li>
				</ul>
			</div>
					<div>
				<ul>
					<li>회원가입 약관에 모두 동의합니다</li>
					<li><input type="checkbox" name="checkboxall"></li>
				</ul>
			</div>
					<div>
				<ul>
					<li>이용약관 동의(필수)</li>
					<li><input type="checkbox"></li>
				</ul>
			</div>
			<pre>
			  이용약관 동의
				
				
				
				
				
				
				
				
			</pre>
					<div>
				<ul>
					<li>개인정보 수집 및 이용 동의(선택)</li>
					<li><input type="checkbox" name="register_selectchk"></li>
				</ul>
			</div>
			<pre>
		      개인정보 처리 방침
				
				
				
				
				
				
				
				
				
			</pre>
			<div class="registerBtn_list">
				<a href="${cpath }"><button>동의안함</button></a>
				<a href="${cpath }/login/signup"><button name="register_agree">동의</button></a>
			</div>
		</div>
	</div>
</div>
<script>
let checkboxAll = document.querySelector('input[name="checkboxall"]');
let registerAgreeBtn = document.querySelector('button[name="register_agree"]');

// "checkboxall" 체크박스로 모든 체크박스 체크/해제 기능
if (checkboxAll) {
    checkboxAll.addEventListener('change', function() {
        // 개인정보 수집 및 이용 동의(선택)를 제외한 필수항목만 체크 되도록 하기
        let checkboxes = document.querySelectorAll('input[type="checkbox"]:not([name="register_selectchk"])');
        
        for (let checkbox of checkboxes) {
            if (checkbox !== checkboxAll) {
                checkbox.checked = checkboxAll.checked;
            }
        }
    });
}

// 개인정보 수집 및 이용 동의(선택)을 제외한 필수 체크항목이 체크되어야 동작하게 하는 기능
if (registerAgreeBtn) {
    registerAgreeBtn.addEventListener('click', function(event) {
        let checkboxes = document.querySelectorAll('input[type="checkbox"]:not([name="register_selectchk"])');
        let allChecked = true;
        
        for (let checkbox of checkboxes) {
            if (checkbox !== checkboxAll && !checkbox.checked) {
                allChecked = false;
                break;
            }
        }
        
        if (!allChecked) {
            event.preventDefault(); // 버튼의 기본 동작을 중지
            alert('필수 약관에 동의 후 다음 단계가 진행가능합니다.');
        }
    });
}
</script>
</body>
</html>