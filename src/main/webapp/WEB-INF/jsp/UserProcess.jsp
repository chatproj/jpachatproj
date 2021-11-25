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

	<div id="main_container">
		<div class="form_container">
			<div class="form">
					<%
						request.setCharacterEncoding("UTF-8");
						String uid = (String)request.getParameter("redirectprocess");
					%>		
					<div class="finduser_id">
					<%
						if(uid.equals("존재하지 않는 ID 입니다.") || uid == "존재하지 않는 ID 입니다."){
					%>
							<a class="findinform">존재하지 않는 ID 입니다.</a>
					<%
						}else{
					%>
						<a class="finduser_in">고객님의 아이디는</a>
						<a class="findinform"><%=uid %></a>
						<a class="finduser_in">입니다.</a>
					<%
						}
					%>
					</div>				
					
					<div class="finduser_btn">
					<input type="submit" id="find_submit_btn" value="로그인" class="find_submit_btn" onclick="location.href='/signin'">
					<input type="submit" id="find_submit_btn" value="패스워드 찾기" class="find_submit_btn" onclick="location.href='/findpw'">
					</div>

			</div>
		</div>
	</div>

	<!-- Script -->
	<script src="/js/account_form.js" type="text/javascript" charset="UTF-8"></script>
</body>
</html>