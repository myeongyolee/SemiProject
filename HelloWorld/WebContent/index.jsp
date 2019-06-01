<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/index.css" />
<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<head>
<meta charset="UTF-8">
<title>MainPage</title>
<script src = "<%=request.getContextPath()%>/js/jquery-3.4.0.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<style>
/*인덱스 페이지  검색 */
/*국가 입력 자동완성  */
ul#autocomplete{
	min-width:171px;
	border: 1px solid gray;
	 display: inline-block;
	padding: 0;
	margin: 0;
	display:none;
}
ul#autocomplete li{
	padding: 0 10px;
	list-style: none;
	cursor: pointer;
}
ul#autocomplete li.sel{
	background: pink;
	color:white;
}
/*사용자 입력값 하이라이트처리*/
span.srchval{color:red;}
div#destination {
	border: 1px solid;
}
/*나라 고르기  */
span.nation:hover {
	color: pink;
	cursor: pointer;
}
/*일정고르기  */

span.days:hover{
	color: blue;
	cursor: pointer;
	} 
h3#days, span.days{
	display:none;}
div#destination{
	display:none;
}
</style>
</head>
<body>
 <h2> HELLO WORLD</h2>
 <nav class="navbar navbar-light bg-light">
  <form class="form-inline">
    <input name="srchNation" id="srchNation" type="search" placeholder="나라를 입력해주세요."> &nbsp;
    <button id = "btn-search">검색</button>
   	
   	<ul id="autocomplete">
   		<li class="sel"></li>
   		<li></li>
   		<li></li>
   		<li></li>
   	</ul>
  </form>
  <br />
  <div id="destination">
  	<h3 id="nation">어디로 가실건가요? </h3>
  		<span class="nation" nid="일본" value="일본" >일본</span>&nbsp;&nbsp;&nbsp;
  		<span class="nation" nid="중국" >중국</span>&nbsp;&nbsp;&nbsp;
  		<span class="nation" nid="동남아" >동남아</span>&nbsp;&nbsp;&nbsp;
  		<span class="nation" nid="유럽" >유럽</span>&nbsp;&nbsp;&nbsp;
  		<span class="nation" nid="미국" >미국</span>&nbsp;&nbsp;&nbsp;
  		<span class="nation" nid="호주/뉴질랜드">호주/뉴질랜드</span>&nbsp;&nbsp;&nbsp;
  		<br /><br />
  	<h3 id="days"> 일정 </h3>
  		<br />
  		<span class="days" did="1">1~3일</span>&nbsp;&nbsp;&nbsp;
  		<span class="days" did="2">3~4일</span>&nbsp;&nbsp;&nbsp;
  		<span class="days" did="3">5~9일</span>&nbsp;&nbsp;&nbsp;
  		<span class="days" did="4">10~15일</span>&nbsp;&nbsp;&nbsp;
  		<span class="days" did="5">2주 이상</span>&nbsp;&nbsp;&nbsp;
  	<br />
  </div>
</nav>
<button type="button" class="review"><a href="<%=request.getContextPath()%>/reviewFrm"> 리뷰 작성 </a></button>
<script>
  //검색창을 클릭하면 나라 고르는 거 나오기
$(function(){ 
	$("input#srchNation").focus(function(){
	$("div#destination").css("transition","3s").show();
	
		$("span.nation").click(function(){
			var srchNation = $("#srchNation");
			var nid = $(this).attr("nid");
			var html = $(this).text();
			$(this).css("color", "pink");	
			 srchNation.val(html);
			if(nid == undefined) return;
			
			//나라를 클릭한 후에 일정 보여지기
			$("h3#days,span.days").css("transition","3s").show();
			
			//일정을 정하면 해당 국가 페이지로 이동
				$("span.days").click(function(){
				var did = $(this).attr("did");
				$(this).css("color", "blue");
				html += ", " + $(this).text();
				 srchNation.val(html);				
				location.href='<%=request.getContextPath()%>/nationToCity?nid=' +nid;			
			});
		});
	});
});
$(function(){	
	$("input#srchNation").keyup(function(key){
		var srchNation = $("#srchNation").val();
		console.log(srchNation);
			if(key.keyCode==13){
				//if(srchNation.length ==0) return;
			 location.href='<%=request.getContextPath()%>/nationToCity?nid=' +$(this).val();
				}
		});
	});

