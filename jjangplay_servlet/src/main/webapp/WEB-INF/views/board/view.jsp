<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!-- 2.라이브러리 확인 -->
<script type="text/javascript">
// jquery: $(ducument).ready(function(){~~~});
// 페이지가 로딩완료 후 세팅이 진행된다.
$(function(){
	console.log("jquery loading......");
	
	$("#deleteBtn").click(function(){
		console.log("deleteBtn event......");
		// 비밀번호 입력창 clear
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
글번호 : ${param.no }, 조회수 증가 : ${param.inc }<br>
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
   
  
  <!-- The Modal -->
  <div class="modal fade" id="deleteModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">비밀번호 확인</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
			<!-- 삭제시 비밀번호 입력을 위한 form태그 사용 -->
			<form action="delete.do" method="post" id="deleteForm">
				<!-- type="hidden"은 form태그에 보이지는 않지만
				값을 같이 넘겨야 할때 사용합니다.
				값을 넘길때 가장중요한 프로퍼티는 name 이다. -->
				<input type="hidden" name="no" value="${param.no }">
				<!-- required : 반드시 작성되어야 한다는 의미 -->
				<!-- pattern ^로 시작해서 $로 끝난다. -->
				<!-- .은 \n 빼로 전부 다 사용가능 -->
				<!-- pw는 3자에서 20자 이내로 써야한다. -->
				<!-- title의 내용은 툴팁으로 모여준다. -->
				<input name="pw" required maxlength="20"
					pattern="^.{3,20}$"
					title="3~20자 입력 가능"
					placeHolder="본인 확인용 비밀번호">
				<button  class="btn btn-danger">삭제</button>
				<button type="button" class="btn btn-success"
					id="deleteCancelBtn">취소</button>
			</form>
        </div>
      </div>
    </div>
  </div>
   <!-- 댓글처리시작 -->
   <jsp:include page="reply.jsp"></jsp:include>
   <!-- 댓글처리끝 -->
</div> <!-- end of class="container" -->
</body>
</html>