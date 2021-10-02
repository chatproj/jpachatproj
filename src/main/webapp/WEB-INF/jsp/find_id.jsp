<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<form action="findacc.jsp">
				<div style="color: #56b7ba; margin-top: 5%; margin-bottom: 1%;">아이디</div>
				<input name="birth" type="text" id="id" style="text-align: center;">
				<div style="color: #56b7ba; margin-top: 5%; margin-bottom: 1%;">이메일</div>
				<input name="email" type="text" id="email" style="text-align: center;">
				<div style="color: #56b7ba; margin-top: 5%; margin-bottom: 1%;">성별</div>
				<div>
				<input type="radio" name="gender" value="male" style="font-size:17px; width:23px;height:23px" onclick="male()">남
				<input type="radio" name="gender" value="female" style="font-size:17px; width:23px;height:23px" onclick="female()">여<br>
				<button type="submit" id="signup_btn" class="signup_btn">
					비밀번호 찾기
				</button>
				</div>
			</form>	
</body>
</html>