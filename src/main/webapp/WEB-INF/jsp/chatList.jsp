<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.springframework.ui.Model"%>
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
			<%
				request.setCharacterEncoding("UTF-8");
				ArrayList<String> CnameList = (ArrayList<String>)request.getAttribute("list");

			%>
				<form method="POST" action="/chatlist">
				<% for(String str : CnameList){ %>
					<div class="chatList">
						<input type="submit" id="list" value=<%=str %> class="submit_btn">
					</div>	
				<% } %> 									
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