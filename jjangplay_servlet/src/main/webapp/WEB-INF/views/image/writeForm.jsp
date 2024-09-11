<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 게시판 글 등록 폼</title>
<!-- 4. 우리가 만든 라이브러리 등록 -->
<script type="text/javascript" src="boardInputUtil.js"></script>

</head>
<body>
<!-- 3. 내용작성 -->
<div class="container">
  <h2><i class="fa fa-edit"></i> 이미지 게시판 글 등록 폼</h2>
  <form action="write.do" method="post" enctype="multipart/form-data">
  <input type="hidden" name="perPageNum" value="${param.perPageNum }">
    <div class="form-group">
      <label for="title">제목</label>
      <input type="text" class="form-control" id="title"
       pattern="^[^ .].{2,99}$" required="required" title="맨 앞에 공백문자 불가: 3~100자 입력" placeholder="제목 입력: 3자 이상 100자 이내" name="title">
    </div>
    <div class="form-group">
      <label for="content">내용</label>
      <textarea class="form-control" rows="7" id="content"
      	name="content" placeholder="내용 입력"></textarea>
    </div>
    <div class="form-group">
      <label for="imageFile">첨부이미지</label>
      <input type="file" class="form-control" id="imageFile"
       required="required" title="첨부할 이미지를 선택하세요" placeholder="이미지 파일 선택" name="imageFile" >
    </div>
   
    <button type="submit" class="btn btn-primary">등록</button>
    <button type="reset" class="btn btn-secondary">새로입력</button>
    <button type="button" class="btn btn-success" onclick="history.back()" id="cancelBtn">취소</button>
  </form>
</div>
</body>
</html>
