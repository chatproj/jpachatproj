<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.example.chatproj.chatproj.domain.Chatlog_Table"%>
<%@page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
<!-- css file -->
<%@ include file="./common/title.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>
	<!-- Header -->
	<%@ include file="./common/header.jsp"%>
	<div id="main_container1">
		<div class="form_container1">
			<div class="form1">
				<%
				// session
				int sessionNum = (Integer) request.getAttribute("sessionNum");
				out.print(sessionNum);

				request.setCharacterEncoding("UTF-8");
				int cnumPK = (int) request.getAttribute("cnumPK");
				ArrayList<Chatlog_Table> chatlog = (ArrayList) request.getAttribute("chatlog");
				%>
				<h1>채팅</h1>
				<div id="chating" class="chating">
  					<% for(int i=0; i<chatlog.size(); i++){ %>
						<div>
					<% 	
						if(chatlog.get(i).getUnum() == sessionNum){
					%>
							<div class="myLog">my : <%=chatlog.get(i).getLog() %></div>
					<% 
						}else{
					%>	
							<div class="yourLog">your : <%=chatlog.get(i).getLog() %></div>
					<% 
						}
					%>
						</div>	
					<% } %>				
				
				</div>

				<div id="yourName">
					<input type="text" name="userName" id="userName" value="<%=sessionNum %>">
				</div>
				<div id="yourMsg">
					<table class="inputTable">
						<tr>
							<th>메시지</th>
							<th><input id="chatting" placeholder="보내실 메시지를 입력하세요."></th>
							<th><button onclick="send()" id="sendBtn">보내기</button></th>
						</tr>
					</table>
				</div>
				
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	var ws;
	wsOpen();

	function wsOpen() {
		ws = new WebSocket("ws://" + location.host + "/chating");
		wsEvt();
	}

	function wsEvt() {
		ws.onopen = function(data) {
			//소켓이 열리면 초기화 세팅하기
		}

		ws.onmessage = function(data) {
			var msg = data.data;
			msg.split(" ");
			if( msg[0] == <%=sessionNum %> ){
				$("#chating").append("<div><div class='myLog'>" + msg + "</div></div>");

			}else{
				$("#chating").append("<div><div class='yourLog'>" + msg + "</div></div>");				
			}
		}

		document.addEventListener("keypress", function(e) {
			if (e.keyCode == 13) { //enter press
				send();
			}
		});
	}

	function send() {
		var uN = $("#userName").val();
		var msg = $("#chatting").val();
		ws.send(uN + " -> " + msg);
		// controller로 메시지 넘기기
		AjaxToController(<%=cnumPK %>,msg);
		$('#chatting').val("");
	}
	
	function AjaxToController(getPkObj, getMsgObj){		
		$.ajax({
			type: 'POST',
			url: "/chat",
			data: {
				cnumPK: getPkObj,
				msg: getMsgObj
			},
			success: function(data){
				
			},
			error: function(data){
				console.log("no", data);
			}
		});
		
	}
	

</script>
</html>