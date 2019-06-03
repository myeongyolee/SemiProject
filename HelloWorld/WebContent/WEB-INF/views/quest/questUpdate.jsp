<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="quest.model.vo.*" %>
<%
	Question q = (Question)request.getAttribute("q");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>문의글 수정하기 페이지</h2>
	<form action="<%=request.getContextPath()%>/quest/questUpdateEnd" method="post" enctype="multipart/form-data">
	글번호 : <td><%=q.getQuestionNo() %></td>
	<input type="hidden" name="questNo" value="<%=q.getQuestionNo() %>" />
	제목 : <input type="text" name="questTitle" value="<%=q.getQuestionTitle() %>" />
	글쓴이 : <input type="text" name="questWriter" value="<%=q.getQuestionWriter() %>" readonly />
	내용 : <textarea name="questContent" id="" cols="30" rows="10"><%=q.getQuestionCotent() %></textarea>
	<%if(q.getQuestionRenamedFileName()!=null){ %>
	사진파일: <img src="<%=request.getContextPath() %>/upload/question/<%=q.getQuestionRenamedFileName() %>" alt="" />
	<input type="hidden" name="oldRenamedFile" value="<%=q.getQuestionRenamedFileName() %>" />
	<input type="hidden" name="oldOriginalFile" value="<%=q.getQuestionOriginalFileName() %>" />
	<%} %>
	사진첨부: <input type="file" name="upFile" id="" />
	<label for="del">첨부파일 삭제</label>
	<input type="checkbox" name="delFile" id="del" />
	
	<label for="sel">공개/비공개여부</label>
	<select name="sel" id="sel">
		<option value="1">공개</option>
		<option value="0">비공개</option>
	</select>
	<input type="submit" value="전송" />
	</form>
	
</body>
</html>