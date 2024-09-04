<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글 등록 폼</title>
<!-- datepicker -->
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.14.0/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://code.jquery.com/ui/1.14.0/jquery-ui.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- FontAwesome CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- jQuery UI CSS & JS (for datepicker) -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- Custom CSS -->
<style>
  .container {
    margin-top: 20px;
  }
  .form-group {
    margin-bottom: 15px;
  }
  .btn-custom {
    margin-right: 10px;
  }
</style>

<!-- Custom JS -->
<script type="text/javascript" src="boardInputUtil.js"></script>
<script type="text/javascript">
$(function() {
  console.log("jQuery loading......");

  let now = new Date();
  let startYear = now.getFullYear();
  let yearRange = (startYear - 10) + ":" + (startYear + 10);
  
  $(".datepicker").datepicker({
    // 입력란의 데이터 포멧
    dateFormat: "yy-mm-dd",
    // 월 선택 입력 추가
    changeMonth: true,
    // 년 선택 입력 추가
    changeYear: true,
    // 월 선택 입력
    monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
    // 달력의 요일 표시
    dayNamesMin: ["일","월","화","수","목","금","토"],
    // 선택할 수 있는 년도의 범위
    yearRange: yearRange,
  });

  $("#writeForm").submit(function() {
    console.log("writeForm submit event......");

    if (isEmpty("#title", "제목", 1)) return false;
    if (isEmpty("#content", "내용", 1)) return false;

    if (lengthCheck("#title", "제목", 3, 100, 1)) return false;
    if (lengthCheck("#content", "내용", 3, 600, 1)) return false;
  });

  $("#cancelBtn").click(function(){
    console.log("cancelBtn event........");
    history.back();
  });
});
</script>

</head>
<body>

<div class="container">
  <h2><i class="fas fa-edit"></i> 공지사항 등록 폼</h2>
  <form action="write.do" method="post" id="writeForm">
    <div class="form-group">
      <label for="title">제목</label>
      <input type="text" class="form-control" id="title"
       pattern="^[^ ].{2,99}$" title="맨 앞에 공백 문자 불가: 3~100자 입력" placeholder="제목 입력 (3자 이상 100자 이내)" name="title">
    </div>
    <div class="form-group">
      <label for="content">내용</label>
      <textarea class="form-control" rows="7" id="content"
      	name="content" placeholder="내용 입력"></textarea>
    </div>
    <div class="form-group">
      <label for="startDate">시작일</label>
      <input type="text" class="form-control datepicker" id="startDate"
       pattern="\d{4}-\d{2}-\d{2}" title="YYYY-MM-DD 형식" placeholder="YYYY-MM-DD" name="startDate">
    </div>
    <div class="form-group">
      <label for="endDate">종료일</label>
      <input type="text" class="form-control datepicker" id="endDate"
       pattern="\d{4}-\d{2}-\d{2}" title="YYYY-MM-DD 형식" placeholder="YYYY-MM-DD" name="endDate">
    </div>
    <button type="submit" class="btn btn-primary btn-custom">등록</button>
    <button type="reset" class="btn btn-secondary btn-custom">새로 입력</button>
    <button type="button" class="btn btn-success btn-custom" id="cancelBtn">취소</button>
  </form>
</div>

</body>
</html>
