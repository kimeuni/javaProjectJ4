<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!-- memberCheck.jsp --> <!-- 만약 세션에 저장된 값이 없으면..! main화면으로 들어가지 못하고 login화면으로 가도록한다. -->
<c:if test="${empty sMid}">
	<script>location.href="login.lo"</script>
</c:if>