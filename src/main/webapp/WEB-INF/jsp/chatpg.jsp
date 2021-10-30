<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<!-- css file -->
<%@ include file="./common/title.jsp"%>
<script type="text/javascript">
	
</script>

</head>
<body>
	<!-- Header -->
	<%@ include file="./common/header.jsp"%>
	
	<div id="main_container">
		<div class="form_container">
			<div class="form">
				<form method="POST" action="/chatpg">
					<div class="input-box">
						<div class="inputlabel">OOO chatting room</div>
					</div>
					
					<div class="chat_box">
					</div>
					
					<div class="sendtest_box" >
						<textarea placeholder="text input"></textarea>
						<input type="submit" id="submit_btn" value="send" class="sendtext_btn">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>