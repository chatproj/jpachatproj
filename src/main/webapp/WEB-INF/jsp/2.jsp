<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>  
<%@page import="com.example.chatproj.chatproj.domain.Chatlog_Table" %>
<%@page import="javax.servlet.http.HttpSession" %>
    
<!DOCTYPE html>
<html>
<head>
<!-- css file -->
<%@ include file="./common/title.jsp"%>
<script type="text/javascript">
	
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<img class='img_inner' src='/userimg/5I7dOPJMklkEgwJ8Vi0cB8AtAgjeupHC.png'>

<form id="upload-file-form">
  <input type="text" name="extra">
  <label for="upload-file-input">Upload your file:</label>
  <input id="upload-file-input" type="file" name="uploadfile" accept="*" />
  <button type="button" onclick="uploadFile();">업로드</button>
</form>

<script type="text/javascript">
function uploadFile() {
	  $.ajax({
	    url: "/uploadFile",
	    type: "POST",
	    data: new FormData($("#upload-file-form")[0]),
	    enctype: 'multipart/form-data',
	    processData: false,
	    contentType: false,
	    cache: false,
	    success: function () {
	      // Handle upload success
	      // ...
	    },
	    error: function () {
	      // Handle upload error
	      // ...
	    }
	  });
	}
</script>
</body>
</html>