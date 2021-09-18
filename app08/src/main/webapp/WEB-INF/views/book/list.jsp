<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<div>
  <h4>도서 조회/수정</h4>
</div>

<table class="table" id="book" border="1">
		<thead>
            <tr>
                <th>도서번호</th>
                <th>도서명</th>
                <th>표지</th>
                <th>출판일자</th>
                <th>금액</th>
                <th>출판사</th>
                <th>도서소개</th>
            </tr>
            
        </thead>
        <tbody>
		<c:forEach var="books" items="${list }">
			<tr>
				<td>${books.bookNo }</td>
				<td>${books.bookName }</td>
				<td><img src="../resources/images/${books.bookCoverimg }" width="100" height="100"></td>
				<td><fmt:formatDate value="${books.bookDate }" pattern="yyyy-MM-dd" /></td>
			    <td><fmt:formatNumber value="${books.bookPrice }" pattern="#,###"/></td>
			    <td>${books.bookPublisher }</td>
			    <td>${books.bookInfo }</td>
			</tr>
		</c:forEach>
		</tbody>
</table>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>