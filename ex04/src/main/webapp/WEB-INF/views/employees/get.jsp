<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 상세정보</title>
</head>
<body>
  <table>
    <tr>
    ${employees.employeeId } : ${employees.lastName } : ${employees.salary } : ${employees.email }
    </tr>
  </table>
</body>
</html>