<%@page import="chat.ChatJVO"%>
<%@page import="chat.ChatDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	request.setCharacterEncoding("utf-8");
	ChatDAO dao = new ChatDAO();
	
	// null처리하면 값이 2개 넘어옴... 
	int chatIdx = Integer.parseInt(request.getParameter("idx")); 
	int chat = Integer.parseInt(request.getParameter("idx")); 
	
	ArrayList<ChatJVO> vos = dao.getMemberChatList(chatIdx);
	pageContext.setAttribute("vos", vos); //EL로 사용하기 위해...
	
	String mid = (String)session.getAttribute("sMid");
	
	// 채팅 방에 들어왔을 시, 알람 N으로 업데이트 처리
	dao.setUpdateChatDate(mid,chatIdx);
	
	// 채팅 알람 Y가 있을 시 채팅그룹에 알림 cnt 업데이트
	dao.chatGroupTotAlarm(chatIdx);
	
%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>채팅방</title>
	<jsp:include page="/include/bs4.jsp"/>
	<style>
		body{
			background-color:#eee;
			padding: 10px;
		}
		.chatBox{
			background-color: #fff;
			border: 1px solid lightgray;
			border-radius: 10px; 
			padding: 3px 5px;
		}
	</style>
	<script>
		'use strict'
		
		setTimeout("location.reload()",1000*2); //현재는 2초마다 refresh 한다.
		
		$(function(){
			document.body.scrollIntoView(false); //스크롤바를 강제로 body태그 마지막으로 보낸다.
		});
		
		
	</script>
</head>
<body>
	<div > 
		<c:forEach var="vo" items="${vos}" varStatus="st"> 
		<!-- 보인이 채팅 칠때 화면 -->
			<c:if test="${vo.whoChatMid == sMid}">
				<div style="width: 300px; float: right;">
					<div class="chatBox">${vo.chat}</div>
					<div style="text-align: right; color: gray">
						<c:if test="${vo.alarm != 'N'}"><span style="color: orange; text-align: right;">1</span></c:if> &nbsp;&nbsp;
						${fn:substring(vo.chatDate,0,16)}
					</div>
					
				</div>   
			</c:if>
			<c:if test="${vo.whoChatMid != sMid}">
				<div style="width: 300px; float: left ;">
					<div class="chatBox">${vo.chat}</div>
					<div>
						<div style="text-align: left; color: gray">${fn:substring(vo.chatDate,0,16)}</div>
					</div>
				</div>   
			</c:if>
		<div style="clear:both;"></div>
		</c:forEach>
	</div>
</body>
</html>