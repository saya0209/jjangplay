<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 보기</title>

<!-- 2.라이브러리 확인 -->
<script type="text/javascript">
// jquery: $(ducument).ready(function(){~~~});
// 페이지가 로딩완료 후 세팅이 진행된다.
$(function(){
	console.log("jquery loading......");
	
	$('[data-toggle="tooltip"]').tooltip();   
	
	$("#deleteBtn").click(function(){
	    console.log("deleteBtn event......");
	    if (!confirm("정말 삭제 하시겠습니까?")) return false;
	});

	
});
</script>


</head>
<body>
<div class="container">
  <h1><i class="fa fa-file-text-o"></i> 상품 상세 보기</h1>
  <div class="card">
	  <div class="card-header">
	  	<b>상품명 : ${vo.name }</b><br>
	  	<b>상품번호 : ${vo.gno }</b> 
	  </div>
	  <div class="card-body">
	  	<div class="card">
			  <img class="card-img-top" src="${vo.imageName }" alt="image">
			  <div class="card-img-overlay">
			  	<!-- Button to Open the Modal -->
				<button type="button" class="btn btn-primary"
				 data-toggle="modal" data-target="#imageChangeModal">
				  이미지변경
				</button>
			  </div>
			  <div class="card-body">
			    <p class="card-text">
			    	<pre>${vo.content }</pre>
			    	</p>
			    <p>모델No: ${vo.modelNo }</p>
			    <p>제조사: ${vo.company }</p>
			    <p>제조일: ${vo.productDate }</p>
			    <p>작성일: ${vo.writeDate }</p>
			    <p>배송비: ${vo.delivery_cost }</p>

			  </div>
			</div>
		</div>
	</div>
	<!-- a tag : 데이터를 클릭하면 href 정보를 가져와서 페이지 이동 -->
		<a href="updateForm.do?no=${param.no}&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.ket}&word=${param.word}" 
		class="btn btn-primary" title="이미지를 제외한 정보만 수정합니다." id="updateBtn" data-toggle="tooltip">수정</a>
		<a href="delete.do?no=${param.no}&deleteFileName=${vo.imageName}&perPageNum=${param.perPageNum}" class="btn btn-danger" id="deleteBtn">삭제</a>
	<a href="list.do?no=${param.no}&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}" class="btn btn-info">목록</a>

	<!-- The Modal -->
	<div class="modal" id="imageChangeModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">바꿀이미지 선택하기</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	      
	      <form action="imageChange.do" method="post" enctype="multipart/form-data">
	      	<!-- 숨겨서 넘겨야 할 데이터 : 이미지번호, 현재화일이름(삭제를 위해서) -->
	      	<input name="gno" value="${vo.gno }" type="hidden">
	      	<input name="deleteFileName" value="${vo.imageName }" type="hidden">
					<!-- 페이지 정보도 넘겨줍니다. -->
					<input name="page" value="${param.page }" type="hidden">
					<input name="perPageNum" value="${param.perPageNum }" type="hidden">
					<input name="key" value="${param.key }" type="hidden">
					<input name="word" value="${param.word }" type="hidden">
		      <!-- Modal body -->
		      <div class="modal-body">
		        <div class="form-group">
				      <label for="imagename">첨부이미지</label>
				      <input type="file" class="form-control"
				       id="imagename" required
				      	name="imagename">
				    </div>
		      </div>
				</form>
</div> <!-- end of class="container" -->
		
		      <!-- Modal footer -->
		      <div class="modal-footer">
		      	<button class="btn btn-primary">바꾸기</button>
		        <button type="button" class="btn btn-danger"
		         data-dismiss="modal">취소</button>
		      </div>
	    </div>
	  </div>
	</div>

   
</body>
</html>