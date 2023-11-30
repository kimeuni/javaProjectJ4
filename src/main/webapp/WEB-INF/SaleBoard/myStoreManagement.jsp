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
    <title>${mVO.nickName} | 상점관리</title>
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
        #saleStr{
        	margin: 10px 0px;
        	font-size: 16pt;
        	min-width: 300px;
        }
        td button {
        	margin-bottom: 10px;
        }
        .searchDiv{
			height: 50px;
			float: left;
			margin: 0px 10px;
        }
        input[type="text"]{
        	border: none;
        	background-color: rgba(0,0,0,0);
        	height: 49px;
        	width: 250px;
        }
        .searchDiv select{
        	height: 49px;
        	
        }
    </style>
    <script>
    	'use script'
    	
    	// 현제 게시글 삭제
    	function deleteSale(idx,fSName){
    		let ans = confirm("등록한 상품을 삭제하시겠습니까?");
    		if(ans) location.href="deleteSale.sa?idx="+idx+"&fSName="+fSName;
    	}
    	
    	// state 리스트 출력
    	function states(mid){
			let state = $("#state").val();
    		
			location.href="myStoreManagementSearchStateChang.sa?state="+state+"&mid="+mid;
    	}
    	
    	// state 변경하기
    	function stateChanges(idx,mid){
			let stateChange = $("#stateChange").val();
    		
			location.href="myStoreManagementstateChange.sa?stateChange="+stateChange+"&idx="+idx+"&mid="+mid;
    	}
    	
    	// up 하기
    	function saleUp(state,idxUp,mid){
    		if(state != '판매중'){
    			alert("예약중 혹은 판매완료된 상품은 up하기가 불가능합니다.")
    		}
    		else {
    			location.href="myStoreMangeUp.sa?idxUp="+idxUp+"&mid="+mid;
    		}
    	}
    	
    	// 관리상점 검색
    	function searchMyStore(mid){
    		let myStoreSearch = $("#myStoreSearch").val().trim();
    		
    		if(myStoreSearch == ""){
    			alert("상품명을 입력해주세요.")
    			$("#myStoreSearch").focus();
    			return false;
    		}
    		else {
    			location.href="myStoreSearchList.sa?mid="+mid+"&myStoreSearch="+myStoreSearch;
    		}
    	}
    	//엔터 눌렀을 시 searchMyStore() 함수 실행
    	$(function() {
    		$("#myStoreSearch").on("keydown", function(e) {
    			if(e.keyCode == 13){
    				searchMyStore('${sMid}');
    			}
    		});
    	});
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
				<div class="searchDiv" style="border: 1px solid gray;">
					<input type="text" name="myStoreSearch" id="myStoreSearch" placeholder="상품명을 입력해주세요" />
					<a href="javascript:searchMyStore('${sMid}')" style="padding: 10px;"><i class="fa-solid fa-magnifying-glass" ></i></a>
				</div>
				<div class="searchDiv">
					<select name="state" id="state" onchange="states('${mVO.mid }')">
						<option value='' ${state =='' ? 'selected' : '' }>전체</option>
						<option value='판매중' ${state =='판매중' ? 'selected' : '' }>판매중</option>
						<option value='예약중' ${state =='예약중' ? 'selected' : '' }>예약중</option>
						<option value='판매완료' ${state =='판매완료' ? 'selected' : '' }>판매완료</option>
					</select>
				</div>
			</div>
			<div style="clear:both"></div>
			<hr/>
			<div style="margin-bottom: 10px;"><c:if test="${state == ''}">전체 &nbsp;&nbsp;&nbsp; <span style="color:gray">${saleSize}개</span></c:if></div>
			<div style="margin-bottom: 10px;"><c:if test="${state != ''}">${state } &nbsp;&nbsp;&nbsp; <span style="color:gray">${saleSize}개</span></c:if></div>
			<table class="table table-hover">
				<thead>
					<tr class="table-dark text-dark text-center">
						<th>사진</th>
						<th>판매상태</th>
						<th>상품명</th>
						<th>가격</th>
						<th>찜</th>
						<th>최근수정일</th>
						<th>기능</th>
					</tr>
				</thead>
				<c:forEach var="allVO" items="${saVOS}" varStatus="st">
					<c:set var="fSNames" value="${fn:split(allVO.fSName,'/')}"/>
					<tbody>
						<tr class="text-center">
							<td><a href="saleContent.sa?idx=${allVO.idx}"><img src="${ctp}/images/sale/${fSNames[0]}" width="150px" height="150px"/></a></td>
							<td>
								<select name="stateChange" id="stateChange" onchange="stateChanges('${allVO.idx}','${allVO.mid}')">
									<option ${allVO.state=='판매중'? 'selected': '' } value="판매중">판매중</option>
									<option ${allVO.state=='예약중'? 'selected': '' } value="예약중">예약중</option>
									<option ${allVO.state=='판매완료'? 'selected': '' } value="판매완료">판매완료</option>
								</select>
							</td>
							<td><a href="saleContent.sa?idx=${allVO.idx}">${allVO.title }</a></td>
							<td>${allVO.money }원</td>
							<td>${allVO.totLike }</td>
							<td>${fn:substring(allVO.uploadDate,0,16)}</td>
							<td>
								<!-- up을 누를 시, 게시물이 상단으로 올라가도록 uploadDate의 날짜가 수정된다. -->
								<button name="saleUp" id="saleUp" onclick="saleUp('${allVO.state}','${allVO.idx}','${allVO.mid }')">up</button> <br/>
								<button name="saleChan" id="saleChan" onclick="location.href='saleChange.sa?idx=${allVO.idx}'">수정</button><br/>
								<button name="saleDelete" id="saleDelete" onclick="deleteSale('${allVO.idx}','${fSNames[0]}')">삭제</button>
							</td>
						</tr>
					</tbody>
				</c:forEach>
				<tr><td colspan="7" class="m-0 p-0"></td></tr>
			</table>
		   <div style="clear:both;"></div>
        </div>
	</div>
	<!-- 페이징 처리(1블로의 크기를 3개(3Page)로 한다. 한페이지는 기본은 10개 -->
	<div class="text-center">
		<ul class="pagination justify-content-center">
		<c:if test="${pageSu > 1}"><li class="page-item"><a class="page-link text-secondary " href="myStoreManagement.sa?pageSu=1&pageSize=${pageSize}&mid=${sMid}">첫페이지</a></li></c:if>
		<c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="myStoreManagement.sa?pageSu=${(curBlock-1)*blockSize+1}&pageSize=${pageSize}&mid=${sMid}">이전블록</a></li></c:if>
		<c:if test="${pageSu > 1}"><li class="page-item"><a class="page-link text-secondary" href="myStoreManagement.sa?pageSu=${pageSu-1}&pageSize=${pageSize}&mid=${sMid}">◀</a></li></c:if>
		<c:forEach var="i" begin="${(curBlock * blockSize)+1}" end="${(curBlock * blockSize)+blockSize}" varStatus="st">
			<c:if test="${i <= totPage && pageSu == i}"><li class="page-item active"><a class="page-link bg-secondary border-secondary" href="myStoreManagement.sa?pageSu=${i}&pageSize=${pageSize}&mid=${sMid}">${i}</a></c:if>
			<c:if test="${i <= totPage && pageSu != i}"><li class="page-item"><a class="page-link text-secondary" href="myStoreManagement.sa?pageSu=${i}&pageSize=${pageSize}&mid=${sMid}">${i}</a></c:if>
		</c:forEach>
		<c:if test="${pageSu < totPage }"><li class="page-item"><a class="page-link text-secondary" href="myStoreManagement.sa?pageSu=${pageSu+1}&pageSize=${pageSize}&mid=${sMid}">▶</a></li></c:if>
		<c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="myStoreManagement.sa?pageSu=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}&mid=${sMid}">다음블록</a></li></c:if>
		<c:if test="${pageSu < totPage}"><li class="page-item"><a class="page-link text-secondary" href="myStoreManagement.sa?pageSu=${totPage}&pageSize=${pageSize}&mid=${sMid}">마지막페이지</a></li></c:if>
		</ul>
	</div>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>