//자동 완성 기능
 $(function(){
    $("#srchNation").keyup(function(e){
        //눌린 키가 뭔지 알기 위해서 e라고 이벤트 객체를 받겠음
        var srchNation = $("#srchNation").val();
        //사용자 입력값이 공백인 경우, ajax 요청하지 않는다.
        if(srchNation.length == 0)
            return;
        
        var $sel = $(".sel");
        var $li = $("#autocomplete li");
        //사용자 입력값이 ArrowUp인 경우 (화살표 키 위로)
        if(e.key == 'ArrowUp'){          
            if($sel.length == 0){
                //처리 없음
            }
            //현재 선택된 요소가 $li 첫 번째 요소인 경우
            else if($sel.is($li.first())){
                $sel.removeClass("sel");
            }
            else{
                $sel.removeClass("sel").prev().addClass("sel");
            }} 
        //사용자 입력값이 ArrowDown인 경우 (화살표 키 밑으로)
        else if(e.key == 'ArrowDown'){
            if($sel.length == 0){
                $li.first().addClass("sel");
            }
            //현재 선택된 요소가 $li 마지막 요소인 경우
            else if($sel.is($li.last())){
                //처리 코드 없음
            }
            else{
                $sel.removeClass("sel")
                    .next()
                    .addClass("sel");
            }}
        //사용자 입력값이 Enter인 경우
        else if(e.key == 'Enter'){
        	//현재 선택값을 input 태그에 입력
        	$(this).css('transition','300');
            $(this).val($sel.text());
        	//검색어 목록을 감추고, li태그 삭제
        	$("#autocomplete").hide().children().remove();
        	$(this).css('transition','200');
            $(function(){
                location.href= '<%=request.getContextPath()%>/main/nationToCity?nid='+$(this).text();
                })
        	//선택된 값을 가지고, 다음 서비스 제공
        //	alert($(this).val()+"");
        }
        //그외 (ajax 요청 보낼 것. 위에 세 가지는 ajax 요청 보낼 필요 X)
        else{
            $.ajax({
                url: "<%=request.getContextPath()%>/main/search",
                data: "srchNation="+srchNation, //파라미터 직렬화. data속성으로 파라미터 전송.
                success: function(data){
                    console.log(data);
                    //$("#search").text(data);
                    
                    //넘어온 csv 데이타가 공백인 경우
                    if(data.trim().length == 0){
                        $("#autocomplete").hide();
                    }
                    else{
                        var nameArr = data.split(" ");
                        var html = "";
                        
                        for(var i=0; i<nameArr.length; i++){
                            html += "<li>"+nameArr[i].replace(srchNation, "<span class='srchval'>"+srchNation+"</span>")+"</li>";
                        $("#autocomplete").html(html).fadeIn(30);
                        }     }
                    }
                    })
                        //enter키 누르면 다음페이지로 넘어가기
                        $("#autocomplete").keyup(function(e){
                        	if(e.key==13)
                        	location.href='<%=request.getContextPath()%>/nationToCity?nid='+searchNation;
                        			/* +$(this).text(); */	
                        })
            }; 
    //end of ajax
        });
   //end of $("#srchName").keyup
    
<<<<<<< HEAD
    	//클릭이벤트가 일어난 li태그의 text를 input 태그에 입력
    $("#autocomplete").on("click","li",function(){
    	$("#srchName").val($(this).text());
    	$("#autocomplete").hide().children().remove();
    	location.href='<%=request.getContextPath()%>/nationToCity?nid='+$(this).text();	
    });
    $("#autocomplete").on("mouseover","li",function(){
    	$(this).siblings().removeClass("sel");
    	$(this).addClass("sel");
    });
    $("#autocomplete").on("mouseout","li",function(){
    	$(this).removeClass("sel");
    });
});
</script>	
</body>
	
