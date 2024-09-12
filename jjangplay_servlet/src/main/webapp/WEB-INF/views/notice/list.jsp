<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!-- 데이터는 DispatcherServlet에 담겨있다(request) -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 리스트</title>

<!-- 4. 우리가 만든 라이브러리 등록 -->
<script type="text/javascript" src="boardInputUtil.js"></script>

<script type="text/javascript">
$(function(){
	//  2. 라이브러리 등록확인 
	console.log("jquery loading......");
	// 리스트 페이지러 들어올때 공지기간 선택옵션을 체크하는 명령
	// 태그선택을 id로 세팅
	$("#${pageObject.period}").prop('checked',true);
	
	// 이벤트 처리
	$("#perPageNum").change(function(){
		$("#searchForm").submit();
	});
	
	// 검색데이터 세팅
	$("#key").val("${(empty pageObject.key)?'t':pageObject.key}");
	$("#perPageNum")
		.val("${(empty pageObject.perPageNum)?'10':pageObject.perPageNum}");
	
	$(".periodOption").change(function(){
		if(this.period[0].checked){
			location = "/notice/list.do?period=pre";
		}else if(this.period[1].checked){
			location = "/notice/list.do?period=old";
		}else if(this.period[2].checked){
			location = "/notice/list.do?period=res";
		}else if(this.period[3].checked){
			location = "/notice/list.do?period=all";
		}
	});
});
</script>

</head>
<body>

<div class="container p-3 my-3">
	<h1><i class="fa fa-align-justify"></i> 공지사항 리스트</h1>
	<c:if test="${!empty login && login.gradeNo == 9 }">
		<form class="periodOption">
		  <div class="custom-control custom-radio custom-control-inline">
		    <input type="radio" class="custom-control-input" id="pre" name="period" value="pre">
		    <label class="custom-control-label" for="pre">현재공지</label>
		  </div>
		  <div class="custom-control custom-radio custom-control-inline">
		    <input type="radio" class="custom-control-input" id="old" name="period" value="old">
		    <label class="custom-control-label" for="old">지난공지</label>
		  </div>
		  <div class="custom-control custom-radio custom-control-inline">
		    <input type="radio" class="custom-control-input" id="res" name="period" value="res">
		    <label class="custom-control-label" for="res">예정된공지</label>
		  </div>
		  <div class="custom-control custom-radio custom-control-inline">
		    <input type="radio" class="custom-control-input" id="all" name="period" value="all">
		    <label class="custom-control-label" for="all">모든공지</label>
		  </div>
		</form>
	</c:if>
	
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
		<!-- 리스트 : 번호, 제목, 게시일, 종료일 -->
		<th>번호</th>
		<th>제목</th>
		<th>게시일</th>
		<th>종료일</th>
	</tr>
	<!-- 실제 데이터 : 데이터가 있는 만큼 <tr></tr> -->
	<c:forEach items="${list }" var="vo">
		<tr onclick="location='view.do?no=${vo.no}&inc=1'" class="dataRow">
			<td>${vo.no}</td>
			<td>${vo.title}</td>
			<td>${vo.startDate}</td>
			<td>${vo.endDate}</td>
		</tr>
	</c:forEach>
	<tr>
		<td colspan="5">
			<a href="writeForm.do"><button class="btn btn-primary">등록</button></a>
		</td>
	</tr>
  </table>
  <div>
  	<pageNav:pageNav listURI="list.do" pageObject="${pageObject}"></pageNav:pageNav>
  </div>
</div>


</body>
</html>