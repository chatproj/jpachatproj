<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>
<head>
<!-- css file -->
<%@ include file="./common/title.jsp"%>
</head>
<body>

	<!-- Header -->
	<%@ include file="./common/header.jsp"%>

	<!-- form -->
	<div id="main_container">
		<div class="form_container">

			<div class="form">
				<form method="POST" action="/signup">
					<div class="input-box">
						<div class="inputlabel">아이디</div>
						<input type="text" name="uid" id="uid">
						<div id="uid_error" class="error"></div>
					</div>

					<div class="input-box">
						<div class="inputlabel">이름</div>
						<input type="text" name="uname" id="uname">
						<div id="username_error" class="error"></div>
					</div>

					<div class="input-box">
						<div class="inputlabel">이메일</div>
						<input type="email" name="email" id="email">
						<div id="email_error" class="error"></div>
					</div>

					<div class="input-box">
						<div class="inputlabel">비밀번호</div>
						<input type="password" name="upw" id="upw">
						<div id="upw_error" class="error"></div>
					</div>

					<div class="input-box">
						<div class="inputlabel">비밀번호 재확인</div>
						<input type="password" name="upw_check" id="upw_check">
						<div id="upw_check_error" class="error"></div>
					</div>

					<div class="input-box">
						<div class="inputlabel">휴대전화</div>
						<input type="text" name="phone_num" id="phone_num">
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