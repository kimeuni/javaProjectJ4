<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	pageContext.setAttribute("newLine", "\n");
%>
<jsp:include page="/include/memberCheck.jsp"/>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${vo.title}</title>
    <jsp:include page="/include/bs4.jsp"/>
    <style>
    	#saleContentMain{
    		margin: 0 auto;
	        width: 1100px;
	        padding: 10px 30px;
    	}
    	#leftDiv{
    		width: 350px;
    		margin: 0px 10px 10px 10px;
    		float: left;
    	}
    	#rightDiv{
    		float: left;
			width: 670px;
    	}
    	button {
    		margin: 30px 20px;
    	}
    	#likes{
    		border: 1px solid gray;
    		background-color: lightgray;
    		height: 50px;
    		width: 130px;
    		color : #fff;
    		font-weight: bolder;
    		font-size: 1.3em;
    	}
    	#chatting{
    		border: 1px solid gray;
    		background-color: #F9BC28;
    		height: 50px;
    		width: 130px;
    		color : #fff;
    		font-weight: bolder;
    		font-size: 1.3em;
    	}
    	#report{
    		border: 1px solid gray;
    		background-color: red;
    		height: 50px;
    		width: 130px;
    		color : #fff;
    		font-weight: bolder;
    		font-size: 1.3em;
    	}
    	#contentLeft{
    		width: 770px;
    		margin: 0px 10px 10px 10px;
    		float: left;
    		border-right: 1px solid lightgray;
    	}
    	#contentRight{
    		float: left;
			width: 250px;
    	}
    </style>
    <script>
    	'use strict'
    	
    </script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
	<div id="saleContentMain">
		<div>카테고리 : ${vo.category}</div>
		<hr style="border-color: black"/>
		<div>
			<div id="leftDiv">
				<img src="${ctp}/images/sale/${vo.fSName}" width="350px" height="350px">
			</div>
			<div id="rightDiv">
				<div style="font-size:2em;">${vo.title}</div>
				<div style="margin: 5px 0px"><span style="font-size:2em; font-weight: bolder;">${vo.money}</span><span style="font-size:1.6em">원</span></div>
				<hr/>
				<div style="margin-bottom: 80px;">
					<span style="margin: 0px 10px"><i class="fa-solid fa-heart"></i>&nbsp; ${vo.totLike}</span>
					<span style="margin: 0px 10px"><i class="fa-solid fa-eye"></i>&nbsp; ${vo.viewCnt}</span>
					<span style="margin: 0px 10px"><i class="fa-regular fa-clock"></i>&nbsp; ${fn:substring(vo.uploadDate,0,16)}</span>
				</div>
				<div style="text-align: center; margin:0 auto;">
					<!-- 찜 데이터베이스 만들면 만약 sMid(로그인한 아이디로) 찜 눌렀을시 하트 색 바꾸기 -->
					<button name="likes" id="likes" onclick=""><i class="fa-regular fa-heart"></i>찜하기</button>
					<button name="chatting" id="chatting" onclick=""><i class="fa-regular fa-comments"></i>채팅하기</button>
					<button name="report" id="report" onclick=""><i class="fa-solid fa-triangle-exclamation"></i>신고하기</button>
				</div>
			</div>
		</div>
		<div style="clear:both; margin-bottom: 20px;"></div>
		<div style="border-top: 1px solid black;"> 
			<div id="contentLeft">
				<h3 style="margin: 20px 10px">상세 내용</h3>
				<hr/>
				<div style="min-height:300px; height:auto; padding: 15px 30px;">
					${fn: replace(vo.content,newLine,"<br/>")}
				</div>
			</div>
			<div id="contentRight">
				<h3 style="margin: 20px 10px">상점 정보</h3>
				<hr/>
				<!-- 게시물 등록한 해당 유저의 상점으로 들어가기 -->
				<a href="#"><div style="padding: 10px;">
					<div style="float: left; width: 60px;"><img src="${ctp}/images/${mVO.profile}" style="width: 60px; border-radius: 100%; border:1px solid pink;"/></div>
					<div style="float: left; width: 170px; padding: 10px;">
						${mVO.nickName} 님 <br/>
						상품 : ${saleSize} 개
					</div>
				</div></a>
				<div style="clear:both; margin-bottom: 10px;"></div>
				<!-- 게시글 작성한 유저가 등록한 글 4건 미리보기 -->
				<div>${mVO.nickName}님 <br/>최근 등록 상품</div>
				<c:forEach var="userSale" items="${vos}" begin="0" end="3">
				<a href="saleContent.sa?idx=${userSale.idx}"><div style="float: left">
					<div style="border: 1px solid gray;" >
						<div><img src="${ctp}/images/sale/${userSale.fSName}" width="110px" height="110"/></div>
						<div style="text-align: center">${userSale.money}원</div>
					</div>
				</div></a>
				</c:forEach>
				<div style="clear:both;"></div>
			</div>
		</div>
		<div style="clear:both;"></div>
	</div>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>