<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World</title>

</head>
<body>
<h1>Hello World</h1>

<div id="test">
<input type="button" value="회원가입"
onclick="location.href='<%=request.getContextPath()%>/member/memberEnroll'"/>
					  				   
</div>
</body>
</html>