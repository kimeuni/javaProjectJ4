<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>멤버 전체 리스트</title>
	<%@ include file="../../include/bs4.jsp" %>
	<style>
		body{
			padding: 20px;
		}
	</style>
	<script>
		
	</script>
</head>
<body>
<p><br/></p>
	<h2 style="text-align:center;">회원 리스트</h2>
	<p><br/></p>
	<table class="table table-hover text-center">
		<tr class="table-dark text-dark">
			<th>번호</th>
			<th>아이디</th>
			<th>성함</th>
			<th>닉네임</th>
			<th>주소</th>
			<th>이메일</th>
			<th>성별</th>
			<th>상점</th>
			<!-- <th>상세보기</th> -->
		</tr>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr>
				<td>${startNo}</td>
				<td>${vo.mid }</td>
				<td>${vo.name }</td>
				<td>${vo.nickName }</td>
				<td>${vo.address }</td>
				<td>${vo.email }</td>
				<td>${vo.gender }</td>
				<td>
					<a href="myStoreSale.sa?mid=${vo.mid}" class="btn btn-primary">상점 가기</a>
				</td>
			</tr>
			<tr><td colspan="7" class="m-0 p-0"></td></tr>
			<c:set var="startNo" value="${startNo-1}" />
		</c:forEach>
	</table>
	<!-- 페이징 처리(1블로의 크기를 3개(3Page)로 한다. 한페이지는 기본은 10개 -->
<div class="text-center">
	<ul class="pagination justify-content-center">
	<c:if test="${pageSu > 1}"><li class="page-item"><a class="page-link text-secondary " href="adminReportList.ad?pageSu=1&pageSize=${pageSize}">첫페이지</a></li></c:if>
	<c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="adminReportList.ad?pageSu=${(curBlock-1)*blockSize+1}&pageSize=${pageSize}">이전블록</a></li></c:if>
	<c:if test="${pageSu > 1}"><li class="page-item"><a class="page-link text-secondary" href="adminReportList.ad?pageSu=${pageSu-1}&pageSize=${pageSize}">◀</a></li></c:if>
	<c:forEach var="i" begin="${(curBlock * blockSize)+1}" end="${(curBlock * blockSize)+blockSize}" varStatus="st">
		<c:if test="${i <= totPage && pageSu == i}"><li class="page-item active"><a class="page-link bg-secondary border-secondary" href="adminReportList.ad?pageSu=${i}&pageSize=${pageSize}">${i}</a></c:if>
		<c:if test="${i <= totPage && pageSu != i}"><li class="page-item"><a class="page-link text-secondary" href="adminReportList.ad?pageSu=${i}&pageSize=${pageSize}">${i}</a></c:if>
	</c:forEach>
	<c:if test="${pageSu < totPage }"><li class="page-item"><a class="page-link text-secondary" href="adminReportList.ad?pageSu=${pageSu+1}&pageSize=${pageSize}">▶</a></li></c:if>
	<c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="adminReportList.ad?pageSu=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}">다음블록</a></li></c:if>
	<c:if test="${pageSu < totPage}"><li class="page-item"><a class="page-link text-secondary" href="adminReportList.ad?pageSu=${totPage}&pageSize=${pageSize}">마지막페이지</a></li></c:if>
	</ul>
</div>
<p><br/></p>
</body>
</html>