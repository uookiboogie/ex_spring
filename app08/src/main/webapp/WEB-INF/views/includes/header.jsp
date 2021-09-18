<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
  <div>
  <h3>도서대여관리</h3>
  <div>
  <a href="${pageContext.request.contextPath }/book/register">도서등록</a>
  <a href="${pageContext.request.contextPath }/book/list">도서목록조회/수정</a>
  <a href="${pageContext.request.contextPath }/book/list2">대여현황조회</a>
  <a href="${pageContext.request.contextPath }">홈으로</a>
  </div>
  </div>