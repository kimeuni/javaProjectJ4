<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
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
    #logo1N{
        position: absolute;
        top: 0;
        left: 3%;
        width: 150px;
        margin-right: 40px;
    }
    #logo2N {
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
    #loginN{
        position: absolute;
        top: 0;
        right: 3%;
        line-height: 80px;
        font-size: 1em;

    }
</style>
<script>
    'use strict';
    
</script>
<header>
<div id="headerMain">
    <div id="headerN">
        <div id="logo1N" >
            <a href="http://localhost:9090/JavaProjectJ4/"><div id="logo2N"><i class="fa-solid fa-box"></i> 중고모아</div></a>
        </div>
        <div id="searchDivN">
            <input type="text" name="searchN" id="searchN" placeholder="상품 검색" />
            <a href="" style="padding: 10px;"><i class="fa-solid fa-magnifying-glass" ></i></a>
        </div>
        <div id="loginN"><a href="login.mem">로그인/회원가입</a></div>
    </div>
</div>
</header>