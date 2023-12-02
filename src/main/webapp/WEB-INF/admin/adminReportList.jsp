<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>신고관리</title>
	<%@ include file="../../include/bs4.jsp" %>
	<style>
		body{
			padding: 20px;
		}
	</style>
	<script>
		'use strict'
		//문제없음 처리
		function adminReportNo(partIdx,title){
			$.ajax({
				url : "adminReportNo.ad",
				type : "post",
				data : {partIdx : partIdx},
				success : function(res){
					if(res != "0"){
						alert("제목 : "+title+"\n 관련 신고글 모두 삭제되었습니다.");
						location.reload();
					}
					else {
						alert("삭제 실패되었습니다.");
					}
				},
				error : function(){
					alert("전송 오류(adminReport.jsp)")
				}
			});
		}
		
		// 삭제처리
		function deleteReportSale(partIdx,fSName,title){
			let query = {
				partIdx : partIdx,
				fSName : fSName
			}
			$.ajax({
				url : "deleteReportSale.ad",
				type : "post",
				data : query,
				success : function(res){
					if(res != "0"){
						alert("제목 : "+title+"\n 상품 글을 삭제하였습니다.");
						location.reload();
					}
					else {
						alert("삭제 실패되었습니다.");
					}
				},
				error : function(){
					alert("전송 오류(adminReport.jsp)")
				}
			});
		}
	</script>
</head>
<body>
<p><br/></p>
	<h2 style="text-align:center;">신고 관리</h2>
	<p><br/></p>
	<table class="table table-hover text-center">
		<tr class="table-dark text-dark">
			<th>번호</th>
			<th>항목</th>
			<th>제목</th>
			<th>신고자</th>
			<th>사유</th>
			<th>날짜</th>
			<th>상세보기</th>
			<!-- <th>상세보기</th> -->
		</tr>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr>
				<td>${startNo}</td>
				<td>${vo.part }</td>
				<td>${vo.title }</td>
				<td>${vo.cpMid }</td>
				<td>${vo.cpContent }</td>
				<c:if test="${vo.hour_diff > 24 }"><td>${fn:substring(vo.cpDate,0,10)}</td></c:if>
				<c:if test="${vo.hour_diff <= 24}"><td>${vo.date_diff == 0 ? fn: substring(vo.cpDate,11,16) : fn: substring(vo.cpDate,5,16)}</td></c:if>
				<td>
					<a href="saleContent.sa?idx=${vo.partIdx}" class="btn btn-primary">글 보기</a>
					<a href="javascript:deleteReportSale('${vo.partIdx}','${vo.fSName}','${vo.title }')" class="btn btn-danger">글 삭제</a>
					<a href="javascript:adminReportNo('${vo.partIdx}','${vo.title }')" class="btn btn-secondary">문제없음</a>
				</td>
			</tr>
			<tr><td colspan="5" class="m-0 p-0"></td></tr>
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