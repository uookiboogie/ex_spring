<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Bootstrap Admin Theme</title>

    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath }/resources/asset/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="${pageContext.request.contextPath }/resources/asset/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath }/resources/asset/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath }/resources/asset/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- jQuery -->
    <script src="${pageContext.request.contextPath }/resources/asset/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/asset/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/asset/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/asset/dist/js/sb-admin-2.js"></script>

<style type="text/css">
  p {word-wrap: break-word;}
</style>
</head>

<body>

    <div id="wrapper">
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Employees</h1>
	</div>
	<!-- /.col-lg-12 -->

	<table class="table" id="board">
		<thead>
            <tr>
                <th>employee_id</th>
                <th>first_name</th>
                <th>last_name</th>
                <th>hire_date</th>
                <th>job_id</th>
            </tr>
        </thead>
		<tbody>
		<c:forEach var="employees" items="${list }">
			<tr>
				<td>${employees.employeeId }</td>
				<td><a class="move" href="${employees.employeeId }">${employees.firstName }</a></td>
				<td>${employees.lastName }</td>
				<td><fmt:formatDate value="${employees.hireDate }"
						pattern="yyyy-MM-dd" /></td>
			    <td>${employees.jobId }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<form id ="actionForm" action="list" method="get">
	  <select name = "type">
	    <option value="" <c:out value="${pageMaker.cri.type==null ? 'selected':''}"/>>선택</option>
	    <option value="T" ${pageMaker.cri.type=='T' ? 'selected' : "" } >employeeId</option>
	    <option value="C" <c:out value="${pageMaker.cri.type=='C' ? 'selected':''}"/>>lastName</option>
	    <option value="W" <c:out value="${pageMaker.cri.type=='W' ? 'selected':''}"/>>jobId</option>
	    <option value="TC" <c:out value="${pageMaker.cri.type=='TC' ? 'selected':''}"/>>employeeId 또는 lastName</option>
	    <option value="TW" <c:out value="${pageMaker.cri.type=='TW' ? 'selected':''}"/>>employeeId 또는 jobId</option>
	    <option value="TCW" <c:out value="${pageMaker.cri.type=='TCW' ? 'selected':''}"/>>employeeId 또는 lastName 또는 jobId</option>
	  </select>
	  <input name="keyword" value="${pageMaker.cri.keyword}">
	  <button type="button" class="btn btn-default" onclick="keyword1(event)">검색</button>
	  <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
	  <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	</form>
	<button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath }/employees/register'">사원등록</button>
	
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

            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->


<script>
  $(function(){

      var actionForm = $("#actionForm")
      
      $(".move").on("click", function(e){
        e.preventDefault();
        var employeeId= $(this).attr("href")
        actionForm.append('<input type="hidden" name="employeeId" value="'+employeeId+'">')
        actionForm.attr("action","updateEmp")
        actionForm.submit();
      })
      
      $(".pull-right a").on("click", function(e){
    	  e.preventDefault(); //a,submit 기본기능 막기
    	  var p = $(this).attr("href")
    	  $('[name="pageNum"]').val(p)
    	  actionForm.submit();
      });
      
      //input 엔터키 이벤트 막기
      $('input[name="keyword"]').keydown(function() {
    	  if (event.keyCode === 13) {
    	    event.preventDefault();
    	  };
    	});
            
  })
      function keyword1(e){
       // e.preventDefault();
       $('input[name="pageNum"]').val('1');
       actionForm.submit();
      }
  
</script>

</body>

</html>

