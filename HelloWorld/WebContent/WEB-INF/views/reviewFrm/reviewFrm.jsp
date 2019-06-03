<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰쓰기 페이지 입니다. </title>
<script src = "<%=request.getContextPath()%>/js/jquery-3.4.0.js"></script>
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous"> -->
<style>
/* review 쓰기페이지 */
div.review-container{
  position:relative;
  border:solid 1px black;
  max-width:680px;
  position:center;
  left-margin:100px;
  left-padding: 100px;}
/* h2{border: solid 1px black;
	border-radius:10%;
} */
.dropbtn {
  background-color: white;
  color: black;
  font-size: 16px;
  border: solid 1px black ;
  cursor: pointer;
  border-radius:5%;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content li {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content li:mouseover {background-color: white}

.dropdown:mouseover .dropdown-content {
  display: block;
}

.dropdown:mouseover .dropbtn {
  background-color: #3e8e41;
}
span#star2, span#star3, span#star4, span#star5{
 display: none;} 
span#star2:hover, span#star3:hover, span#star4:hover, span#star5:hover{
 display: inline-block;} 
</style>

</head>
<body>
<h3>Review 쓰기</h3>
<!--카테고리 고르기  -->
<br />
	<div class="review-container">			
		<div class="dropdown">
		  	<span><h6>카테고리</h6></span>&nbsp;&nbsp;&nbsp;
		  <button class="dropbtn">카테고리 </button>
		  <div class="dropdown-content">
		  <li id="맛집"> 맛집</li>
		  <li id="관광"> 관광</li>
		  <li id="휴양"> 휴양</li>
		  <li id="레져"> 레져</li>
		  </div>
		</div>
			
	<br />
	  <div class="form-group">
	    <label for="place">
	    <span><h6>장소</h6></span></label>&nbsp;&nbsp;&nbsp;
	    	<!--지도 창 띄우기 링크 -->
	    <a href=""><span class="fa fa-map-marker fa-2x" aria-hidden="true"></span></a>
	    <input type="text" class="form-control" id="formGroupExampleInput" placeholder="어디에 다녀오셨나요?">
	  </div>
  	<br />
	  <div class="form-group">
	    <label for="title">
	    <span><h6>제목</h6></span></label>
	    <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="제목을 지어주세요">
	  </div>
  	<br />
  		<span><h6>내용</h6></span>
		  <textarea name="message" rows="10" cols="80" placeholder="내용을 입력해주세요"></textarea>
		  <br>
		  <span><h6>이번 경험에 얼만큼 만족하셨나요?(★로 평가해주세요)</h6></span>
		  <br />
		   <span id="star1" class="fa fa-star fa-2x" aria-hidden="true"></span>
		   <span id="star2" class="fa fa-star fa-2x" aria-hidden="true"></span>
		   <span id="star3" class="fa fa-star fa-2x" aria-hidden="true"></span>
		   <span id="star4" class="fa fa-star fa-2x" aria-hidden="true"></span>
		   <span id="star5" class="fa fa-star fa-2x" aria-hidden="true"></span>
		   <br /><br />
		  <button type="reset" /> 초기화</button>&nbsp;&nbsp;&nbsp;
		  <button type="save" /> 저장</button>&nbsp;&nbsp;&nbsp;		  
		  <button type="submit"/> 제출</button>
		  <br />
	</div>

<script>
$(function(){
	/*카테고리 버튼에 클릭한 값 넣어주기  */
	$("li").click(function(){
		var li = $(this).attr("li");
		var html = $(this).text();
		console.log(html);
		$(".dropbtn").html(html);
	});
	$("span#star1").mouseover(function(){
		var star1 = $(this).attr("span#star1");
		var html= $(this).html("<br>완전 비추.절대 가지마세요."); 
		star1.html("<br>"+html);
		$("span#star2").css("position","inline-block").show();
			$("span#star1").mousemove(function(){
				star1.remove(html);
		});
	})
	$("span#star2").mouseover(function(){
		var star2 = $(this).attr("span#star2");
		var html = $(this).html("<br>그럭저럭 괜찮았아요. 그러나 다시 가고 싶지 않아요");
		star2.html("<br>"+html);
	})
	$("span#star3").mouseover(function(){
		var star3 = $(this).attr("span#star3");
		var html = $(this).html("<br>가격대비 괜찮았습니다.");
		star3.html("<br>"+html);
	})
	$("span#star4").mouseover(function(){
		var star4 = $(this).attr("span#star4");
		var html = $(this).html("<br>2% 부족하지만 좋았습니다.");
		star4.html("<br>"+html);
	})
	$("span#star5").mouseover(function(){
		var star5 = $(this).attr("span#star5");
		var html = $(this).html("<br>여기 대박. 다음에 또 갈꺼에요~!");
		star5.html("<br>"+html);
	})
	
});

</script>
</body>
</html>