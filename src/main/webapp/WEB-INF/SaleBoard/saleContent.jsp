<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	pageContext.setAttribute("newLine", "\n");
%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${vo.title}</title>
    <jsp:include page="/include/bs4.jsp"/>
    <style>
    	#saleContentMain{
    		margin: 0 auto;
	        width: 1100px;
	        padding: 10px 30px;
    	}
    	#leftDiv{
    		width: 350px;
    		margin: 0px 10px 10px 10px;
    		float: left;
    	}
    	#rightDiv{
    		float: left;
			width: 670px;
    	}
    	button {
    		margin: 30px 20px;
    	}
    	#likes{
    		border: 1px solid gray;
    		background-color: lightgray;
    		height: 50px;
    		width: 150px;
    		color : #fff;
    		font-weight: bolder;
    		font-size: 1.3em;
    	}
    	#chatting{
    		border: 1px solid gray;
    		background-color: #F9BC28;
    		height: 50px;
    		width: 150px;
    		color : #fff;
    		font-weight: bolder;
    		font-size: 1.3em;
    	}
    	#report{
    		border: 1px solid gray;
    		background-color: red;
    		height: 50px;
    		width: 150px;
    		color : #fff;
    		font-weight: bolder;
    		font-size: 1.3em;
    	}
    	#contentLeft{
    		width: 770px;
    		margin: 0px 10px 10px 10px;
    		float: left;
    		border-right: 1px solid lightgray;
    	}
    	#contentRight{
    		float: left;
			width: 250px;
    	}
    	
    	/* 신고창 */
		#complaint{
			position: fixed;
			top:25%;
			/* 가운데 정렬 */
			left: 50%;
    		transform: translate(-50%, 0);
			width: 450px;
			border: 1px solid gray;
			border-radius: 25px;
			background-color:#fff;
		}
		
		#cpstyle{
			text-align:center;
			padding: 30px;
		}
		.item-box{
		     position: relative;
		  }
	    .sold-out{
		    position: absolute;
		    left: 0px;
		    top: 0px;
		    width: 100%;
		    height: 100%;
		    display: table;
		    background: rgba(0, 0, 0, 0.5);
		    color: #fff;
		 }
		
		 .sold-out > p{
		    display: table-cell;
		    text-align: center;
		    vertical-align: middle;
		 }
		 
		 #myStoreHome{
		 	border: 1px solid gray;
    		background-color: #F9BC28;
    		height: 50px;
    		width: 400px;
    		color : #fff;
    		font-weight: bolder;
    		font-size: 1.3em;
		 }
    </style>
    <script>
    	'use strict'
    	
    	// 현제 게시글 삭제
    	function deleteSale(idx,fSName){
    		let ans = confirm("등록한 상품을 삭제하시겠습니까?");
    		if(ans) location.href="deleteSale.sa?idx="+idx+"&fSName="+fSName;
    	}
    	
    	// 찜하기
    	function likesCheck(likeMid,idx){
    		if(likeMid.trim() == ""){
    			alert("로그인 후 이용 가능합니다.")
    			location.href="login.mem";
    			return false;
    		}
    		
			let query={
				likeMid : likeMid,
				idx : idx
			}    		
			$.ajax({
				url : "likeCheck.sa",
				type : "post",
				data : query,
				success : function(res){
					if(res == "0") alert("찜 실패");
					else location.reload();
				},
				error : function(){
					alert("전송오류(saleContent.jsp)")
				}
			});
    	}
    	
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
    	
    	//게시판 들어왔을 때 신고창 숨기기 및 신고기타사유 적는 곳 숨기기
		$(function() {
			$("#complaint").hide();
			$("#cpWhyOther").hide();
		});
		
		// 신고버튼 눌렀을 시, 신고창 뜨게 하기
		function cpCheck(){
			// 로그인 안하면 신고 불가능
			let sMid = $("#sMid").val();
			
			if(sMid.trim() == ""){
				alert("로그인 후 이용 가능합니다.");
				location.href="login.mem";
				return false;
			}
			else {
				$("#complaint").show();
			}
		}
		
		// "기타"를 선택했을 시, 화면 보이기 혹은 가리기
		function cpWhyCheck(){
			let cpWhy = $("#cpWhy").val();
			if(cpWhy == '기타'){
				$("#cpWhyOther").show();
			}
			else {
				$("#cpWhyOther").hide();
			}
		};
		
		// 신고창에서 취소 버튼
		function cCheck(){
			$("#complaint").hide();
			$("#cpWhyOther").hide();
		}
		
		// 신고창 신고하기 버튼
		function cpCheckOk() {
			let cpWhy = $("#cpWhy").val();
			let otherWhy =$("#otherWhy").val();
			
			if(cpWhy.trim() == "" ){
				alert("신고 사유를 선택해주세요.")
				return false;
			}
			else if(cpWhy == "기타" && otherWhy.trim() == ""){
				alert("신고 사유를 선택해주세요.")
				$("#otherWhy").focus();
				return false;
			}
			else {
				let cpWhy = $("#cpWhy").val();
				let otherWhy = $("#otherWhy").val();
				
				let query = {
					part : "saleBoard",
					partIdx : ${vo.idx},
					cpMid : "${sMid}",
					title : "${vo.title}",
					cpContent : cpWhy,
					cpContOther : otherWhy,
					fSName : '${vo.fSName}'
				}
				$.ajax({
					url : "report.sa",
					type : "post",
					data : query,
					success : function(res){
						if(res == "1") {
							alert("신고가 완료되었습니다.")
							location.reload();
						}
						else alert("신고에 실패하였습니다.")
					},
					error : function(){
						alert("전송 오류");
					}
				});
			}
		}
    	
		//채팅하기
		function chatGroup(saleBoardIdx,saleMid,myMid,state){
			if(myMid.trim() == ""){
				alert("로그인 후 이용 가능합니다.");
				location.href="login.mem";
				return false;
			}
			else if(state != '판매중'){
				alert("판매중이 아닌 상품은 채팅을 할 수 없습니다.");
				return false;
			}
			else {
				location.href='chatGroup.cht?saleBoardIdx='+saleBoardIdx+'&saleMid='+saleMid+'&myMid='+myMid
			}
		}
    </script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
	<div id="saleContentMain">
		<div>카테고리 : ${vo.category}</div>
		<hr style="border-color: black"/>
		<div>
			<div id="leftDiv">
				<c:set var="fSNames" value="${fn:split(vo.fSName,'/')}"/>
		   		<div><img src="${ctp}/images/sale/${fSNames[0]}" title="${fSNames[0]}" width="350px" height="350px"/></div>
			</div>
			<div id="rightDiv">
				<div style="font-size:2em;">
					${vo.title}
				</div>
				<c:if test="${vo.state != '판매중' }"><div style="color: red;font-size: 0.8em">(${vo.state})</div></c:if>
				<div style="margin: 5px 0px"><span style="font-size:2em; font-weight: bolder;">${vo.money}</span><span style="font-size:1.6em">원</span></div>
				<hr/>
				<div style="margin-bottom: 80px;">
					<span style="margin: 0px 10px"><i class="fa-solid fa-heart"></i>&nbsp; ${vo.totLike}</span>
					<span style="margin: 0px 10px"><i class="fa-solid fa-eye"></i>&nbsp; ${vo.viewCnt}</span>
					<span style="margin: 0px 10px"><i class="fa-regular fa-clock"></i>&nbsp; ${fn:substring(vo.uploadDate,0,16)}</span>
				</div>
				<div style="text-align: center; margin:0 auto;">
					<!-- 찜 데이터베이스 만들면 만약 sMid(로그인한 아이디로) 찜 눌렀을시 하트 색 바꾸기 -->
					<!-- 자신이 등록한 글이면 찜,채팅,신고 버튼이 보이지 않음 -->
					<c:if test="${sMid == vo.mid}">
						<button name="myStoreHome" id="myStoreHome" onclick="location.href='myStoreSale.sa?mid=${sMid}'">내 상점 관리</button>
					</c:if>
					<c:if test="${sMid != vo.mid}">
						<!-- 찜 안했을 때 -->
						<c:if test="${sMid != likeVO.likeMid || likeVO.likeMid == null || likeVO.likeYN == null}"><button name="likes" id="likes" onclick="likesCheck('${sMid}','${vo.idx}')"><i class="fa-regular fa-heart"></i>찜하기</button></c:if>
						<!-- 찜 했을 때 -->
						<%-- ${sMid} / ${likeVO.likeMid} / ${likeVO.likeYN} / ${vo.idx} / ${likeVO.saleBoardIdx} --%>
						<c:if test="${sMid == likeVO.likeMid && likeVO.likeYN == 'Y'}"><button name="likes" id="likes" onclick="likesDelete('${sMid}','${vo.idx}')" style="background-color: #E54090"><i class="fa-regular fa-heart" style="color:red"></i>찜취소</button></c:if>
						<button name="chatting" id="chatting" onclick="chatGroup('${vo.idx}','${vo.mid}','${sMid}','${vo.state}')"><i class="fa-regular fa-comments"></i>채팅하기</button>
						<button name="report" id="report" onclick="cpCheck()"><i class="fa-solid fa-triangle-exclamation"></i>신고하기</button>
					</c:if>
				</div>
			</div>
		</div>
		<div style="clear:both; margin-bottom: 20px;"></div>
		<div style="border-top: 1px solid black;"> 
			<div id="contentLeft">
				<h3 style="margin: 20px 10px">상세 내용</h3>
				<hr/>
				<div style="min-height:300px; height:auto; padding: 15px 30px;">
					${fn: replace(vo.content,newLine,"<br/>")}
				</div>
			</div>
			<div id="contentRight">
				<h3 style="margin: 20px 10px">상점 정보</h3>
				<hr/>
				<!-- 게시물 등록한 해당 유저의 상점으로 들어가기 -->
				<a href="myStoreSale.sa?mid=${vo.mid}"><div style="padding: 10px;">
					<div style="float: left; width: 60px;"><img src="${ctp}/images/${mVO.profile}" style="width: 60px; border-radius: 100%; border:1px solid pink;"/></div>
					<div style="float: left; width: 170px; padding: 10px;">
						${mVO.nickName} 님 <br/>
						상품 : ${saleSize} 개
					</div>
				</div></a>
				<div style="clear:both; margin-bottom: 10px;"></div>
				<!-- 게시글 작성한 유저가 등록한 글 4건 미리보기 -->
				<div>${mVO.nickName}님 <br/>최근 등록 상품</div>
				<c:forEach var="userSale" items="${vos}" begin="0" end="3">
					<a href="saleContent.sa?idx=${userSale.idx}"><div style="float: left">
						<div style="border: 1px solid gray;" >
							<div><img src="${ctp}/images/sale/${userSale.fSName}" width="110px" height="110"/></div>
							<div style="text-align: center">${userSale.money}원</div>
						</div>
					</div></a>
				</c:forEach>
				<div style="clear:both;"></div>
			</div>
		</div>
		<div style="clear:both;"></div>
	</div>
	<!-- 게시글 신고창 -->
	<div id="complaint">
		<div style="text-align:center; background-color:#252525; color:#fff; height:50px; line-height:50px;">신고하기</div>
		<div id="cpstyle">
			<div style="text-align: left; margin-bottom: 5px">신고 게시판 : ${vo.title}</div>
			<div style="text-align: left; margin-bottom: 15px">신고자 : ${sMid}</div>
			<div>
				<select name="cpWhy" id="cpWhy" class="form-control" onchange="cpWhyCheck()">
					<option value="">신고 사유</option>
					<option value="광고성 콘텐츠(상점)예요">광고성 콘텐츠(상점)예요</option>
					<option value="상품 정보가 부정확해요">상품 정보가 부정확해요</option>
					<option value="거래금지 품목으로 판단돼요">거래금지 품목으로 판단돼요</option>
					<option value="사기가 의심돼요(외부 채널 유도)">사기가 의심돼요(외부 채널 유도)</option>
					<option value="전문 업자 같아요">전문 업자 같아요</option>
					<option value="기타">기타</option>
				</select>
			</div>
			<div id="cpWhyOther" class="mt-2">
				<hr/>
				<textarea rows="4" id="otherWhy" class="form-control"></textarea>
			</div>
			<div class="text-center mt-3">
				<a href="javascript:cpCheckOk()" class="btn btn-danger">신고하기</a>
				<a href="javascript:cCheck()" class="btn btn-secondary">취소하기</a>
			</div>
		</div>
	</div>
<!-- 세션 아이디 값 있는지 체크하기 위해(신고에서 사용) -->
<input type="hidden" value="${sMid}" name="sMid" id="sMid">
<jsp:include page="/include/footer.jsp"/>
</body>
</html>