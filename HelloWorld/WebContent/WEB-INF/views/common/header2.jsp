<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.*" %>
<%
	Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
	String visit = (String)request.getAttribute("visit");	

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
	<%
	if(visit!=null && "first".equals(visit)){
	%>
		$("#menubar").css("right","0px");
		$("#menubar").css("display","inline");
	<%
		visit = "none";
	}
	%>	
	
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
	var spec = "width=500px, height=800px, left=500px, top=100px";
		
	var popup = open(url, title, spec); 
}
</script>
</head>
<body>
<div id="container">
	<!-- 헤더 -->
	<header>
		<div id="header2-container" class="header">
			<%-- <a href="<%=request.getContextPath()%>">
			<img id="logo_img" src="<%=request.getContextPath()%>/images/logo.png"/>
			<span>HelloWorld</span>
			</a> --%>
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
				  onsubmit="loginSubmit();"
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
						<td rowspan="2">
							<input id="login_btn" 
								   type="submit" 
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
					</tr>
					<tr>
						<td colspan="3">
							<input type="checkbox" 
								   name="saveId" 
								   id="saveId"
								   <%=saveIdFlag?"checked":""%>/>
							<label id="saveId">아이디 저장</label>
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
					<td>
						<div id="profile-div">
						<img id="profile-viewer_"
					 		 src="<%=request.getContextPath()%>/upload/member/profile/<%=memberLoggedIn.getRenamedImgName()%>" 
					 		 width="100px" height="100px"/>
						</div>
					</td>
					<td><%=memberLoggedIn.getMemberName()%>님!<br>반갑습니다</td>
				</tr>
				<tr>
					<td>
						<input type='button' 
							   value='My Page'
							   onclick="location.href='<%=request.getContextPath()%>/member/memberMyPage?memberId=<%=memberLoggedIn.getMemberId()%>'"/>
					</td>
					<td>		   
						<input type='button'
							   value='LogOut'
							   onclick="location.href='<%=request.getContextPath()%>/member/Logout'"/>
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
		} 
		</script>
		
		
		
		
		<!-- 메뉴목록 -->
		<div id="menu">
			<ul id="menu-list1">
			<%if(memberLoggedIn != null) {%>
				<li><span><a href="<%=request.getContextPath()%>">일정보기</a></span></li>
			</ul>
			<ul id="menu-list2">
				<li><a href="<%=request.getContextPath()%>">찜리스트</a></li>
			</ul>
			<ul id="menu-list3">
				<li><a href="<%=request.getContextPath()%>">내글보기</a></li>			
			</ul>
			<ul id="menu-list4">
				<li><a href="<%=request.getContextPath()%>/review/reviewForm">리뷰쓰기</a></li>
			</ul>
			<ul id="menu-list5">
				<li><a href="<%=request.getContextPath()%>">문의사항</a></li>
			</ul>
			<%} %>
			<ul id="menu-list6">
				<li><a href="<%=request.getContextPath()%>/notice/noticeList">공지사항</a></li>
			</ul>
		</div>
		
	</div>
	<!-- 메뉴바 끝 -->
	
	<section id="content">
		