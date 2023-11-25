<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>로그인</title>
    <jsp:include page="/include/bs4.jsp"/>
	<style>
	    input[type="text"]{
	        border: none;
	        width: 320px;
	        margin: 3px;
	        height: 50px;
	        outline: none; 
	        font-size: 1.1em;
	        background-color: rgba(0,0,0,0);
	    }
	    input[type="password"]{
	        border: none;
	        width: 390px;
	        margin: 3px;
	        height: 50px;
	        outline: none;
	        font-size: 1.1em;
	        background-color: rgba(0,0,0,0);
	    }
	    div, hr{
	        margin: 0 auto;
	        text-align: center;
	    }
	    .loginStyle{
	        border: 1px solid gray;
	        border-radius: 10px;
	        width: 400px; 
	        height: 60px;
	        margin-bottom: 10px;
	    }
	    a:hover{
	        text-decoration: none;
	        color: black;
	    }
	    input[type="button"]{
	        width: 400px;
	        height: 50px;
	        font-size: 16pt;
	        font-weight: bolder;
	    }
	    hr{
	        border: 1px solid gray;
	        width: 400px;
	    }
	</style>
    <script>
        'use strict';
        function loginOk(){
        	// 각종 front 유효성 검사
        	
        	
        }
    </script>
</head> 
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<h1 style="text-align: center;">로 그 인</h1>
<p><br/></p>
<form name="loginForm" method="post" action="loginOk.mem">
    <div class="loginStyle">
        <input type="text" name="mid" id="mid" required autofocus placeholder="아이디 입력" style="text-align: left;" />
        <input type="checkbox" name="idCheck" id="idCheck" value="save" /><label for="idCheck"><span style="color: gray;">ID저장</span></label>
    </div>
    <div class="loginStyle">
        <input type="password" name="pwd" id="pwd" required placeholder="비밀번호 입력" style="text-align: left;"/>
    </div>
    <div>
        <a href="idFind.mem">아이디/비밀번호 찾기</a>
    </div>
    <p><br/></p>
    <div>
        <input type="button" onclick="loginOk()" value="로그인" class="btn btn-primary form-control"/>
    </div>
    <p><br/></p>
    <hr/>
    <p><br/></p>
    <div>
        <input type="button" onclick="location.href='join.mem'" value="회원가입" class="btn btn-secondary form-control"/>
    </div>
</form>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>