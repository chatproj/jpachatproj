<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>
<head>
<!-- css file -->
<%@ include file="./common/title.jsp"%>
<script type="text/javascript">
	window.addEventListener("DOMContentLoaded", function(){
		<%
			if(request.getParameter("message") != null && request.getParameter("message").equals("duplicateId")){
		%>
				alert("이미 존재하는 아이디입니다.");
		<%
			}else if(request.getParameter("message") != null && request.getParameter("message").equals("duplicateEmail")){
		%>
				alert("동일한 이메일입니다.");
		<%
			}
		%>
		
		<%
			int unum = (Integer) request.getAttribute("unum");
			String uid = (String) request.getAttribute("uid");
			String uname = (String) request.getAttribute("uname");
			String email = (String) request.getAttribute("email");
			String phone = (String) request.getAttribute("phone");
			String userimg = (String) request.getAttribute("userimg");
		%>
		
		function setErrorMessage(id, message){
			document.getElementById(id).innerText = message;
		}
	});
</script>
</head>
<body>

	<!-- Header -->
	<%@ include file="./common/header.jsp"%>
	<!-- form -->
	<div id="main_container">
		<div class="form_container">
			<div class="form">
				<form method="POST" action="/modify" enctype="multipart/form-data">
					<input type="hidden" name="unum" value="<%=unum %>">
					<div class="input-box">
						<div class="inputlabel">아이디</div>
						<input type="text" name="uid" id="uid" maxlength="15" value="<%=uid %>" readonly>
						<div id="uid_error" class="error"></div>
					</div>

					<div class="input-box">
						<div class="inputlabel">이름</div>
						<input type="text" name="uname" id="uname" maxlength="10" value="<%=uname %>">
						<div id="uname_error" class="error"></div>
					</div>

					<div class="input-box">
						<div class="inputlabel">이메일</div>
						<input type="email" name="email" id="email" maxlength="30" value="<%=email %>">
						<div id="email_error" class="error"></div>
					</div>

					<div class="input-box">
						<div class="inputlabel">비밀번호</div>
						<input type="password" name="upw" id="upw" maxlength="20">
						<div id="upw_error" class="error"></div>
					</div>

					<div class="input-box">
						<div class="inputlabel">비밀번호 재확인</div>
						<input type="password" name="upw_check" id="upw_check" maxlength="20">
						<div id="upw_check_error" class="error"></div>
					</div>

					<div class="input-box">
						<div class="inputlabel">휴대전화</div>
						<input type="text" name="phone_num" id="phone_num" maxlength="20" value="<%=phone %>">
						<div id="phone_num_error" class="error"></div>
					</div>
					
					<canvas id="imagecanvas" ></canvas>
					
					<div class="input-box">
						<div class="inputlabel">프로필이미지</div>
						<input type="file" name="userimg" id="userimg" maxlength="40">
						<div id="phone_num_error" class="error"></div>
					</div>

					<input type="submit" id="submit_btn" value="회원정보변경"
						class="submit_btn">

				</form>
			</div>
		</div>
	</div>

	<!-- Script -->
	<script type="text/javascript">
	    const canvas = document.getElementById('imagecanvas');
	    const context = canvas.getContext('2d');
	    
	    var origin_userimg = new Image();
	    origin_userimg.src = "userimg/<%=userimg %>";
	    origin_userimg.addEventListener("load", () => {
       		context.drawImage(origin_userimg, 0, 0, 300, 150);
	    });
	    
	    const fileChange = document.getElementById('userimg');
	    fileChange.addEventListener('change', function (event) {
	        let reader = new FileReader();
	        reader.onload = function (e){ 
	            userimg = new Image();   
	            userimg.src = e.target.result
	            userimg.onload = function(){
	            	context.drawImage(userimg, 0, 0, 300, 150);
	            	context.restore()
	            }
	        };    
	        reader.readAsDataURL(event.target.files[0])
	    });
    </script>
	<script src="/js/account_form.js" type="text/javascript" charset="UTF-8"></script>
</body>
</html>