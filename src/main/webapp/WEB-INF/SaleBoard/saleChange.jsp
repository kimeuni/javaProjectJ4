<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/memberCheck.jsp"/>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>중고 상품 등록 수정</title>
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
    </style>
    <script>
    	'use strict'
    	
    	
    	
    	function saleChangeOk(){
			let fName = $("#fName").val();
			let title = $("#title").val();
			let categorys = $("#categorys").val();
			let money =$("#money").val();
			let content = $("#content").val();
			let photo = $("#photo").val();
			let fileSize = 0;
			
			let regMoney = /^[0-9]*$/;
			
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
			else if(!regMoney.test(money)){
				alert("상품 금액은 숫자로만 입력 가능합니다.")
				$("#money").focus();
				return false
			}
			else if(content.trim() == ""){
				alert("상품 설명을 작성해주세요.")
				$("#content").focus();
				return false
			}
			else {
				if(fName.trim() != "") {
			    	let ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase();
			    	let maxSize = 1024 * 1024 * 5;
			    	fileSize = document.getElementById("fName").files[0].size;
			  		// 업로드 가능한 확장명 파일
			  		if(ext != 'jpg' && ext != 'gif'&& ext != 'png'){
						alert("업로드 가능한 파일은 'jpg/gif/png'만 가능합니다.")
						return false;
					}
					// 파일 용량 체크
					else if(fileSize > maxSize) {
						alert("업로드할 파일의 최대용량은 5MByte입니다.");
						return false;
					}
		  		}
				saleForm.fileSize.value = fileSize;
				saleForm.submit();
			}
    	}	
    	
    	
    	// 선택한 이미지 화면에 출력
        $(function() {
			$("#fName").on("change", function(e) {
				// 그림파일인지 체크
				//alert("e : " +e);
				let files = e.target.files;
				// 파일에 들어온 내용을 배열개념으로 꺼내서 담는다.
				let filesArr = Array.prototype.slice.call(files);
				//console.log("filesArr", filesArr);
				
				filesArr.forEach(function(f){
					//타입확인 이미지 타입인가?
					if(!f.type.match("image.*")) {
						alert("업로드할 파일은 이미지 파일만 가능합니다.")
					}
				});
				
				//멀티파일 이미지 미리보기
				document.getElementById("demo2").innerHTML = "";
				
				let i = e.target.files.length;
				let imgSource = "";
				let k = 0;
				for(let image of files) {
					let img = document.createElement("img");
					let reader = new FileReader();
					reader.onload = function(e) {
						img.setAttribute("src", e.target.result);
						img.setAttribute("width", 90); //기본이 픽셀단위임
					}
					reader.readAsDataURL(e.target.files[--i]);
					console.log("img2",e.target.files[k].name);
					document.querySelector(".demo").append(img);
					imgSource += e.target.files[k].name + "/";
					k++;
				}
				saleForm.imgSource.value = imgSource;
			});
		});
    </script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
	<div id="saleUpdateMain">
		<div class="leftDiv" style="width: 220px;">
			<h2>기본정보 수정</h2>
		</div>
		<div class="rightDiv" style="height: 98px; line-height: 70px "> 
			<span id="pilsu">*은 필수항목</span>
		</div>
		<form name="saleForm" method="post" action="saleChangeOk.sa" enctype="multipart/form-data">
			<hr id="hrStyle"/>
			<div class="leftDiv" style="height: 150px;" >
				<label>상품이미지 <span id="pilsu">*</span></label>
			</div>
			<div class="rightDiv insert" style="height: 150px;">
				<input type="file" name="fName" id="fName" class="mb-3"/>
				<div class="demo" id="demo2"><img src="${ctp}/images/sale/${vo.fSName}" width="90px"/></div>
				<!-- <img id="demo2" class="demo" width="80px" class="mt-3"/> -->
			</div>
			<hr style="clear: both"/>
			<div class="leftDiv" >
				<label>상품명 <span id="pilsu">*</span></label>
			</div>
			<div class="rightDiv" >
				<input type="text" name="title" id="title" value="${vo.title}" maxlength="20" placeholder="상품명을 입력해주세요."/>
			</div>
			<hr style="clear: both"/>
			<div class="leftDiv" >
				<label>카테고리 <span id="pilsu">*</span></label>
			</div>
			<div class="rightDiv" >
				<select name="categorys" id="categorys">
					<option value="" ${vo.category=='' ? 'selected' : '' }>카테고리 선택</option>
					<option value="여성의류" ${vo.category=='여성의류' ? 'selected' : '' }>여성의류</option>
					<option value="남성의류" ${vo.category=='남성의류' ? 'selected' : '' }>남성의류</option>
					<option value="신발" ${vo.category=='신발' ? 'selected' : '' }>신발</option>
					<option value="가방/지갑" ${vo.category=='가방/지갑' ? 'selected' : '' }>가방/지갑</option>
					<option value="시계" ${vo.category=='시계' ? 'selected' : '' }>시계</option>
					<option value="쥬얼리" ${vo.category=='쥬얼리' ? 'selected' : '' }>쥬얼리</option>
					<option value="패션 액세서리" ${vo.category=='패션 액세서리' ? 'selected' : '' }>패션 액세서리</option>
					<option value="디지털" ${vo.category=='디지털' ? 'selected' : '' }>디지털</option>
					<option value="가전제품" ${vo.category=='가전제품' ? 'selected' : '' }>가전제품</option>
					<option value="스포츠/레저" ${vo.category=='스포츠/레저' ? 'selected' : '' }>스포츠/레저</option>
					<option value="차량/오토바이" ${vo.category=='차량/오토바이' ? 'selected' : '' }>차량/오토바이</option>
					<option value="스타굿즈" ${vo.category=='스타굿즈' ? 'selected' : '' }>스타굿즈</option>
					<option value="키덜트" ${vo.category=='키덜트' ? 'selected' : '' }>키덜트</option>
					<option value="예술/희귀/수집품" ${vo.category=='예술/희귀/수집품' ? 'selected' : '' }>예술/희귀/수집품</option>
					<option value="음반/악기" ${vo.category=='음반/악기' ? 'selected' : '' }>음반/악기</option>
					<option value="도서/티켓/문구" ${vo.category=='도서/티켓/문구' ? 'selected' : '' }>도서/티켓/문구</option>
					<option value="뷰티/미용" ${vo.category=='뷰티/미용' ? 'selected' : '' }>뷰티/미용</option>
					<option value="가구/인테리어" ${vo.category=='가구/인테리어' ? 'selected' : '' }>가구/인테리어</option>
					<option value="생활/주방용품" ${vo.category=='생활/주방용품' ? 'selected' : '' }>생활/주방용품</option>
					<option value="공구/산업용품" ${vo.category=='공구/산업용품' ? 'selected' : '' }>공구/산업용품</option>
					<option value="식품" ${vo.category=='식품' ? 'selected' : '' }>식품</option>
					<option value="반려동물용품" ${vo.category=='반려동물용품' ? 'selected' : '' }>반려동물용품</option>
					<option value="기타" ${vo.category=='기타' ? 'selected' : '' }>기타</option>
				</select>
			</div>
			<hr style="clear: both"/>
			<div class="leftDiv" >
				<label>금액 <span id="pilsu">*</span></label>
			</div>
			<div class="rightDiv" >
				<input type="text" name="money" value="${vo.money}" maxlength="7" id="money" placeholder="금액을 입력해주세요.(최대 9,999,999원)"/>
			</div>
			<hr style="clear: both"/>
			<div class="leftDiv" >
				<label>설명 <span id="pilsu">*</span></label>
			</div>
			<div class="rightDiv" >
				<textarea rows="6" class="form-control" name="content" id="content" style="resize :none; width: 600px; margin-bottom: 10px" placeholder="상세설명을 입력해주세요.">${vo.content}</textarea>
			</div>
			<hr id="hrStyle"/>
			<div style="text-align: right; margin-bottom: 10px">
				<span style="padding-right: 20px; "><a href="#" class="btn btn-secondary">취소하기</a></span>
				<span style="padding-right: 20px; "><a href="javascript:saleChangeOk()" class="btn btn-primary">수정하기</a></span>
			</div>
			<input type="hidden" name="fileSize"/>
			<input type="hidden" name="imgSource"/>
			<!-- 이미지 수정 안했을 시 기존에 있던 값을 넘기기 위해 hidden으로 넘김. -->
			<input type="hidden" name="photo" value="${vo.fSName}"/>
			<input type="hidden" name="fSizeed" value="${vo.fSize}"/>
			<!-- 화면으로 돌아가기 위해서 게시물의 idx값을 넘김 -->
			<input type="hidden" name="idx" value="${vo.idx}"/>
		</form>
	</div>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>