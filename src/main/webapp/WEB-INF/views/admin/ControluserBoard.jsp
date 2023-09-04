<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<style>
a {
	text-decoration: none;
	color: black;
}

#boardTitle {
	display: flex;
	gap: 10px;
	/* 		justify-content: center;  */
	/* 		align-items: center; */
	padding-left: 250px;
	padding-top: 50px;
}

#board {
	font-size: 25pt;
	font-weight: bold;
	line-height: 1
}

#freeBoard, #reviewBoard, #eventBoard, #noticeBoard {
	font-size: 20pt;
	font-weight: bold;
	line-height: 1
}

#column {
	display: flex;
	gap: 10px;
}

#boardList {
	width: 900px;
	margin: 0 auto;
}

.item {
	display: flex;
	padding: 5px 10px;
}

.column {
	display: flex;
}

.columns {
	border-bottom: 3px solid #00743D;
	border-top: 3px solid #00743D;
}

.item>.idx, .item>.writer, .item>.date, .item>.viewCount {
	flex: 1;
}

.item>.title {
	flex: 5;
}

.item>.idx {
	color: #00743D;
}

.menubar {
	display: flex;
	width: 900px;
	margin: 20px auto;
	justify-content: space-between;
}

#modal {
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
	display: none;
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>
<body>

	<div id="boardList">
		<div class="item columns">
			<div class="idx">번호</div>
			<div class="title">제목</div>
			<div class="writer">작성자</div>
			<div class="date">작성일시</div>
			<div class="view_cnt">조회수</div>
			<div class="delete">게시글 삭제</div>
		</div>
		<c:forEach var="dto" items="${list }">
			<div class="item">
				<div class="idx">${dto.idx }</div>
				<div class="title">
					<a href="${cpath}/freeBoard/view/${dto.idx}"> ${dto.title }
						[${dto.replyCount}] </a>
				</div>
				<div class="writer">${dto.writer }</div>
				<div class="date">${dto.date }</div>
				<div class="viewCount">${dto.view_cnt }</div>
				<div class="delete_btn">

					<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#exampleModal" style="background-color:rgb(90, 209, 110)">
						삭제사유</button>

					<!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5" id="exampleModalLabel">삭제이유 입력</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<form action="${cpath }/admin/BannedReason" method="POST">
								<div class="modal-body">
									<textarea name="reason"></textarea>
									<input type="hidden" name="idx" value="${dto.idx }" />
									<input type="hidden" name="nickname" value="${dto.writer }" />
									<input type="hidden" name="title" value="${dto.title }" />
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal" style="background-color:rgb(90, 209, 110)">닫기</button>
									<button type="submit" class="btn btn-primary" style="background-color:rgb(90, 209, 110)">
										삭제 이유저장
									</button>
								</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>


</body>
</html>