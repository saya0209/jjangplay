<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!-- 데이터는 DispatcherServlet에 담겨있다(request) -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>

<!-- 4. 우리가 만든 라이브러리 등록 -->
<script type="text/javascript" src="boardInputUtil.js"></script>

<script type="text/javascript">
$(function(){
	//  2. 라이브러리 등록확인 
	console.log("jquery loading......");
	
	// 이벤트 처리
	$("#perPageNum").change(function(){
		$("#searchForm").submit();
	});
	
	// 검색데이터 세팅
	$("#key").val("${(empty pageObject.key)?'t':pageObject.key}");
	$("#perPageNum")
		.val("${(empty pageObject.perPageNum)?'10':pageObject.perPageNum}");
	
});
</script>

</head>
<body>

<div class="container p-3 my-3">
	<h1><i class="fa fa-align-justify"></i> 회원 리스트</h1>
	<form action="list.do" id="searchForm">
		<div class="row">
			<div class="col-md-8">
	  			<div class="input-group mt-3 mb-3">
					<div class="input-group-prepend">
						<select class="form-control" id="key" name="key">
							<option value="t">제목</option>
					        <option value="c">내용</option>
					        <option value="w">작성자</option>
					        <option value="tc">제목/내용</option>
					        <option value="tw">제목/작성자</option>
					        <option value="cw">내용/작성자</option>
					        <option value="tcw">모두</option>
						</select>
					</div>
		      		<input type="text" class="form-control" placeholder="검색어입력"
	      				id="word" name="word" value="${pageObject.word }">
					<div class="input-group-prepend">
						<button type="submit" class="btn btn-primary">
							<i class="fa fa-search"></i></button>
					</div>
			    </div>
			</div> <!-- end of class="col-md-8" -->
			<div class="col-md-4">
				<div class="input-group mt-3 mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text">Rows/Page</span>
				  </div>
				  <select id="perPageNum" name="perPageNum"
				   class="form-control">
				   		<option>5</option>
				   		<option>10</option>
				   		<option>15</option>
				   		<option>20</option>
				  </select>
				</div>
			</div> <!-- end of class="col-md-4" -->
		</div><!-- end of class="row" -->
	</form>



  <table class="table table-hover">
	<!-- 데이터의 제목 줄 표시 -->
	<tr>
		<!-- th : table head - 테이블의 제목줄에 사용 -->
		<!-- 리스트 : 사진, 아이디, 이름, 생년월일, 연락처, 등급, 상태 -->
		<th>사진</th>
		<th>아이디</th>
		<th>이름</th>
		<th>생년월일</th>
		<th>연락처</th>
		<th>등급</th>
		<th>상태</th>
	</tr>
	<!-- 실제 데이터 : 데이터가 있는 만큼 <tr></tr> -->
	<c:forEach items="${list }" var="vo">
		<tr class="dataRow">
			<td>
				<c:if test="${!empty vo.photo}">
					<img src="${vo.photo}"
					 style="width:30px;height:30px">
				</c:if>
				<c:if test="${empty vo.photo}">
					<i class="fa fa-user-circle-o"
					 style="font-size:30px"></i>
				</c:if>
			</td>
			<td>${vo.id}</td>
			<td>${vo.name}</td>
			<td>${vo.birth}</td>
			<td>${vo.tel}</td>
			<td> <!-- 회원등급 시작 -->
				<form action="changeGrade.do">
					<input name="id" value="${vo.id }" type="hidden">
					<div class="input-group mb-3">
					  <select class="form-control" name="gradeNo" data-data="${vo.gradeNo }">
					    <option value="1" ${(vo.gradeNo==1)?"selected":"" }>일반회원</option>
					    <option value="9" ${(vo.gradeNo==9)?"selected":"" }>관리자</option>
					  </select>
					  <div class="input-group-append">
					  	<button class="btn btn-success" disabled>변경</button>
					  </div>
					</div>
				</form>
			</td> <!-- 회원등급 끝 -->
			<td> <!-- 회원상태 시작 -->
				<form action="changeStatus.do">
					<input name="id" value="${vo.id }" type="hidden">
					<div class="input-group mb-3">
					  <select class="form-control" name="status" data-data="${vo.status }">
					    <option ${(vo.status == "정상")?"selected":"" }>정상</option>
					    <option ${(vo.status == "탈퇴")?"selected":"" }>탈퇴</option>
					    <option ${(vo.status == "휴면")?"selected":"" }>휴면</option>
					    <option ${(vo.status == "강퇴")?"selected":"" }>강퇴</option>
					  </select>
					  <div class="input-group-append">
					  	<button class="btn btn-success" disabled>변경</button>
					  </div>
					</div>
				</form>
			</td> <!-- 회원상태 끝 -->
		</tr>
	</c:forEach>
  </table>
  <div>
  	<pageNav:pageNav listURI="list.do" pageObject="${pageObject}"></pageNav:pageNav>
  </div>
</div>


</body>
</html>