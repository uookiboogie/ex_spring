<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


		<c:forEach var="employees" items="${list }">
			<div class="emp">
			  <span>${employees.employeeId }</span>
			  <span>${employees.firstName }${employees.lastName }</span>
			  <span><fmt:formatDate value="${employees.hireDate }" pattern="yyyy-MM-dd" /></span>
			  <span>${employees.jobId }</span>
			
			</div>
		</c:forEach>
		
		<script>
		$(function(){
			$(".emp").on("click",function(){
				 var span = $(this).find("span")
				 $("#managerId").val(span.eq(0).text());
				 $("#name").val(span.eq(1).text());
				 $('#empModal').modal('hide')
				 
			})
		})
		</script>