<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>중고모아</title>
    <jsp:include page="/include/bs4.jsp"/>
    <style>
    	#main{
			margin: 0 auto;
	        width: 1100px;
    	}
    	#newcategory{
    		float: left;
    		margin: 10px;
    		border: 1px solid lightgray;
    	}
    	#newcategory:hover{
    		opacity: 0.7;
    	}
    	#topBtn{
		    position: fixed;
		    bottom: 160px;
		    right: 100px;
		}
    	#topBtn:hover{
			cursor: pointer;
		}
		#likeDiv{
			position: fixed;
			width: 120px;
			min-height: 300px;
			border: 1px solid gray;
			background-color: #fff;
			top: 200px;
			right: 200px;
		}
		
    </style>
    <script>
    	'use strict'
    	// 화살표클릭시 화면 처음으로 부드럽게 이동시키기
		$(window).scroll(function(){ //윈도우이에 스크롤이 일어났을 때
			if($(this).scrollTop() > 100) { //현재 스크롤이 100px 아래로 갈시
				$("#topBtn").addClass("on");  //화살표 추가
			}
			else {
				$("#topBtn").removeClass("on");  //아닐 시 삭제
			}
			$("#topBtn").click(function(){
				window.scrollTo({top:0,behavior:"smooth"}) //현재 페이지에서 특정 위치로 스크롤이동시키는 명령어  //만약 topBtn을 클릭했을 시 스크롤 위치 0 .. 그리고 부드럽게 올라가기
			});
		});  
    </script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div id="main">
<h2><span style="color: red">${category}</span>의 검색결과 <span style="color: gray">${saleSize}개</span></h2>
<hr/>
	<c:if test="${saleSize == 0 }"><h4 style="margin: 10px 0px;">현재 "<span style="color: red">${category}</span>"카테고리에 상품이 존재하지 않습니다.</h4></c:if>
   	<c:forEach var="allVO" items="${saleVOS}" varStatus="st">
    <c:set var="fSNames" value="${fn:split(allVO.fSName,'/')}"/>
	<c:if test="${allVO.userDel != 'Y' }">
	<!-- forEach를 통하여 등록된 게시글 출력 -->
	   	<a href="saleContent.sa?idx=${allVO.idx}"><div id="newcategory">
	   		<div><img src="${ctp}/images/sale/${fSNames[0]}" title="${fSNames[0]}" width="198px" height="186px"/></div>
	   		<div style="text-align: left; margin: 6px 5px;"> 
		   		<c:if test="${fn:length(allVO.title) > 10 }">${fn: substring(allVO.title,0,10)}···</c:if>
		   		<c:if test="${fn:length(allVO.title) <= 10 }">${allVO.title}</c:if>
	   		</div>
	   		<div style="text-align: left; margin: 6px 5px; width: 120px; float: left"><b>${allVO.money}원</b></div>
	   		<div style="text-align: right; margin: 6px 5px; width: 58px; float: right; font-size: 10px; color:lightgary;">
	   			<c:if test="${allVO.hour_diff > 24 }">${allVO.date_diff}일 전</c:if>
	   			<c:if test="${allVO.hour_diff <= 24 }">${allVO.hour_diff}시간 전</c:if>
	   		</div>
	   		<div>
		   		<c:if test="${allVO.state == '예약중' || allVO.state == '판매완료' }"><div style="color:red; float: left; width: 90px;">${allVO.state}</div></c:if>
		   		<div style="float:right; text-align:right; padding-right: 10px; padding-bottom: 5px; width: 100px; color:gray">
		   			<i class="fa-solid fa-heart"></i> ${allVO.totLike}
		   		</div>
	   		</div>
	   	</div></a>
	</c:if>
   </c:forEach>
   <div style="clear:both;"></div>
</div>
<!-- 누르면 맨 위로 올라가는 자동 스크롤 -->
<div>
	<h6 id="topBtn" class="text-right"><i class='far fa-arrow-alt-circle-up' style='font-size:36px'></i></h6>
</div>
<div id="likeDiv">
	<!-- 찜 목록 클릭시 전체 찜목록으로 이동(내가 찜한 것만) -->
	<a href="myStoreLike.sa?mid=${sMid}">
		<h6 style="text-align: center">찜 목록</h6>
		<div style="text-align: center"><i class="fa-solid fa-heart" style="color:red"></i>${likeSize}</div>
	</a>
	<hr/>
	<c:forEach var="saVO" items="${saVOS}" begin="0" end="3">
		<a href="saleContent.sa?idx=${saVO.idx}" style="text-align: center">
			<div><img src="${ctp}/images/sale/${saVO.fSName}" width="100px"/></div>
			<div style="text-align: center; margin-bottom: 3px;">${saVO.money}원</div>
		</a>
	</c:forEach>
</div>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>