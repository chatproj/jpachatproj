<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.example.chatproj.chatproj.domain.Chatlog_Table"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="java.util.HashMap"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>파일 다운로드</title>
</head>
<body>
			<%
				request.setCharacterEncoding("UTF-8");				
			HashMap<String, String> fileList = (HashMap<String, String>)request.getAttribute("filelist");
			%>
<%-- 	<% for(int i=0; i<fileList.size(); i++){ %>
    <a href="http://localhost:8080/download/<%=fileList.get(i) %>"><%=fileList.get(i) %></a>
    <% } %> --%>
    
    <form method="GET" action="/download">
	<% for(String key : fileList.keySet()){ %>
		<div class="chatList">
<%--  			<a name="fileparam" href="http://localhost:8080/download/<%=key %>"><%=fileList.get(key) %></a>  --%>
  			<input type="submit" id="list" name="fileparam" value="<%=key %>" class="submit_btn">
		</div>	
	<% } %>
	</form>
</body>

</html>