	function AjaxChat(getPkObj, getMsgObj, getNowTimeObj){		
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
	
	function AjaxExit(){
		var cnumPK = "<%=cnumPK %>";
		console.log(cnumPK);
		AjaxExitController(cnumPK);
		window.location.href="/chatList";
	}
	
	function AjaxExitController(cnumPK){
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