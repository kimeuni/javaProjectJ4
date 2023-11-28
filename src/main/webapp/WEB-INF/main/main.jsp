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
    		margin: 20px;
    	}
    	#newcategory:hover{
    		opacity: 0.7;
    	}
    </style>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div id="main">
<h2>최신 등록상품</h2>
<hr/>
   <c:forEach var="allVO" items="${allVOS}" varStatus="st">
	<c:set var="fSNames" value="${fn:split(allVO.fSName,'/')}"/>
   	<a href="#"><div id="newcategory">
   		<div><img src="${ctp}/images/sale/${fSNames[0]}" title="${fSNames[0]}" width="179px" height="180px"/></div>
   		${allVO.title}
   	</div></a>
   </c:forEach>
   <div style="clear:both;"></div>
</div>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>