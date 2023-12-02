<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!-- 폰트어썸 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/fa3667321f.js" crossorigin="anonymous"></script>
<style>
	#topH{
		position : sticky;
		top:0;
	}
	header{
		background-color:#fff;
	} 
    #headerMain{
        margin: 0 auto;
        padding: 0px 200px;
        width: 100%;
        width: 1100px;
        height: 80px;
        position: relative;
    }
    #logo1{
        position: absolute;
        top: 0;
        left: 3%;
        width: 150px;
        margin-right: 40px;
    }
    #logo2 {
        width: 150px;
        line-height: 80px;
        font-size: 20pt;
    }
    #logo1 a{
        width: 150px;
    }
    a:hover{
        text-decoration: none;
        color: black;
    }
    #searchDivN input[type="text"]{
        border: none;
        width: 350px;
        background-color: rgba(0,0,0,0);
        padding: 5px 0px;
        margin: 0px 5px;
        font-weight: bolder;
        outline: none;
    }
    #searchDivN{
        position: absolute;
        top: 0;
        left: 22%;
        margin: 15px 0px;
        border: 3px solid #1565C0;
        border-radius: 10px;
        width: 408px;
    }
    #searchN{
        height: 40px;
    }
    #login{
        position: absolute;
        top: 0;
        right: 3%;
        line-height: 80px;
        font-size: 1em;

    }
    #bell {
    	position: absolute;
        top: 0;
        right: 7%;
        line-height: 80px;
        font-size: 2em;  
    }
    #store {
    	position: absolute;
        top: 0;
        right: 2%; 
        line-height: 80px;
        font-size: 1.3em; 
        
    }
    #user {
    	position: absolute;
        top: 0;
        right: 12%;
        line-height: 80px;
        font-size: 1.2em; 
        background-color: #fff;
    }
    #contentUserDiv{
    	margin: 0 auto;
        width: 1100px;
        position: relative;
    }
    #contentUser{
        background-color: #fff;
    	width: 90px;
    	position: absolute;
        top: -80px;
        right: 12%;
        text-align:center;
        font-size: 1.2em;
        border: 1px solid;
    }
    #contentStoreDiv{
    	margin: 0 auto;
        width: 1100px;
        position: relative;
    }
    #contentStore{
        background-color: #fff;
    	width: 90px;
    	position: absolute;
        top: -80px;
        right: 2%;
        text-align:center;
        font-size: 1.2em;
        border: 1px solid;
    }
    #contentAlarmDiv{
    	margin: 0 auto;
        width: 1100px;
        position: relative;
    }
    #contentAlarm{
        background-color: #eee;
    	width: 250px;
    	height: 130px;
    	position: absolute;
        top: -80px;
        right: -2%;
        text-align:center; 
        font-size: 1.2em;
        border: 1px solid gray;
        overflow: auto;
    }
    .userA{
    	display: block;
    }
    
    
    
   	nav{
	background-color:#fff;
	box-shadow: 0px 5px 5px lightgray;
	}
    #navMain{
        margin: 0 auto;
        padding: 0px 200px;
        width: 100%;
        width: 1100px;
        height: 70px;
        position: relative;
    }
    #nav a:hover{
        text-decoration: none;
        color: black;
    }
    #nav{
        position: absolute;
        line-height: 80px;
        left: 3%;
    }
    #category{
        font-size: 2em;
    }
    #Mysell{
        position: absolute;
        line-height: 80px;
        right: 12%;
    }
    #sell{
        font-size: 1.5em;
    }
    #category:hover{
        color: #1565C0;
    }
    #myChat{
        position: absolute;
        line-height: 80px;
        right: 1%;
    }
    #chat{
        font-size: 1.5em;   
    }
    
    
    
   
    #categoryDiv{
    	margin: 0 auto;
        width: 1100px;
        position: relative;
    }
    #saleCategory{
    	position: absolute;
    	left: 3%;
    	background-color: #fff;
    	width: 200px;
    	border: 1px solid gray;
    }
    #inCategoryStr{
    	padding: 10px 10px 0px 10px;
    	text-align:left;
    	font-size : 18px;
    }
    .inCategory{
    	padding: 3px 10px;
    	text-align:left;
    	font-size : 16px;
    }
    .inCategory:hover{
		background-color: skyblue;
		color : #fff;
    }
    #chatAlarm{
    	font-size: 12px;
    	background-color: #fff;
    	
    }
    #chatAlarm:hover{
    	background-color: #ffe;
    }
    #contentAlarmDiv hr{
    	margin: 5px;
    	border: 1px solid black;
    }
