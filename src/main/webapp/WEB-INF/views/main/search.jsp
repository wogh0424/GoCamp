<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<style>
	#totalSearchList {
		max-width: 1200px;
		border: 1px dashed grey;
		margin: 20px auto;
		border-top: 2px solid black;
		padding: 30px 0;
	}
	#searchAll {
		width: 100%;
		display: flex;
		justify-content: center;
		font-size: 20px;
	}
	#searchAll > div {
		margin: 10px;
		height: 50px; 
		line-height: 50px;
	}
</style>

<div id="totalSearchList">

	<!-- 통합검색 -->
	<div id="totalSearch">
		<form action="${cpath }/main/search" id="searchAll">
			<div>
				<label for="srchKywrd" >통합검색</label>		
			</div>
			<div style="border: 1px solid lightgrey; width: 50%; display: flex; justify-content: space-between;">
				<input type="search" name="srchKywrd" id="srchKywrd" placeholder="검색어를 입력하세요" style="border:none; font-size: 18px; padding-left: 20px;">
				<button type="submit" style="border: none; background-color: white; cursor:pointer; font-size: 18px; padding-right: 20px;">🔍</button>
			</div>
		</form>
	</div>
	
</div>

</body>
</html>