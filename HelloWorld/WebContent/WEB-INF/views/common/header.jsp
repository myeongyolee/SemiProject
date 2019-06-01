<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css" />
<script src="<%=request.getContextPath()%>/js/jquery-3.4.0.js"></script>
<script>
$(function(){
	/* 메뉴바 클릭 이벤트 */
	$("#menu_img").click(function(){
		$("#menubar").animate({'right':'0px'},300,'linear');
	});
	
	$("#close").click(function(){
		$("#menubar").animate({'right':'-300px'},300,'linear');
	});
});
</script>
</head>
<body>
	<div id="container">
		<!-- 헤더 -->
		<header>
			<div id="header-container">
				<a href="<%=request.getContextPath()%>">
				<img id="logo_img" src="<%=request.getContextPath()%>/images/logo.png"/>
				<span>HelloWorld</span>
				</a>
				
				<%-- <nav>
					<div id="index">
					<a href="<%=request.getContextPath()%>">인덱스를</a>&nbsp;&nbsp;
					<a href="<%=request.getContextPath()%>">이렇게</a>&nbsp;&nbsp;
					<a href="<%=request.getContextPath()%>">넣어야</a>&nbsp;&nbsp;
					<a href="<%=request.getContextPath()%>">홈페이지</a>&nbsp;&nbsp;
					<a href="<%=request.getContextPath()%>">같을텐데</a>
					</div>
				</nav> --%>
				
				<a href="<%=request.getContextPath()%>">
				<img id="chat_img" src="<%=request.getContextPath()%>/images/chat.png"/>
				</a>
				<img id="menu_img" src="<%=request.getContextPath()%>/images/menu.png"/>		
			</div>
		</header>
		
		<!-- 메뉴바 -->
		<div id="menubar">
			<span id="close">x</span>
			<form action="" 
				  id="loginfrm"
				  method="post"
				  onsubmit="return loginValidate();">
				  
				<span class="text">로그인이 필요합니다.</span>
				<br /><br />
				<table>
				<tr>
					<td>
						<img src="<%=request.getContextPath()%>/images/userid.png"/>
					</td>
					<td>
						<input type="text" id="memberId" placeholder="   ID" />
					</td>
					<td rowspan="2">
						<input id="login_btn" type="submit" value="로그인"/>
					</td>
				</tr>
				<tr>
					<td><img src="<%=request.getContextPath()%>/images/key.png"/></td>
					<td>
						<input type="password" id="password" placeholder="   PASSWORD" />
					</td>
				</tr>
				</table>
			<br />
			&nbsp;
			<input type="button" value="아이디/비밀번호찾기"
				   class="membermenu"
				   onclick="location.href='<%=request.getContextPath()%>'"/>
			<input type="button" value="회원가입"
				   class="membermenu"
				   onclick="location.href='<%=request.getContextPath()%>/member/memberEnroll'"/>
			
			</form>
			
			
			<!-- 메뉴목록 -->
			<div id="menu">
				<ul>
					<li><a href="<%=request.getContextPath()%>">공지사항</a></li>
					<li><a href="<%=request.getContextPath()%>">문의사항</a></li>
				</ul>
			</div>
			
		</div>
		
		<section id="content">
			



=======
<%@ page import="member.model.vo.*" %>
<%
	Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");

	//쿠키 관련 처리
	Cookie[] cookies = request.getCookies();
	boolean saveIdFlag = false;
	String memberIdSaved = "";
	
	if(cookies != null){
		for(Cookie c: cookies){
			String key = c.getName();
			String value = c.getValue();
			if("saveId".equals(key)){
				saveIdFlag = true;
				memberIdSaved = value;
			}
		}
	}
	if(memberLoggedIn != null){
	System.out.println(memberLoggedIn.getAnswer().replaceAll(" ", "").replaceAll("\\p{Z}", ""));
	}
	System.out.println("멤버로그드인=="+memberLoggedIn);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css" />
<script src="<%=request.getContextPath()%>/js/jquery-3.4.0.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function(){
	/* 메뉴바 클릭 이벤트 */
	$("#menu_img").click(function(){
		$("#menubar").animate({'right':'0px'},300,'linear');
		$("#menubar").css("display","inline");
	});
	
	$("#menubar-close").click(function(){
		$("#menubar").animate({'right':'-290px'},300, function(){
			$("#menubar").css("display","none");
		});
	});
	
	$("#chat-close").click(function(){
		$("#chat-container").css({'display':'none'});
	});
	
});

$(function() {
	 $("#chat-container").draggable();
});



