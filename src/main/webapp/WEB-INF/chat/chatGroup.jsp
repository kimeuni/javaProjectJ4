<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/memberCheck.jsp"/>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>채팅그룹</title>
    <jsp:include page="/include/bs4.jsp"/>
    <style>
    	body{
    		background-color: #eee;
    	}
    	#chatGroupMain{
    		margin: 0 auto;
	        width: 1100px;
	        margin-top: 27px;
	        margin-bottom: 27px;
    	}
    	#chatGroup{
    		margin: 0 auto;
    		text-align: center;
    		width: 500px;
    		background-color: #fff; 
            border-radius: 10px;
            padding: 30px 0px; 
            height: 600px;
            overflow: auto;
    	}
    	#selectChat{
    		background-color: pink;
    		height: 70px;
    		text-align: left;
    		padding: 5px 20px;
    		font-size: 1.2em;
    		font-weight: bold;
    	}
    	#selectChat:hover{
    		opacity: 0.7;
    	}
    	#chatList{
    		height: 70px;
    		text-align: left;
    		padding: 5px 20px;
    		font-size: 1.2em;
    		font-weight: bold;
    	}
    	#chatList:hover{
    		background-color: #ccc;
    	}
    	.newMsg{
    		color: #fff; 
    		text-align: right; 
    		border:1px solid; 
    		display: inline-block;
    		padding: 0px 8px;
    		border-radius: 100%;
    		background-color: red;
    		vertical-align: middle;
    	}
    </style>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<div id="chatGroupMain">
	<div id="chatGroup">
		<h2>${sNickName}님 채팅방</h2>
		<hr/>
		<!-- 상품에서 '채팅하기를 클릭하고 들어왔을 시' 제일 상단에 채팅방이 올라오도록 -->
		<c:if test="${saleBoardIdx != 0 && saleMid != '' && myMid != ''}">
			<a href="chatting.cht?saleBoardIdx=${saleBoardIdx}&saleMid=${saleMid}&myMid=${myMid}">
				<div id="selectChat">
					<c:if test="${saleMid != sMid }">${saleMid}</c:if>
					<c:if test="${myMid != sMid }">${myMid}</c:if>
				</div>
			</a>
		</c:if>
		<!-- 현재 만들어진 채팅방 그룹 리스트 -->
		<c:forEach var="cgVO" items="${cgListVOS}">
			<c:if test="${cgVO.saleBoardIdx != 0 }">
				<a href="chatting.cht?saleBoardIdx=${cgVO.saleBoardIdx}&saleMid=${cgVO.saleMid}&myMid=${cgVO.myMid}">
				<div id="chatList">
					<c:if test="${cgVO.saleMid != sMid }">
						<span style="width: 400px; display: inline-block;">
						${cgVO.saleMid} 
						</span>
						<c:if test="${cgVO.totAlarm != 0 }"><span class="newMsg">${cgVO.totAlarm }</span></c:if>
					</c:if>
					<c:if test="${cgVO.myMid != sMid }">
						<span style="width: 400px; display: inline-block;">${cgVO.myMid}</span>
						<c:if test="${cgVO.totAlarm != 0 }"><span class="newMsg">${cgVO.totAlarm }</span></c:if>
					</c:if>
				</div>
				</a>
			</c:if>
		</c:forEach>
	</div>
</div>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>