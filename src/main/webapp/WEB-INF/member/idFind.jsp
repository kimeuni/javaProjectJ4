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
        #idFindMain{
            margin: 0 auto;
            padding: 0px 200px;
            width: 100%;
            width: 1100px;
            /* position: relative; */
        }
        h1{
            text-align: center;
        }
        a #idFind {
            height: 65px;
            border: 1px;
            line-height: 65px;
            text-align:center;
        	display: inline-block;
            background-color: #f9f9f9; 
            border-width:1px 1px 0px 1px;
            border-style:solid;
            width: 300px;
            font-size: 1.3em; 
            
        }
        a #pwdFind {
        	text-align:center;
        	display: inline-block;
            width: 300px;
            height: 65px;
            border: 1px;
            font-size: 1.3em;
            line-height: 65px;
            border: 1px solid #ddd;
            border-bottom: 1px solid black;
        }
        a:hover{
            color: black;
            text-decoration: none;
        }
        #mid{
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
        #btnDiv{
            height: 45px;
            width: 400px;
            margin: 0 auto;
            text-align:center;
        }
    </style>
    <script>
        'use strict';
        function idFindOk(){
        	let email = document.getElementById("email").value;
        	if(email.trim() == ""){
        		alert("이메일을 입력해주세요.");
        	}
        	else {
        		$.ajax({
        			url : "idFindOk.mem",
        			type : "post",
        			data : {email : email},
        			success : function(res){
        				if(res == "0") alert("이메일을 다시 확인해주세요.")
        				else {
        					let str = '';
        					str += '<hr/>';
        					str += '<div style="margin:0 auto; text-align:center; width:650px; font-size: 1.5em;">'; 
        					str += '찾으시는 아이디는 <span style="color:red;">' + res + '</span>입니다.';
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
        			idFindOk();
        		}
        	});
        });
    </script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
	<div id="idFindMain">
        <h1>아이디 찾기</h1>
        <p><br/></p>
        <p><br/></p>
        <div id="mid">
        	<a href="idFind.mem"><div id="idFind">아이디 찾기</div></a><a href="pwdFind.mem"><div id="pwdFind">임시 비밀번호 발급</div></a>
        </div>
        <div style="height: 50px;"></div>
        <div style="text-align: center; height: 60px; font-size: 18px;">아이디 찾기</div>
        <div style="text-align: center; height: 50px;"><font color="blue">※회원가입하신 이메일을 통하여 아이디를 찾으실 수 있습니다.</font color></div>
        <form name="idFindForm" method="post" action="">
            <div id="emailDiv">
                <i class="fa-solid fa-envelope"> </i> <input type="email" name="email" id="email" placeholder="이메일을 입력해주세요." style="width: 355px;"/>
            </div>
                <div style="height: 35px;"></div>
            <div id="btnDiv">
                <input type="button" value="아이디찾기" onclick="idFindOk()" class="btn btn-primary form-control">
            </div>
        </form>
    </div>
    <div id="demo"></div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/> 
</body>
</html>