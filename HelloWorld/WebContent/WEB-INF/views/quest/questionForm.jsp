<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/js/jquery-3.4.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h2>문의사항 글쓰기</h2>
	
	<form action="<%=request.getContextPath()%>/quest/questFormEnd" method="post" enctype="multipart/form-data">
		제목 : <input type="text" name="questTitle"/>
		작성자 : <input type="text" name="questWriter" value="abc" readonly />
		내용 : <textarea name="questContent" id="" cols="30" rows="10"></textarea>
		<label for="sel">공개/비공개여부</label>
		<select name="sel" id="sel">
			<option value="1">공개</option>
			<option value="0">비공개</option>
		</select>
		<input type="file" name="upFile" id="" />
		<input type="submit" value="전송" />
	</form>
	
</body>
</html>