<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, review.model.vo.*" %>
<%
	//ReviewListServlet에서 정보가지고 오기
	int cPage = (int)request.getAttribute("cPage");
	String pageBar = (String)request.getAttribute("pageBar");
	
	List<Review> list = (List<Review>)request.getAttribute("list");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<script src="<%=request.getContextPath()%>/js/jquery-3.4.0.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<style>
div#pageBar{
	margin-top: 10px;
	text-align: center;
	background-color: rgba(0,188,212,0.3);
}
div#pageBar span.cPage{
	color: #06f;
}
</style>

<title>리뷰게시판</title>

<script>
$(function(){
	$("#btn-write").click(function(){
	 	location.href = "<%=request.getContextPath()%>/review/reviewForm";
	<%-- 	location.href = "<%=request.getContextPath()%>/review/reviewFormTest"; --%>
	});
});
</script>

</head>
<body>
	<h2>리뷰게시판</h2>
	
	<table class="table table-dark">
  <thead>
    <tr>
      <th scope="col">글번호</th>
      <th scope="col">글제목</th>
      <th scope="col">작성자</th>
      <th scope="col">조회수</th>
    </tr>
  </thead>
  <tbody>
    <tr>
    <%if(list.isEmpty()){%>
    	<tr>
			<td colspan="4" align="center">게시글이 없습니다.</td>
		</tr>
    <%} else {
        for(Review rv : list){%>
      <th scope="row"><%=rv.getReviewNo() %></th>
      <td><a href="<%=request.getContextPath()%>/review/reviewView?reviewNo=<%=rv.getReviewNo()%>">
            <%=rv.getPlaceTitle() %></a></td>
      <td><%=rv.getMemberId() %></td>
      <td><%=rv.getReadCount() %></td>
    </tr>
    <%} // end of for 
      } // end of if %> 
  </tbody>
</table>

	<div id="pageBar">
		<%=pageBar %>
	</div>

	<hr />
	<button type="button" class="btn btn-primary" id="btn-write">글쓰기</button>
	
</body>
</html>