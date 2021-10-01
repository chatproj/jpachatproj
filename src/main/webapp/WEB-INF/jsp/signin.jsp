<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<form method="method" id="idForm" >
	
	<div>
	
	<label for="loginid">아이디</label>
	
	<input type="email" id="loginid" name="loginid" placeholder="id" >
	
	<label for="loginpw">비밀번호</label>
	
	<input type="password" id="loginpw" name="password" placeholder="password" >
	
	</div>
	
	<button type="submit" disabled="disabled">로그인</button>
	
	<div>
	
	<input type="checkbox" id="keeplogin" name="keeplogin">
	
	<label for="keeplogin"><span>로그인 중</span></label>
	
	</div>
	
	</form>
</body>
</html>