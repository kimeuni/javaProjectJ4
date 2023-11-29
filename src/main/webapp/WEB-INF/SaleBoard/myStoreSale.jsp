<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>상점</title>
    <jsp:include page="/include/bs4.jsp"/>
    <style>
    	#myStoreSaleMain{
    		margin: 0 auto;
	        width: 1100px;
	        /*
	        padding: 10px 30px;
	        */
    	}
    </style>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
	<div id="myStoreSaleMain">
		<jsp:include page="/include/userInfo.jsp"/>
		우에에에엥ㅇㅇ
	</div>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>