<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>계정설정</title>
    <jsp:include page="/include/bs4.jsp"/>
    <style>
    	body{
    		padding: 0px;
    		margin: 0px;
    	}
    	#myPageBack{
            /* padding: 0px 200px;
            width: 1100px;*/
            height: 963px; 
            background-color: #eee; 
            
        }
        #myPage{
            margin: 0 auto;
        	width: 500px;
        	height: 963px; 
            background-color: #fff; 
            border-radius: 10px;
            padding: 30px 0px; 
        }
        #TopStr{
        	height: 30px;  
        }
        i {
        	float : left;
        	text-align:left;
        	width: 50px;
        	font-size : 1.5em;
        	padding: 20px 0px 0px 20px; 
        }
        #TopStr h2{
        	float : left;
        	text-align:center;
        	width: 400px;
        } 
        hr{
        	clear : both;
	        border: 1px solid gray;
	        width: 500px;
	        margin: 0 auto;
        }
        .divStyle{
        	text-align: left;
			padding: 20px;
			font-size: 1.1em;
			
        }
        .divStyle:hover{
        	background-color: #ffe;
        }
        a:hover{
        text-decoration: none;
        color: black;
    	}
    </style>
</head>
<body>
	<div id="myPageBack">
		<div id="myPage">
			<div id="TopStr">
				<a href="main.ad"><i class="fa-solid fa-arrow-left" ></i></a>
				<h2>계정설정</h2> 
			</div>
			<hr/>
			<a href="pwdChange.mem"><div class="divStyle">비밀번호 변경</div></a>
			<hr/>
			<a href="infoChange.mem"><div class="divStyle">개인정보 변경</div></a>
			<hr/>
			<a href=""><div class="divStyle">탈퇴</div></a>
			<hr/>
		</div>
	</div>
</body>
</html>