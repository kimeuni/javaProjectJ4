<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>닉네임 찾기</title>
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
    	function nickOk(){
    		let nickC = document.getElementById("nickC").value;
    		let regNickName = /^[a-zA-Z가-힣0-9]{2,12}$/; //영문대소문자,한글,숫자 2~12자
    		
    		// 공백 검사
    		if(nickC.trim() == ""){
    			alert("중복확인 할 닉네임를 작성해주세요.")
    			document.getElementById("nickC").focus();
    			return false;
    		}
    		// 정규식 검사 
    		else if(!regNickName.test(nickC)){
    			alert("닉네임은 영문대소문자,한글,숫자만 사용하셔야하며, 2~12자 사이로 입력해주셔야합니다.")
    			document.getElementById("nickC").focus();
    			return false;
    		}
    		else {
        		// ajax로 닉네임 중복검사하기
        			$.ajax({
        				url : "nickCheckOk.mem",
        				type : "post",
        				data : {nickName : nickC},
        				success : function(res){
        					if(res != "0"){
    							let str = '';
    			    			str += '<div><span style="color:red">';
    			    			str += nickC+'</span>은(는) 존재하는 닉네임 입니다. <br/>';
    			    			str += '다시 입력해주세요.';
    			    			str += '</div>';
    			    			$("#demo").html(str);
        					}
        					else{
        						opener.document.getElementById("nickName").value = nickC;
        			    		window.close();
        					}
        				},
        				error : function(){
        					alert("전송오류(nickCheck.jsp)")
        				}
        			});
        		}
        	}
    	
    	// Enter(keyCode 13번)시, nickOk() 함수를 불러온다.
    	$(function() {
    		$("#nickC").on("keydown",function(e) {
    			if(e.keyCode == 13){
	    			nickOk()
    			}
    		});
    	});
    </script>
</head>
<body>
	<h2 style="text-align:center">닉네임 중복확인</h2>
	<hr/>
	<div>
		<label for="nickC">닉네임 : </label>
		<input type="text" name="nickC" id="nickC" maxlength="12" required autofocus placeholder="닉네임 입력"/>
		<a href="javascript:nickOk()" class="btn btn-secondary">검색</a>
	</div>
	<div id="demo"></div>
</body>
</html> 