<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/js/jquery-3.4.0.js"></script>
<title>Insert title here</title>
</head>
<body>

<section id="review-container">
	<h2>리뷰글쓰기 테스트 JSP</h2>
	<form action="<%=request.getContextPath()%>/review/reviewFormEndTest" method="post" enctype="multipart/form-data">
		<table id="tbl-board">
			<tr>
				<th>제목</th>
				<td><input type="text" name="reviewTitle"/></td>
			</tr>
			
			<tr>
				<th>작성자</th>
				<td><input type="text" name="reviewWriter" value="abc" readonly/></td> <!-- value값 로그인된회원찍어주기 -->
			</tr>
			
			<tr>
				<th>장소번호</th>
				 <div class="form-group">
   					 <label for="exampleFormControlSelect1">장소번호선택</label>
   					 <select class="form-control" id="exampleFormControlSelect1" name="placeNo">
     					 <option selected="selected">1</option>
     					 <option>2</option>
     					 <option>3</option>
     					 <option>4</option>
     					 <option>5</option>
    				</select>
 				 </div>
			</tr>
			
			<tr>
				<th>메인사진</th>
				<input type="file" name="mainFile" />
			
				<th>부가사진</th>
				<input type="file" name="upFile" id="upFile" multiple="multiple" maxlength="8"/>
				<input type="hidden" name="fileName" value="" />
			</tr>
			
			<tr>
				<th>내용</th>
				<td>
					<textarea name="reviewContent" id="reviewContent" cols="30" rows="10"></textarea>
				</td>
			</tr>
			
			<tr>
				<th colspan="2">
					<input type="submit" value="등록" onclick="return validate();"/>
				</th>
			</tr>
		</table>
	</form>
</section>

<script>
$(function(){
	$("#upFile").change(function(e){
	
		var html = "";	
		var size = $("input[name=upFile]")[0].files.length
	
		for(var i=0; i<size; i++){
			var name = $("input[name=upFile]")[0].files[i].name
			html += name;
			if(i < size-1){
				html += "&";
			}
		}
		
		$("input[name=fileName]").val(html);
		
		var result = $("input[name=fileName]").val();
		console.log(result);
		
	});
});
</script>	
			
</body>
</html>