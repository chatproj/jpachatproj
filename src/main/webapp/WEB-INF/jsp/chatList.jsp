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
				<form method="POST" action="/chatlist">
					<div class="chatList">
						<input type="submit" id="list" value="채팅1" class="submit_btn">
					</div>
					<div class="chatList">
						<input type="submit" id="list" value="채팅2" class="submit_btn">
					</div>
					<div class="chatList">
						<input type="submit" id="list" value="채팅3" class="submit_btn">
					</div>										
				</form>
				
				<div class="borderline">
					<div class="chatList_btn">
					<input type="submit" id="create_room" value="방만들기" class="submit_btn" onclick="location.href='/inviteuser'">
					<input type="submit" id="delete_room" value="삭제" class="submit_btn">
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Script -->
	<script src="/js/account_form.js" type="text/javascript" charset="UTF-8"></script>
</body>
</html>