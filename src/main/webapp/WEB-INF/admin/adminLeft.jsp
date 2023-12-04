<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>adminLeft.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
	<style>
		body{
			background-color:#4AA8D8;
			text-align: center;
			color: #fff;
		}
		hr{
		}
		h3{
			padding: 10px 0px;
			color: #fff;
		}
	</style>
</head>
<body >
	<h3><b><a href="${ctp}/" target="_top"><i class="fa-solid fa-box"></i> 중고모아</a></b></h3>
	<hr/>
	<p><b><a href="adminContent.ad" target="adminContent">관리자메인</a></b>
	<hr/>
	<div>
		<h4><b>회원관리</b></h4>
		<div><a href="memberAllList.ad" target="adminContent">회원 리스트</a></div>
	</div>
	<hr/>
	<div>
		<h4><b>상품관리</b></h4>
		<div><a href="adminReportList.ad" target="adminContent">신고 관리</a></div>
	</div>
</body>
</html>