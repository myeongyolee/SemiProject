<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<script src="<%=request.getContextPath()%>/js/jquery-3.4.0.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<title>리뷰게시판 글쓰기 페이지</title>
</head>
<body>
<section id="review-container">
	<h2>리뷰게시글 작성</h2>
	<form action="<%=request.getContextPath()%>/review/reviewFormEnd" method="post" enctype="multipart/form-data">
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
     					 <option>1</option>
     					 <option>2</option>
     					 <option>3</option>
     					 <option>4</option>
     					 <option>5</option>
    				</select>
 				 </div>
			</tr>
			
			<div id="fileDiv">
			<tr>
				<th>첨부파일</th>
				<td><input type="file" name="file_0"/></td>
				<!-- <a href="#this" name="delete" class="btn">삭제하기</a> -->
			</tr>
			</div>
			
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
			<a href="#this" id="add" class="btn">파일 추가하기</a>
		</table>
	</form>
</section>
<script>
var g_count = 1;
        $(document).ready(function(){
/*             $("a[name='delete']").on("click",function(e){
                e.preventDefault();
                fn_fileDelete($(this));
            })  */
            
            $("#add").on("click",function(e){
                e.preventDefault();
                fn_fileAdd();
            })
        });
         
        function fn_fileDelete(obj){
            obj.parent().remove();
        }
        
        function fn_fileAdd(){
        	if(g_count < 9){
            	var str = "<p><input type='file' name='file_"+(g_count++)+"'/><a href='#this' name='delete' class='btn'>삭제하기</a></p> ";
            	$("#fileDiv").append(str);
        	} 
            
             $("a[name='delete']").on("click",function(e){
            	e.preventDefault();
                fn_fileDelete($(this));
            });
        }
</script>
</body>
</html>