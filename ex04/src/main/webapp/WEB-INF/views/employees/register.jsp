<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원등록</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<script>
  



$(function(){
	
	  function validation(){
		  if(frm.lastName.value =="" ){
			  alert("이름입력")
			  frm.lastName.focus();
			  return false;
		  }

		  return true;
	  }
	  
	  //등록버튼
	  $("#btnResgister").on("click",function(){
	       if(validation()){
	    	   frm.submit();
	       }
	  })
	
	//매니저검색
	$("#btnEmpSearch").on("click",function(){
		//검색페이지를 ajax -> 모달 바디 넣고 -> 모달
		$.ajax({
			url: "empSearch",
			success : function(data){
				$("#empModal .modal-body").html(data);
				$('#empModal').modal('show')
			}
		})
	});
	
/* 	$("#managerId").on("change",function(){
	//매니저 단건 검색
		$.ajax({
			url:"ajaxEmp",
			data : {employeeId : $("#managerId").val() } ,
			success : function(data){
				if(data){
					$("#name").val(data.firstName);
				}else{
					$("#btnEmpSearch").click();
				}
			    }
		})
	}) */
	
	$("#managerId").on("keydown",function(e){
	//매니저 단건 검색
	    $("#name").val("");
	      if($("#managerId").val()=="")
	    	  return;
		  if(e.keyCode ==13){
			  e.preventDefault();
		  
		      $.ajax({
				url:"ajaxEmp",
				data : {employeeId : $("#managerId").val() } ,
				success : function(data){
					if(data){
						$("#name").val(data.firstName);
					}else{
						$("#btnEmpSearch").click();
					}
				    }
			   })
		
		  }
	})
	
	
});

</script>

<style type="text/css">
  .require {
    color : red;
  }
  .emp:hover {
     color: blue;
  }
  .emp:hover{
    cursor:pointer;
  }

</style>
</head>
<body>
  <div align="center">
    <form id="frm" action=${empty emp ? 'register' : 'updateEmp' }   method="post">
      <c:if test ="${not empty emp}">
        <input name="employeeId" value="${emp.employeeId }">
      </c:if>
      firstName<input name="firstName" value="${emp.firstName }"><br>
      lastName<span class="require">**</span><input id="lastName" name="lastName"><br>
      email<span class="require">**</span><input name="email"><span id="result"/><br>
      phoneNumber<input name="phoneNumber"><br>
      hireDate<span class="require">**</span><input name="hireDate"><br>
      jobId<span class="require">**</span><select name="jobId">
             <option value="">선택</option>
             <c:forEach items="${opt.jobs}" var="job">
               <option value="${job.jobId }">${job.jobTitle }</option>
             </c:forEach>
           </select>
      <br>
      salary<input name="salary"><br>
      commissionPct<input name="commissionPct"><br>
      managerId<input name="managerId" id="managerId"><input id="name">
      <!-- Button trigger modal -->
			<button type="button" class="btn btn-primary" id="btnEmpSearch">
			  검색
			</button><br>
      departmentId<select name="departmentId">
          <option value="">선택</option>
             <c:forEach items="${opt.departments}" var="dept">
               <option value="${dept.departmentId }">${dept.departmentName }</option>
             </c:forEach>
           </select>
      <br>
      
      <br>
      <button type="button" id="btnResgister">등록</button>
      
    </form>
    
<!-- Modal -->
<div class="modal" tabindex="-1" id="empModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Modal body text goes here.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
    
  </div>
</body>
</html>