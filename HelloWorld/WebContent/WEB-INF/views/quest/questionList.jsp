<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, quest.model.vo.*" %>
<%
	int cPage = (int)request.getAttribute("cPage");
	String pageBar = (String)request.getAttribute("pageBar");
	
	List<Question>list = (List<Question>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/js/jquery-3.4.0.js"></script>
<title>Insert title here</title>

<script>
$(function(){
	$("#btn-writer").click(function(){
		location.href = "<%=request.getContextPath()%>/quest/questForm";
	});
});
</script>

<script>
function arm(){
	alert("비공개글입니다");
}
</script>

</head>
<body>
	<h2>문의사항 게시판</h2>
	<table class="table table-dark">
  <thead>
    <tr>
      <th scope="col">글번호</th>
      <th scope="col">글제목</th>
      <th scope="col">작성자</th>
      <th scope="col">공개여부</th>
      <th scope="col">궁금증해결여부</th>
      <th scope="col">작성일</th>
      <th scope="col">해결완료여부체크</th>
    </tr>
  </thead>
  <tbody>
    <tr>
    
    <%if(list.isEmpty()){%>
    	<tr>
			<td colspan="4" align="center">게시글이 없습니다.</td>
		</tr>
    <%} else {
        for(Question q : list){%>
      <th scope="row"><%=q.getQuestionNo() %></th>
      <%if(q.getQuestionLevel() != 1){ %>
      <td><a href="" onclick="arm();"><%=q.getQuestionTitle() %></a></td>
      <%}else{ %>
       <td><a href="<%=request.getContextPath()%>/quest/questView?questNo=<%=q.getQuestionNo()%>">
            <%=q.getQuestionTitle() %></a></td>
      <%} %>
      <td>글쓴이 아이디 찍어주는 곳</td>
      <td id="visible"><%=q.getQuestionLevel()!=1?"비공개":"공개" %></td>
      <td><%=q.getAnswerLevel()!=1?"해결완료":"해결중" %></td>
      <td><%=q.getQuestionDate() %></td>
      <%if(q.getAnswerLevel()==1){ %>
      <td><input type="checkbox" name="" id="" onclick="location.href='<%=request.getContextPath()%>/quest/questionClear?questNo=<%=q.getQuestionNo()%>' "/></td>
      <%} %>
    </tr>
    <%} // end of for 
      } // end of if %> 
      
  </tbody>
</table>
	
	<div id="pageBar">
		<%=pageBar %>
	</div>
	
	<button id="btn-writer">글쓰기</button>
	
</body>
</html>