</style>
<script>
    'use strict';
    function logout(){
		let ans = confirm("로그아웃 하시겠습니까?");
		if(ans) location.href="logout.mem?mid=${sMid}";
    }
    
    // 유저 부분 
    $(function() {
   		$("#contentUser").hide();
   		$("#contentStore").hide();
   		$("#contentAlarm").hide();
    });
    $(function() {
		$("#user").mouseenter(function(){
	   		$("#contentUser").show();
	   		$("#contentStore").hide();
	   		$("#contentAlarm").hide();
		});
		$("#contentUser").mouseleave (function(){
	   		$("#contentUser").hide();
	   		$("#contentStore").hide();
	   		$("#contentAlarm").hide();
		});
    });
    
    // 상점 부분
    $(function() {
		$("#store").mouseenter(function(){
	   		$("#contentUser").hide();
	   		$("#contentStore").show();
	   		$("#contentAlarm").hide();
		});
		$("#contentStore").mouseleave (function(){
	   		$("#contentUser").hide();
	   		$("#contentStore").hide();
	   		$("#contentAlarm").hide();
		});
    });
    // 알림 부분
    $(function() {
		$("#bell").mouseenter(function(){
	   		$("#contentUser").hide();
	   		$("#contentStore").hide();
	   		$("#contentAlarm").show();
		});
		$("#contentAlarm").mouseleave (function(){
	   		$("#contentUser").hide();
	   		$("#contentStore").hide();
	   		$("#contentAlarm").hide();
		});
    });

    //검색
    function mainSearch(){
    	let search = $("#searchN").val();
    	
    	if(search.trim() == ""){
    		alert("검색할 상품명을 입력해주세요.")
    		$("#searchN").focus();
    		return false;
    	}
    	else {
    		location.href="mainSearch.ad?search="+search;
    	}
    }
    $(function() {
    	$("#searchN").on("keydown", function(e) {
    		if(e.keyCode == 13){
    			mainSearch();
    		}
    	});
    });
    
    
    //카테고리
    $(function() {
    	$("#categoryDiv").hide();
    });
    $(function() {
		$("#nav").mouseenter(function(){
	   		$("#categoryDiv").show();
		});
		$("#categoryDiv").mouseleave (function(){
	   		$("#categoryDiv").hide();
		});
    });
