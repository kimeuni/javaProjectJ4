<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="/include/memberCheck.jsp"/>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>채팅그룹</title>
    <jsp:include page="/include/bs4.jsp"/>
    <style>
    	body{
    		background-color: #eee;
    	}
    	#chatMain{
    		margin: 0 auto;
	        width: 1100px;
	        margin-top: 27px;
	        margin-bottom: 27px;
    	}
    	#chatting{
    		margin: 0 auto;
    		text-align: center;
    		width: 500px;
    		background-color: #fff; 
            border-radius: 10px;
            padding: 20px 0px; 
            height: 600px;
    	}
    	#userImg{
    		width: 45px;
    		border: 1px solid pink;
    		border-radius: 100%;
    		vertical-align: middle;
    	}
    	#saleImg{
    		width: 50px;
    		height: 50px;
    		border: 1px solid pink;
    		border-radius: 100%;
    		vertical-align: middle;
    	}
    	hr{
    		margin: 10px;
    	}
    </style>
    <script>
		'use strict'
		function chatInput(saleBoardIdx,saleMid,myMid){
			let chat = $("#chatIn").val();
			
			if(chat.trim() == ""){
				alert("보낼 채팅을 입력해주세요.")
				$("#chat").focus();
				return false;
			}
			else{
				let query = {
					saleBoardIdx:saleBoardIdx,
					saleMid: saleMid,
					myMid: myMid,
					chat : chat,
					chatIdx : ${chatIdx}
				}
				$.ajax({
					url : "chatting.cht",
					type : "post",
					data : query,
					error : function(){
						alert("전송오류")
					}
				});
			}
		}
		
		
		// 13번은 Enter..
		// Enter를 했을 시 chatInput()를 불러서 처리하도록 한다
		/* 
		$(function() {
	    	$("#chatIn").on("keydown", function(e) {
	    		if(e.keyCode == 13) {
	    			chatInput('${saleBoardIdx}','${saleMid}','${myMid}');
	    		}
	    	});
	    }); 
		*/
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<div id="chatMain">
	<div id="chatting">
		<!-- 구매 혹은 판매하려는 판매자 정보 -->
		<div style="text-align: left; padding: 0px 20px">
			<div style="width: 80%; float: left">${mVO.nickName} <br/>
				마지막 접속: 
				<c:if test="${mVO.hour_diff > 24 }">${mVO.day_diff}일 전</c:if>
	   			<c:if test="${mVO.hour_diff <= 24 }">${mVO.hour_diff}시간 전</c:if>
   			</div>
   			<div style="width: 19%; float: left; text-align: right;"><a href="myStoreSale.sa?mid=${mVO.mid}"><img src="${ctp}/images/${mVO.profile}" id="userImg"></a></div>
		</div>
		<div style="clear: both;"></div>
		<hr/>
		<!-- 구매 혹은 판매하려는 게시물 정보 -->
		<div>
			<div style="width: 20%; float: left">
				<a href="saleContent.sa?idx=${saleVO.idx}"><img src="${ctp}/images/sale/${saleVO.fSName}" id="saleImg"></a>
			</div>
			<div style="width: 79%; float: left; text-align: left;">
				<b>${saleVO.money}원</b><br/>
				<span style="color: gray">${saleVO.title}</span>
			</div>
		</div>
		<div style="clear: both;"></div>
		<hr/>
		<!-- 채팅 -->
		<div>
			<form name="chatForm">
				<iframe src="${ctp}/include/memberChat.jsp?idx=${chatIdx}"  width="99%" height="370px" class="border"></iframe>
				<div class="input-group mt-1">
					<input type="text" name="chatIn" id="chatIn" maxlength="50" class="form-control" placeholder="대화내용을 입력하세요." autofocus/>
					<div class="input-group-append">
						<input type="button" value="글등록" onclick="chatInput('${saleBoardIdx}','${saleMid }','${myMid}')" class="btn btn-success"/> 
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>