<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="review.model.vo.*, java.util.*, review.model.vo.*" %>
<%
	Review rv = (Review)request.getAttribute("rv");
	List<ReviewPhoto> list = (List<ReviewPhoto>)request.getAttribute("list");
	List<ReviewComment> commentList = (List<ReviewComment>)request.getAttribute("commentList");
%>
<!DOCTYPE html>
<html>
<head>
<script src="<%=request.getContextPath()%>/js/jquery-3.4.0.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function deleteReview(){
	if(!confirm("이 게시글을 정말 삭제하시겠습니까?")){
		return;
	}
	$("#reviewDelFrm").submit();
}
</script>

<script>
//대댓글입력
$(function(){

	$(".btn-reply").click(function(){	
		console.log("확인");
		var tr = $("<tr></tr>");
		var html = '<td style="display:none; text-align:left; colspan=2">';
		html += '<form action="<%=request.getContextPath()%>/review/reviewCommentInsert" method="post">';
		html += '<textarea name="reviewCommentContent" id="" cols="60" rows="3"></textarea>';
		html += '<button type="submit" class="btn-insert2">등록</button>';
		html += '<input type="hidden" name="reviewRef" value="<%=rv.getReviewNo()%>" />';
		html += '<input type="hidden" name="reivewCommentWriter" value="abc" />';
		html += '<input type="hidden" name="reviewCommentLevel" value="2" />';
		html += '<input type="hidden" name="reviewCommentRef" value="'+$(this).val()+'" />';
		html += '</form>';
		html += '</td>';
		
		tr.html(html);
		tr.insertAfter($(this).parent().parent()).children("td").slideDown(800);
		
		//답글버튼 연속적으로 누르지 않도록 하기
		$(this).off('click');
		
		//새로생성한 요소에 대해 submit이벤트 핸들러 작성
		tr.find("form").submit(function(){
			//댓글textarea 유효성검사
			var content = $(this).children("textarea").val().trim();
			if(content.length == 0){
				e.preventDefault();
			}
		});
	});
});
</script>

</head>
<body>
	<table>
		<tr>
			<th>글번호</th>
			<td><%=rv.getReviewNo() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=rv.getMemberId() %></td>
		</tr>
		<tr>
			<th>글내용</th>
			<td><%=rv.getReviewContent() %></td>
		</tr>
		
		<div id="imgdiv">
		<tr>
			<th>업로드한사진</th>
			<%if(!list.isEmpty()){ 
			     for(ReviewPhoto rp : list){%>
			<td>
			<img src="<%=request.getContextPath()%>/upload/review/<%=rp.getRenamedPhotoName()%>" alt="" />
			</td>
			<%} %>
			<%} %>
		</tr>
		</div>
		
		<tr>
			<th>조회수</th>
			<td><%=rv.getReadCount() %></td>
		</tr>
		
		<tr>
			<td>
			<button onclick="location.href='<%=request.getContextPath()%>/review/reviewUpdate?reviewNo=<%=rv.getReviewNo()%>'">수정하기</button>
			<button onclick="deleteReview();">삭제하기</button>
			<button onclick="location.href='<%=request.getContextPath()%>/review/reviewList'">게시글 목록보기</button>
			</td>
		</tr>	
	</table>
	
	<hr style="margin-top: 30px;" />
	<div id="comment-container">
	
		<div class="comment-editor">
			<form action="<%=request.getContextPath()%>/review/reviewCommentInsert" name="reviewCommentFrm" method="post">
				<textarea name="reviewCommentContent" id="" cols="60" rows="3"></textarea>
				<button type="submit" id="btn-insert">등록</button>
				<input type="hidden" name="reviewRef" value="<%=rv.getReviewNo()%>" />
				<input type="hidden" name="reviewCommentWriter" value="abc" />
				<input type="hidden" name="reviewCommentLevel" value="1" />
				<input type="hidden" name="reviewCommentRef" value="0" />
			</form>
		</div>
		
		<!-- 댓글목록 테이블 -->
		<table id="tbl-comment">
			<%if(!commentList.isEmpty()) {
				for(ReviewComment rc : commentList){
					if(rc.getReviewCommentLevel() == 1){
			%>
					<!-- 댓글인경우 -->
					<tr class="level1">
						<td>
							<sub class="comment-writer"><%=rc.getReviewCommentWriter() %></sub>
							<sub class="comment-date"><%=rc.getReviewCommentDate() %></sub>
							<br />
							<%=rc.getReviewCommentContent() %>
						</td>
						
						<td>
							<button class="btn-reply" value="<%=rc.getReviewCommentNo()%>">답글</button>
							
							<button class="btn-delete" 
									onclick="location.href='<%=request.getContextPath()%>/review/deleteReply?reviewCommentNo=<%=rc.getReviewCommentNo()%>&reviewNo=<%=rc.getReviewRef()%>'">삭제</button>
							
						</td>
					</tr>
			<% 
					}
					else{
			%>
					<!-- 대댓글인경우 -->
					<tr class="level2">
						<td>
							<sub class="comment-writer"><%=rc.getReviewCommentWriter() %></sub>
							<sub class="comment-date"><%=rc.getReviewCommentDate() %></sub>
							<br />
							<%=rc.getReviewCommentContent() %>
						</td>
						
						<td>
							
							<button class="btn-delete" 
									onclick="location.href='<%=request.getContextPath()%>/review/deleteReply?reviewCommentNo=<%=rc.getReviewCommentNo()%>&reviewNo=<%=rc.getReviewRef()%>'">삭제</button>
							
						</td>
					</tr>
			<% 
					}//end of if(getBoardCommentLevel==1)
				}//end of for
			}//end of if
			%>			
			
		</table>
		
	</div>
	
	<form action="<%=request.getContextPath()%>/review/reviewDelete" method="post" id="reviewDelFrm">
	<input type="hidden" name="reviewNo" value="<%=rv.getReviewNo()%>" />
</form>
</body>
</html>