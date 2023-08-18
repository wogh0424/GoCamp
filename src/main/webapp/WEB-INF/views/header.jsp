<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GoCamping</title>
<style>

.flex {
   display: flex;
   flex-flow: wrap;
   margin: auto;
}

.flex > li > input {
   cursor: pointer;
}

ul li {
   list-style: none;
   padding-left: 0;
}

body {
   padding: 0px;
   margin: 0px;
   width: 100%;
   height: 150%;
}

.description {
   width: 600px;
}

.lineIntro {
   display: -webkit-box;
   max-width: 60%;
   -webkit-line-clamp: 1;
   -webkit-box-orient: vertical;
   overflow: hidden;
   text-overflow: ellipsis;
}

.intro {
   display: -webkit-box;
   max-width: 60%;
   -webkit-line-clamp: 3;
   -webkit-box-orient: vertical;
   overflow: hidden;
   text-overflow: ellipsis;
}

a {
   text-decoration: none;
}

.modal {
   display: none;
}

.overlay {
   position: absolute;
   top: 0;
   left: 0;
   width: 100%;
   height: 150%;
   background-color: rgba(0, 0, 0, 0.4);
}

.modal_body {
   position: absolute;
   top: 50%;
   left: 50%;
   width: 100vh;
   height: 800px;
   padding: 40px;
   text-align: center;
   background-color: rgb(255, 255, 255);
   border-radius: 10px;
   box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
   transform: translate(-50%, -50%);
}
.category_wrap {
   display: flex;
   justify-content: center;
   align-items: center;
}
.category_name {
   width: 100px;
   height: 50px;
   display: flex;
   justify-content: center;
   align-items: center;
}

.category_box {
   width: 800px;
   height: 80px;
   border: 1px solid black;
   border-radius: 10px;
   box-shadow: 2px 2px 2px 0;
   margin: 5px;
}
.search_btn > input {
   border: unest;
   border-radius: 10px;
   background-color: black;
   color: white;
   width: 150px;
   height: 50px;
   font-weight: bold;
   cursor: pointer;
}

</style>
</head>
<body>

	<h1>
		<a href="${cpath }/main">프로젝트 기술점검표</a>
	</h1>
	<hr>