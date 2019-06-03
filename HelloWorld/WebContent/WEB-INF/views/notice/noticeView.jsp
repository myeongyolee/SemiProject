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
<script src="<%=request.getContextPath()%>/js/jquery-3.4.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h2>공지사항 글 보기</h2>
	제목 : <td><%=n.getNoticeTitle() %></td>
	글쓴이 : <td>관리자입니다</td>
	내용 : <td><%=n.getNoticeContent() %></td>
	작성일 : <td><%=n.getNoticeDate() %></td>
	
	<hr />
	
	<button onclick="location.href='<%=request.getContextPath()%>/notice/noticeUpdate?noticeNo=<%=n.getNoticeNo()%>'">수정하기</button>
	<button onclick="location.href='<%=request.getContextPath()%>/notice/noticeDelete?noticeNo=<%=n.getNoticeNo()%>'">삭제하기</button>
	<button onclick="location.href='<%=request.getContextPath()%>/notice/noticeList'">목록보기</button>
</body>
</html>