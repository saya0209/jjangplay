<%@page import="com.jjangplay.board.vo.BoardVO"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 리스트</title>
    
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(function(){
            console.log("jQuery loaded...");
            
           $("#perPageNum").change(function(){
        	   $("#searchForm").submit();
           });
            
            // 검색데이터 세팅
           $("#key").val("${(empty pageObject.key)?'t':pageObject.key}");
           $("#perPageNum").val("${(empty pageObject.perPageNum)?'10':pageObject.perPageNum}");
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
                    <input type="text" class="form-control" placeholder="검색어입력" id="word" name="word" value="${pageObject.word }">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
                    </div>
                </div>
            </div> <!--  class col-md-8 -->
            <div class="col-md-4">
            	<div class="input-group mt-3 mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text">Rows/Page</span>
				  </div>
				    <select id="perPageNum" name="perPageNum" class="form-control">
				    	<option>10</option>
				    	<option>15</option>
				    	<option>20</option>
				    	<option>25</option>
				    </select>
				</div>
            </div><!--  class col-md4 -->
        </div> <!--  class row -->
    </form>
    <table class="table table-hover">
        <thead>
            <tr>
                <th>사진</th>
                <th>아이디</th>
                <th>이름</th>
                <th>생년월일</th>
                <th>전화번호</th>
                <th>등급</th>
                <th>상태</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="vo">
                <tr onclick="location='view.do?no=${vo.id}&inc=1'" class="dataRow">
                    <td>
                    	<c:if test="${!empty vo.photo}">
                    		<img src="${vo.photo}" style="width: 30px;height: 30px">
                    	</c:if>
                    	<c:if test="${empty vo.photo}">
							<i class="fa fa-user-circle-o" style="font-size:30px"></i>
                    	</c:if>
                    </td>
                    <td>${vo.id}</td>
                    <td>${vo.name}</td>
                    <td>${vo.birth}</td>
                    <td>${vo.tel}</td>
                    <td>${vo.gradeName}</td>
                    <td>${vo.status}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div>
    	<pageNav:pageNav listURI="list.do" pageObject="${ pageObject}"></pageNav:pageNav>
    </div>
</div>
</body>
</html>
