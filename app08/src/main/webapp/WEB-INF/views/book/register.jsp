<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<script>
$(function(){
	  function validation(){
		  if(frm.bookName.value =="" ){
			  alert("도서명이 입력되지 않았습니다")
			  frm.bookName.focus();
			  return false;
		  }
		  return true;
	  }
	  //등록버튼
	  $("#btnResgister").on("click",function(){
	       if(validation()){
	    	   frm.submit();
	    	   alert("도서등록이 완료 되었습니다.")
	       }
	  })
});
</script>

<div>
  <h4>도서 등록</h4>
</div>
<form id="frm" action="register"  method="post">
	<table class="table" id="book" border="1">
	  <tr>
	   <td>도서번호</td><td><input name="bookNo" value="${No}" readonly></td>
	  </tr>
	  <tr>
	   <td>도서명</td><td><input id="bookName" name="bookName"></td>
	  </tr>
	  <tr>
	   <td>도서표지</td><td><input name="bookCoverimg"></td>
	  </tr>
	  <tr>
	   <td>출판일자</td><td><input name="bookDate"></td>
	  </tr>
	  <tr>
	   <td>금액</td><td><input name="bookPrice"></td>
	  </tr>
	  <tr>
	   <td>출판사</td><td><input name="bookPublisher"></td>
	  </tr>
	  <tr>
	   <td>도서소개</td><td><textarea rows="3" name="bookInfo"></textarea></td>
	  </tr>
	</table>
    <button type="button" id="btnResgister">등록</button>
</form>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>