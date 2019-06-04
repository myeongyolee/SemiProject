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

<%-- <script>
$(function(){
	$("input[name=delFile]").on("click", function(){
		
		var eventNo = $("input[name=eventNo]").val();
		var img = $("input[name=renamed]").val();
		
		$.ajax({
			url:"<%=request.getContextPath()%>/ajax/gson/notice/deleteEventPhoto",
			type:"post",
			data:{img:img, eventNo:eventNo},
			dataType:"json",
			success:function(data){
				console.log(data);
			}
		});
	});
});
</script> --%>

</head>
<body>
	<h2>이벤트 게시글 수정페이지</h2>
	<form action="<%=request.getContextPath()%>/event/eventUpdateEnd" method="post" enctype="multipart/form-data">
	글번호 : <td><%=e.getEventNo() %></td>
	<input type="hidden" name="eventNo" value="<%=e.getEventNo() %>" />
	제목 : <input type="text" name="eventTitle" value="<%=e.getEventTitle() %>" />
	글쓴이 : <td>관리자입니다</td>
	내용 : <textarea name="eventContent" id="" cols="30" rows="10"><%=e.getEventContent() %></textarea>
	사진 : <input type="file" name="upFile" id="" />
	<span id="cover"><%=ep.getOriginalFileName() %></span>
	<%if(ep.getOriginalFileName()!=null){ %>
	<br />
	<input type="checkbox" name="delFile" id="delFile" />
	<label for="delFile">첨부파일 삭제</label>
	<%} %>
	<input type="hidden" name="original" value="<%=ep.getOriginalFileName() %>" />
	<input type="hidden" name="renamed" value="<%=ep.getRenamedFileName() %>" />
	<input type="submit" value="전송" />
	</form>
</body>
</html>