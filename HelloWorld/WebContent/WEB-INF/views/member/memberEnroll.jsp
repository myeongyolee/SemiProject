<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.4.0.js"></script>
<style>
img#profile-viewer{
	border: 1px solid rgba(0,0,0,0);
	border-radius: 50%;
}
</style>
</head>
<body>
<section id="enroll-container">
<h1>Join Us,</h1>

<form action="<%=request.getContextPath()%>/member/memberEnrollEnd"
	  name="memberEnrollFrm" 
	  method="post"
	  enctype="multipart/form-data">
<table id="memberEnrollTable">
	<tr>
		<td rowspan="10">
			<div id="profile-div">
				<img id="profile-viewer"
					 src="<%=request.getContextPath()%>/images/profilebasic.png" 
					 width="150px"
					 />
			</div>
			<input type="file" 
				   name="profile" 
				   id="profile"
				   style="display:none"
				   onchange="loadProfile(this);"/>
			
		</td>
		<th>아이디</th>
		<td><input type="text" 
				   name="memberId"
				   id="memberId" 
				   required/>
			<input type="button" value="중복 검사"
			   onclick="checkIdDuplicate();" />
			<input type="hidden" id="isValid" value="0"/>
		</td>
	</tr>
	<tr>
		<th>이름</th>
		<td>
			<input type="text"
				   name="memberName"
				   id="memberName"
				   required/>
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" 
				   name="password"
				   id="password" 
				   required/>
		</td>
	</tr>
	<tr>
		<th>비밀번호 확인</th>
		<td><input type="password" 
				   id="passwordCheck"
				   required/>
		</td>
	</tr>
	<tr>
		<th>질문</th>
		<td>
			<select name="question" 
				    id="question"
				    required>
				<option value="">비밀번호 찾기 질문</option>
				<option value="나의 고향은?">나의 고향은?</option>
	            <option value="보물 1호는?">보물 1호는?</option>
	            <option value="어머니의 성함은?">어머니의 성함은?</option>
	            <option value="나의 가장 친한 친구는?">나의 가장 친한 친구는?</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>답</th>
		<td>
			<input type="text"
				   id="answer"
				   name="answer"
				   required/>
		</td>
	</tr>
	<tr>
		<th>성별</th>	
		<td>
			<input type="radio" 
				   name="gender"
				   id="genderF" 
				   value="F"
				   checked/>
			<label for="genderF">여</label>
			<input type="radio" 
				   name="gender"
				   id="genderM" 
				   value="M"/>
			<label for="genderF">남</label>
		</td>
	</tr>
	<tr>
		<th>생년월일</th>
		<td>
			<input type="date"
				   name="birth" 
				   id="birth"/>
		</td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td>
			<input type="tel"
				   name="tel"
				   id="tel"/>
		</td>
	</tr>
	<tr>
		<th>관심사</th>
		<td>
			<input type="checkbox" 
				   name="interest" 
				   id="interest0"
				   value="맛집"/>
			<label for="interest0">맛집</label>
			<input type="checkbox" 
				   name="interest" 
				   id="interest1"
				   value="관광"/>
			<label for="interest1">관광</label>
			<input type="checkbox" 
				   name="interest" 
				   id="interest2"
				   value="휴양"/>
			<label for="interest2">휴양</label>
			<input type="checkbox" 
				   name="interest" 
				   id="interest3"
				   value="레저"/>
			<label for="interest3">레저</label>
		</td>
	</tr>
	<tr>
		<td colspan="2"><button onclick="submitInvalid();">가입하기</button>
		</td>
	</tr>
	
</table>

</form>

</section>

<script>
$(function(){
	$("#profile-viewer").click(function(){
		$("#profile").click();
	});
});

function loadProfile(f){
	console.log(f.files);
	
	if(f.files && f.files[0]){
		var reader = new FileReader();
		reader.readAsDataURL(f.files[0]);
		reader.onload = function(){
			$("#profile-viewer").attr("src", reader.result);
		}
	}
}

function submitInvalid(){
	var file = $("#profile").val();
	console.log(file);
	if(file==""){
		$("#profile").remove();
		$("#memberEnrollFrm").submit();
	}
	else{
		$("#memberEnrollFrm").submit();
	}
}


</script>
</body>
</html>