=======
    
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/index.css" />

<style>
/*인덱스 페이지  검색 */
/*국가 입력 자동완성  */
ul#autocomplete{
	min-width:171px;
	border: 1px solid gray;
	 display: inline-block;
	padding: 0;
	margin: 0;
	display:none;
}
ul#autocomplete li{
	padding: 0 10px;
	list-style: none;
	cursor: pointer;
}
ul#autocomplete li.sel{
	background: pink;
	color:white;
}
/*사용자 입력값 하이라이트처리*/
span.srchval{color:red;}
div#destination {
	border: 1px solid;
}
/*나라 고르기  */
span.nation:hover {
	color: pink;
	cursor: pointer;
}
/*일정고르기  */

span.days:hover{
	color: blue;
	cursor: pointer;
	} 
h3#days, span.days{
	display:none;}
div#destination{
	display:none;
}
</style>
 <h2> HELLO WORLD</h2>
 <nav class="navbar navbar-light bg-light">
  <form class="form-inline">
    <input name="srchNation" id="srchNation" type="search" placeholder="나라를 입력해주세요."> &nbsp;
    <button id = "btn-search">검색</button>
   	
   	<ul id="autocomplete">
   		<li class="sel"></li>
   		<li></li>
   		<li></li>
   		<li></li>
   	</ul>
  </form>
  <br />
  <div id="destination">
  	<h3 id="nation">어디로 가실건가요? </h3>
  		<span class="nation" nid="일본" value="일본" >일본</span>&nbsp;&nbsp;&nbsp;
  		<span class="nation" nid="중국" >중국</span>&nbsp;&nbsp;&nbsp;
  		<span class="nation" nid="동남아" >동남아</span>&nbsp;&nbsp;&nbsp;
  		<span class="nation" nid="유럽" >유럽</span>&nbsp;&nbsp;&nbsp;
  		<span class="nation" nid="미국" >미국</span>&nbsp;&nbsp;&nbsp;
  		<span class="nation" nid="호주/뉴질랜드">호주/뉴질랜드</span>&nbsp;&nbsp;&nbsp;
  		<br /><br />
  	<h3 id="days"> 일정 </h3>
  		<br />
  		<span class="days" did="1">1~3일</span>&nbsp;&nbsp;&nbsp;
  		<span class="days" did="2">3~4일</span>&nbsp;&nbsp;&nbsp;
  		<span class="days" did="3">5~9일</span>&nbsp;&nbsp;&nbsp;
  		<span class="days" did="4">10~15일</span>&nbsp;&nbsp;&nbsp;
  		<span class="days" did="5">2주 이상</span>&nbsp;&nbsp;&nbsp;
  	<br />
  </div>
</nav>
<button type="button" class="review"><a href="<%=request.getContextPath()%>/reviewFrm"> 리뷰 작성 </a></button>
<script>
  //검색창을 클릭하면 나라 고르는 거 나오기
$(function(){ 
	$("input#srchNation").focus(function(){
	$("div#destination").css("transition","3s").show();
	
		$("span.nation").click(function(){
			var srchNation = $("#srchNation");
			var nid = $(this).attr("nid");
			var html = $(this).text();
			$(this).css("color", "pink");	
			 srchNation.val(html);
			if(nid == undefined) return;
			
			//나라를 클릭한 후에 일정 보여지기
			$("h3#days,span.days").css("transition","3s").show();
			
			//일정을 정하면 해당 국가 페이지로 이동
				$("span.days").click(function(){
				var did = $(this).attr("did");
				$(this).css("color", "blue");
				html += ", " + $(this).text();
				 srchNation.val(html);				
				location.href='<%=request.getContextPath()%>/nationToCity?nid=' +nid;			
			});
		});
	});
});
$(function(){	
	$("input#srchNation").keyup(function(key){
		var srchNation = $("#srchNation").val();
		console.log(srchNation);
			if(key.keyCode==13){
				//if(srchNation.length ==0) return;
			 location.href='<%=request.getContextPath()%>/nationToCity?nid=' +$(this).val();
				}
		});
	});

