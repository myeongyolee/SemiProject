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
				<th>글번호</th>
				<td><input type="text" name="reviewNo" value="<%=rv.getReviewNo() %>" /></td>
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
				
				<!-- 파일태그에 value속성은 보안상의 이유로 사용할 수 없다 -->
				<%if(!list.isEmpty()){
					 int i=0;
				     for(ReviewPhoto rp : list){%>
			</tr>
			
			<tr>
				<%if(i==0){ %>
				<th>기존파일</th>
				<%} %>
				
				<td>
				<!-- 사용자가 첨부파일관련해서 아무런 수정도 하지 않는 경우 -->
				<input type="hidden" name="originalFileNameOld_<%=i%>" value="<%=rp.getOriginalPhotoName()%>" />
				<input type="hidden" name="renamedFileNameOld_<%=i%>" value="<%=rp.getRenamedPhotoName()%>" />
				
				<!-- 사용자가 업로드한 파일을 삭제하는 경우 -->
				<%if(rp.getRenamedPhotoName()!=null){
					if(rp.getPhotoLevel() == 1){%>
					<p>대표사진 수정: <input type="file" name="upFile" id="" /></p>
					<span id="fname_<%=i%>"><%=rp.getOriginalPhotoName()!=null?rp.getOriginalPhotoName():"" %></span>
					<img src="<%=request.getContextPath() %>/upload/review/<%=rp.getRenamedPhotoName() %>" id="oldimg_<%=i%>" width="150px"/>
					<input type="checkbox" name="delFile_<%=i%>" id="delFile" />
					<label for="delFile">첨부파일 삭제</label>
				<%} else{ %>	 
					<br />
					<span id="fname_<%=i%>"><%=rp.getOriginalPhotoName()!=null?rp.getOriginalPhotoName():"" %></span>
					<p><img src="<%=request.getContextPath() %>/upload/review/<%=rp.getRenamedPhotoName() %>" id="oldimg_<%=i%>" width="150px" /></p>
					<input type="checkbox" name="delFile_<%=i%>" id="delFile" />
					<label for="delFile">첨부파일 삭제</label>
					<%} %>
				<%i++; } %>
	
				
				<%}%>
				<%}%>
				</td>
			</tr>
			
			<tr>
				<td>
				<div id="fileDiv">
				</div>
				</td>
			</tr>
			
			<tr>
				<td>
					<div id="imgview">
					<%for(int i=0; i<10; i++){%>
					<img id="img-viewer_<%=i %>" width=100 />
					<%} %>
					</div>
				</td>
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
	var g_count = 0;
	var del_count = 0;

    $(document).ready(function(){
        
    $("#add").on("click",function(e){
            e.preventDefault();
            fn_fileAdd();
        })
    });
    
    function fn_fileAdd(){
    	
    	var p_count = $("p").length;
    	
    	$.ajax({
    		url:"<%=request.getContextPath()%>/test/testCheck2",
    		data:{g_count:g_count,p_count:p_count,del_count:del_count},
    		dataType:"json",
    		success:function(data){
    			
    			if((data[0].ptag - data[0].del_count) < 10 ){
                	var str = "<p class='"+data[0].ptag+"'><input type='file' name='file_"+(data[0].ptag)+"' onchange='loadImg(this);'/><a href='#this' name='delete' class='"+data[0].ptag+"'>삭제하기</a></p> ";
                	$("#fileDiv").append(str);
    
            	} else {
            		alert("더이상 추가할 수 없습니다.");
            	}
    			
    			$("a[name='delete']").on("click",function(e){
                	console.log("삭제버튼누름");
					var a = $(this).attr('class');
					console.log("삭제버튼클릭한 태그의 클래스값"+a);
					
					$("input[name=imgnumber]").attr("value", "");
					$("#imgview .mainPhoto"+data[0].ptag+"").remove();
					$("#img-viewer_"+p_count).attr("src", "");
					$("p."+data[0].ptag+"").remove();
		
                })
    		}
    	});
    }
	
	var reviewNo = $("input[name=reviewNo]").val();
		
	$("input[name=delFile_0]").on("click",function(){
		del_count++;
		
		var p_count = $("p").length;
		var img = $("input[name=renamedFileNameOld_0]").val();
			
			$.ajax({
				url:"<%=request.getContextPath()%>/ajax/gson/review/deleteReviewImg",
				type:"post",
				dataType:"json",
				data:{img:img, reviewNo:reviewNo},
				success:function(data){
					console.log(data);
	
					$("#fname_0").hide();
					$("#oldimg_0").hide();
					$(".mainPhoto0").remove();
					
					
				},complete:function(){
					$("input[name=originalFileNameOld_0]").remove();
					$("input[name=renamedFileNameOld_0]").remove();
				}
				
			});
	});
	
	$("input[name=delFile_1]").on("click",function(){
		del_count++;

		var img = $("input[name=renamedFileNameOld_1]").val();
			
			$.ajax({
				url:"<%=request.getContextPath()%>/ajax/gson/review/deleteReviewImg",
				type:"post",
				dataType:"json",
				data:{img:img, reviewNo:reviewNo},
				success:function(data){
					console.log(data);
					
					$("#fname_1").hide();
					$("#oldimg_1").hide();
					$(".mainPhoto1").remove();
					
				},complete:function(){
					$("input[name=originalFileNameOld_1]").remove();
					$("input[name=renamedFileNameOld_1]").remove();
				}
			});
	});
	
	
	$("input[name=delFile_2]").on("click",function(){
		del_count++;
		
		var img = $("input[name=renamedFileNameOld_2]").val();
			
			$.ajax({
				url:"<%=request.getContextPath()%>/ajax/gson/review/deleteReviewImg",
				type:"post",
				dataType:"json",
				data:{img:img, reviewNo:reviewNo},
				success:function(data){
					console.log(data);
					
					$("#fname_2").hide();
					$("#oldimg_2").hide();
					$(".mainPhoto2").remove();
					
				},complete:function(){
					$("input[name=originalFileNameOld_2]").remove();
					$("input[name=renamedFileNameOld_2]").remove();
				}
			});
	});
	
	$("input[name=delFile_3]").on("click",function(){
		del_count++;
		
		var img = $("input[name=renamedFileNameOld_3]").val();
			console.log(img);
			
			$.ajax({
				url:"<%=request.getContextPath()%>/ajax/gson/review/deleteReviewImg",
				type:"post",
				dataType:"json",
				data:{img:img, reviewNo:reviewNo},
				success:function(data){
					console.log(data);
					
					$("#fname_3").hide();
					$("#oldimg_3").hide();
					$(".mainPhoto3").remove();
					
				},complete:function(){
					$("input[name=originalFileNameOld_3]").remove();
					$("input[name=renamedFileNameOld_3]").remove();
				}
			});
	});
	
	$("input[name=delFile_4]").on("click",function(){
		del_count++;
		
		var img = $("input[name=renamedFileNameOld_4]").val();
			console.log(img);
			
			$.ajax({
				url:"<%=request.getContextPath()%>/ajax/gson/review/deleteReviewImg",
				type:"post",
				dataType:"json",
				data:{img:img, reviewNo:reviewNo},
				success:function(data){
					console.log(data);
					
					$("#fname_4").hide();
					$("#oldimg_4").hide();
					$(".mainPhoto4").remove();
					
				},complete:function(){
					$("input[name=originalFileNameOld_4]").remove();
					$("input[name=renamedFileNameOld_4]").remove();
				}
			});
	
	});
	
	$("input[name=delFile_5]").on("click",function(){
		del_count++;
		
		var img = $("input[name=renamedFileNameOld_5]").val();
			console.log(img);
			
			$.ajax({
				url:"<%=request.getContextPath()%>/ajax/gson/review/deleteReviewImg",
				type:"post",
				dataType:"json",
				data:{img:img, reviewNo:reviewNo},
				success:function(data){
					console.log(data);
					
					$("#oldimg_5").hide();
					$("#fname_5").hide();
					$(".mainPhoto5").remove();
					
				},complete:function(){
					$("input[name=originalFileNameOld_5]").remove();
					$("input[name=renamedFileNameOld_5]").remove();
				}
			});
	});
	
	$("input[name=delFile_6]").on("click",function(){
		del_count++;
		
		var img = $("input[name=renamedFileNameOld_6]").val();
			console.log(img);
			
			$.ajax({
				url:"<%=request.getContextPath()%>/ajax/gson/review/deleteReviewImg",
				type:"post",
				dataType:"json",
				data:{img:img, reviewNo:reviewNo},
				success:function(data){
					console.log(data);
					
					$("#oldimg_6").hide();
					$("#fname_6").hide();
					$(".mainPhoto6").remove();
					
				},complete:function(){
					$("input[name=originalFileNameOld_6]").remove();
					$("input[name=renamedFileNameOld_6]").remove();
				}
			});
	});
	
	$("input[name=delFile_7]").on("click",function(){
		del_count++;
		
		var img = $("input[name=renamedFileNameOld_7]").val();
			console.log(img);
			
			$.ajax({
				url:"<%=request.getContextPath()%>/ajax/gson/review/deleteReviewImg",
				type:"post",
				dataType:"json",
				data:{img:img, reviewNo:reviewNo},
				success:function(data){
					console.log(data);
					
					$("#oldimg_7").hide();
					$("#fname_7").hide();
					$(".mainPhoto7").remove();
					
				},complete:function(){
					$("input[name=originalFileNameOld_7]").remove();
					$("input[name=renamedFileNameOld_7]").remove();
				}
			});
	});
	
	$("input[name=delFile_8]").on("click",function(){
		del_count++;
		
		var img = $("input[name=renamedFileNameOld_8]").val();
			console.log(img);
			
			$.ajax({
				url:"<%=request.getContextPath()%>/ajax/gson/review/deleteReviewImg",
				type:"post",
				dataType:"json",
				data:{img:img, reviewNo:reviewNo},
				success:function(data){
					console.log(data);
					
					$("#oldimg_8").hide();
					$("#fname_8").hide();
					$(".mainPhoto8").remove();
					
				},complete:function(){
					$("input[name=originalFileNameOld_8]").remove();
					$("input[name=renamedFileNameOld_8]").remove();
				}
			});
	});
	
	$("input[name=delFile_9]").on("click",function(){
		del_count++;
		
		var img = $("input[name=renamedFileNameOld_9]").val();
			console.log(img);
			
			$.ajax({
				url:"<%=request.getContextPath()%>/ajax/gson/review/deleteReviewImg",
				type:"post",
				dataType:"json",
				data:{img:img, reviewNo:reviewNo},
				success:function(data){
					console.log(data);
					
					$("#oldimg_9").hide();
					$("#fname_9").hide();
					$(".mainPhoto9").remove();
					
				},complete:function(){
					$("input[name=originalFileNameOld_9]").remove();
					$("input[name=renamedFileNameOld_9]").remove();
				}
			});
	});	
});
</script>

<script>
function loadImg(f){
 	console.log(f.files); //파일리스트
	console.log(f.files[0]); // 실제업로드한파일(리스트내에 존재)
	var p_count = $("p").length;
	console.log("이미지단에서의 p태그수="+p_count);
	
	if(f.files && f.files[0]){ //JavaScript에서는 값이 있으면 true, 없으면 false로 볼 수 있음
		var reader = new FileReader();
		//파일읽기메소드 호출. 읽기완료하면 onload에 등록된 함수를 호출
		reader.readAsDataURL(f.files[0]);
		reader.onload = function(){
			//result속성에는 파일컨텐츠가 담겨있음
			$("#img-viewer_"+(p_count-1)).attr("src", reader.result);
		}
	} 
}
</script>



</body>
</html>