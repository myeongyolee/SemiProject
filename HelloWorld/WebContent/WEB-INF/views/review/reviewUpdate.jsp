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
				<input type="text" name="reviewNo" value="<%=rv.getReviewNo() %>" />
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
	
	var g_count = 0;
	var del_count = $("input[name=size]").val();

    $(document).ready(function(){
        
    $("#add").on("click",function(e){
            e.preventDefault();
            fn_fileAdd();
        })
    });
    
    function fn_fileAdd(){
    	
    	var p_count = $("p").length;
    	console.log("삭제된파일의 수"+del_count);
    	console.log("p태그숫자!"+p_count);
    	
    	$.ajax({
    		url:"<%=request.getContextPath()%>/test/testCheck2",
    		data:{g_count:g_count,p_count:p_count,del_count:del_count},
    		dataType:"json",
    		success:function(data){
    			console.log("json에서 넘어온 g_count"+data[0].number);
    			console.log("json에서 넘어온 p_count"+data[0].ptag);
    			console.log("json에서 넘어온 del_count"+data[0].del_count);
    			
    			if((data[0].ptag ) < 10 - data[0].del_count){
                	var str = "<p class='"+data[0].number+"'><input type='file' name='file_"+(data[0].number)+"'/><a href='#this' name='delete' class='"+data[0].number+"'>삭제하기</a></p> ";
                	$("#fileDiv").append(str);
                	g_count++;
            	} else {
            		alert("더이상 추가할 수 없습니다.");
            	}
    			
    			$("a[name='delete']").on("click",function(e){
                	console.log("삭제버튼누름");
					var a = $(this).attr('class');
					console.log("삭제버튼클릭한 태그의 클래스값"+a);
					$("a."+a+"").parent("p."+data[0].number+"").remove();
                })
    		}
    	});
    }
	
	var reviewNo = $("input[name=reviewNo]").val();
		
	$("input[name=delFile_0]").on("click",function(){
		del_count--;
		
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
					
					$("input[name=originalFileNameOld_0]").remove();
					$("input[name=renamedFileNameOld_0]").remove();
					
				}
				
			});
	});
	
	$("input[name=delFile_1]").on("click",function(){
		del_count--;

		var img = $("input[name=renamedFileNameOld_1]").val();
			
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
					$("input[name=originalFileNameOld_1]").remove();
					$("input[name=renamedFileNameOld_1]").remove();
				}
			});
	});
	
	
	$("input[name=delFile_2]").on("click",function(){
		del_count--;
		
		var img = $("input[name=renamedFileNameOld_2]").val();
			
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
					$("input[name=originalFileNameOld_2]").remove();
					$("input[name=renamedFileNameOld_2]").remove();
				}
			});
	});
	
	$("input[name=delFile_3]").on("click",function(){
		del_count--;
		
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
					$("input[name=originalFileNameOld_3]").remove();
					$("input[name=renamedFileNameOld_3]").remove();
				}
			});
	});
	
	$("input[name=delFile_4]").on("click",function(){
		del_count--;
		
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
					$("input[name=originalFileNameOld_4]").remove();
					$("input[name=renamedFileNameOld_4]").remove();
				}
			});
	
	});
	
	$("input[name=delFile_5]").on("click",function(){
		del_count--;
		
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
					$("input[name=originalFileNameOld_5]").remove();
					$("input[name=renamedFileNameOld_5]").remove();
				}
			});
	});
	
	$("input[name=delFile_6]").on("click",function(){
		del_count--;
		
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
					$("input[name=originalFileNameOld_6]").remove();
					$("input[name=renamedFileNameOld_6]").remove();
				}
			});
	});
	
	$("input[name=delFile_7]").on("click",function(){
		del_count--;
		
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
					$("input[name=originalFileNameOld_7]").remove();
					$("input[name=renamedFileNameOld_7]").remove();
				}
			});
	});
	
	$("input[name=delFile_8]").on("click",function(){
		del_count--;
		
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
					$("input[name=originalFileNameOld_8]").remove();
					$("input[name=renamedFileNameOld_8]").remove();
				}
			});
	});
	
	$("input[name=delFile_9]").on("click",function(){
		del_count--;
		
		var img = $("input[name=renamedFileNameOld_9]").val();
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
					$("#test_9").hide();
					$("#fname_9").html(html);
					
				},complete:function(){
					$("input[name=originalFileNameOld_9]").remove();
					$("input[name=renamedFileNameOld_9]").remove();
				}
			});
	});
	
	
});
</script>

<%-- <script>
var g_count = 0;

        $(document).ready(function(){
            
        $("#add").on("click",function(e){
                e.preventDefault();
                fn_fileAdd();
            })
        });
        
        function fn_fileAdd(){
        	
        	var p_count = $("p").length;
        	console.log("p태그숫자!"+p_count);
        	
        	$.ajax({
        		url:"<%=request.getContextPath()%>/test/testCheck",
        		data:{g_count:g_count,p_count:p_count},
        		dataType:"json",
        		success:function(data){
        			console.log("json에서 넘어온 g_count"+data[0].number);
        			console.log("json에서 넘어온 p_count"+data[0].ptag);
        			
        			if(data[0].ptag == 10){
        				alert("더이상 추가할 수 없습니다.");
        				return;
        			}
        			
        			if(data[0].ptag < 10){
                    	var str = "<p class='"+data[0].number+"'><input type='file' name='file_"+(data[0].number)+"'/><a href='#this' name='delete' class='"+data[0].number+"'>삭제하기</a></p> ";
                    	$("#fileDiv").append(str);
                    	g_count++;
                	}
        			
        			$("a[name='delete']").on("click",function(e){
                    	console.log("삭제버튼누름");
						var a = $(this).attr('class');
						console.log("삭제버튼클릭한 태그의 클래스값"+a);
						$("a."+a+"").parent("p."+data[0].number+"").remove();
                    })
        		}
        	});
        }
</script> --%>

</body>
</html>