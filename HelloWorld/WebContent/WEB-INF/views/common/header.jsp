<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			



