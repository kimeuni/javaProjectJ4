<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="/include/memberCheck.jsp"/>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>비밀번호 변경</title>
    <jsp:include page="/include/bs4.jsp"/>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  	<script src="${ctp}/js/woo.js"></script>
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
        	width: 800px;
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
        	width: 680px;
        } 
        hr{
        	clear : both;
	        border: 1px solid gray;
	        width: 800px;
	        margin: 0 auto;
        }
        img {
        	border-radius: 100%;
        	border:2px solid pink;
        }
        #leftDiv{
        	width: 160px;
        	float : left;
        	margin: 50px 0px 20px 20px; 
        }
        #rightDiv{
        	width: 580px;
        	float : left;
        	margin: 20px; 
        } 
        .inRightDiv1{
       		text-align: right;
        	width: 90px;
        	float : left;
        	height: 35px; 
        	line-height: 35px;
        	margin: 7px 0px;
        }
        .inRightDiv2{
        	width: 490px;
        	float : left;
        	height: 35px; 
        	line-height: 35px;
        	margin: 7px 0px; 
        }
        #tel1, #tel2, #tel3{
            width: 80px;
        }
        #tel1{
            height: 35px;
        }
        #btnDiv{
        	text-align:center;
        	margin-top: 10px;
        }
    </style>
    <script>
    	'use strict'
    	// 닉네임 중복 확인
    	let childWindow;
    	
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

        // 이메일 중복 확인
        function emailCheck(){
        	let url = "emailCheck.mem";
        	let winName = "이메일 중복확인";
        	let opt = "width=500px, height=350px, top=300px, left=500px " 
        	
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
        
        // 개인정보 변경
        function infoChangeOk(){
        	//정규식
        	let regName = /^[가-힣]{2,10}$/; //이름은 한글로, 2~10자
        	let regTel = /^[0-9]{3,4}$/; //숫자만 3~4자
        	
        	// input에 적혀있는 값 가져오기
        	let profile;
            if(document.getElementsByName("profile")[0].checked) profile = "1.png";   
            if(document.getElementsByName("profile")[1].checked) profile = "2.png";
            if(document.getElementsByName("profile")[2].checked) profile = "3.png";
            if(document.getElementsByName("profile")[3].checked) profile = "4.png";
            if(document.getElementsByName("profile")[4].checked) profile = "5.png";
        	
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
        	let gender;
            if(document.getElementsByName("gender")[0].checked) gender = "남자";   
            if(document.getElementsByName("gender")[1].checked) gender = "여자";
            
            
        	// 성명 공백확인
        	if(name.trim() == ""){
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
        		alert("전화번호는 숫자로만 입력가능합니다.")
        		document.getElementById("tel2").focus();
        		return false;
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
        		let tel = tel1 + "-" + tel2 + "-" + tel3;
        		
        		
        		// 전송전에 '주소'를 하나로 묶어서 전송처리 준비
            	let postcode = infoChangeForm.postcode.value;
            	let roadAddress = infoChangeForm.roadAddress.value;
            	let detailAddress = infoChangeForm.detailAddress.value;
            	let extraAddress = infoChangeForm.extraAddress.value;
            	let address = postcode + "/" + roadAddress + "/" + detailAddress + "/" + extraAddress;
          		
            	
            	let query = {
            		profile:profile,
            		name:name,
            		nickName:nickName,
            		address:address,
            		tel:tel,
            		email:email,
            		gender:gender
            	}
            	$.ajax({
            		url : "infoChangeOk.mem",
            		type : "post",
            		data : query,
            		success : function(res){
            			if(res == "1"){
            				alert("개인정보가 변경되었습니다.")
            				location.reload();
            			}
            			else alert("개인정보 변경에 실패하였습니다.")
            		},
            		error : function(){
            			alert("전송오류(infoChange.jsp)")
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
				<h2>개인정보 변경</h2>
				<hr/>
				<form name="infoChangeForm" >
					<div>
						<div id="leftDiv">
							<img src="${ctp}/images/${vo.profile}" width= "150px" >
						</div>
						<div id="rightDiv">
							<div class="inRightDiv1">
								프로필 : &nbsp;&nbsp;
							</div>
							<div class="inRightDiv2">
								<input type="radio" name="profile" id="profile1" value="1.png" ${vo.profile=='1.png'? 'checked' : '' } /><label for="profile1"><img src="${ctp}/images/1.png" width="40px" style="border-radius:100%"></label>&nbsp;&nbsp;&nbsp;
					        	<input type="radio" name="profile" id="profile2" value="2.png" ${vo.profile=='2.png'? 'checked' : '' }/><label for="profile2"><img src="${ctp}/images/2.png" width="40px" style="border-radius:100%"></label>&nbsp;&nbsp;&nbsp;
					        	<input type="radio" name="profile" id="profile3" value="3.png" ${vo.profile=='3.png'? 'checked' : '' }/><label for="profile3"><img src="${ctp}/images/3.png" width="40px" style="border-radius:100%"></label>&nbsp;&nbsp;&nbsp;
					        	<input type="radio" name="profile" id="profile4" value="4.png" ${vo.profile=='4.png'? 'checked' : '' }/><label for="profile4"><img src="${ctp}/images/4.png" width="40px" style="border-radius:100%"></label>&nbsp;&nbsp;&nbsp;
					        	<input type="radio" name="profile" id="profile5" value="5.png" ${vo.profile=='5.png'? 'checked' : '' }/><label for="profile5"><img src="${ctp}/images/5.png" width="40px" style="border-radius:100%"></label>
							</div>
							<div class="inRightDiv1">
								아이디 : &nbsp;&nbsp;
							</div>
							<div class="inRightDiv2">
								<div>${vo.mid}</div>
							</div>
							<div class="inRightDiv1">
								<label for="name">성명 : &nbsp;&nbsp; </label>
							</div>
							<div class="inRightDiv2">
								<input type="text" name="name" id="name" value="${vo.name}" maxlength="10" required placeholder="성명을 입력하세요." />
							</div>
							<div class="inRightDiv1">
								<label for="nickCheck">닉네임 : &nbsp;&nbsp; </label>
							</div>
							<div class="inRightDiv2">
								<input type="text" name="nickName" id="nickName" value="${vo.nickName}" maxlength="12" required placeholder="닉네임을 입력하세요." readonly/>
								<input type="button"  name="nickCheck" id="nickCheck"  value="중복확인" onclick="nickCheckOk()" class="btn btn-success btn-sm"/>
							</div>
							<div class="inRightDiv1" style="height: 130px;">
								<label for="nickCheck">주소 : &nbsp;&nbsp; </label>
							</div>
							<c:set var="addresss" value="${fn:split(vo.address,'/')}"/>
							<div class="inRightDiv2" style="height: 130px;">
								<div style="margin-bottom: 5px">
							        <input type="text" name="postcode" id="sample6_postcode" value="${addresss[0]}" readonly placeholder="우편번호" >
						        	<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-secondary btn-sm">
					         	</div>
						        <input type="text" name="roadAddress" id="sample6_address" value="${addresss[1]}" readonly placeholder="기본주소" style="width: 300px; margin-bottom: 5px">
						        <div class="input-group mb-1">
						        	<input type="text" name="detailAddress" id="sample6_detailAddress" value="${addresss[2]}" placeholder="상세주소" style="width: 300px;"> &nbsp;&nbsp;
							        <div class="input-group-append"> 
							        	<input type="text" name="extraAddress" id="sample6_extraAddress" value="${addresss[3]}" placeholder="참고항목" style="width: 150px;" />
							        </div>
						        </div>
							</div>
							<div class="inRightDiv1"> 
								<label for="name">전화번호 :&nbsp;&nbsp; </label>
							</div>
							<div class="inRightDiv2">
								<c:set var="tels" value="${fn:split(vo.tel,'-')}"/>
								<select name="tel1" id="tel1">
					                <option value="010" ${tels[0]=='010'? 'selected' : '' }>010</option>
					                <option value="011" ${tels[0]=='011'? 'selected' : '' }>011</option>
					                <option value="016" ${tels[0]=='016'? 'selected' : '' }>016</option>
					                <option value="017" ${tels[0]=='017'? 'selected' : '' }>017</option>
					                <option value="018" ${tels[0]=='018'? 'selected' : '' }>018</option>
					                <option value="019" ${tels[0]=='019'? 'selected' : '' }>019</option>
					            </select> - 
					            <input type="text" name="tel2" value="${tels[1]}" maxlength="4" id="tel2" > - 
					            <input type="text" name="tel3" value="${tels[2]}" maxlength="4" id="tel3">
							</div>
							<div class="inRightDiv1">
								<label for="email">이메일 : &nbsp;&nbsp; </label>
							</div>
							<div class="inRightDiv2">
								<input type="email" name="email" id="email" value="${vo.email}" maxlength="12" required placeholder="이메일을 입력하세요." readonly/>
								<input type="button"  name="mailCheck" id="mailCheck"  value="중복확인" onclick="emailCheck()" class="btn btn-success btn-sm"/>
							</div>
							<div class="inRightDiv1">
								<label for="email">성별 : &nbsp;&nbsp; </label>
							</div>
							<div class="inRightDiv2">
								<input type="radio" name="gender" value="남자" ${vo.gender=='남자'? 'checked' : '' }/>남자 &nbsp;&nbsp;&nbsp;
            					<input type="radio" name="gender" value="여자" ${vo.gender=='여자'? 'checked' : '' } />여자
							</div>
						</div>
					</div>
					<hr/> 
					<div id="btnDiv"><input type="button" value="변경하기" onclick="infoChangeOk()" class="btn btn-success"/></div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>

</body>
</html>