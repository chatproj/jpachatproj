<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{ 
		margin: 0; 
		padding: 0; 
	}
 
	.header { 
		font-size: 20px; 
		padding: 10px 0; 
		background-color: gray; 
		color: white; 
		text-align: center;  
	}
 
	.chat { 
		padding-bottom: 80px; 
	}
 
	.textbox { 
		position: fixed; 
		float: left;
		bottom: 0; 
		width: 100%; 
		background-color: white; 
		text-align: center; 
		border-top: 1px solid black; 
	}
	
	.textbox > textarea { 
		width: 85%; 
		height: 80px;
		padding: 10px;
		border: 0;
		font-size: 15px;
	}
	
	.send_btn {
		float: right;
	    line-height: 2.5;
	    padding: 0 10px;
	    border-radius: 10px;
	    background-color: gray;
	    color: white;
	    text-align: center;
	    font-size: 15px;
	}
	
</style>
</head>
<body>
<div class="chat_room">
	
    	<div class="header">
    		OOO chatting room
    	</div>
    	
   		<div class="chat">
        	<div>
        		Chatting
        	</div>
    	</div>
    	
    	<div class="textbox" >
        	<textarea placeholder="text input"></textarea>
        	<button class="send_btn" type="button">send</button>
    	</div>
	</div>
</body>
</html>