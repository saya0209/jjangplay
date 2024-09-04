<%@page import="com.jjangplay.board.vo.BoardVO"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>일반 게시판 리스트</title>
    
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
    <h1><i class="fa fa-align-justify"></i> 일반 게시판 리스트</h1>
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
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="vo">
                <tr onclick="location='view.do?no=${vo.no}&inc=1'" class="dataRow">
                    <td>${vo.no}</td>
                    <td>${vo.title}</td>
                    <td>${vo.writer}</td>
                    <td>${vo.writeDate}</td>
                    <td>${vo.hit}</td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="5">
                    <a href="writeForm.do"><button class="btn btn-primary">등록</button></a>
                </td>
            </tr>
        </tbody>
    </table>
    <div>
    	<pageNav:pageNav listURI="list.do" pageObject="${ pageObject}"></pageNav:pageNav>
    </div>
</div>
</body>
</html>
