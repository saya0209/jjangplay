<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글보기</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- Custom CSS -->
<style>
  .container {
    margin-top: 20px;
  }
  .row {
    margin-bottom: 10px;
  }
  .row div {
    padding: 10px;
  }
  .header {
    background-color: #f8f9fa;
    font-weight: bold;
  }
  .content {
    background-color: #e9ecef;
  }
</style>

<!-- Custom JS -->
<script type="text/javascript">
$(function(){
	  console.log("jQuery loading......");

	  // 삭제 버튼 클릭 시 확인 창 띄우고, 확인 후 폼 제출
	  $("#deleteBtn").click(function(){
	    console.log("deleteBtn event......");
	    if(confirm("정말로 이 공지사항을 삭제하시겠습니까?")) {
	        $("#deleteForm").submit();  // 폼을 제출
	    }
	  });

	  // 삭제 취소 버튼 (현재 코드에서는 사용되지 않음)
	  $("#deleteCancelBtn").click(function(){
	    console.log("deleteCancelBtn event......");
	    $("#pw").val("");  // 이 코드에 대해서는 아래 설명 참조
	    $("#deleteModal").modal("hide");
	  });
	});
</script>

</head>
<body>

<div class="container">
  <h1 class="mb-4"><i class="fa fa-file-text-o"></i> 공지사항 글보기</h1>

  <!-- 공지사항 내용 -->
  <div class="row">
    <div class="col-sm-4 header">번호</div>
    <div class="col-sm-8 content">${vo.no}</div>
  </div>
  <div class="row">
    <div class="col-sm-4 header">제목</div>
    <div class="col-sm-8 content">${vo.title}</div>
  </div>
  <div class="row">
    <div class="col-sm-4 header">내용</div>
    <div class="col-sm-8 content">${vo.content}</div>
  </div>
  <div class="row">
    <div class="col-sm-4 header">게시일</div>
    <div class="col-sm-8 content">${vo.startDate}</div>
  </div>
  <div class="row">
    <div class="col-sm-4 header">종료일</div>
    <div class="col-sm-8 content">${vo.endDate}</div>
  </div>
  <div class="row">
    <div class="col-sm-4 header">작성일</div>
    <div class="col-sm-8 content">${vo.writeDate}</div>
  </div>
  <div class="row">
    <div class="col-sm-4 header">수정일</div>
    <div class="col-sm-8 content">${vo.updateDate}</div>
  </div>

  <!-- 버튼 -->
  <div class="row mt-4">
    <div class="col-sm-12">
      <a href="updateForm.do?no=${param.no }" class="btn btn-primary">수정</a>
      <button class="btn btn-danger" id="deleteBtn">삭제</button>
      <a href="list.do" class="btn btn-success">리스트</a>
    </div>
  </div>
</div>

  <!-- 삭제 폼 -->
  <form action="delete.do" method="post" id="deleteForm" style="display: none;">
    <input type="hidden" name="no" value="${param.no}">
  </form>

</body>
</html>

