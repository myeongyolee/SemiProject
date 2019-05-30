<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
    
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/index.css" />
<%@ include file="/WEB-INF/views/common/header.jsp" %>
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
	System.out.println("멤버로그드인=="+memberLoggedIn);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World</title>
>>>>>>> refs/remotes/origin/jimin

	<h5>내용웅애웅ㅇㅇ우</h5>
	<h5>내용웅애웅ㅇㅇ우</h5>
	<h5>내용웅애웅ㅇㅇ우</h5>
	<h5>내용웅애웅ㅇㅇ우</h5>
	<h5>내용웅애웅ㅇㅇ우</h5>
	<h5>내용웅애웅ㅇㅇ우</h5>
	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<<<<<<< HEAD

=======
<div id="test">
<input type="button" value="회원가입"
onclick="location.href='<%=request.getContextPath()%>/member/memberEnroll'"/>

<hr />

<!-- 로그인 메뉴/폼 -->
<div class="login-container" style="border:1px solid;">
<%-- 1.로그인하지 않은 경우 --%>
<%if(memberLoggedIn == null){ %>
	<form action="<%=request.getContextPath() %>/member/login" 
		  id="loginFrm"
		  method="post"
		  onsubmit="return loginValidate();">
		  <table>
		  	<tr>
		  		<td>
		  			<input type="text" 
		  				   name="memberId" 
		  				   id="memberId" 
		  				   placeholder="아이디"
		  				   value="<%=saveIdFlag?memberIdSaved:"" %>"/>
		  		</td>
		  		<td></td>
		  	</tr>
		  	<tr>
		  		<td>
		  			<input type="password" 
		  				   name="password" 
		  				   id="password"
		  				   placeholder="비밀번호" />
		  		</td>
		  		<td>
		  			<input type="submit" value="로그인" />
		  		</td>
		  	</tr>
		  	<tr>
		  		<td colspan="2">
		  			<input type="checkbox" 
		  				   name="saveId"
		  				   id="saveId"
		  				   <%=saveIdFlag?"checked":""%>/>
		  			<label for="saveId">아이디 저장</label>
		  			
		  		</td>
		  	</tr>
		  </table>
	</form>
<%
	}

	//로그인 성공한 경우
	else{
%>
	<table id="logged-in">
		<tr>
			<td><%=memberLoggedIn.getMemberName()%>님, 안녕하세용</td>
		</tr>
		<tr>
			<td>
				<input type="button" value="내 정보 보기"
					   onclick="location.href='<%=request.getContextPath()%>/member/memberView?memberId=<%=memberLoggedIn.getMemberId()%>'" />
				<input type="button" value="로그아웃" 
					   onclick="location.href='<%=request.getContextPath()%>/member/Logout'"/>
			</td>
		</tr>
	
	</table>

<%
	}
%>
</div>
<!-- 로그인 메뉴/폼 끝 -->

			
</div>
</body>
</html>
>>>>>>> refs/remotes/origin/jimin
