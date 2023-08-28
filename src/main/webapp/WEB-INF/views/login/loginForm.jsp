<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>

<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>로그인 페이지</title>
    <style>
         a{
            text-decoration: none;
            color: black;
        }
        .full_body{
            width: 400px;
            margin:5% auto;
        }

        .loginForm_frame{
            position: relative;
            height: 500px;
            border: 2px solid rgb(162, 154, 154);
            border-radius: 70px;
        }

        .loginForm_content {
            text-align: center;
        }
        #logo {
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;        
        }
        #logo_img{
            width: 200px;
            }
        #input_wrap{
            display: flex;
            flex-direction: column;
            justify-content: space-around;
        }
       #id,#password {
            width: 250px;
            height: 50px;
            border-radius: 50px;
            border: 1px solid rgb(184, 167, 167);
        }
        #btn_wrap{
            position: relative;
        }
        #login_btn_input{
            transform: translate(-50%);
            left: 50%;
            top: 100%;
        }
        #wrap_account{
            display: flex;
        }
        #signup_text{
            text-align: center;
        }
        #login_btn_input{
           display: block;
           margin: 30px 50%;
           width: 70%;
           padding: 13px 0;
           border-radius: 10px;
           background-color: rgb(90, 209, 110);
            font-size: large;
            font-weight: bolder;
            border: 1px solid rgb(60, 116, 69);
            color: white;
        }

        input {
            padding-left: 30px;
        }
        .form-wrap{
            text-align: center;
        }
    </style>
</head>

<body onload="document.f.id.focus();">
  <div class="full_body">
    <div class="loginForm_frame">
        <div class="loginForm_content">
        <div id="input_account">
            <h3>아이디와 비밀번호를 입력해주세요.</h3>
        </div>
        <c:url value="/login" var="loginUrl" />
         </div>
        <form:form name="f" action="${loginUrl}" method="POST">
        <div class="form-wrap">   
        <c:if test="${param.error != null}">
                <p>아이디와 비밀번호가 잘못되었습니다.</p>
            </c:if>
        <div id="input_wrap">
            <p>
                <input type="text" id="id" name="userid" placeholder="Enter ID"/>
            </p>
            <p>
                <input type="password" id="password" name="userpw" placeholder="Enter PW"/>
            </p>
        </div>
    </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
           <input type="submit" id="login_btn_input" value="로그인"/>
        </form:form>   
        </div>
    <div class="wrap_account">
    <p id="signup_text"><a href="${cpath}/login/signup">회원가입</a> | <a href="${cpath}/login/findAccount">아이디 찾기</a> | <a href="${cpath}/login/resetPw">비밀번호 재발급</a></p>
</div>
</div>

</body>
</html>
