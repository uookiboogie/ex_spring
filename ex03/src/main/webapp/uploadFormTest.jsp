<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업로드 연습하기</title>
</head>
<body>
  <form method="post" enctype="multipart/form-data" action="uploadFormAction">
    <input type="file" name="uploadFile" multiple="multiple"><br>
    <input type="file" name="uploadFile"><br>
    <input type="file" name="uploadFile"><br>
    <button>FILE UPLOAD</button>
  </form>
</body>
</html>