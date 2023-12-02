<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="/include/memberCheck.jsp"/>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${mVO.nickName} | 찜목록</title>
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
        a #likeStore {
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
        }
        #newcategory{
    		float: left;
    		margin: 10px;
    		border: 1px solid lightgray;
    	}
    	#newcategory:hover{
    		opacity: 0.7;
    	}
    </style>
    <script>
    	'use script'
    	
    	// 찜 취소
    	function likesDelete(likeMid,idx){
    		let query={
 				likeMid : likeMid,
 				idx : idx
 			}    		
 			$.ajax({
 				url : "likeDelete.sa",
 				type : "post",
 				data : query,
 				success : function(res){
 					if(res == "0") alert("찜취소 실패");
 					else location.reload();
 				},
 				error : function(){
 					alert("전송오류(saleContent.jsp)")
 				}
 			});
    	}
    </script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
    <div id="myStoreSaleMain">
		<jsp:include page="/include/userInfo.jsp"/>
		<div id="storeNav">
			<c:if test="${mVO.mid != sMid }">
        		<a href="myStoreSale.sa?mid=${mVO.mid}"><div class="saleStore">상품 ${saleSize}</div><div style="width:734; border-bottom: 1px solid black;"></div></a>
			</c:if>
			<c:if test="${mVO.mid == sMid  }">
        		<a href="myStoreSale.sa?mid=${mVO.mid}"><div class="saleStore">상품 ${saleAllSize}</div></a><a href="myStoreLike.sa?mid=${mVO.mid}"><div id="likeStore">찜목록</div></a><a href="myStoreManagement.sa?mid=${mVO.mid}"><div id="managementStore">상품관리</div></a>
			</c:if>
			<div id="saleStr">찜 <span style="color:red">${likeSize}</span></div>
			<hr/>
			<div style="margin-bottom: 10px;">전체 &nbsp;&nbsp;&nbsp; <span style="color:gray">${likeSize}개</span></div>
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
				   		<div style="text-align: right; padding-right: 10px; padding-bottom: 5px;  color:gray">
				   			<button name="likes" id="likes" onclick="likesDelete('${sMid}','${allVO.idx}')" style="background-color: #E54090"><i class="fa-regular fa-heart" style="color:red"></i>찜취소</button>
				   		</div>
				   	</div></a>
			   </c:forEach>
			   <div style="clear:both;"></div>
        </div>
	</div>	
<jsp:include page="/include/footer.jsp"/>
</body>
</html>