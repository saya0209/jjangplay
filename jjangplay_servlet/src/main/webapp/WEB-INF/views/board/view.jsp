<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 게시판 글보기</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- FontAwesome CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
  .btn-custom {
    margin-right: 5px;
  }
  .modal-header {
    background-color: #007bff;
    color: white;
  }
</style>

<!-- Custom JS -->
<script type="text/javascript">
$(function(){
  console.log("jQuery loading......");

  $("#deleteBtn").click(function(){
    console.log("deleteBtn event......");
    $("#pw").val("");
    $("#deleteModal").modal("show");
  });

  $("#deleteCancelBtn").click(function(){
    console.log("deleteCancelBtn event......");
    $("#pw").val("");
    $("#deleteModal").modal("hide");
  });
});
</script>

</head>
<body>

<div class="container">
  <h1 class="mb-4"><i class="fas fa-file-alt"></i> 일반 게시판 글보기</h1>

  <!-- 글 상세 정보 -->
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
    <div class="col-sm-4 header">작성자</div>
    <div class="col-sm-8 content">${vo.writer}</div>
  </div>
  <div class="row">
    <div class="col-sm-4 header">작성일</div>
    <div class="col-sm-8 content">${vo.writeDate}</div>
  </div>
  <div class="row">
    <div class="col-sm-4 header">조회수</div>
    <div class="col-sm-8 content">${vo.hit}</div>
  </div>

  <!-- 버튼 -->
  <div class="row mt-4">
    <div class="col-sm-12">
      <a href="updateForm.do?no=${param.no }" class="btn btn-primary btn-custom">수정</a>
      <button class="btn btn-danger btn-custom" id="deleteBtn">삭제</button>
      <a href="list.do" class="btn btn-success btn-custom">리스트</a>
    </div>
  </div>
</div>

<!-- 삭제 확인 모달 -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteModalLabel">비밀번호 확인</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="delete.do" method="post" id="deleteForm">
          <input type="hidden" name="no" value="${param.no }">
          <div class="form-group">
            <label for="pw">본인 확인용 비밀번호</label>
            <input type="password" name="pw" id="pw" class="form-control" required maxlength="20" pattern="^.{3,20}$" title="3~20자 입력 가능" placeholder="비밀번호 입력">
          </div>
          <button type="submit" class="btn btn-danger">삭제</button>
          <button type="button" class="btn btn-secondary" id="deleteCancelBtn">취소</button>
        </form>
      </div>
    </div>
  </div>
</div>

</body>
</html>
