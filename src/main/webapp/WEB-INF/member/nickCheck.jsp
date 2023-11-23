<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>아이디 찾기</title>
    <jsp:include page="/include/bs4.jsp"/>
    <style>
    	body{
    		margin: 0 auto;
    	}
    	#idOk{
    		text-align:center"
    	}
    </style>
    <script>
    	'use strict'
    	
    	// 중복확인 창에서 회원가입(join)창에 값 전달하기
    	function idOk(){
    		let midC = document.getElementById("midC").value;
    		let ragMid = /^[a-z0-9]{4,16}$/;
    		
    		// 공백 검사
    		if(midC.trim() == ""){
    			alert("중복확인 할 아이디를 작성해주세요.")
    			document.getEltmetnById("midC").focus();
    			return false;
    		}
    		// 정규식 검사 (정규식과 작성한 아이디가 같이 않을 시)
    		else if(!ragMid.test(midC)){
    			alert("아이디는 영소문자와 숫자만 사용하여야 하며 4~16자 사이로 입력해주셔야 합니다. .")
    			document.getEltmetnById("midC").focus();
    			return false;
    		}
    		else {
    		// ajax로 아이디 중복검사하기
    			$.ajax({
    				
    			});
    		}
    		
    		
    		// 만약 중복이면 demo에 mid(적은 아이디)는 존재하는 아이디 입니다. 띄우기
    		
    		// 아니면, 바로 중복검사 창 닫고 값 회원가입으로 보내기
    		opener.document.getElementById("mid").value = midC;
    		window.close();
    	}
    	
    	// Enter(keyCode 13번)시, idOk() 함수를 불러온다.
    	$(function() {
    		$("#midC").on("keydown",function(e) {
    			if(e.keyCode == 13){
	    			idOk()
    			}
    		});
    	});
    </script>
</head>
<body>
	<h2 style="text-align:center">아이디 중복확인</h2>
	<hr/>
	<div>
		<label for="midC">아이디 : </label>
		<input type="text" name="midC" id="midC" maxlength="16" required autofocus placeholder="아이디 입력"/>
		<a href="javascript:idOk()" class="btn btn-secondary">검색</a>
	</div>
	<div id="demo"></div>
</body>
</html> 