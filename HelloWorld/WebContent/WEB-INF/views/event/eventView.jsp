<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="event.model.vo.*" %>
<%
	Event e = (Event)request.getAttribute("e");
	EventPhoto ep = (EventPhoto)request.getAttribute("ep");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/js/jquery-3.4.0.js"></script>
<title>Insert title here</title>

<script>
function deleteEvent(){
	if(!confirm("이 게시글을 정말 삭제하시겠습니까?")){
		return;
	}
	$("#eventDelFrm").submit();
}
</script>

</head>
<body>
	<h2>이벤트 게시글 보기</h2>
	<h2>공지사항 글 보기</h2>
	글번호 : <td><%=e.getEventNo() %></td>
	제목 : <td><%=e.getEventTitle()%></td>
	글쓴이 : <td>관리자입니다</td>
	내용 : <td><%=e.getEventContent() %></td>
	사진 : <td><img src="<%=request.getContextPath() %>/upload/notice/<%=ep.getRenamedFileName() %>" alt="" /></td>
	<hr />
	
	<button onclick="location.href='<%=request.getContextPath()%>/event/eventUpdate?eventNo=<%=e.getEventNo()%>'">수정하기</button>
	<button onclick="deleteEvent();">삭제하기</button>
	<button onclick="location.href='<%=request.getContextPath()%>/event/eventList'">목록보기</button>
	
	<form action="<%=request.getContextPath()%>/event/eventDelete" method="post" id="eventDelFrm">
	<input type="hidden" name="eventNo" value="<%=e.getEventNo()%>" />
</form>

</body>
</html>