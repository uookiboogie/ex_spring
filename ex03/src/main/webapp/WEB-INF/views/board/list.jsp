<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

    <!-- DataTables CSS -->
    <link href="${pageContext.request.contextPath }/resources/asset/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">
    <!-- DataTables Responsive CSS -->
    <link href="${pageContext.request.contextPath }/resources/asset/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">
    <!-- DataTables JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/asset/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/asset/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/asset/vendor/datatables-responsive/dataTables.responsive.js"></script>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">게시판</h1>
	</div>
	<!-- /.col-lg-12 -->

	<table class="table" id="board">
		<thead>
            <tr>
                <th>글번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일자</th>
            </tr>
        </thead>
		<tbody>
		<c:forEach var="board" items="${list }">
			<tr>
				<td>${board.bno }</td>
				<td><a class="move" href="${board.bno }">${board.title }</a></td>
				<td>${board.writer }</td>
				<td><fmt:formatDate value="${board.regdate }"
						pattern="yyyy-MM-dd" /></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<form id ="actionForm" action="list" method="get">
	  <select name = "type">
	    <option value="" <c:out value="${pageMaker.cri.type==null ? 'selected':''}"/>>선택</option>
	    <option value="T" ${pageMaker.cri.type=='T' ? selected : "" } >제목</option>
	    <option value="C" <c:out value="${pageMaker.cri.type=='C' ? 'selected':''}"/>>내용</option>
	    <option value="W" <c:out value="${pageMaker.cri.type=='W' ? 'selected':''}"/>>작성자</option>
	    <option value="TC" <c:out value="${pageMaker.cri.type=='TC' ? 'selected':''}"/>>제목 또는 내용</option>
	    <option value="TW" <c:out value="${pageMaker.cri.type=='TW' ? 'selected':''}"/>>제목 또는 작성자</option>
	    <option value="TCW" <c:out value="${pageMaker.cri.type=='TCW' ? 'selected':''}"/>>제목 또는 내용 또는 작성자</option>
	  </select>
	  <input name="keyword" value="${pageMaker.cri.keyword}">
	  <button class="btn btn-default">검색</button>
	  <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
	  <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	</form>
	<button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath }/board/register'">글등록</button>
	
	<div class ="pull-right">
	  <ul class ="pagination">
	    <c:if test = "${pageMaker.prev }" >
	      <li class="paginate_button previous"><a href="${pageMaker.startPage-1}">이전</a></li>
	    </c:if>
	    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num" >
	      <li class="paginate_button"><a href="${num}">${num }</a></li>
	    </c:forEach>
	    <c:if test = "${pageMaker.next }" >
	      <li class="paginate_button previous"><a href="${pageMaker.endPage+1}">다음</a></li>
	    </c:if>
	  </ul>
	</div>
</div>
<!-- /.row -->

<script>
  $(function(){
      //$('#board').DataTable();

      var actionForm = $("#actionForm")
      
      $(".move").on("click", function(e){
        e.preventDefault();
        var bno= $(this).attr("href")
        actionForm.append('<input type="hidden" name="bno" value="'+bno+'">')
        actionForm.attr("action","get")
        actionForm.submit();
      })
      
      $(".pull-right a").on("click", function(e){
    	  e.preventDefault(); //a,submit 기본기능 막기
    	  var p = $(this).attr("href")
    	  $('[name="pageNum"]').val(p)
    	  actionForm.submit();
      });
      
  })
</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>



