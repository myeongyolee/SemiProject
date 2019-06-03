<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="quest.model.vo.*, java.util.*" %>
<%
	Question q = (Question)request.getAttribute("q");
	List<QuestionComment> list = (List<QuestionComment>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/js/jquery-3.4.0.js"></script>
<title>Insert title here</title>

<script>
function deleteBtn(){
	if(!confirm("이 게시글을 정말 삭제하시겠습니까?")){
		return;
	}
	
	location.href='<%=request.getContextPath()%>/quest/questDelete?questNo=<%=q.getQuestionNo()%>';
}
</script>

</head>
<body>
	<h2>문의사항 글 보기</h2>
	글번호 : <td><%=q.getQuestionNo() %></td>
	제목 : <td><%=q.getQuestionTitle() %></td>
	글쓴이 : <td><%=q.getQuestionWriter() %></td>
	내용 : <td><%=q.getQuestionCotent() %></td>
	<%if(q.getQuestionRenamedFileName()!=null){ %>
	사진파일 : <img src="<%=request.getContextPath() %>/upload/question/<%=q.getQuestionRenamedFileName() %>" alt="" />
	<%} %>
	작성일 : <td><%=q.getQuestionDate() %></td>
	<hr />
	<br />
	
	<h2>댓글 작성하기</h2>
	<form action="<%=request.getContextPath()%>/quest/questionCommentInsert">
	<textarea name="QuestionCommentContent" id="" cols="60" rows="3"></textarea>
	<input type="hidden" name="questionRef" value="<%=q.getQuestionNo() %>" />
	<input type="submit" value="댓글 등록" />
	</form>
	<hr />
	<br />
	
	<h2>댓글내용</h2>
	<%if(!list.isEmpty()){ 
	   for(QuestionComment qc : list){%>
	댓글 번호 : <p><%=qc.getQuestionCommentNo() %></p>
	댓글 내용 : <p><%=qc.getQuestionCommentContent() %></p>
	댓글 작성일 : <p><%=qc.getQuestionCommentDate() %></p>
	<button onclick="location.href='<%=request.getContextPath()%>/quest/deleteQuestionComment?questionCommentNo=<%=qc.getQuestionCommentNo()%>&questionNo=<%=q.getQuestionNo()%>'">댓글 삭제</button>
	<%} %>
	<%} %>
	
	<hr />
	<br />
	
	<button onclick="location.href='<%=request.getContextPath()%>/quest/questUpdate?questNo=<%=q.getQuestionNo()%>'">수정하기</button>
	<button onclick="deleteBtn();">삭제하기</button>
	<button onclick="location.href='<%=request.getContextPath()%>/quest/questList'">목록보기</button>
</body>
</html>