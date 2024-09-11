<%@page import="com.jjangplay.board.vo.BoardVO"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>이미지 게시판 리스트</title>
     <style>
        /* 이미지 간격 설정 */
        .card {
            margin-bottom: 20px; /* 카드 간의 아래 간격 설정 */
        }
        .imageDiv{
        	background: black;
            text-align: center; /* 이미지 가운데 정렬 */
        }
        .imageDiv img {
            display: inline-block; /* 이미지를 가운데 정렬되도록 설정 */
            max-width: 100%; /* 이미지가 카드 너비를 넘지 않도록 설정 */
            height: auto; /* 이미지 비율 유지 */
        }
        .title {
            text-align: left; /* 제목 텍스트는 왼쪽 정렬 */
        }
    </style>
    <script type="text/javascript">
    $(function(){
        // jQuery 로드 확인
        console.log("jQuery loaded...");

        // 가장 높은 제목 높이에 맞추기
        let titleHeights = [];
        
        $(".title").each(function(idx, title){
            titleHeights.push($(title).height());
        });
        
        let maxTitleHeight = Math.max.apply(null, titleHeights);
        console.log("maxTitleHeight = " + maxTitleHeight);
        
        $(".title").height(maxTitleHeight);

        // 첫 번째 이미지로 가로세로 비율 구하기 (5:4)
        let imgWidth = $(".imageDiv:first").width();
        let height = imgWidth / 5 * 4;
        $(".imageDiv").height(height);

        $(".imageDiv>img").each(function(idx, image){
            let originalWidth = $(image).get(0).naturalWidth;
            let originalHeight = $(image).get(0).naturalHeight;
            let aspectRatio = originalWidth / originalHeight;

            let adjustedHeight = imgWidth / aspectRatio;
            if (adjustedHeight > height) {
                $(image).height(height);
                $(image).width(height * aspectRatio);
            } else {
                $(image).height(adjustedHeight);
                $(image).width(imgWidth);
            }
        });

        // 이벤트 처리
        $(".dataRow").click(function(){
        	let no = $(this).find(".no").text();
        	console.log("no = "+no);
        	location="view.do?no="+no+"&${pageObject.pageQuery}";
        });
        
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
    <h1><i class="fa fa-align-justify"></i> 이미지 게시판 리스트</h1>
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
            </div>
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
            </div>
        </div>
    </form>
    <c:if test="${empty list }">
    	<h4>데이터가 존재하지 않습니다.</h4>
    </c:if>
    <c:if test="${!empty list }">
  		<div class="row">
	  		<c:forEach items="${list }" var="vo" varStatus="vs">
		  		<c:if test="${(vs.index !=0) && (vs.index%3==0) }">
		  			${"</div>"}
		  			${"<div class='row'>"}
		  		</c:if>
		  		<div class="col-md 4 dataRow">
			       <div class="card" style="width:100%">
			       	<div class="imageDiv">
					  <img class="card-img-top" src="${vo.fileName }" alt="Card image">
				  	</div>
					  <div class="card-body title">
					    <h4 class="card-title">
					    	<span class="float-right">${vo.writeDate }</span>
					    	${vo.name }(${vo.id })
					    </h4>
					    <p class="card-text">
					    	<span class="no">${vo.no }</span>.${vo.title }
					    </p>
					  </div>
					</div>
			      </div>
	  		</c:forEach>
		</div>    	
    </c:if>
      
	<a href="writeForm.do"><button class="btn btn-primary">등록</button></a>
    
    <div>
    	<pageNav:pageNav listURI="list.do" pageObject="${ pageObject}"></pageNav:pageNav>
    </div>
</div>
</body>
</html>
