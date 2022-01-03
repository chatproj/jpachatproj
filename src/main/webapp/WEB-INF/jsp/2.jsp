<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.example.chatproj.chatproj.domain.Chatlog_Table"%>
<%@page import="com.example.chatproj.chatproj.domain.Fileupload_Table"%>
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
/* 			HashMap<String, String> fileList = (HashMap<String, String>)request.getAttribute("filelist"); */
				String fileList1 = (String) request.getAttribute("filelist");

				String[] fileList = fileList1.split("/");
				
				ArrayList<String> uname = new ArrayList<String>();
				ArrayList<String> filename = new ArrayList<String>();
				ArrayList<String> original_filename = new ArrayList<String>();
				ArrayList<String> time = new ArrayList<String>();
				
				for(String list : fileList){
					uname.add(list.toString().split(",")[0]);
					filename.add(list.toString().split(",")[1]);
					original_filename.add(list.toString().split(",")[2]);
					time.add(list.toString().split(",")[3]);
				}
				
/* 				out.print(uname);
				out.print(filename);
				out.print(original_filename);
				out.print(time);
				
				for(int i=0; i<fileList.length; i++){
					out.print(uname.get(i));
				} */
				
				
				
			%>
<%-- 	<% for(int i=0; i<fileList.size(); i++){ %>
    <a href="http://localhost:8080/download/<%=fileList.get(i) %>"><%=fileList.get(i) %></a>
    <% } %> --%>
    
<%--     <form method="GET" action="/download">
	<% for(String key : fileList.keySet()){ %>
		<div class="chatList">
			<div>파일이름</div>
 			<a name="fileparam" href="http://localhost:8080/download/<%=key %>"><%=fileList.get(key) %></a> 
  			<input type="submit" id="list" name="fileparam" value="<%=key %>" class="submit_btn">
		</div>	
	<% } %>
	</form> --%>
	
	    <form method="GET" action="/download">
  	<% for(int i=0; i<fileList.length; i++) { %>
		<div class="chatList">
			<a><%=uname.get(i) %></a>
			<a><%=original_filename.get(i) %></a>
 			<a name="fileparam" href="http://localhost:8080/download/"></a> 
  			<input type="submit" id="list" name="fileparam" value="d" class="submit_btn">
		</div>	
	<% } %>
	</form>
</body>

</html>