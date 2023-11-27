<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>임시 비밀번호 발급</title>
    <jsp:include page="/include/bs4.jsp"/>
    <style>
        #idFindMain{
            margin: 0 auto;
            padding: 0px 200px;
            width: 100%;
            width: 1100px;
        }
        h1{
            text-align: center;
        }
        #idFind{
            display: inline-block;
            width: 300px;
            height: 65px;
            border: 1px;
            font-size: 1.3em;
            text-align: center;
            line-height: 65px;
            border: 1px solid #ddd;
            border-bottom: 1px solid black;
        }
        #pwdFind{
            display: inline-block;
            width: 300px;
            height: 65px;
            border: 1px;
            font-size: 1.3em;
            text-align: center;
            line-height: 65px;
            background-color: #f9f9f9;
            border-width:1px 1px 0px 1px;
            border-style:solid;
            
        }
        a:hover{
            color: black;
            text-decoration: none;
        }
        #idPwdClick{
            text-align:center;
        }
        #email{
            outline: none;
            border: none;
        }
        #emailDiv{
            background-color: rgba(0,0,0,0);
            margin: 0 auto;
            width: 400px;
            border: 1px solid lightgray; 
            font-size: 1.3em;
            padding: 5px;
            height: 45px;
            border-radius: 10px;
        }
        #midDiv{
            background-color: rgba(0,0,0,0);
            margin: 0 auto;
            width: 400px;
            border: 1px solid lightgray; 
            font-size: 1.3em;
            padding: 5px;
            height: 45px;
            border-radius: 10px;
        }
        #mid{
            outline: none;
            border: none;
        }
        #btnDiv{
        	height: 45px;
            width: 400px;
            margin: 0 auto;
            text-align:center;
        }
    </style>
    <script>
        'use strict';
        
        function pwdFind(){
        	let mid = document.getElementById("mid").value;
        	let email = document.getElementById("email").value;
        	
        	if(mid.trim() == ""){
        		alert("아이디를 입력해주세요.");
        	}
        	else if(email.trim() == ""){
        		alert("이메일을 입력해주세요.");
        	}
        	else {
        		let query = {
        			mid, mid,
        			email, email
        		}
        		$.ajax({
        			url : "pwdFindOk.mem",
        			type : "post",
        			data : query,
        			success : function(res){
        				if(res == "0") alert("아이디 혹은 이메일을 다시 확인해주세요.")
        				else {
        					let str = '';
        					str += '<hr/>';
        					str += '<div style="margin:0 auto; text-align:center; width:650px; font-size: 1.5em;">'; 
        					str += '임시로 발급된 비밀번호는 <span style="color:red;">' + res + '</span>입니다. <br/>';
        					str += '로그인 후, 계정정보에서 비밀번호 수정이 가능합니다.';
        					str += '</div>';
        					
        					demo.innerHTML = str;
        				}
        			},
        			error : function(){
        				alert("전송오류 (idFind.jsp)")
        			}
        		});
        	}
        }
        
        $(function() {
        	$("#email").on("keydown",function(e){
        		if(e.keyCode == 13){
        			pwdFind();
        		}
        	});
        });
    </script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
	<div id="idFindMain">
	    <h1>임시 비밀번호 발급</h1>
	    <p><br/></p> 
	    <p><br/></p>
	    <div id="idPwdClick">
		    <a href="idFind.mem"><div id="idFind">아이디 찾기</div></a><a href="pwdFind.mem"><div id="pwdFind">임시 비밀번호 발급</div></a>
	    </div>
	    <div style="height: 50px;"></div>
	    <div style="text-align: center; height: 60px; font-size: 18px;">임시 비밀번호 발급</div>
	    <div style="text-align: center; height: 50px;"><font color="blue">※회원가입하신 이메일과 아이디를 통하여 임시 비밀번호를 발급받으실 수 있습니다.</font color></div>
	    <form name="idFindForm">
	        <div id="midDiv">
	            <i class="fa-solid fa-user"> </i> <input type="text" name="mid" id="mid" placeholder="아이디를 입력해주세요." style="width: 345px;"/>
	        </div>
	        <div style="height: 15px;"></div>
	        <div id="emailDiv">
	            <i class="fa-solid fa-envelope"> </i> <input type="email" name="email" id="email" placeholder="이메일을 입력해주세요." style="width: 355px;"/>
	        </div>
	            <div style="height: 35px;"></div>
           <div id="btnDiv">
	            <input type="button" value="임시 비밀번호 발급" onclick="pwdFind()" class="btn btn-primary form-control">
           </div>
	    </form>
	</div>
	<div id="demo"></div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/> 
</body>
</html>