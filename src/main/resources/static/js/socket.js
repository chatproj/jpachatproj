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