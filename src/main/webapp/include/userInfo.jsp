<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>유저 정보</title>
    <%-- <jsp:include page="/include/bs4.jsp"/> --%>
    <style>
    	#userInfoMain{
    		margin: 30px 15px;
    		border: 1px solid lightgray;
    	}
    	#useImg{
    		padding: 30px;
    	}
    	#useImg img{
    		border-radius: 100%;
    		border: 2px solid pink;
    		width: 240px;
    	}
    	
    	#userLeft{
    		float: left;
    		width: 305px;
    	}
    	#userRight{
    		float: left;
    		width: 760px;
    		padding: 30px;
    	}
    </style>
</head>
<body>
	<div id="userInfoMain">
		<div id="userLeft">
			<div id="useImg"><img src="${ctp}/images/${mVO.profile}"/></div>
		</div>
		<div id="userRight">
			<div style="font-size: 1.5em; font-weight: bolder;">${mVO.nickName }</div>
			<hr/>
			<div>
				<i class="fa-solid fa-store" style="color:orange;"></i>상점 오픈일 ${mVO.day_diff}일 전 &nbsp;&nbsp;&nbsp;
				<i class="fa-solid fa-cart-shopping" style="color:blue;"></i>상품 ${saleSize}개 &nbsp;&nbsp;&nbsp;
				<c:if test="${mVO.mid == sMid }"><i class="fa-solid fa-heart" style="color:red;"></i>찜 ${likeSize}개</c:if>
			</div>
			<hr/>
		</div>
		<div style="clear:both"></div>
	</div>
</body>
</html>