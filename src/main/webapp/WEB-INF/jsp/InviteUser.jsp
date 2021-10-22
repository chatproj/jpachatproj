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
				<form method="POST" action="/inviteuser">
					<div class="invite-box">
						<div class="inputlabel">방제목</div>
						<input type="text" name="cname" id="cname">
						<div id="cname_error" class="error"></div>
					</div>
					
					<div class="invite-box">
						<div class="inputlabel">아이디</div>
						<input type="text" name="uid" id="uid">
						<div id="uid_error" class="error"></div>
					</div>
					
					<input type="submit" id="submit_btn" value="초대하기"
						class="submit_btn">

				</form>
			</div>
		</div>
	</div>

	<!-- Script -->
	<script src="/js/account_form.js" type="text/javascript" charset="UTF-8"></script>
</body>
</html>