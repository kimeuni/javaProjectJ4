<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${mVO.nickName} | 상점</title>
    <jsp:include page="/include/bs4.jsp"/>
    <style>
    	#myStoreSaleMain{
    		margin: 0 auto;
	        width: 1100px;
    	}
    	a #idFind {
            height: 65px;
            border: 1px;
            line-height: 65px;
            text-align:center;
        	display: inline-block;
            background-color: #f9f9f9; 
            border-width:1px 1px 0px 1px;
            border-style:solid;
            width: 300px;
            font-size: 1.3em; 
            
        }
        a #pwdFind {
        	text-align:center;
        	display: inline-block;
            width: 300px;
            height: 65px;
            border: 1px;
            font-size: 1.3em;
            line-height: 65px;
            border: 1px solid #ddd;
            border-bottom: 1px solid black;
        }
        #storeNav{
        	margin-bottom: 20px;
        }
    	a .saleStore {
            height: 65px;
            border: 1px;
            line-height: 65px;
            text-align:center;
        	display: inline-block;
            background-color: #f9f9f9; 
            border-width:1px 1px 0px 1px;
            border-style:solid;
            width: 366px;
            font-size: 1.3em; 
        }
        a #likeStore {
        	text-align:center;
        	display: inline-block;
            width: 366px;
            height: 65px;
            border: 1px;
            font-size: 1.3em;
            line-height: 65px;
            border: 1px solid #ddd;
            border-bottom: 1px solid black;
        }
        a #managementStore {
        	text-align:center;
        	display: inline-block;
            width: 366px;
            height: 65px;
            border: 1px;
            font-size: 1.3em;
            line-height: 65px;
            border: 1px solid #ddd;
            border-bottom: 1px solid black;
        }
    </style>
    <script>
    	'use script'
    </script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
	<div id="myStoreSaleMain">
		<jsp:include page="/include/userInfo.jsp"/>
		<div id="storeNav">
			<c:if test="${mVO.mid != sMid }">
        		<a href="myStoreSale.sa?mid=${mVO.mid}"><div class="saleStore">상품 ${saleSize}</div><div style="width:734; border-bottom: 1px solid black;"></div>
			</c:if>
			<c:if test="${mVO.mid == sMid }">
        		<a href="myStoreSale.sa?mid=${mVO.mid}"><div class="saleStore">상품 ${saleSize}</div></a><a href="pwdFind.mem"><div id="likeStore">찜목록</div></a><a href="pwdFind.mem"><div id="managementStore">상품관리</div></a>
			</c:if>
        </div>
	</div>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>