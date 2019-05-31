<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="review.model.vo.*, java.util.*" %>
<%
	Review rv = (Review)request.getAttribute("rv");
	List<ReviewPhoto> list = (List<ReviewPhoto>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath() %>/js/jquery-3.4.0.js"></script>
</head>
<body>
<section id="board-container">
	<h2>게시판 작성</h2>
	<form action="<%=request.getContextPath()%>/review/reviewUpdateEnd" method="post" enctype="multipart/form-data">
		<table id="tbl-board">
			<tr>
				<input type="hidden" name="reviewNo" value="<%=rv.getReviewNo() %>" />
				<th>제목</th>
				<td><input type="text" name="reviewTitle"/ value="<%=rv.getPlaceTitle()%>"></td>
			</tr>
			
			<tr>
				<th>작성자</th>
				<td><input type="text" name="reviewWriter" value="<%=rv.getMemberId()%>" readonly/></td>
			</tr>
			
			<tr>
				<th>첨부파일</th>
				<td><a href="#this" id="add" class="btn">파일 추가하기</a></td>
				<div id="fileDiv">

				</div>
				<!-- 파일태그에 value속성은 보안상의 이유로 사용할 수 없다 -->
				<%if(!list.isEmpty()){
					 int i=0;
				     for(ReviewPhoto rp : list){%>
				     
				<td id="test_<%=i%>" style="position:relative;">
					
				</td>
				
				<!-- 사용자가 첨부파일관련해서 아무런 수정도 하지 않는 경우 -->
				<input type="hidden" name="originalFileNameOld_<%=i%>" value="<%=rp.getOriginalPhotoName()%>" />
				<input type="hidden" name="renamedFileNameOld_<%=i%>" value="<%=rp.getRenamedPhotoName()%>" />
				
				<!-- 사용자가 업로드한 파일을 삭제하는 경우 -->
				<%if(rp.getRenamedPhotoName()!=null){%> 
					<br />
					<span id="fname_<%=i%>"><%=rp.getOriginalPhotoName()!=null?rp.getOriginalPhotoName():"" %></span>
					<input type="checkbox" name="delFile_<%=i%>" id="delFile" />
					<label for="delFile">첨부파일 삭제</label>
				<%i++; } %>
	
				
				<%}%>
				<input type="hidden" name="size" value="<%=list.size()%>" />
				<%}%>
			</tr>
			
			<tr>
				<th>내용</th>
				<td>
					<textarea name="reviewContent" id="reviewContent" cols="30" rows="10"><%=rv.getReviewContent() %></textarea>
				</td>
			</tr>
			
			<tr>
				<th colspan="2">
					<input type="submit" value="수정" onclick="return validate();"/>
				</th>
			</tr>
			
		</table>
	</form>
</section>

<script>
$(function(){
	var delCount = $("input[name=size]").val();
	console.log(delCount);
	
	var reviewNo = $("input[name=reviewNo]").val();
		
	$("input[name=delFile_0]").on("click",function(){
		var str = $("input[name=delFile_0]").val();
			delCount--;
		var img = $("input[name=renamedFileNameOld_0]").val();
			
			$.ajax({
				url:"<%=request.getContextPath()%>/ajax/gson/review/deleteReviewImg",
				type:"post",
				dataType:"json",
				data:{img:img, reviewNo:reviewNo},
				success:function(data){
					console.log(data);
					
					var html = "";
					for(var i in data){
						var user = data[i];
						html = user.originalFileName;
					}
					$("#fname_0").html(html);
					$("#test_0").hide();
					
				},complete:function(){
					$("input[name=originalFileNameOld_0]").val("");
					$("input[name=renamedFileNameOld_0]").val("");
				}
				
			});
	});
	
	$("input[name=delFile_1]").on("click",function(){
		var str = $("input[name=delFile_1]").val();
			console.log(str);
		var img = $("input[name=renamedFileNameOld_1]").val();
			console.log(img);
			
			$.ajax({
				url:"<%=request.getContextPath()%>/ajax/gson/review/deleteReviewImg",
				type:"post",
				dataType:"json",
				data:{img:img, reviewNo:reviewNo},
				success:function(data){
					console.log(data);
					
					var html = "";
					for(var i in data){
						var user = data[i];
						html = user.originalFileName;
					}
					$("#test_1").hide();
					$("#fname_1").html(html);
					
				},complete:function(){
					$("input[name=originalFileNameOld_1]").val("");
					$("input[name=renamedFileNameOld_1]").val("");
				}
			});
	});
	
	
	$("input[name=delFile_2]").on("click",function(){
		var str = $("input[name=delFile_2]").val();
			console.log(str);
		var img = $("input[name=renamedFileNameOld_2]").val();
			console.log(img);
			
			$.ajax({
				url:"<%=request.getContextPath()%>/ajax/gson/review/deleteReviewImg",
				type:"post",
				dataType:"json",
				data:{img:img, reviewNo:reviewNo},
				success:function(data){
					console.log(data);
					
					var html = "";
					for(var i in data){
						var user = data[i];
						html = user.originalFileName;
					}
					$("#test_2").hide();
					$("#fname_2").html(html);
					
				},complete:function(){
					$("input[name=originalFileNameOld_2]").val("");
					$("input[name=renamedFileNameOld_2]").val("");
				}
			});
	});
	
	$("input[name=delFile_3]").on("click",function(){
		var str = $("input[name=delFile_3]").val();
			console.log(str);
		var img = $("input[name=renamedFileNameOld_3]").val();
			console.log(img);
			
			$.ajax({
				url:"<%=request.getContextPath()%>/ajax/gson/review/deleteReviewImg",
				type:"post",
				dataType:"json",
				data:{img:img, reviewNo:reviewNo},
				success:function(data){
					console.log(data);
					
					var html = "";
					for(var i in data){
						var user = data[i];
						html = user.originalFileName;
					}
					$("#test_3").hide();
					$("#fname_3").html(html);
					
				},complete:function(){
					$("input[name=originalFileNameOld_3]").val("");
					$("input[name=renamedFileNameOld_3]").val("");
				}
			});
	});
	
	$("input[name=delFile_4]").on("click",function(){
		var str = $("input[name=delFile_4]").val();
			console.log(str);
		var img = $("input[name=renamedFileNameOld_4]").val();
			console.log(img);
			
			$.ajax({
				url:"<%=request.getContextPath()%>/ajax/gson/review/deleteReviewImg",
				type:"post",
				dataType:"json",
				data:{img:img, reviewNo:reviewNo},
				success:function(data){
					console.log(data);
					
					var html = "";
					for(var i in data){
						var user = data[i];
						html = user.originalFileName;
					}
					$("#test_4").hide();
					$("#fname_4").html(html);
					
				},complete:function(){
					$("input[name=originalFileNameOld_4]").val("");
					$("input[name=renamedFileNameOld_4]").val("");
				}
			});
	
	});
	
	$("input[name=delFile_5]").on("click",function(){
		var str = $("input[name=delFile_5]").val();
			console.log(str);
		var img = $("input[name=renamedFileNameOld_5]").val();
			console.log(img);
			
			$.ajax({
				url:"<%=request.getContextPath()%>/ajax/gson/review/deleteReviewImg",
				type:"post",
				dataType:"json",
				data:{img:img, reviewNo:reviewNo},
				success:function(data){
					console.log(data);
					
					var html = "";
					for(var i in data){
						var user = data[i];
						html = user.originalFileName;
					}
					$("#test_5").hide();
					$("#fname_5").html(html);
					
				},complete:function(){
					$("input[name=originalFileNameOld_5]").val("");
					$("input[name=renamedFileNameOld_5]").val("");
				}
			});
	});
	
	$("input[name=delFile_6]").on("click",function(){
		var str = $("input[name=delFile_6]").val();
			console.log(str);
		var img = $("input[name=renamedFileNameOld_6]").val();
			console.log(img);
			
			$.ajax({
				url:"<%=request.getContextPath()%>/ajax/gson/review/deleteReviewImg",
				type:"post",
				dataType:"json",
				data:{img:img, reviewNo:reviewNo},
				success:function(data){
					console.log(data);
					
					var html = "";
					for(var i in data){
						var user = data[i];
						html = user.originalFileName;
					}
					$("#test_6").hide();
					$("#fname_6").html(html);
					
				},complete:function(){
					$("input[name=originalFileNameOld_6]").val("");
					$("input[name=renamedFileNameOld_6]").val("");
				}
			});
	});
	
	$("input[name=delFile_7]").on("click",function(){
		var str = $("input[name=delFile_7]").val();
			console.log(str);
		var img = $("input[name=renamedFileNameOld_7]").val();
			console.log(img);
			
			$.ajax({
				url:"<%=request.getContextPath()%>/ajax/gson/review/deleteReviewImg",
				type:"post",
				dataType:"json",
				data:{img:img, reviewNo:reviewNo},
				success:function(data){
					console.log(data);
					
					var html = "";
					for(var i in data){
						var user = data[i];
						html = user.originalFileName;
					}
					$("#test_7").hide();
					$("#fname_7").html(html);
					
				},complete:function(){
					$("input[name=originalFileNameOld_7]").val("");
					$("input[name=renamedFileNameOld_7]").val("");
				}
			});
	});
	
	$("input[name=delFile_8]").on("click",function(){
		var str = $("input[name=delFile_8]").val();
			console.log(str);
		var img = $("input[name=renamedFileNameOld_8]").val();
			console.log(img);
			
			$.ajax({
				url:"<%=request.getContextPath()%>/ajax/gson/review/deleteReviewImg",
				type:"post",
				dataType:"json",
				data:{img:img, reviewNo:reviewNo},
				success:function(data){
					console.log(data);
					
					var html = "";
					for(var i in data){
						var user = data[i];
						html = user.originalFileName;
					}
					$("#test_8").hide();
					$("#fname_8").html(html);
					
				},complete:function(){
					$("input[name=originalFileNameOld_8]").val("");
					$("input[name=renamedFileNameOld_8]").val("");
				}
			});
	});
});
</script>

<script>
var g_count = 0;
$(document).ready(function(){
    $("a[name='delete']").on("click",function(e){
        e.preventDefault();
        fn_fileDelete($(this));
    })
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
    })
}
</script>

</body>
</html>