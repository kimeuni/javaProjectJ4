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
        .joinMain hr{
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
        
        // 아이디 중복확인
        function idCheck(){
        	let url = "idCheck.mem";
        	let winName = "아이디 중복확인";
        	let opt = "width=500px, height=350px, top=300px, left=500px " 
        	
       		childWindow = window.open(url,winName,opt)
        }
        
        // 아이디 input 클릭시 idCheck() 함수를 불러옴
        $(function() {
        	$("#mid").on("click",function(e){
        		idCheck()
        	});
        });
        // keydown 시 
        $(function() {
        	$("#mid").on("keydown",function(e){
        		// Tab이 아닐 시 (마우스 사용을 잘 안하는 사람을 위해서 Tab제외 아무키나 눌러도 중복확으로 들어가도록 처리)
        		if(e.keyCode != 9){
	        		idCheck()
        		}
        	});
        });
        
        // 닉네임 중복 확인
        function nickCheckOk() {
        	let url = "nickCheck.mem";
        	let winName = "닉네임 중복확인";
        	let opt = "width=500px, height=350px, top=300px, left=500px " 
        	
       		childWindow = window.open(url,winName,opt)
        }
        
        // 클릭시
        $(function() {
        	$("#nickName").on("click",function(e){
        		nickCheckOk()
        	});
        });
     	// keydown 시 
        $(function() {
        	$("#nickName").on("keydown",function(e){
        		// Tab이 아닐 시 (마우스 사용을 잘 안하는 사람을 위해서 Tab제외 아무키나 눌러도 중복확으로 들어가도록 처리)
        		if(e.keyCode != 9){
        			nickCheckOk()
        		}
        	});
        });
        
        // 주소 클릭시
        $(function() {
        	$("#sample6_postcode").on("click",function(e){
        		sample6_execDaumPostcode()
        	});
        });
        // 주소 클릭시
        $(function() {
        	$("#sample6_address").on("click",function(e){
        		sample6_execDaumPostcode()
        	});
        });
     	// keydown 시 
        $(function() {
        	$("#sample6_postcode").on("keydown",function(e){
        		// Tab이 아닐 시 (마우스 사용을 잘 안하는 사람을 위해서 Tab제외 아무키나 눌러도 중복확으로 들어가도록 처리)
        		if(e.keyCode != 9){
        			sample6_execDaumPostcode()
        		}
        	});
        });
    	 // keydown 시 
        $(function() {
        	$("#sample6_address").on("keydown",function(e){
        		// Tab이 아닐 시 (마우스 사용을 잘 안하는 사람을 위해서 Tab제외 아무키나 눌러도 중복확으로 들어가도록 처리)
        		if(e.keyCode != 9){
        			sample6_execDaumPostcode()
        		}
        	});
        });
        
        // 이메일 중복 확인
        function emailCheck(){
        	let url = "emailCheck.mem";
        	let winName = "이메일 중복확인";
        	let opt = "width=700px, height=350px, top=300px, left=500px " 
        	
       		childWindow = window.open(url,winName,opt)
        }
        
        // 클릭시
        $(function() {
        	$("#email").on("click",function(e){
        		emailCheck()
        	});
        });
        // keydown 시 
        $(function() {
        	$("#email").on("keydown",function(e){
        		// Tab이 아닐 시 (마우스 사용을 잘 안하는 사람을 위해서 Tab제외 아무키나 눌러도 중복확으로 들어가도록 처리)
        		if(e.keyCode != 9){
        			emailCheck()
        		}
        	});
        });
        
        // 회원가입
        function joinOk() {
        	//정규식
        	let regPwd = /^(?=.*[a-zA-Z0-9])(?=.*[~!@#$%^&*()_+[\]{}?]).{8,16}$/; //영문자(대/소), 숫자,특수문자(~!@#$%^&*()_+[]{}?)를 각각 1자이상 포함하고 8~16자까지 입력 
        	let regName = /^[가-힣]{2,10}$/; //이름은 한글로, 2~10자
        	let regTel = /^[0-9]{3,4}$/; //숫자만 3~4자
        	
        	// input에 적혀있는 값 가져오기
        	let mid = document.getElementById("mid").value;
        	let pwd = document.getElementById("pwd").value;
        	let pwdOk = document.getElementById("pwdOk").value;
        	let name = document.getElementById("name").value;
        	let nickName = document.getElementById("nickName").value;
        	let sample6_postcode = document.getElementById("sample6_postcode").value;
        	let sample6_address = document.getElementById("sample6_address").value;
        	let sample6_detailAddress = document.getElementById("sample6_detailAddress").value;
        	let sample6_extraAddress = document.getElementById("sample6_extraAddress").value;
        	let tel1 = document.getElementById("tel1").value;
        	let tel2 = document.getElementById("tel2").value;
        	let tel3 = document.getElementById("tel3").value;
        	let email = document.getElementById("email").value;
        	let gender = joinForm.gender.value;
        	
        	// 아이디 공백확인
        	if(mid.trim() == ""){
        		alert("아이디 중복확인을 통하여 아이디를 받아와주세요.");
        		document.getElementById("mid").focus();
        		return false;
        	}
        	// 비밀번호 공백확인
        	else if(pwd.trim() == ""){
        		alert("비밀번호를 입력해주세요.")
        		document.getElementById("pwd").focus();
        		return false;
        	}
        	// 비밀번호 확인 공백확인
        	else if(pwdOk.trim() == ""){
        		alert("비밀번호를 입력해주세요.")
        		document.getElementById("pwdOk").focus();
        		return false;
        	}
        	// 비밀번호 정규식 확인
        	else if(!regPwd.test(pwd)){
        		alert("대문자,특수문자 1개이상&영소문자숫자/ 8~16자 사이로 입력해주세요.");
        		document.getElementById("pwd").focus();
        		return false;
        	}
        	// 비밀번호와 비밀번호 확인이 동일한지 확인
        	else if(pwd != pwdOk){
        		alert("작성하신 비밀번호와 확인 비밀번호가 틀립니다. 다시 확인해주세요.");
        		document.getElementById("pwd").focus();
        		return false;
        	}
        	// 성명 공백확인
        	else if(name.trim() == ""){
        		alert("성명을 입력해주세요.");
        		document.getElementById("name").focus();
        		return false;
        	}
        	// 성명 정규식 확인
        	else if(!regName.test(name)){
        		alert("성명은 한글로, 2~10자 사이로 입력해주셔야 합니다.");
        		document.getElementById("name").focus();
        		return false;
        	}
        	// 닉네임 공백확인
        	else if(nickName.trim() == ""){
        		alert("닉네임 중복확인을 통하여 닉네임를 받아와주세요.");
        		document.getElementById("nickName").focus();
        		return false;
        	}
        	// 주소 공백확인
        	else if(sample6_postcode.trim() == "" || sample6_address.trim() == ""){
        		alert("주소를 입력해주세요.");
        		document.getElementById("sample6_postcode").focus();
        		return false;
        	}
        	// 전화번호 정규식 확인
        	else if(tel2.trim() != "" && tel3.trim() !="" && !regTel.test(tel2) || !regTel.test(tel3)){
        		if(!regTel.test(tel2) || !regTel.test(tel3)){
	        		alert("전화번호는 숫자로만 입력가능합니다.")
	        		document.getElementById("tel2").focus();
	        		return false;
        		}
        	}
        	// 이메일 공백확인
        	else if(email.trim() == ""){
        		alert("이메일 중복확인을 통하여 이메일을 받아와주세요.")
        		document.getElementById("email").focus();
        		return false;
        	}
        	// front 검사 끝 submit 보내기
        	else {
        		// 전송전 '전화번호' 하나로 묶어서 전송처리 준비
        		joinForm.tel.value = tel1 + "-" + tel2 + "-" + tel3;
        		
        		// 전송전에 '주소'를 하나로 묶어서 전송처리 준비
            	let postcode = joinForm.postcode.value;
            	let roadAddress = joinForm.roadAddress.value;
            	let detailAddress = joinForm.detailAddress.value;
            	let extraAddress = joinForm.extraAddress.value;
            	joinForm.address.value = postcode + "/" + roadAddress + "/" + detailAddress + "/" + extraAddress;
          		
            	joinForm.submit();
        	}
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
        	프로필 <span class="pilsu">*</span>
        </div>
        <div class="joinInput"> 
        	<input type="radio" name="profile" id="profile1" value="1.png" checked /><label for="profile1"><img src="${ctp}/images/1.png" width="40px" style="border-radius:100%"></label>&nbsp;&nbsp;&nbsp;
        	<input type="radio" name="profile" id="profile2" value="2.png" /><label for="profile2"><img src="${ctp}/images/2.png" width="40px" style="border-radius:100%"></label>&nbsp;&nbsp;&nbsp;
        	<input type="radio" name="profile" id="profile3" value="3.png" /><label for="profile3"><img src="${ctp}/images/3.png" width="40px" style="border-radius:100%"></label>&nbsp;&nbsp;&nbsp;
        	<input type="radio" name="profile" id="profile4" value="4.png" /><label for="profile4"><img src="${ctp}/images/4.png" width="40px" style="border-radius:100%"></label>&nbsp;&nbsp;&nbsp;
        	<input type="radio" name="profile" id="profile5" value="5.png" /><label for="profile5"><img src="${ctp}/images/5.png" width="40px" style="border-radius:100%"></label>
        </div>
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
            <input type="password" maxlength="16" name="pwd" id="pwd" required  />
            <span>(대문자,특수문자 1개이상&영소문자숫자/ 8~16자)</span>
        </div>
        <div class="joinStr">
            <label for="pwdOk">비밀번호 확인 <span class="pilsu">*</span></label>
        </div>
        <div class="joinInput">
            <input type="password" maxlength="16" name="pwdOk" id="pwdOk" required  />
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
            <input type="button"  name="nickCheck" id="nickCheck"  value="중복확인" onclick="nickCheckOk()" class="btn btn-success btn-sm"/>
        </div>
        <div class="joinStr" style="height: 110px;">
            <label for="sample6_postcode">주소 <span class="pilsu">*</span></label>
        </div>
         <div class="joinInput " style="height: 110px;">
         	<div style="margin-bottom: 5px">
		        <input type="text" name="postcode" id="sample6_postcode" readonly placeholder="우편번호" >
	        	<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-secondary btn-sm">
         	</div>
	        <input type="text" name="roadAddress" id="sample6_address" readonly placeholder="기본주소" style="width: 400px; margin-bottom: 5px">
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
            <select name="tel1" id="tel1">
                <option selected value="010">010</option>
                <option value="011">011</option>
                <option value="016">016</option>
                <option value="017">017</option>
                <option value="018">018</option>
                <option value="019">019</option>
            </select> - 
            <input type="text" name="tel2" id="tel2" maxlength="4" id="tel2" > - 
            <input type="text" name="tel3" id="tel3" maxlength="4" id="tel3">
        </div>
        <div class="joinStr">
            <label for="email">이메일 <span class="pilsu">*</span></label>
        </div>
        <div class="joinInput">
            <input type="text" name="email" id="email" readonly required /> 
            <input type="button"  name="mailCheck" id="mailCheck"  value="중복확인" onclick="emailCheck()" class="btn btn-success btn-sm"/>
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
            <input type="button" value="돌아가기" onclick="location.href='login.mem'" class="btn btn-secondary"/>
        </div>
        
	    <input type="hidden" name="tel" />
	    <input type="hidden" name="address" />
    </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/> 
</body>
</html>