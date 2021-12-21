<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>
<head>
<!-- css file -->
<%@ include file="./common/title.jsp"%>
<script type="text/javascript">
	window.addEventListener("DOMContentLoaded", function(){
		<%
			if(request.getParameter("message") != null && request.getParameter("message").equals("duplicateId")){
		%>
				alert("이미 존재하는 아이디입니다.");
		<%
			}else if(request.getParameter("message") != null && request.getParameter("message").equals("duplicateEmail")){
		%>
				alert("이미 존재하는 이메일입니다.");
		<%
			}
		%>
		
		function setErrorMessage(id, message){
			document.getElementById(id).innerText = message;
		}
	});
</script>
</head>
<body>

	<!-- Header -->
	<%@ include file="./common/header.jsp"%>
	<!-- form -->
	<div id="main_container">
		<div class="form_container">
			<div class="form">
				<form method="POST" action="/signup" enctype="multipart/form-data">
					<div class="input-box">
						<div class="inputlabel">아이디</div>
						<input type="text" name="uid" id="uid" maxlength="15">
						<div id="uid_error" class="error"></div>
					</div>

					<div class="input-box">
						<div class="inputlabel">이름</div>
						<input type="text" name="uname" id="uname" maxlength="10">
						<div id="uname_error" class="error"></div>
					</div>

					<div class="input-box">
						<div class="inputlabel">이메일</div>
						<input type="email" name="email" id="email" maxlength="30">
						<div id="email_error" class="error"></div>
					</div>

					<div class="input-box">
						<div class="inputlabel">비밀번호</div>
						<input type="password" name="upw" id="upw" maxlength="20">
						<div id="upw_error" class="error"></div>
					</div>

					<div class="input-box">
						<div class="inputlabel">비밀번호 재확인</div>
						<input type="password" name="upw_check" id="upw_check" maxlength="20">
						<div id="upw_check_error" class="error"></div>
					</div>

					<div class="input-box">
						<div class="inputlabel">휴대전화</div>
						<input type="text" name="phone_num" id="phone_num" maxlength="20">
						<div id="phone_num_error" class="error"></div>
					</div>
					
					<div class="input-box">
						<div class="inputlabel">프로필이미지</div>
						<input type="file" name="userimg" id="userimg" maxlength="40">
						<div id="phone_num_error" class="error"></div>
					</div>

					<input type="submit" id="submit_btn" value="회원가입"
						class="submit_btn">

				</form>
			</div>
		</div>
	</div>

	<!-- Script -->
	<script src="/js/account_form.js" type="text/javascript" charset="UTF-8"></script>
</body>
</html>