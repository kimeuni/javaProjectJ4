<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/memberCheck.jsp"/>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>비밀번호 변경</title>
    <jsp:include page="/include/bs4.jsp"/>
</head>
    <style>
    	body{
    		padding: 0px;
    		margin: 0px;
    	}
    	#myPageBack{
            height: 963px;  
            background-color: #eee; 
            
        }
        #myPage{
            margin: 0 auto;
        	width: 500px;
            background-color: #fff; 
            border-radius: 10px;
            padding: 30px 0px;
        }
        i {
        	float : left;
        	text-align:left;
        	width: 50px;
        	font-size : 1.5em;
        	padding: 20px 0px 0px 20px; 
        }
        #TopStr h2{
        	float : left;
        	text-align:center;
        	width: 400px;
        } 
        hr{
        	clear : both;
	        border: 1px solid gray;
	        width: 500px;
	        margin: 0 auto;
        }
        #pwdDiv{
        	margin: 20px;
        }
        .inPwdDiv{
        	margin-bottom: 10px;
        	text-align: center;
        }
        input[type="password"]{
        	width: 300px;
        	height: 40px;
        	border: 1px solid gary;  
        }
        #btnDiv{
        	text-align:center;
        	margin-top: 10px;
        	
        }
    </style>
    <script>
    	'use strict'
    	function pwdChangeOk(){
    		let regPwd = /^(?=.*[a-zA-Z0-9])(?=.*[~!@#$%^&*()_+[\]{}?]).{8,16}$/;
    		
			let pwd = document.getElementById("pwd").value.trim();
			let newPwd = document.getElementById("newPwd").value.trim();
			let newPwdCheck = document.getElementById("newPwdCheck").value.trim();
			
			// 비밀번호 공백 체크
			if(pwd == ""){
				alert("현재 비밀번호를 입력해주세요.")
				document.getElementById("pwd").focus;
				return false;
			}
			else if(newPwd == ""){
				alert("새 비밀번호를 입력해주세요.")
				document.getElementById("newPwd").focus;
				return false;
			}
			// 새 비밀번호 정규식 확인
        	else if(!regPwd.test(newPwd)){
        		alert("대문자,특수문자 1개이상&영소문자숫자/ 8~16자 사이로 입력해주세요.");
        		document.getElementById("newPwd").focus();
        		return false;
        	}
			else if(newPwdCheck == ""){
				alert("새 비밀번호 확인을 입력해주세요.")
				document.getElementById("newPwdCheck").focus;
				return false;
			}
			else if(newPwd != newPwdCheck){
				alert("새 비밀번호와 새 비밀번호 확인이 동일하지 않습니다. 다시 확인해주세요.")
				document.getElementById("newPwd").focus;
				return false;
			}
			else{
				let query = {
					pwd : pwd,
					newPwd : newPwd,
					newPwdCheck : newPwdCheck
				}
				$.ajax({
					url : "pwdChangeOk.mem",
					type : "post",
					data : query,
					success : function(res){
						if(res =="0") alert("현재 비밀번호가 일치하지 않습니다.")
						else if(res == "1") alert("새비밀번호와 새비밀번호 확인을 다시 확인해주세요.")
						else if(res == "2") alert("비밀번호 변경에 실패하였습니다.")
						else if(res == "3"){
							alert("비밀번호를 변경하였습니다.")
							location.href="myPage.mem";
						} 
					},
					error : function(){
						alert("전송 오류(pwdChange.jsp)")
					}
				});
			}
    	}
    </script>
</head>
<body>
	<div id="myPageBack">
		<div id="myPage">
			<div id="TopStr">
				<a href="myPage.mem"><i class="fa-solid fa-arrow-left" ></i></a>
				<h2>비밀번호 변경</h2>
				<hr/>
				<div style="margin: 15px 20px 50px 20px;"> 
					<p>※안전한 비밀번호로 내정보를 보호하세요</p>
					<p>※다른 아이디/사이트에서 사용한 적 없는 비밀번호</p>
					<p>※이전에 사용한 적 없는 비밀번호가 안전합니다.</p>
				</div>
				<form name="pwdChangeForm" >
				<div id="pwdDiv">
					<div class="inPwdDiv">
						<input type="password" name="pwd" id="pwd" placeholder="현재 비밀번호" autofocus required/>
					</div>
					<div class="inPwdDiv">
						<input type="password" name="newPwd" id="newPwd" placeholder="새 비밀번호" required/>
					</div>
					<div class="inPwdDiv">
						<input type="password" name="newPwdCheck" id="newPwdCheck" placeholder="새 비밀번호 확인" required/>
					</div>
				</div>
				<hr/> 
				<div id="btnDiv"><input type="button" value="변경하기" onclick="pwdChangeOk()" class="btn btn-success"/></div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>

</body>
</html>