<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>사진 확인</title>
</head>
<body>
					<%
						request.setCharacterEncoding("UTF-8");
					String file = (String) request.getAttribute("file");
						out.print(file);
					%>	
	<div>
		 <img src="/userimg/${file}" style="width:500px;height:auto;">
	</div>
</body>
</html>