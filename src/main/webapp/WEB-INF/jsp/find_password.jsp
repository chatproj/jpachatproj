<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 가입</title>
	</head>
	<style>
		body{
				background-color: #FFFFFF;
			}
			.square{
				border: 1px solid white;
				border-radius: 20px;
				background: white;
				width: 400px; height: 380px;
				margin: 15%;
				box-shadow: 10px 10px 60px #8bbbbd;
			}
			.square_input{
				border: 1px solid gray;
				border-radius: 10px;
				background: white;
				width: 300px; height: 50px;
				margin: 5px;
			}
			input {
				border: 1px solid white;
				color: #c9c9c9;
				outline: none;
			}
		.gen_cir{
			border: 2px solid gray;
			width: 20px; height: 20px;
			border-radius: 10px;
		}
		.radio_btn{
			border: none;
		}
		#signup_btn { 
		border-radius: 10px;
		width: 300px; 
		height: 50px; 
		outline: none;
		font-size: 16px; 
		font: monospace; 
		background: #e1e1e1; 
		color: #4a6363; 
		font-weight: bold; 
		border: none; 
		margin-top: 5%; } 
		#signup_btn:hover { border-radius: 10px; width: 300px; height: 50px; outline: none; background: #8bbbbd; } 
		#id, #email{
			border: 1px solid gray;
			border-radius: 10px;
			background: white;
			width: 300px; height: 50px;
			color: black;
		}
	</style>
	<body>
		<div class="center" align="center">
			<div class="square" align="center" style="font-weight: bold; font: monospace;">
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
			</div>
		</div>
	</body>
</html>