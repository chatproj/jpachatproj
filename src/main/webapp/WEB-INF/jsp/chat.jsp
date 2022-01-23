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
				<script type="text/javascript">
					window.addEventListener("DOMContentLoaded", function(){
						<%
							if(request.getParameter("message") != null && request.getParameter("message").equals("validuser")){
						%>
								alert("이미 존재하는 멤버입니다.");
						<%
							}
						%>
							
						<%
							String tempStart = request.getParameter("page");
							if(request.getParameter("page") != null){
						%>
							downloadFile.showModal();
						<%
							}
						%>
						
					});
				</script>
				
				<%			
				// session
				int sessionNum = (Integer) request.getAttribute("sessionNum");
				String sessionName = (String) request.getAttribute("sessionName");
				String cname = (String) request.getAttribute("cname");
				String userimg = (String) request.getAttribute("userimg");
				
				request.setCharacterEncoding("UTF-8");
				int cnumPK = (int) request.getAttribute("cnumPK");
				ArrayList<Chatlog_Table> chatlog = (ArrayList) request.getAttribute("chatlog");
				
				// filelist
				ArrayList<String> totalfile = (ArrayList) request.getAttribute("totalfile");
				int count = totalfile.size();

				
				int startPage = 0;
				int onePageCnt = 5;
				
				count = (int)Math.ceil((double)count/(double)onePageCnt);
				
				if(tempStart != null){
					startPage = (Integer.parseInt(tempStart)-1)*onePageCnt;
				}
				
				
				
				String fileList1 = (String) request.getAttribute("filelist");

				String[] fileList = fileList1.split("/");
				
				ArrayList<String> uname = new ArrayList<String>();
				ArrayList<String> filename = new ArrayList<String>();
				ArrayList<String> original_filename = new ArrayList<String>();
				ArrayList<String> time = new ArrayList<String>();
			
				if(fileList1 != null && fileList != null && !fileList1.equals("") && !fileList.equals("") ){
					for(String list : fileList){
						uname.add(list.toString().split(",")[0]);
						filename.add(list.toString().split(",")[1]);
						original_filename.add(list.toString().split(",")[2]);
						time.add(list.toString().split(",")[3]);
					}
				}else{
					uname.add("");
					filename.add("");
					original_filename.add("");
					time.add("");
				}
				
				//chatuserlist
				ArrayList<String> chatuserlist = (ArrayList) request.getAttribute("chatuserlist");
				ArrayList<String> chatuserlistimg = (ArrayList) request.getAttribute("chatuserlistimg");
				%>
				
				<%-- <% if(fileList1 != null && fileList != null && !fileList1.equals("") && !fileList.equals("")){ %>
				<% for(int i=0; i<fileList.length; i++) { %>
				<tr class="second_fileblock">
					<td class="originalfilename"><%=original_filename.get(i) %></td>
				<td class="fileusername"><%=uname.get(i) %></td>
				<td class="fileuploadtime"><%=time.get(i) %></td>
				  <form method="POST" action="/download">
				  	<input type="hidden" name="original_filename" value="<%=original_filename.get(i) %>">
				<input type="hidden" name="filename" value="<%=filename.get(i) %>">
				    <td><input type="submit" id="downloadbtn" value="다운로드" class="downloadbtn"></td>	
				</form>
				<form method="POST" action="filedelete">
					<input type="hidden" id="text" name="cnum" value="<%=cnumPK %>">
				<input type="hidden" name="filename" value="<%=filename.get(i) %>">
					    <td><input type="submit" id="filedeletebtn" value="삭제" class="filedeletebtn"></td>										
					</form>
				</tr>
				<% } %>
				<% }else{ %>
				
				<% } %>
				
				<%
					for(int i=1; i<=count; i++){
				%>
						<a href="chat?cnumPK=<%=cnumPK %>&page=<%=i %>">[<%=i %>]</a>
				<%
					}
				%> --%>
				
				<div class="chatheader">
				
				<div class="chatroom_name"><%=cname %></div>

					<div id="menu_btn" class="menu_btn">
						<img class="menuiconimg" src="/userimg/menu_icon.png">
						<div id="slideToggle" class="slideToggle">
							<div class="chatroomuserlist">
							<%
								for(int i=0; i<chatuserlist.size(); i++){
							%>
								<div class="chatuserlist">
									<div class="userimg"><img class="img_inner" src='userimg/<%=chatuserlistimg.get(i) %>'></div>
									<div class="username"><a class="username_txt"><%=chatuserlist.get(i) %></a></div>
								</div>
							<%
								}
							%>
							</div>
							<button id="invitebtn" class="invitebtn" onclick="openinvite()">친구초대</button>
							<button id="filelistbtn" class="filelistbtn" onclick="openfilelist()">파일</button>
							<input type="submit" id="exitbtn" value="나가기" class="exitbtn" onclick="AjaxExitController()">
						</div>
					</div>
					
					<dialog id="invite" class="invite">
						<form method="POST" action="/invitechat">
							<div class="invite-box">
								<div class="inputlabel">방제목</div>
								<input type="hidden" name="cnum" id="cnum" value="<%=cnumPK %>">
								<input type="text" name="cname" id="cname" value="<%=cname %>" readonly>
								<div id="cname_error" class="error"></div>
							</div>
							
							<div class="invite-box">
								<div class="inputlabel">아이디</div>
								<input type="text" name="uid" id="uid">
								<div id="uid_error" class="error"></div>
							</div>
							
							<input type="submit" id="submit_btn" value="초대하기"
								class="submit_btn">
		
						</form>
					</dialog>

					<dialog id="downloadFile" class="downloadFile" data-keyboard="false">
						<form method="dialog">
  						  		<table id="filelist_table" class="filelist_table">
  						  		<tr>
  						  			<th class="filelist_table_header_close" colspan="5"><button id="filelistexit" class="filelistexit" onclick="filelistexit()">X</button></th>
  						  		</tr>
  						  		<tr>
									<th class="filelist_table_header" id="filename_width">파일명</th>
									<th class="filelist_table_header">등록자</th>
									<th class="filelist_table_header">시간</th>
									<th class="filelist_table_header">다운로드</th>
									<th class="filelist_table_header">삭제</th>
								</tr>
								<% if(fileList1 != null && fileList != null && !fileList1.equals("") && !fileList.equals("")){ %>
								  	<% for(int i=0; i<fileList.length; i++) { %>
										<tr class="second_fileblock">
											<td class="originalfilename"><%=original_filename.get(i) %></td>
											<td class="fileusername"><%=uname.get(i) %></td>
											<td class="fileuploadtime"><%=time.get(i) %></td>
										    <form method="POST" action="/download">
										    	<input type="hidden" name="original_filename" value="<%=original_filename.get(i) %>">
												<input type="hidden" name="filename" value="<%=filename.get(i) %>">
											    <td><input type="submit" id="downloadbtn" value="다운로드" class="downloadbtn"></td>	
											</form>
											<form method="POST" action="filedelete">
												<input type="hidden" id="text" name="cnum" value="<%=cnumPK %>">
												<input type="hidden" name="filename" value="<%=filename.get(i) %>">
											    <td><input type="submit" id="filedeletebtn" value="삭제" class="filedeletebtn"></td>										
											</form>
										</tr>
									<% } %>
								<% }else{ %>

								<% } %>
								</table>
								<div class="chatlistpage">
									<%
									for(int i=1; i<=count; i++){
									%>
											 <a href="chat?cnumPK=<%=cnumPK %>&page=<%=i %>">[<%=i %>]</a>
											<%-- <a><input type="button" id="page" name="page" value="<%=i %>" onclick="page()"></a> --%>
									<%
										}
									%>
								</div>
							</form>
					</dialog>
					
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
							<%
								if(chatlog.get(i).getDivision().equals("text")){
							%>
								<div class="mymsg"><%=chatlog.get(i).getLog() %></div>
								<div class="mytime">time : < <%=chatlog.get(i).getTime() %> ></div>
							<%
								}else if(chatlog.get(i).getDivision().equals("file")){
							%>
								<form method='POST' action='/download' id="upfile" class="upfile">
									<input type='hidden' id="test" name='filename' value='<%=chatlog.get(i).getLog() %>'>
									<input type='hidden' name='original_filename' value='<%=chatlog.get(i).getUp_filename() %>'>
									<%-- <input type="text" name="sockoriginalfilename" value='<%=chatlog.get(i).getUp_filename() %>' readonly> --%>
									<div id="sockoriginalfilename" class="sockoriginalfilename">파일명 : <%=chatlog.get(i).getUp_filename() %></div>
									<input type='submit' id='downloadbtn' value='다운로드' class='downloadbtn'>
								</form>
								<div class="mytime">time : < <%=chatlog.get(i).getTime() %> ></div>								
							<%
								}
							%>
							</div>
					<% 
						}else{
					%>	
							<div class="yourLog">
								<div class="yourprofile">
									<div class="yourimg"><img class="img_inner" src='userimg/<%=chatlog.get(i).getFilename() %>'></div>
									<div class="yourname"><%=chatlog.get(i).getUname() %></div>
								</div>
							<%
								if(chatlog.get(i).getDivision().equals("text")){
							%>
								<div class="yourmsg"><%=chatlog.get(i).getLog() %></div>
								<div class="yourtime">time : < <%=chatlog.get(i).getTime() %> ></div>
							<%
								}else if(chatlog.get(i).getDivision().equals("file")){
							%>
								<form method='POST' action='/download' id="upfile" class="upfile">
									<input type='hidden' name='filename' value='<%=chatlog.get(i).getLog() %>'>
									<input type='hidden' name='original_filename' value='<%=chatlog.get(i).getUp_filename() %>'>
									<%-- <input type="text" name="sockoriginalfilename" value='<%=chatlog.get(i).getUp_filename() %>' readonly> --%>
									<div id="sockoriginalfilename" class="sockoriginalfilename">파일명 : <%=chatlog.get(i).getUp_filename() %></div>
									<input type='submit' id='downloadbtn' value='다운로드' class='downloadbtn'>
								</form>
								<div class="yourtime">time : < <%=chatlog.get(i).getTime() %> ></div>	
							<%
								}
							%>
							</div>
					<% 
						}
					%>
						</div>	
					<% } %>				
				
				</div>
				<div id="yourMsg" class="yourMsg">
					<table class="inputTable">	
							<form id="upload-file-form">
								<input type="hidden" id="text" name="cnum" value="<%=cnumPK %>">
								<input type="hidden" id="text" name="unum" value="<%=sessionNum %>">
								<th><input id="uploadinput" class="uploadinput" type="file" name="fileupload" accept="*" /></th>
								<th><button onclick="upload()" type="button" id="uploadBtn" class="sendBtn">업로드</button></th>
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

