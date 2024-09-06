<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 보기</title>

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
</head>
<body>

<div class="container">
  <h1 class="mb-4"><i class="fa fa-user-circle"></i> 회원 정보 보기</h1>

  <!-- 회원 정보 -->
  <div class="row">
    <div class="col-sm-4 header">아이디</div>
    <div class="col-sm-8 content">${member.id}</div>
  </div>
  <div class="row">
    <div class="col-sm-4 header">이름</div>
    <div class="col-sm-8 content">${member.name}</div>
  </div>
  <div class="row">
    <div class="col-sm-4 header">이메일</div>
    <div class="col-sm-8 content">${member.email}</div>
  </div>
  <div class="row">
    <div class="col-sm-4 header">성별</div>
    <div class="col-sm-8 content">${member.gender}</div>
  </div>
  <div class="row">
    <div class="col-sm-4 header">생일</div>
    <div class="col-sm-8 content">${member.birthDate}</div>
  </div>
  <div class="row">
    <div class="col-sm-4 header">연락처</div>
    <div class="col-sm-8 content">${member.phone}</div>
  </div>
  <div class="row">
    <div class="col-sm-4 header">가입일</div>
    <div class="col-sm-8 content">${member.joinDate}</div>
  </div>
  <div class="row">
    <div class="col-sm-4 header">최근 접속일</div>
    <div class="col-sm-8 content">${member.lastLoginDate}</div>
  </div>
  <div class="row">
    <div class="col-sm-4 header">등급</div>
    <div class="col-sm-8 content">${member.gradeName}</div>
  </div>
  
  <!-- 관리자일 경우 회원 선택 옵션 표시 -->
  <c:if test="${member.gradeNo == 9}">
    <div class="row">
      <div class="col-sm-4 header">관리자 선택</div>
      <div class="col-sm-8 content">
        <form action="view.do" method="get">
          <input type="text" name="id" class="form-control" placeholder="회원 아이디 입력">
          <button type="submit" class="btn btn-primary mt-2">조회</button>
        </form>
      </div>
    </div>
  </c:if>

  <!-- 버튼 -->
  <div class="row mt-4">
    <div class="col-sm-12">
      <a href="updateForm.do?id=${member.id}" class="btn btn-primary">수정</a>
      <a href="list.do" class="btn btn-success">리스트</a>
    </div>
  </div>
</div>

</body>
</html>
