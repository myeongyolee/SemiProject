<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="notice.model.vo.*" %>
<%
	Notice n = (Notice)request.getAttribute("n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>공지사항 수정하기</h2>
	<form action="<%=request.getContextPath()%>/notice/noticeUpdateEnd">
	글번호 : <td><%=n.getNoticeNo() %></td>
	<input type="hidden" name="noticeNo" value="<%=n.getNoticeNo() %>" />
	제목 : <input type="text" name="noticeTitle" value="<%=n.getNoticeTitle() %>" />
	글쓴이 : <td>관리자입니다</td>
	내용 : <textarea name="noticeContent" id="" cols="30" rows="10"><%=n.getNoticeContent() %></textarea>
	<input type="submit" value="전송" />
	</form>
</body>
</html>