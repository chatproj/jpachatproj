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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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
				String sessionName = (String) request.getAttribute("sessionName");
				String cname = (String) request.getAttribute("cname");
				String userimg = (String) request.getAttribute("userimg");
				
				request.setCharacterEncoding("UTF-8");
				int cnumPK = (int) request.getAttribute("cnumPK");
				ArrayList<Chatlog_Table> chatlog = (ArrayList) request.getAttribute("chatlog");
				%>
				<div class="chatheader">
				
					<!--<button id="filelistbtn" class="filelistbtn"onclick="window.open('/2', 'file_list', 'resizable=no,width=500,height=300,location=no,status=no,scrollbars=yes');">파일</button>-->
					<button id="filelistbtn" onclick="openfilelist()">파일</button>
					<dialog id="downloadFile">
						<form method="dialog">
							<label>파일 선택</label>
							<select>
								<option>1</option>
								<option>2</option>
								<option>3</option>
							</select>
							<menu>
								<button value="cancel">나가기</button>
							</menu>
						</form>
					</dialog>
					
					<div class="chatroom_name"><%=cname %></div>
					<input type="submit" id="exitbtn" value="나가기" class="exitbtn" onclick="cnumtocontroller()">
				</div>
				<div id="chatform" class="chatform">
  					<% for(int i=0; i<chatlog.size(); i++){ %>
						<div>
					<% 	
						if(chatlog.get(i).getUnum() == sessionNum){
					%>
							<div class="myLog">
								<div class="myprofile">
									<div class="myname"><%=chatlog.get(i).getUname() %></div>
								<div class="myimg"><img class="img_inner" src='userimg/<%=chatlog.get(i).getFilename() %>'></div>
									
								</div>
								<div class="mymsg"><%=chatlog.get(i).getLog() %></div>
								<div class="mytime">time : <<%=chatlog.get(i).getTime() %>></div>
							</div>
					<% 
						}else{
					%>	
							<div class="yourLog">
								<div class="yourprofile">
									<div class="yourimg"><img class="img_inner" src='userimg/<%=chatlog.get(i).getFilename() %>'></div>
									<div class="yourname"><%=chatlog.get(i).getUname() %></div>
								</div>
								<div class="yourmsg"><%=chatlog.get(i).getLog() %></div>
								<div class="yourtime">time : <<%=chatlog.get(i).getTime() %>></div>
							</div>
					<% 
						}
					%>
						</div>	
					<% } %>				
				
				</div>
				<div id="yourMsg" class="yourMsg">
					<table class="inputTable">
						<tr>
							<form method="POST" action="/uploadFile" enctype="multipart/form-data">
								<input type="hidden" id="text" name="cnum" value="<%=cnumPK %>">
								<input type="hidden" id="text" name="unum" value="<%=sessionNum %>">
								<th><input id="uploadbtn" class="uploadbtn" type="file" name="fileupload" accept="*" /></th>
								<th><button type="submit" id="sendBtn" class="sendBtn">업로드</button></th>
							</form>
						</tr>
						<tr>
							<th><input id="chatting" class="chatting"  placeholder="보내실 메시지를 입력하세요."></th>
							<th><button onclick="send()" id="sendBtn" class="sendBtn">보내기</button></th>
						</tr>
					</table>
				</div>
				
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	var ws;
	var scrolldiv;
	var scrolldiv = document.getElementById("chatform");
	scrolldiv.scrollTop = scrolldiv.scrollHeight;
	
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
			console.log(msg);
			
			var msgarr = msg.split(",");
			console.log(msgarr[0]);
			console.log(msgarr[1]);
			console.log(msgarr[2]);
			console.log(msgarr[3]);
			console.log(msgarr[4]);
			
			if( msgarr[0] == <%=sessionNum %> ){
				var msgTemp = "<div>"
					msgTemp = "<div class='myLog'>"
					msgTemp += "<div class='myprofile'>"
					msgTemp += "<div class='myname'>"
					msgTemp += msgarr[1];
					msgTemp += "</div>"
					msgTemp += "<div class='myimg'>"
					msgTemp += msgarr[3];
					msgTemp += "</div>"
					msgTemp += "</div>"
					msgTemp += "<div class='mymsg'>"
					msgTemp += msgarr[2];
					msgTemp += "</div>"
					msgTemp += "<div class='mytime'>"
					msgTemp += "time : <"
					msgTemp += msgarr[4];
					msgTemp += ">"
					msgTemp += "</div>"
					msgTemp += "</div>"				
				$("#chatform").append(msgTemp);

			}else{
				var msgTemp = "<div>"
					msgTemp = "<div class='yourLog'>"
					msgTemp += "<div class='yourprofile'>"
					msgTemp += "<div class='yourimg'>"
					msgTemp += msgarr[3];
					msgTemp += "</div>"
					msgTemp += "<div class='yourname'>"
					msgTemp += msgarr[1];
					msgTemp += "</div>"
					msgTemp += "</div>"
					msgTemp += "<div class='yourmsg'>"
					msgTemp += msgarr[2];
					msgTemp += "</div>"
					msgTemp += "<div class='yourtime'>"
					msgTemp += "time : <"
					msgTemp += msgarr[4];
					msgTemp += ">"
					msgTemp += "</div>"
					msgTemp += "</div>"						
					$("#chatform").append(msgTemp);	
			}
			
			var scrolldiv = document.getElementById("chatform");
			scrolldiv.scrollTop = scrolldiv.scrollHeight;
			
		}
		document.addEventListener("keypress", function(e) {
			if (e.keyCode == 13) { //enter press
				send();
			}
		});
	}
	function send() {
		var uN = "<%=sessionNum %>";
		var uName = "<%=sessionName %>";
		var msg = $("#chatting").val();
		var img = "<img class='img_inner' src='/userimg/${userimg}'>";
		
		// 날짜시간
		var today = new Date();
		var hours = today.getHours();
		var minutes = today.getMinutes();
		var seconds = today.getSeconds();
		
		var nowtimes = hours+":"+minutes+":"+seconds;
		
		ws.send(uN+","+uName+","+msg+","+img+","+nowtimes);
		// controller로 메시지 넘기기
		AjaxToController(<%=cnumPK %>,msg, nowtimes);
		$('#chatting').val("");
	}
	
	function AjaxToController(getPkObj, getMsgObj, getNowTimeObj){		
		$.ajax({
			type: 'POST',
			url: "/chat",
			data: {
				cnumPK: getPkObj,
				msg: getMsgObj,
				nowtime: getNowTimeObj
			},
			success: function(data){
				
			},
			error: function(data){
				console.log("no", data);
			}
		});
	}
	
	function cnumtocontroller(){
		var cnumPK = "<%=cnumPK %>";
		console.log(cnumPK);
		AjaxCnumtoController(cnumPK);
		window.location.href="/chatList";
	}
	
	function AjaxCnumtoController(cnumPK){
 		$.ajax({
			type: 'POST',
			url: "/chatexit",
			data: {
				cnumPK: cnumPK
			},
			success: function(data){
				
			},
			error: function(data){
				console.log("no", data);
			}
		}); 		
	}
	
	
	var filelistbtn = document.getElementById('filelistbtn');
	var downloadFile = document.getElementById('downloadFile');
	function openfilelist(){
		if (typeof downloadFile.showModal === "function") {
			downloadFile.showModal();
			} else {
				alert("The <dialog> API is not supported by this browser");
		  }
	}

</script>
</html>