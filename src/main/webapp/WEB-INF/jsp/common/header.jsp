<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.example.chatproj.chatproj.domain.User"%>
<head>
<section id="header_container">
	<div id="header_form_container">
		<div class="header_form">
			<form method="POST" action="/signout">
				<div class="section1">
				<%
				String headerSession = (String) session.getAttribute("sessionId");
				%>
								
				<%
					if(headerSession != null){
				%>
					<div class="sessionStatus"><%=headerSession %></div>
					<input type="submit" id="signout" value="로그아웃" class="signout">
				<%
					}
				%>
				</div>
			</form>
		</div>
	</div>
</section>
</head>