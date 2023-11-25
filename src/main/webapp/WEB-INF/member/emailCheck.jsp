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
    	
    	function email3(){
    		let emailC3 = document.getElementById("emailC3").value;
    		
    		document.getElementById("emailC2").value = emailC3;
    		
    	}
    	
    	// 중복확인 창에서 회원가입(join)창에 값 전달하기
    	function emailOk(){
    		let emailC1 = document.getElementById("emailC1").value;
    		let emailC2 = document.getElementById("emailC2").value;
    		let regEmail1 = /^[\w]{4,20}$/; //알파벳,숫자,_ / 4~20자 사이
    		let regEmail2 = /^@{1}[a-zA-Z]+\.[a-z]+$/;
    		
    		// 공백 검사
    		if(emailC1.trim() == "" || emailC2.trim() == ""){
    			alert("중복확인 할 이메일을 작성해주세요.")
    			document.getElementById("emailC1").focus();
    			return false;
    		}
    		// 정규식 검사 
    		else if(!regEmail1.test(emailC1)){
    			alert("이메일은 알파벳,숫자,_만 사용하셔야하며, 4~20자 사이로 입력해주셔야합니다.")
    			document.getElementById("emailC1").focus();
    			return false;
    		}
    		else if(!regEmail2.test(emailC2)){
    			alert("이메일 형식에 맞춰 작성해주세요. (ex:@naver.com))")
    			document.getElementById("emailC2").focus();
    			return false;
    		}
    		else {
    			let emailC = emailC1 + emailC2
        		// ajax로 중복검사하기
        			$.ajax({
        				url : "emailCheckOk.mem",
        				type : "post",
        				data : {email : emailC},
        				success : function(res){
        					if(res != "0"){
    							let str = '';
    			    			str += '<div><span style="color:red">';
    			    			str += emailC+'</span>은(는) 존재하는 이메일 입니다. <br/>';
    			    			str += '다시 입력해주세요.';
    			    			str += '</div>';
    			    			$("#demo").html(str);
        					}
        					else{
        						opener.document.getElementById("email").value = emailC;
        			    		window.close();
        					}
        				},
        				error : function(){
        					alert("전송오류(emailCheck.jsp)")
        				}
        			});
        		}
        	}
    	
    	// Enter(keyCode 13번)시, nickOk() 함수를 불러온다.
    	$(function() {
    		$("#nickC").on("keydown",function(e) {
    			if(e.keyCode == 13){
    				emailOk()
    			}
    		});
    	});
    </script>
</head>
<body>
	<h2 style="text-align:center">이메일 중복확인</h2>
	<hr/>
	<div>
		<label for="nickC">이메일 : </label>
		<input type="text" name="emailC1" id="emailC1" maxlength="20" required autofocus placeholder="이메일 입력"/>
		<input type="text" name="emailC2" id="emailC2" maxlength="30" required autofocus placeholder="@이메일 입력"/>
		<select name="emailC3" id="emailC3" onchange="email3()">
			<option value="">이메일 선택</option>
			<option value="@naver.com">@naver.com</option>
			<option value="@gmail.com">@gmail.com</option>
			<option value="@nate.com">@nate.com</option>
			<option value="@hanmail.net">@hanmail.net</option>
		</select>
		<a href="javascript:emailOk()" class="btn btn-secondary">검색</a>
	</div>
	<div id="demo"></div>
</body>
</html> 