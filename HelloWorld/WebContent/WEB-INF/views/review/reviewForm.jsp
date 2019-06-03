<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/reviewForm.css" />
<title>리뷰 쓰기</title>


</head>
<body>
<section id="review-container">
	<h2>리뷰 쓰기</h2>
	<form action="<%=request.getContextPath()%>/review/reviewFormEnd" 
		  method="post" 
		  enctype="multipart/form-data">
		<table id="tbl-board">
			<tr>
				<th>제목</th>
				<td><input type="text" name="reviewTitle"/></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" 
						   name="reviewWriter" 
						   value="<%=memberLoggedIn.getMemberId()%>" 
						   readonly/></td> <!-- value값 로그인된회원찍어주기 -->
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
				<td>
					<a href="#this" id="add" class="btn" >파일 추가하기</a>
					<div id="fileDiv">
					</div>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
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
					<textarea name="reviewContent" 
							  id="reviewContent" 
							  cols="30" rows="10">
					</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<span>얼마나 만족하셨나요?</span>
					<span class="star-input">
						<span class="input">
					    	<input type="radio" name="star-input" value="1" id="p1">
					    	<label for="p1">너무 별로였어요<i class="fa fa-frown-o" aria-hidden="true"></i></label>
					    	<input type="radio" name="star-input" value="2" id="p2">
					    	<label for="p2">그냥 그랬어요<i class="fa fa-frown-o" aria-hidden="true"></i></label>
					    	<input type="radio" name="star-input" value="3" id="p3">
					    	<label for="p3">가성비 괜찮았어요<i class="fa fa-meh-o" aria-hidden="true"></i></label>
					    	<input type="radio" name="star-input" value="4" id="p4">
					    	<label for="p4">좋았어요<i class="fa fa-smile-o" aria-hidden="true"></i></label>
					    	<input type="radio" name="star-input" value="5" id="p5">
					    	<label for="p5">정말 좋았어요<i class="fa fa-smile-o" aria-hidden="true"></i></label>
					  	</span>
					  	<output for="star-input"><b></b></output>						
					</span>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" value="취소"/>
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


 /* 별 평점 주기 */
var starRating = function(){
var $star = $(".star-input"),
    $result = $star.find("output>b");
	
  	$(document)
	.on("focusin", ".star-input>.input", 
		function(){
   		 $(this).addClass("focus");
 	})
		 
	   	.on("focusout", ".star-input>.input", function(){
	    	var $this = $(this);
	    	setTimeout(function(){
	      		if($this.find(":focus").length === 0){
	       			$this.removeClass("focus");
	     	 	}
	   		}, 100);
	 	 })  
		    .on("change", ".star-input :radio", function(){
		    	$result.text($(this).next().text());
		  	})
			    .on("mouseover", ".star-input label", function(){
			    	$result.text($(this).text());
			    })
				    .on("mouseleave", ".star-input>.input", function(){
				    	var $checked = $star.find(":checked");
				    		if($checked.length === 0){
				     	 		$result.text("");
			   		 	} else {
			     	 		$result.text($checked.next().text());
			    		}
  	});
};

starRating();
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>