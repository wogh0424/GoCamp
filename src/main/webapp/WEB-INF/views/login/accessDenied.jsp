<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<style>
	#errorHead {
		width: 100%;
		height: 270px;
		background-color: #DE4258;
	}
	#errorBanner {
		background-position: center;
		width: 400px;
		height: 270px;
		margin: auto;
		background-repeat: no-repeat;
		background-size: cover;
	}
	#errorNotice {
		padding: 100px auto;
		max-width: 1200px;	
		height: 520px;
		margin: 0 auto;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	#noResponse {
		padding-top: 50px;
		width: 100%;
		height: 400px;
		border-top: 1px solid lightgrey;
		text-align: center;
	}
	#toMain {
		margin-top: 30px;
		width: 60%;
		height: 50px;
		background-color: #004D91;
		color: white;
		border: none;
		border-radius: 10px;
	}
</style>


<div id="errorHead">
	<div id="errorBanner" style="background-image: url('${cpath}/resources/image/main/noaccess.jpg');">
	</div>
</div>
<div id="errorNotice">
	<div id="noResponse">
		<p><img src="${cpath }/resources/image/main/nopermission.png" width="100px" height="100px" style="margin: 0 auto;"></p>
		<br><h4><b>페이지에 대한 권한이 없습니다.</b></h4>
		<p>서비스 이용에 불편을 드려 죄송합니다.<br>메인페이지로 이동 후 원하는 정보에 대한 페이지로 연결해주시기 바랍니다.
		<p><a href="${cpath }/"><button id="toMain">메인으로 돌아가기</button></a></p>
	</div>
</div>


<%@ include file="../footer.jsp" %>
</body>
</html>