function chatFunction(){
	  var x = document.getElementById("chat-container");
	  if (x.style.display === "none") {
	    x.style.display = "block";
	  } else {
	    x.style.display = "none";
	  }
}

function findMember(){
	//아이디, 비밀번호 찾기 팝업 생성
	var url = "<%=request.getContextPath()%>/member/findMember";
	var title = "findMember";
	var spec = "width=500px, height=750px, left=500px, top=100px";
		
	var popup = open(url, title, spec); 
}
</script>
</head>
<body>
<div id="container">
	<!-- 헤더 -->
	<header>
		<div id="header-container">
			<a href="<%=request.getContextPath()%>">
			<img id="logo_img" src="<%=request.getContextPath()%>/images/logo.png"/>
			<span>HelloWorld</span>
			</a>
			<%-- <nav>
				<div id="index">
				<a href="<%=request.getContextPath()%>">인덱스를</a>&nbsp;&nbsp;
				<a href="<%=request.getContextPath()%>">이렇게</a>&nbsp;&nbsp;
				<a href="<%=request.getContextPath()%>">넣어야</a>&nbsp;&nbsp;
				<a href="<%=request.getContextPath()%>">홈페이지</a>&nbsp;&nbsp;
				<a href="<%=request.getContextPath()%>">같을텐데</a>
				</div>
			</nav> --%>
			
			<img id="chat_img" src="<%=request.getContextPath()%>/images/chat.png" onclick="chatFunction();"/>
			<img id="menu_img" src="<%=request.getContextPath()%>/images/menu.png"/>		
		</div>
	</header>
	
	<!-- 채팅화면 -->
        <div id="chat-container">
            <span id="chat-title">1:1 문의하기</span>
            <span id="chat-close">x</span>
            <div id="msg-container">
                <ul class="list-group list-group-flush">웅dodododd앵웅doddodododod</ul>
                <ul class="list-group list-group-flush">웅앵웅</ul>
                <ul class="list-group list-group-flush">웅앵웅</ul>
                <ul class="list-group list-group-flush">웅앵웅</ul>
                <ul class="list-group list-group-flush">웅앵웅</ul>
                <ul class="list-group list-group-flush">웅앵웅</ul>
                <ul class="list-group list-group-flush">웅앵웅</ul>
                <ul class="list-group list-group-flush">웅앵웅</ul>
                <ul class="list-group list-group-flush">웅앵웅</ul>
                <ul class="list-group list-group-flush">웅앵웅</ul>
                <ul class="list-group list-group-flush">웅앵웅</ul>
                <ul class="list-group list-group-flush">웅앵웅</ul>
                <ul class="list-group list-group-flush">웅앵웅</ul>
            </div>
            
            <div id="input">
                <input type="text"/>
                <button>전송</button>
            </div>        
        </div>
	
	<!-- 메뉴바 -->
	<div id="menubar">
		<span id="menubar-close">X</span>
		<!-- 로그인 메뉴/폼 -->
		<div class="login-container">
		<%-- 1.로그인하지 않은 경우 --%>
		<%if(memberLoggedIn == null){ %>
			<form action="<%=request.getContextPath() %>/member/login" 
				  id="loginfrm"
				  method="post"
				  >
				<span class="text">로그인이 필요합니다.</span>
				<br /><br />
				<table>
					<tr>
						<td>
							<img src="<%=request.getContextPath()%>/images/userid.png"/>
						</td>
						<td>
							<input type="text" 
								   name="memberId" 
								   id="memberId" 
								   placeholder="   ID"
								   value="<%=saveIdFlag?memberIdSaved:"" %>"/>
						</td>
						<td>
							<input id="login_btn" 
								   type="button" 
								   onclick="loginSubmit();"
								   value="로그인"/>
						</td>
						
					</tr>
					
					<tr>
						<td><img src="<%=request.getContextPath()%>/images/key.png"/></td>
						<td>
							<input type="password" 
								   name="password" 
								   id="password"
								   placeholder="   PASSWORD" />
						</td>
						<td>
							<input type="checkbox" 
								   name="saveId" 
								   id="saveId"
								   <%=saveIdFlag?"checked":""%>/>
							<label for="saveId">아이디 저장</label>
						</td>
					</tr>
					
				</table>
			<br />
			&nbsp;
			<input type="button" value="아이디/비밀번호찾기"
				   class="membermenu"
				   onclick="findMember();"/>
			<input type="button" value="회원가입"
				   class="membermenu"
				   onclick="location.href='<%=request.getContextPath()%>/member/memberEnroll'"/>
			</form>
		<%
		}
		else{
		%>
			<table id='logged-in'>
				<tr>
					<td rowspan="2">
						<div id="profile-div">
						<img id="profile-viewer"
					 		 src="<%=request.getContextPath()%>/upload/member/profile/<%=memberLoggedIn.getRenamedImgName()%>" 
					 		 width="100px" height="100px"/>
						</div>
					</td>
					<td><%=memberLoggedIn.getMemberName()%>님! 안녕하세용</td>
				</tr>
				<tr>
					<td>
						<input type='button' 
							   value='My Page'
							   onclick="location.href='<%=request.getContextPath()%>/member/memberMyPage?memberId=<%=memberLoggedIn.getMemberId()%>'"/>
						<input type='button'
							   value='LogOut'
							   onclick="logoutFunction();"/>
					</td>
				</tr>
			</table>
		
		<%
		}
		%>
			
		<input type="hidden" name="loginCheck" id="loginCheck" value="0"/>
		</div>
		<!-- 로그인 메뉴/폼 끝 -->	
		
		<script>
		<%--로그인을 ajax로 처리할 겁니당--%>
		function loginSubmit(){
			if($("#memberId").val().trim().length == 0){
				alert("아이디를 입력하세요.");
				$("#memberId").focus();
				return;
			}
			
			if($("#password").val().trim().length == 0){
				alert("비밀번호를 입력하세요.");
				$("#password").focus();
				return;
			}
			
			var param = {
					memberId : $("#memberId").val(),
					password : $("#password").val(),
					saveId : $("#saveId").val()
			}
			console.log("아이디="+memberId);
			console.log("비번="+password);
			
			
			$.ajax({
				url: "<%=request.getContextPath() %>/member/login",
				data: param,
				dataType: "json",
				success: function(data){
					var member = data;
					var msg = member.msg;
					var html = "";
					var memberId = member.memberId;
					//console.dir(data);
					if(msg=='로그인성공'){
						var memberName = member.memberName;
						var memberProfile = member.renamedImgName;
						
						html += "<table id='logged-in'><tr>";
						html+="<td rowspan='2'><div id='profile-div'>";
						html+="<img id='profile-viewer'";
						html+="src='<%=request.getContextPath()%>/upload/member/profile/"+memberProfile+"'";
						html+=" width='100px' height='100px'/></div></td>";
					 		 
						html+="<td>"+memberName+"님! 안녕하세용</td></tr>";
						html+="<tr><td><input type='button' value='My Page'/>";
						html+=" <input type='button' value='LogOut'";
						html+="onclick='logoutFunction();'/>";
						
						html+="</td></tr></table>";
						$(".login-container").html(html);

	
						var menu = "<ul><li><a href='<%=request.getContextPath()%>'>일정보기</a></li>";
						menu+="<li><a href='<%=request.getContextPath()%>/test'>내글보기</a></li>";
						menu+="<li><a href='<%=request.getContextPath()%>'>찜리스트</a></li>";
						menu+="<li><a href='<%=request.getContextPath()%>'>리뷰쓰기</a></li>";
						menu+="<li><a href='<%=request.getContextPath()%>'>공지사항</a></li>";
						menu+="<li><a href='<%=request.getContextPath()%>'>문의사항</a></li></ul>";
						
						$("#menu").html(menu);
					
						
<%-- 						var id = {
								memberId : memberId
						}
						$.ajax({
							url: "<%=request.getContextPath() %>/member/getMemberLoggedIn",
							data: id,
							success: function(data){
								console.log(data);
							},
							error: function(a, b, c){
								console.log(a);
								console.log(b);
								console.log(c);
							}
						}); --%>
					}
					
					else{
						alert(msg);
					}
				},
				error: function(a, b, c){
					console.log(a);
					console.log(b);
					console.log(c);
				}
				
			});
		} 
		
		function logoutFunction(){
			location.href="<%=request.getContextPath()%>/member/Logout";
		}
		
		</script>
		
		
		
		
		<!-- 메뉴목록 -->
		<div id="menu">
			<ul>
			<%if(memberLoggedIn != null) {%>
				<li><a href="<%=request.getContextPath()%>">일정보기</a></li>
				<li><a href="<%=request.getContextPath()%>">내글보기</a></li>
				<li><a href="<%=request.getContextPath()%>">찜리스트</a></li>
				<li><a href="<%=request.getContextPath()%>">리뷰쓰기</a></li>
				<li><a href="<%=request.getContextPath()%>">문의사항</a></li>
			<%} %>
				<li><a href="<%=request.getContextPath()%>">공지사항</a></li>
			</ul>
		</div>
		
	</div>
	<!-- 메뉴바 끝 -->
	
	<section id="content">
		
>>>>>>> refs/remotes/origin/jimin
