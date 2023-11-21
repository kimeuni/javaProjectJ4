<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<style>
	nav{
		position : sticky; 
		top:80px;
		background-color:#fff;
	}
    #navMain{
        margin: 0 auto;
        padding: 0px 200px;
        width: 100%;
        width: 1100px;
        height: 70px;
        position: relative;
    }
    a:hover{
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
    #myStore{
        position: absolute;
        line-height: 80px;
        right: 12%;
    }
    #store{
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
</style>
<script>
	'use strict';
	
</script>
<nav>
	<div id="navMain">
	    <div id="nav">
	        <i class="fa-solid fa-bars" id="category"></i>
	    </div>
	    <div id="myStore">
	        <a href="" style="padding: 0px 20px;" title="내 상점"><i class="fa-solid fa-cart-shopping" id="store"> 상점</i></a>
	    </div>
	    <div id="myChat">
	        <a href="" style="padding: 0px 20px;" title="채팅"><i class="fa-solid fa-comment" id="chat"> 채팅</i></a>
	    </div>
	</div>
</nav>