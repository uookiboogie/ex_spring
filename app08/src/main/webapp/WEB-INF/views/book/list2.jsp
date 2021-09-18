<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<div>
  <h4>도서별 대여매출현황</h4>
</div>

<table class="table" border="1">
		<thead>
            <tr>
                <th>도서번호</th>
                <th>도서명</th>
                <th>대여총계</th>
                <th>대여횟수</th>
            </tr>
            
        </thead>
        <tbody>
		<c:forEach var="books" items="${list }">
			<tr>
				<td align="center">${books.bookNo }</td>
				<td>${books.bookName }</td>
			    <td align="right"><fmt:formatNumber value="${books.bookSum }" pattern="#,###"/></td>
			    <td align="right">${books.bookCount }</td>
			</tr>
		</c:forEach>
		</tbody>
</table>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>