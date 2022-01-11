<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.example.chatproj.chatproj.domain.User"%>
<head>
<section id="header_container">
	<div id="header_form_container">
		<div class="header_form">
			<%
				String headerSession = (String) session.getAttribute("sessionId");
			%>
			
			<%
				if(headerSession != null){
			%>
			<form method="POST" action="/signout">
				<div class="section1">
					<div class="sessionStatus"><%=headerSession %></div>
					<input type="submit" id="signout" value="로그아웃" class="signout">
					
				</div>
			</form>
			
			<form method="POST" action="/deleteuser">
				<div class="section2">
					<input type="hidden" name="sessionId" value="<%=headerSession %>">
					<input type="submit" id="deleteuser" value="회원탈퇴" class="deleteuser">
				</div>
			</form>
			
			<div class="section3">
				<input type="button" onclick="location.href='/modifyUser'" id="modifyuser" value="회원정보수정" class="modifyuser">
			</div>
			
			<%
				}
			%>
		</div>
	</div>
</section>
</head>