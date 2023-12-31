<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
        #saleStr{
        	margin-top: 20px;
        	font-size: 16pt;
        	min-width: 300px;
        	float: left;
        }
        #newcategory{
    		float: left;
    		margin: 10px;
    		border: 1px solid lightgray;
    	}
    	#newcategory:hover{
    		opacity: 0.7;
    	}
    	#userCategoryDiv{
    		margin-top: 20px;
    		margin-right: 10px;
    		float: right;
    	}
    </style>
    <script>
    	'use script'
    	
    	function userCategorysChangeSale(mid){
			let userCategorys = document.getElementById("userCategorys").value;
			
			location.href="userCategorysChangeSale.sa?category="+userCategorys+"&mid="+mid;
    	}
    </script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
	<div id="myStoreSaleMain">
		<jsp:include page="/include/userInfo.jsp"/>
		<div id="storeNav">
			<c:if test="${mVO.mid != sMid }">
        		<a href="myStoreSale.sa?mid=${mVO.mid}"><div class="saleStore">상품 ${saleAllSize}</div><div style="width:734; border-bottom: 1px solid black;"></div></a>
			</c:if>
			<c:if test="${mVO.mid == sMid }">
        		<a href="myStoreSale.sa?mid=${mVO.mid}"><div class="saleStore">상품 ${saleAllSize}</div></a><a href="myStoreLike.sa?mid=${mVO.mid}"><div id="likeStore">찜목록</div></a><a href="myStoreManagement.sa?mid=${mVO.mid}"><div id="managementStore">상품관리</div></a>
			</c:if>
			<div id="saleStr">상품 <span style="color:red">${saleAllSize}</span></div>
			<div id="userCategoryDiv">
				<select name="userCategorys" id="userCategorys" onchange="userCategorysChangeSale('${mVO.mid }')">
					<option value="">전체</option>
					<c:forEach var="cgNames" items="${categorysName}">
						<option value="${cgNames}" ${cgNames==category ? 'selected':'' }>${cgNames}</option>
					</c:forEach>
				</select>
			</div>
			<div style="clear:both"></div>
			<hr/>
			<div style="margin-bottom: 10px;"><c:if test="${category == ''}">전체 &nbsp;&nbsp;&nbsp; <span style="color:gray">${saleSize}개</span></c:if></div>
			<div style="margin-bottom: 10px;"><c:if test="${category != ''}">${category } &nbsp;&nbsp;&nbsp; <span style="color:gray">${saleSize}개</span></c:if></div>
			<c:forEach var="allVO" items="${saVOS}" varStatus="st">
				<c:set var="fSNames" value="${fn:split(allVO.fSName,'/')}"/>
				<!-- forEach를 통하여 등록된 게시글 출력 -->
				   	<a href="saleContent.sa?idx=${allVO.idx}"><div id="newcategory">
				   		<div><img src="${ctp}/images/sale/${fSNames[0]}" title="${fSNames[0]}" width="198px" height="186px"/></div>
				   		<div style="text-align: left; margin: 6px 5px;"> 
					   		<c:if test="${fn:length(allVO.title) > 10 }">${fn: substring(allVO.title,0,10)}···</c:if>
					   		<c:if test="${fn:length(allVO.title) <= 10 }">${allVO.title}</c:if>
				   		</div>
				   		<div style="text-align: left; margin: 6px 5px; width: 120px; float: left"><b>${allVO.money}원</b></div>
				   		<div style="text-align: right; margin: 6px 5px; width: 58px; float: right; font-size: 10px; color:lightgary;">
				   			<c:if test="${allVO.hour_diff > 24 }">${allVO.date_diff}일 전</c:if>
				   			<c:if test="${allVO.hour_diff <= 24 }">${allVO.hour_diff}시간 전</c:if>
				   		</div>
				   		<div>
					   		<c:if test="${allVO.state == '예약중' || allVO.state == '판매완료' }"><div style="color:red; float: left; width: 90px;">${allVO.state}</div></c:if>
					   		<div style="float:right; text-align:right; padding-right: 10px; padding-bottom: 5px; width: 100px; color:gray">
					   			<i class="fa-solid fa-heart"></i> ${allVO.totLike}
					   		</div>
				   		</div>
				   	</div></a>
			   </c:forEach>
			   <div style="clear:both;"></div>
        </div>
	</div>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>