<!-- <script type="text/javascript">
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

	    },
	    error: function () {

	    }
	  });
	}

</script> -->

<script type="text/javascript">
	$(document).ready(function(){
		$('#menu_btn').click(function(){
			$('#slideToggle').animate({width: 'toggle'}, 400);		
		})
	})
</script>

<script type="text/javascript">
	// 업로드 파일 없을 시 응답X
	var uploadinput = document.getElementById("uploadinput");
	var uploadbtn = document.getElementById("uploadBtn");
	
	uploadbtn.disabled = true;
	
	uploadinput.addEventListener("change", stateHandle1);
	function stateHandle1(){
		if(document.querySelector("#uploadinput").value === ""){
			uploadbtn.disabled = true;
		}else{
			uploadbtn.disabled = false;
		}
	}
</script>

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
			var sessionNum = "<%=sessionNum%>";
			var msg = data.data;
			console.log(msg);
			
			var msgarr = msg.split(",");
			console.log(msgarr[0]);
			console.log(msgarr[1]);
			console.log(msgarr[2]);
			console.log(msgarr[3]);
			console.log(msgarr[4]);
			
			if( msgarr[0] == sessionNum ){
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
					msgTemp += "time : < "
					msgTemp += msgarr[4];
					msgTemp += " >"
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
					msgTemp += "time : < "
					msgTemp += msgarr[4];
					msgTemp += " >"
					msgTemp += "</div>"
					msgTemp += "</div>"						
					$("#chatform").append(msgTemp);	
			}
			var filesearch = msgarr[2].substring(86, 98); // value='file'
			console.log(filesearch);
			
			if(filesearch == "value='file'"){
				 location.reload();
				 loaction.reload();
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
		
		// 채팅 공백 시 응답x
		var chatinput = document.querySelector("#chatting");
		
		
		var cnumPK = "<%=cnumPK %>";
		if(chatinput.value != ""){
			ws.send(uN+","+uName+","+msg+","+img+","+nowtimes);
			// controller로 메시지 넘기기
			AjaxChat(cnumPK, msg, nowtimes);
			$('#chatting').val("");
		}
	}
	
	function upload() { 	
 		  $.ajax({
		    url: "/uploadFile",
		    type: "POST",
		    data: new FormData($("#upload-file-form")[0]),
		    enctype: 'multipart/form-data',
		    processData: false,
		    contentType: false,
		    cache: false,
		    success: function () {
		    	
		    },
		    error: function () {

		    }
		  }); 
	    var uN = "<%=sessionNum %>";
	    var uName = "<%=sessionName %>";		  
	    var file = "<form method='POST' action='/download'><input type='hidden' id='test' name='filename' value='file'><input type='button' id='downloadbtn' value='다운로드' class='downloadbtn'></form>";
	    var img = "<img class='img_inner' src='/userimg/${userimg}'>";

		// 날짜시간
		var today = new Date();
		var hours = today.getHours();
		var minutes = today.getMinutes();
		var seconds = today.getSeconds();
		
		var nowtimes = hours+":"+minutes+":"+seconds;
		
		setTimeout(function() {
			ws.send(uN+","+uName+","+file+","+img+","+nowtimes);
		}, 1000)

	}

</script>
<script type="text/javascript">
	var filelistbtn = document.getElementById('filelistbtn');
	var downloadFile = document.getElementById('downloadFile');
	function openfilelist(){
		if (typeof downloadFile.showModal === "function") {
			downloadFile.showModal();
			} else {
				alert("The <dialog> API is not supported by this browser");
		  }
	}
	
	function filelistexit(){
		downloadFile.addEventListener('close', function onClose(){
			
		});
	}


	var invite = document.getElementById('invite');
	function openinvite(){
		if(typeof invite.showModal === "function") {
			invite.showModal();
		}else{
			alert("The <dialog> API is not supported by this browser");
		}
	}

	
</script>
<script src="/js/AjaxController.js" type="text/javascript" charset="UTF-8"></script>
</html>