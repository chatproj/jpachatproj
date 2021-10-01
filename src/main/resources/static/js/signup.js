window.addEventListener("DOMContentLoaded", function(){

	var username = document.getElementById("username");
	var email = document.getElementById("email");
	var pass = document.getElementById("password");
	var pass_check = document.getElementById("password_check");
	var phone_num = document.getElementById("phone_num");

/*	
	var username_error = document.getElementById("username_error");
	var email_error = document.getElementById("email_error");
	var pass_error = document.getElementById("pass_error");
	var pass_check_error = document.getElementById("pass_check_error");
	var phone_num_error = document.getElementById("phone_num_error");
*/
	
	username.addEventListener("keyup", function(){
		if(username.value == "" || username.value.length == 0){
			setErrorMessage("username_error", "필수 정보입니다.");		
		}else{
			var pattern = /[^a-zA-Z0-9]/;
			if(pattern.test(username.value)){
				setErrorMessage("username_error", "영어와 숫자를 조합해주세요.");
			}else{
				removeErrorMessage("username_error");
			}
		}
	});
	
	email.addEventListener("keyup", function(){
		var pattern = /^[a-zA-Z0-9]+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]+$/;
		if(email.value == "" || email.value.length == 0){
			setErrorMessage("email_error", "필수 정보입니다.");
		}else{
			if(!pattern.test(email.value)){
				setErrorMessage("email_error", "이메일 형식으로 입력해주세요.")
			}else{
				removeErrorMessage("email_error");
			}
		}
	});
	
	pass.addEventListener("keyup", function(){
		var level = passwordLevel(pass.value);
		if(level == 0){
			setErrorMessage("pass_error", "필수 정보입니다.");
		}else{
			if(level == 1 || level == 2 || level == 3){
				setErrorMessage("pass_error", "영문,숫자,특수문자를 사용항세요.")
			}else{
				removeErrorMessage("pass_error");
			}
		}
	});
	
	pass_check.addEventListener("keyup", function(){
		var level = passwordLevel(pass_check.value);
		if(level == 0){
			setErrorMessage("pass_check_error", "필수 정보입니다.");
		}else{
			if(level == 1 || level == 2 || level == 3){
				setErrorMessage("pass_check_error", "영문,숫자,특수문자를 사용하세요.")
			}else{
				removeErrorMessage("pass_check_error");
			}
		}
	});
	
	pass_check.addEventListener("keyup", function(){
		if(pass.value != pass_check.value){
			setErrorMessage("pass_check_error", "비밀번호가 일치하지 않습니다.");
		}else{
			removeErrorMessage("pass_check_error");
		}
	});
	
	phone_num.addEventListener("keyup", function(){
		var pattern = /^(?:(010-\d{4})|(01[1|6|7|8|9]-\d{3,4}))-(\d{4})$/;
		if(phone_num == "" || phone_num.value.length == 0){
			setErrorMessage("phone_num_error", "필수 정보입니다.");
		}else{
			if(!pattern.test(phone_num.value)){
				setErrorMessage("phone_num_error", "휴대전화 형식으로 입력해주세요.");
			}else{
				removeErrorMessage("phone_num_error");
			}
		}
	});
	
	
	
	pass.addEventListener("keyup", function(){
		document.getElementById("pass_error").className = "error";
		var level = passwordLevel(pass.value);
	})
	
	function setErrorMessage(id, message){
		document.getElementById(id).innerText = message;
	}
	
	function removeErrorMessage(id){
		document.getElementById(id).innerText = "";
	}
	
	function passwordLevel(str){
		var pattern1 = /[a-zA-Z]/;
		var pattern2 = /[0-9]/;
		var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/;
		
		if(str == "" || str.length == 0){
			return 0;
		}else{
			if(pattern1.test(str) && pattern2.test(str) && pattern3.test(str)) {
				return 4;
			} else if(!pattern1.test(str) && pattern2.test(str) && pattern3.test(str)) {
				return 3;
			} else if(pattern1.test(str) && !pattern2.test(str) && pattern3.test(str)) {
				return 3;
			} else if(pattern1.test(str) && pattern2.test(str) && !pattern3.test(str)) {
				return 3;
			} else if(!pattern1.test(str) && !pattern2.test(str) && pattern3.test(str)) {
				return 2;
			} else if(!pattern1.test(str) && pattern2.test(str) && !pattern3.test(str)) {
				return 2;
			} else if(pattern1.test(str) && !pattern2.test(str) && !pattern3.test(str)) {
				return 2;
			} else {
				return 1; 
			}
		}	
	}
	
});
