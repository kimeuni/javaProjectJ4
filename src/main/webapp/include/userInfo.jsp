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
    		border: 1px solid gray;
    	}
    	#useImg{
    		border-radius: 100%;
    		border-color: pink;
    	}
    	#userLeft{
    		float: left;
    		width: 305px;
    		border: 1px solid;
    	}
    	#userRight{
    		float: left;
    		width: 760px;
    		border: 1px solid;
    		padding: 30px;
    	}
    </style>
</head>
<body>
	<div id="userInfoMain">
		<div id="userLeft">
			<div id="useImg"><img src="${ctp}/images/sale/"/></div>
		</div>
		<div id="userRight">
			<div>닉네임</div>
			<hr/>
			<div>상점 오픈일:</div>
			<hr/>
		</div>
		<div style="clear:both"></div>
	</div>
</body>
</html>