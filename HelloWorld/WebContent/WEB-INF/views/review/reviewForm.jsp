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

<style>
section#review-container{
	width: 600px;
	margin: 0 auto;
	text-align: center;
}
section#review-container h2{
	margin: 10px 0;
}
</style>

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
   				<td>
   					<label for="select">장소 분류</label>
   					 <select class="" id="select" name="placeNo">
     					 <option value="1" selected="selected">맛집</option>
     					 <option value="2">쇼핑</option>
     					 <option value="3">휴양</option>
     					 <option value="4">레져</option>
     					 <option value="5">역사</option>
    				</select>
    			</td>
			</tr>	
			
			<tr>
				<th>첨부파일</th>
				<td><a href="#this" id="add" class="btn" >파일 추가하기</a></td>
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
                    	var str = "<p class='"+data[0].number+"'><input type='file' name='file_"+(data[0].number)+"' onchange='loadImg(this);'/><a href='#this' name='delete' class='"+data[0].number+"'>삭제하기</a></p> ";
                    	$("#fileDiv").append(str);
                    	g_count++;
                	}
        			
        			$("a[name='delete']").on("click",function(e){
                    	console.log("삭제버튼누름");
						var a = $(this).attr('class');
						console.log("삭제버튼클릭한 태그의 클래스값"+a);
						$("a."+a+"").parent("p."+data[0].number+"").remove();
						$("#img-viewer_"+p_count).attr("src", "");
                    })
        		}
        	});
        }
        
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