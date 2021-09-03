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
				<td><a href="get?bno=${board.bno }">${board.title }</a></td>
				<td>${board.writer }</td>
				<td><fmt:formatDate value="${board.regdate }"
						pattern="yyyy-MM-dd" /></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath }/board/register'">글등록</button>
	
</div>
<!-- /.row -->
<script>
  $(function(){
      $('#board').DataTable();	  
  })

</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>



