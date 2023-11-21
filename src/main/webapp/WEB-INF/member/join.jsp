<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>회원가입</title>
    <jsp:include page="/include/bs4.jsp"/>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  	<script src="${ctp}/js/woo.js"></script>
    <style>
        hr{
            border: 1.5px solid #252525;
        }
        h5{
            float: left;
            width: 200px;
        }
        h6{
            float: right;
            width: 200px;
            text-align: right;
        }
        .joinMain{
            margin: 0 auto;
            width: 1100px;
        }
        .joinStr{
            float: left;
            width:15%;
            height: 30px;
            line-height: 30px;
            margin: 10px;
        }
        .joinInput{
            float: left;
            top: 0;
            left: 20%;
            width: 65%;
            height: 30px;
            line-height: 30px;
            margin: 10px;
        }
        .pilsu{
            color: red;
        }
        input[type="text"], input[type="password"]{
            width: 220px;
        }
        #tel1, #tel2, #tel3{
            width: 80px;
        }
        #tel1{
            height: 35px;
        }
    </style>
    <script>
        'use strict';
        let childWindow;
        
        function idCheck(){
        	let url = "idCheck.mem";
        	let winName = "아이디 중복확인";
        	let opt = "width=500px, height=350px, top=300px, left=500px " 
        	
       		childWindow = window.open(url,winName,opt)
        }
    </script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>  
<p><br/></p>
<div  class="joinMain" >
    <h1 style="text-align:center;">회 원 가 입</h1>
    <p><br/></p>
    <hr />
    <form name="joinForm" method="post" action="joinOk.mem">
        <div>
            <h5><b>기본 정보</b></h5>
            <h6><span class="pilsu">*</span>는 필수 입력</h6>
        </div>
        <p style="clear: both;"></p>
        <div class="joinStr">
        <label for="mid">아이디 <span class="pilsu">*</span></label>
        </div>
        <div class="joinInput">
            <input type="text"  name="mid" id="mid" readonly required autofocus  />
            <input type="button"  name="midCheck" id="midCheck"  value="중복확인" onclick="idCheck()" class="btn btn-success btn-sm"/>
            <span>(영문소문자,숫자/ 4~16자)</span>
        </div>
        <div class="joinStr">
            <label for="pwd">비밀번호 <span class="pilsu">*</span></label>
        </div>
        <div class="joinInput">
            <input type="password"  name="pwd" id="pwd" required  />
            <span>(대문자,특수문자 1개이상&영소문자숫자/ 8~16자)</span>
        </div>
        <div class="joinStr">
            <label for="pwdOk">비밀번호 확인 <span class="pilsu">*</span></label>
        </div>
        <div class="joinInput">
            <input type="password"  name="pwdOk" id="pwdOk" required  />
        </div>
        <div class="joinStr">
            <label for="name">성명 <span class="pilsu">*</span></label>
        </div>
        <div class="joinInput">
            <input type="text"  name="name" id="name" required  />
        </div>
        <div class="joinStr">
            <label for="nickName">닉네임 <span class="pilsu">*</span></label>
        </div>
        <div class="joinInput">
            <input type="text"  name="nickName" id="nickName" required readonly />
            <input type="button"  name="nickCheck" id="nickCheck"  value="중복확인" onclick="" class="btn btn-success btn-sm"/>
        </div>
        <div class="joinStr" style="height: 110px;">
            주소 <span class="pilsu">*</span>
        </div>
         <div class="joinInput " style="height: 110px;">
         	<div style="margin-bottom: 5px">
		        <input type="text" name="postcode" id="sample6_postcode" placeholder="우편번호" >
	        	<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-secondary btn-sm">
         	</div>
	        <input type="text" name="roadAddress" id="sample6_address" placeholder="기본주소" style="width: 400px; margin-bottom: 5px">
	        <div class="input-group mb-1">
	        	<input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소" style="width: 400px;"> &nbsp;&nbsp;
		        <div class="input-group-append"> 
		        	<input type="text" name="extraAddress" id="sample6_extraAddress" placeholder="참고항목" 	>
		        </div>
	        </div>
        </div>
        <div class="joinStr">
            <label for="tel2">휴대전화</label>
        </div>
        <div class="joinInput">
            <select name="tel1" id="tel1" onchange="">
                <option selected value="010">010</option>
                <option value="011">011</option>
                <option value="016">016</option>
                <option value="017">017</option>
                <option value="018">018</option>
                <option value="019">019</option>
            </select> - 
            <input type="text" name="tel2" id="tel2" > - 
            <input type="text" name="tel3" id="tel3">
        </div>
        <div class="joinStr">
            <label for="email">이메일 <span class="pilsu">*</span></label>
        </div>
        <div class="joinInput">
            <input type="text" name="email" id="email" readonly required /> 
            <input type="button"  name="mailCheck" id="mailCheck"  value="중복확인" onclick="" class="btn btn-success btn-sm"/>
        </div>
        <div class="joinStr">
            성별 <span class="pilsu">*</span>
        </div>
        <div class="joinInput" >
            <input type="radio" name="gender" value="남자" checked/>남자 &nbsp;&nbsp;&nbsp;
            <input type="radio" name="gender" value="여자" />여자
        </div>
        <div style="clear: both;"></div>
        <hr/>
        <div style=" text-align: center;">
            <input type="button" value="회원가입" onclick="joinOk()" class="btn btn-secondary"/> 
            <input type="button" value="돌아가기" onclick="" class="btn btn-secondary"/>
        </div>
    </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/> 
</body>
</html>