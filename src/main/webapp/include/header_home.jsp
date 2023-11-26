<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!-- 폰트어썸 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/fa3667321f.js" crossorigin="anonymous"></script>
<style>
	header{
		position : sticky;
		top:0;
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
    a{
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
    }
    #headerMain ul li {
    	list-style: none;
    }
    #userUL {
    	/* display: none; */
    	position: absolute;
        top: 60px; 
        right: 12%;
    	width: 90px; 
    } 
    #headerMain ul li a{
    	width: 90px; 
    	text-align:center;
        font-size: 1.2em; 
    }
</style>
<script>
    'use strict';
    function logout(){
		let ans = confirm("로그아웃 하시겠습니까?");
		if(ans) location.href="logout.mem?mid=${sMid}";
    }
</script>
<header>
<div id="headerMain">
    <div id="headerN">
        <div id="logo1" >
            <a href="http://localhost:9090/JavaProjectJ4/"><div id="logo2"><i class="fa-solid fa-box"></i> 중고모아</div></a>
        </div>
        <div id="searchDivN">
            <input type="text" name="searchN" id="searchN" placeholder="상품 검색" />
            <a href="" style="padding: 10px;"><i class="fa-solid fa-magnifying-glass" ></i></a>
        </div>
        <!-- 로그인 안했을 시 -->
        <c:if test="${sMid == null }"><div id="login"><a href="login.mem">로그인/회원가입</a></div></c:if>
        <!-- 로그인 했을 시 -->
        <c:if test="${sMid != null }">
        	<a href="#"><div id="user">${sNickName}님<i class="fa-solid fa-chevron-down"></i></div></a>
        	<a href="#"><div id="bell"><i class="fa-regular fa-bell" title="알림"></i></div></a>
        	<a href="#"><div id="store"><i class="fa-solid fa-cart-shopping" id="store" title="내상점"></i></div></a>
        	<ul id="userUL">
				<li><a href="">계정설정</a></li>	        	
				<li><a href="javascript:logout()">로그아웃</a></li>	        	
        	</ul>
        </c:if>
    </div>
</div>
</header>
