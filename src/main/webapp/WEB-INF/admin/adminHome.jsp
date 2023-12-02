<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/memberCheck.jsp"/>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>관리자 메인</title>
	<jsp:include page="/include/bs4.jsp"/>
	<frameset cols="200px, *">
		<frame src="adminLeft.ad" name="adminLeft" frameborder="0"/>
		<frame src="adminContent.ad" name="adminContent" frameborder="0"/>
	</frameset>
</html>