//자동 완성 기능
 $(function(){
    $("#srchNation").keyup(function(e){
        //눌린 키가 뭔지 알기 위해서 e라고 이벤트 객체를 받겠음
        var srchNation = $("#srchNation").val();
        //사용자 입력값이 공백인 경우, ajax 요청하지 않는다.
        if(srchNation.length == 0)
            return;
        
        var $sel = $(".sel");
        var $li = $("#autocomplete li");
        //사용자 입력값이 ArrowUp인 경우 (화살표 키 위로)
        if(e.key == 'ArrowUp'){          
            if($sel.length == 0){
                //처리 없음
            }
            //현재 선택된 요소가 $li 첫 번째 요소인 경우
            else if($sel.is($li.first())){
                $sel.removeClass("sel");
            }
            else{
                $sel.removeClass("sel").prev().addClass("sel");
            }} 
        //사용자 입력값이 ArrowDown인 경우 (화살표 키 밑으로)
        else if(e.key == 'ArrowDown'){
            if($sel.length == 0){
                $li.first().addClass("sel");
            }
            //현재 선택된 요소가 $li 마지막 요소인 경우
            else if($sel.is($li.last())){
                //처리 코드 없음
            }
            else{
                $sel.removeClass("sel")
                    .next()
                    .addClass("sel");
            }}
        //사용자 입력값이 Enter인 경우
        else if(e.key == 'Enter'){
        	//현재 선택값을 input 태그에 입력
        	$(this).css('transition','300');
            $(this).val($sel.text());
        	//검색어 목록을 감추고, li태그 삭제
        	$("#autocomplete").hide().children().remove();
        	$(this).css('transition','200');
            $(function(){
                location.href= '<%=request.getContextPath()%>/main/nationToCity?nid='+$(this).text();
                })
        	//선택된 값을 가지고, 다음 서비스 제공
        //	alert($(this).val()+"");
        }
        //그외 (ajax 요청 보낼 것. 위에 세 가지는 ajax 요청 보낼 필요 X)
        else{
            $.ajax({
                url: "<%=request.getContextPath()%>/main/search",
                data: "srchNation="+srchNation, //파라미터 직렬화. data속성으로 파라미터 전송.
                success: function(data){
                    console.log(data);
                    //$("#search").text(data);
                    
                    //넘어온 csv 데이타가 공백인 경우
                    if(data.trim().length == 0){
                        $("#autocomplete").hide();
                    }
                    else{
                        var nameArr = data.split(" ");
                        var html = "";
                        
                        for(var i=0; i<nameArr.length; i++){
                            html += "<li>"+nameArr[i].replace(srchNation, "<span class='srchval'>"+srchNation+"</span>")+"</li>";
                        $("#autocomplete").html(html).fadeIn(30);
                        }     }
                    }
                    })
                        //enter키 누르면 다음페이지로 넘어가기
                        $("#autocomplete").keyup(function(e){
                        	if(e.key==13)
                        	location.href='<%=request.getContextPath()%>/nationToCity?nid='+searchNation;
                        			/* +$(this).text(); */	
                        })
            }; 
    //end of ajax
        });
   //end of $("#srchName").keyup
    
    	//클릭이벤트가 일어난 li태그의 text를 input 태그에 입력
    $("#autocomplete").on("click","li",function(){
    	$("#srchName").val($(this).text());
    	$("#autocomplete").hide().children().remove();
    	location.href='<%=request.getContextPath()%>/nationToCity?nid='+$(this).text();	
    });
    $("#autocomplete").on("mouseover","li",function(){
    	$(this).siblings().removeClass("sel");
    	$(this).addClass("sel");
    });
    $("#autocomplete").on("mouseout","li",function(){
    	$(this).removeClass("sel");
    });
});
</script>	
    
    
    
>>>>>>> refs/remotes/origin/jimin
<%@ include file="/WEB-INF/views/common/footer.jsp" %>