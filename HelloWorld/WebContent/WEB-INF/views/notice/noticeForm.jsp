<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/js/jquery-3.4.0.js"></script>
<title>Insert title here</title>

<script>
$(function(){
	$("#sel").on("change", function(){
		var result = $("#sel option:selected").val();
		if(result == 1){
			$.ajax({
				url:"<%=request.getContextPath()%>/notice/noticeCheck",
				data:"get",
				dataType:"json",
				success:function(data){
					console.log(data);
					
					var html = "<tr><th>첨부파일</th>";
					html += "<th><input type='file' name='upFile'/></td></tr>";
					
					$("#filediv").html(html);
				}
				
			});
		} else {
			$("#filediv").hide();
		}
	});
});
</script>

</head>
<body>
	<h2>공지사항 글쓰기</h2>
	<form action="<%=request.getContextPath()%>/notice/noticeFormEnd" method="post" enctype="multipart/form-data">
		제목 : <input type="text" name="noticeTitle"/>
		내용 : <textarea name="noticeContent" id="" cols="30" rows="10"></textarea>
		<label for="sel">공지종류</label>
		<select name="sel" id="sel">
			<option value="0">공지사항</option>
			<option value="1" id="test">업데이트</option>
		</select>
		<div id=filediv>
		</div>
		<input type="submit" value="전송" />
	</form>
</body>
</html>