</script>
<div id="topH">
	<header style="z-index: 0">
	<div id="headerMain">
	    <div id="headerN">
	        <div id="logo1" >
	            <a href="http://localhost:9090/JavaProjectJ4/"><div id="logo2"><i class="fa-solid fa-box"></i> 중고모아</div></a>
	        </div>
	        <div id="searchDivN">
	            <input type="text" name="searchN" id="searchN" value="${search}" placeholder="상품 검색" />
	            <a href="javascript:mainSearch()" style="padding: 10px;"><i class="fa-solid fa-magnifying-glass" ></i></a>
	        </div>
	        <!-- 로그인 안했을 시 -->
	        <c:if test="${sMid == null }"><div id="login"><a href="login.mem">로그인/회원가입</a></div></c:if>
	        <!-- 로그인 했을 시 -->
	        <c:if test="${sMid != null }">
			<div id="user">${sNickName}님<i class="fa-solid fa-chevron-down"></i></div> 
			<a href="#"><div id="bell"><i class="fa-regular fa-bell" title="알림"></i></div></a>
			<a href="myStoreSale.sa?mid=${sMid}"><div id="store"><i class="fa-solid fa-cart-shopping" id="store" title="내상점"></i></div></a>
	        </c:if>
	    </div>
	</div>
	</header>
	<nav style="z-index: 1">
		<div id="navMain">
		    <div id="nav">
		        <i class="fa-solid fa-bars" id="category"></i>
		    </div>
		    <div id="Mysell">
		        <a href="saleupdate.sa" style="padding: 0px 20px ;" title="판매"><i class="fa-solid fa-sack-dollar" id="sell"> 판매</i></a>
		    </div>
		    <div id="myChat">
		        <a href="chatGroup.cht?saleBoardIdx=0&saleMid=&myMid=${sMid}" style="padding: 0px 20px;" title="채팅"><i class="fa-solid fa-comment" id="chat"> 채팅</i></a>
		    </div>
		</div>
	</nav>
	<!-- user 메뉴 -->
	<div id="contentUserDiv">
		<div id="contentUser">
			<a href="myPage.mem" class="userA">계정설정</a>   
			<c:if test="${sMid == 'admin'}"><a href="adminHome.ad" class="userA">관리메뉴</a></c:if>     	
			<a href="javascript:logout()" class="userA">로그아웃</a>   
	    </div>	
    </div>
	<!-- 알림 메뉴 -->
	<div id="contentAlarmDiv">
		<div id="contentAlarm">
			<c:if test="${newLikeSize == 0 && ChatSize ==0 }">
				<div style="text-align: center; vertical-align: middle; height: 100%">
					<i class="fa-regular fa-bell" title="알림"></i>최근 알림이 없습니다.
				</div>
			</c:if>
			<c:if test="${ChatSize != 0 }">
				<div style="text-align: center;">채팅 알람</div>
				<hr/>
				<c:forEach var="cVO" items="${cgVOS}">
					<a href="chatGroup.cht?saleBoardIdx=0&saleMid=&myMid=${sMid}">
					<div id="chatAlarm">
						<c:if test="${cVO.saleMid !=sMid }">${cVO.saleMid}님께서 보낸 채팅 ${cVO.totAlarm }건</c:if>
						<c:if test="${cVO.myMid !=sMid }">${cVO.myMid}님께서 보낸 채팅 ${cVO.totAlarm }건</c:if>
					</div>
					</a>
				</c:forEach>
			</c:if>
			<c:if test="${newLikeSize != 0 }">
				<div style="text-align: center;">찜 알람</div>
				<hr/>
				<c:forEach var="nlVO" items="${newLike}">
					<a href="saleAlarmNo.sa?idx=${nlVO.idx }">
					<div id="chatAlarm">
						<c:if test="${nlVO.newLike !=0 }">
							<span style="color: red">${nlVO.title}</span>에 새로운 찜 ${nlVO.newLike}개
						</c:if>
					</div>
					</a>
				</c:forEach>
			</c:if>
	    </div>	
    </div>
	<!-- 상점 -->
	<div id="contentStoreDiv">
		<div id="contentStore">
			<a href="myStoreSale.sa?mid=${sMid}" class="userA">내 상점</a>   
			<a href="myStoreLike.sa?mid=${sMid}" class="userA">찜목록</a> 	
			<a href="myStoreManagement.sa?mid=${sMid}" class="userA">상점관리</a>   
	    </div>	
    </div>
    <!-- 카테고리 메뉴 -->
	<div id="categoryDiv">
		<div id="saleCategory">
			<div id="inCategoryStr">카테고리</div>
			<hr/>
			<a href="mainCategoryOk.ad?category=여성의류"><div class="inCategory">여성의류</div></a>
			<a href="mainCategoryOk.ad?category=남성의류"><div class="inCategory">남성의류</div></a>
			<a href="mainCategoryOk.ad?category=신발"><div class="inCategory">신발</div></a>
			<a href="mainCategoryOk.ad?category=가방/지갑"><div class="inCategory">가방/지갑</div></a>
			<a href="mainCategoryOk.ad?category=시계"><div class="inCategory">시계</div></a>
			<a href="mainCategoryOk.ad?category=쥬얼리"><div class="inCategory">쥬얼리</div></a>
			<a href="mainCategoryOk.ad?category=패션 액세서리"><div class="inCategory">패션 액세서리</div></a>
			<a href="mainCategoryOk.ad?category=디지털"><div class="inCategory">디지털</div></a>
			<a href="mainCategoryOk.ad?category=가전제품"><div class="inCategory">가전제품</div></a>
			<a href="mainCategoryOk.ad?category=스포츠/레저"><div class="inCategory">스포츠/레저</div></a>
			<a href="mainCategoryOk.ad?category=차량/오토바이"><div class="inCategory">차량/오토바이</div></a>
			<a href="mainCategoryOk.ad?category=스타굿즈"><div class="inCategory">스타굿즈</div></a>
			<a href="mainCategoryOk.ad?category=키덜트"><div class="inCategory">키덜트</div></a>
			<a href="mainCategoryOk.ad?category=예술/희귀/수집품"><div class="inCategory">예술/희귀/수집품</div></a>
			<a href="mainCategoryOk.ad?category=음반/악기"><div class="inCategory">음반/악기</div></a>
			<a href="mainCategoryOk.ad?category=도서/티켓/문구"><div class="inCategory">도서/티켓/문구</div></a>
			<a href="mainCategoryOk.ad?category=뷰티/미용"><div class="inCategory">뷰티/미용</div></a>
			<a href="mainCategoryOk.ad?category=가구/인테리어"><div class="inCategory">가구/인테리어</div></a>
			<a href="mainCategoryOk.ad?category=생활/주방용품"><div class="inCategory">생활/주방용품</div></a>
			<a href="mainCategoryOk.ad?category=공구/산업용품"><div class="inCategory">공구/산업용품</div></a>
			<a href="mainCategoryOk.ad?category=식품"><div class="inCategory">식품</div></a>
			<a href="mainCategoryOk.ad?category=반려동물용품"><div class="inCategory">반려동물용품</div></a>
			<a href="mainCategoryOk.ad?category=기타"><div class="inCategory">기타</div></a>
		</div>
	</div>
</div>