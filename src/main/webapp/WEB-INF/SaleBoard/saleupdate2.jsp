<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/memberCheck.jsp"/>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>중고 상품 등록</title>
    <jsp:include page="/include/bs4.jsp"/>
    <style>
    	#saleUpdateMain{
    		margin: 0 auto;
	        width: 1100px;
	        padding: 10px 30px;
    	}
    	h2{
    		margin: 20px 2px;
    	}
    	#hrStyle{
    		clear : both;
    		border:1.2px solid #000;
    	}
    	#pilsu{
    		color:red;
    	}
    	.leftDiv{
    		width: 150px;
    		float: left;
    		text-align: left;
    		padding: 10px;
    		margin-bottom: 5px; 
    	}
    	.rightDiv{
    		width: 800px;
    		float: left;
    		text-align: left;
    		padding: 10px;
    		margin-bottom: 5px; 
    	}
    	input[type="text"], #categorys{
    		width: 600px;
    		height: 35px;
    		border-radius: 5px;
    		border: 1px solid gray;
    	}
    	#fName{
    		width: 800px;
    		height: 35px;
    		border-radius: 5px;
    	}
    	#fName:hover{
    		cursor: pointer;
    	}
    	
    	
    	
		.file-list {
		    height: 100px;
		    overflow: auto;
		    border: 1px solid #989898;
		    padding: 10px;
		    width: 600px;
		    margin-left: 160px;
		}
		.insert .file-list .filebox p {
		    font-size: 14px;
		    margin-top: 10px;
		    display: inline-block;
		}
		.insert .file-list .filebox .delete i{
		    color: #ff5353;
		    margin-left: 5px;
		}
		.name {
			width: 255px;
		}
    </style>
    <script>
    	'use strict'
    	
    	var fileNo = 0;
		var filesArr = new Array();
		
		/* 첨부파일 추가 */
		function addFile(obj){
		    var maxFileCnt = 10;   // 첨부파일 최대 개수
		    var attFileCnt = document.querySelectorAll('.filebox').length;    // 기존 추가된 첨부파일 개수
		    var remainFileCnt = maxFileCnt - attFileCnt;    // 추가로 첨부가능한 개수
		    var curFileCnt = obj.files.length;  // 현재 선택된 첨부파일 개수
		
		    // 첨부파일 개수 확인
		    if (curFileCnt > remainFileCnt) {
		        alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
		    }
		
		    for (var i = 0; i < Math.min(curFileCnt, remainFileCnt); i++) {
		
		        const file = obj.files[i];
		
		        if(obj.files && obj.files[0]){
	        		let reader = new FileReader();
	    			reader.onload = function(obj){
	    				document.getElementById("demo").src = obj.target.result;
	    			}
	    			reader.readAsDataURL(obj.files[0]);
	    		}
	    		else {
	    			document.getElementById("demo").src = "";
	    		}
		        
		        // 첨부파일 검증
		        if (validation(file)) {
		            // 파일 배열에 담기
		            var reader = new FileReader();
		            reader.onload = function () {
		                filesArr.push(file);
		            };
		            reader.readAsDataURL(file)
		
		            // 목록 추가
		            let htmlData = '';
		            htmlData += '<div id="file' + fileNo + '" class="filebox">';
		            htmlData += '   <p class="name" style="float:left;">' + file.name + '</p>';
		            htmlData += '   <a class="delete" style="float:left;" onclick="deleteFile(' + fileNo + ');"><i class="far fa-minus-square"></i></a>';
		            htmlData += '	<div style="clear:both;"></div>';
		            htmlData += '</div>';
		            $('.file-list').append(htmlData);
		            fileNo++;
		        } else {
		            continue;
		        }
		    }
		    // 초기화
		    document.querySelector("input[type=file]").value = "";
		}
		
		/* 첨부파일 검증 */
		function validation(obj){
		    const fileTypes = ['image/gif', 'image/jpeg', 'image/png', 'image/bmp', 'image/tif'];
		    if (obj.name.length > 100) {
		        alert("파일명이 100자 이상인 파일은 제외되었습니다.");
		        return false;
		    } else if (obj.size > (100 * 1024 * 1024)) {
		        alert("최대 파일 용량인 100MB를 초과한 파일은 제외되었습니다.");
		        return false;
		    } else if (obj.name.lastIndexOf('.') == -1) {
		        alert("확장자가 없는 파일은 제외되었습니다.");
		        return false;
		    } else if (!fileTypes.includes(obj.type)) {
		        alert("첨부가 불가능한 파일은 제외되었습니다.");
		        return false;
		    } else {
		        return true;
		    }
		}
		
		/* 첨부파일 삭제 */
		function deleteFile(num) {
		    document.querySelector("#file" + num).remove();
		    filesArr[num].is_delete = true;
		}
		
		/* 폼 전송 */
		function submitForm() {
		    // 폼데이터 담기
		    
		
		    $.ajax({
		        method: 'POST',
		        url: '/register',
		        dataType: 'json',
		        data: formData,
		        async: true,
		        timeout: 30000,
		        cache: false,
		        headers: {'cache-control': 'no-cache', 'pragma': 'no-cache'},
		        success: function () {
		            alert("파일업로드 성공");
		        },
		        error: function (xhr, desc, err) {
		            alert('에러가 발생 하였습니다.');
		            return;
		        }
		    })
		}
    	
    	
    	function saleUpdateOk(){
			let fName = $("#fName").val();
			let title = $("#title").val();
			let categorys = $("#categorys").val();
			let money =$("#money").val();
			let content = $("#content").val();
			
			if(title.trim() == ""){
				alert("상품명을 작성해주세요.")
				$("#title").focus();
				return false
			}
			else if(categorys.trim() == ""){
				alert("상품 카테고리를 선택해주세요.")
				$("#categorys").focus();
				return false
			}
			else if(money.trim() == ""){
				alert("상품 금액을 작성해주세요.")
				$("#money").focus();
				return false
			}
			else if(content.trim() == ""){
				alert("상품 설명을 작성해주세요.")
				$("#content").focus();
				return false
			}
			else {
				var Form = document.querySelector("Form");
			    var formData = new FormData(Form);
			    for (var i = 0; i < filesArr.length; i++) {
			        // 삭제되지 않은 파일만 폼데이터에 담기
			        if (!filesArr[i].is_delete) {
			            formData.append("attach_file", filesArr[i]);
			        }
			    }
			    for (let key of formData.keys()) {
			 	   console.log(key);
				 }
	
				 /* value 확인하기 */
				 for (let value of formData.values()) {
				       console.log(value);
				 }
			}
    	}	
    	
    </script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
	<div id="saleUpdateMain">
		<div class="leftDiv">
			<h2>기본정보</h2>
		</div>
		<div class="rightDiv" style="height: 98px; line-height: 70px "> 
			<span id="pilsu">*은 필수항목</span>
		</div>
		<form name="saleForm" method="post" action="saleUpdateOk.sa" enctype="multipart/form-data">
			<hr id="hrStyle"/>
			<div class="leftDiv" style="height: 150px;" >
				<label>상품이미지 <span id="pilsu">*</span></label>
			</div>
			<div class="rightDiv insert" style="height: 150px;">
				<input type="file" name="fName" id="fName" onchange="addFile(this);" multiple class="mb-3"/>
				<img id="demo" width="80px" class="mt-3"/>
			</div>
			<hr style="clear: both"/>
			<div class="leftDiv" >
				<label>상품명 <span id="pilsu">*</span></label>
			</div>
			<div class="rightDiv" >
				<input type="text" name="title" id="title"  placeholder="상품명을 입력해주세요."/>
			</div>
			<hr style="clear: both"/>
			<div class="leftDiv" >
				<label>카테고리 <span id="pilsu">*</span></label>
			</div>
			<div class="rightDiv" >
				<select name="categorys" id="categorys">
					<option value="">카테고리 선택</option>
					<option value="여성의류">여성의류</option>
					<option value="남성의류">남성의류</option>
					<option value="신발">신발</option>
					<option value="가방/지갑">가방/지갑</option>
					<option value="시계">시계</option>
					<option value="쥬얼리">쥬얼리</option>
					<option value="패션 액세서리">패션 액세서리</option>
					<option value="디지털">디지털</option>
					<option value="가전제품">가전제품</option>
					<option value="스포츠/레저">스포츠/레저</option>
					<option value="차량/오토바이">차량/오토바이</option>
					<option value="스타굿즈">스타굿즈</option>
					<option value="키덜트">키덜트</option>
					<option value="예술/희귀/수집품">예술/희귀/수집품</option>
					<option value="음반/악기">음반/악기</option>
					<option value="도서/티켓/문구">도서/티켓/문구</option>
					<option value="뷰티/미용">뷰티/미용</option>
					<option value="가구/인테리어">가구/인테리어</option>
					<option value="생활/주방용품">생활/주방용품</option>
					<option value="공구/산업용품">공구/산업용품</option>
					<option value="식품">식품</option>
					<option value="반려동물용품">반려동물용품</option>
					<option value="기타">기타</option>
				</select>
			</div>
			<hr style="clear: both"/>
			<div class="leftDiv" >
				<label>금액 <span id="pilsu">*</span></label>
			</div>
			<div class="rightDiv" >
				<input type="text" name="money" id="money" placeholder="금액을 입력해주세요."/>
			</div>
			<hr style="clear: both"/>
			<div class="leftDiv" >
				<label>설명 <span id="pilsu">*</span></label>
			</div>
			<div class="rightDiv" >
				<textarea rows="6" class="form-control" name="content" id="content" style="resize :none; width: 600px; margin-bottom: 10px" placeholder="상세설명을 입력해주세요."></textarea>
			</div>
			<hr id="hrStyle"/>
			<div class="file-list"></div>
			<div style="text-align: right; margin-bottom: 10px">
				<span style="padding-right: 20px; "><a href="#" class="btn btn-secondary">취소하기</a></span>
				<span style="padding-right: 20px; "><a href="javascript:saleUpdateOk()" class="btn btn-primary">등록하기</a></span>
			</div>
		</form>
	</div>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>