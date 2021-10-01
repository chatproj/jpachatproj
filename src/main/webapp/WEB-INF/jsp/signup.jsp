<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="EUC-KR">
<title>Signup</title>
<link rel="stylesheet" href="/css/signup.css">
<script src="/js/signup.js" type="text/javascript" charset="UTF-8"></script>
</head>
<body>
<div id="main_container">
        <div class="form_container">

            <div class="form">
                <form action="#">
                    <div class="signup-input-box">
                        <div class="signuplabel">아이디</div>
                       	<span class="input-box-detail">
	                        <input type="text" name="username" id="username">
	                    </span>
                    	<div id="username_error" class="error"></div>
                    </div>
                    
                    <div class="signup-input-box">
                        <!-- <label for="email">E-MAIL :</label> -->
                        <div class="signuplabel">이메일</div>
                        <span class="input-box-detail">
                        	<input type="email" name="email" id="email">
                        </span>
                        <div id="email_error" class="error"></div>
                    </div>

                    <div class="signup-input-box">
                    	<div class="signuplabel">비밀번호</div>
                    	<span class="input-box-detail">
                        	<input type="password" name="password" id="password">
                        </span>
                        <div id="pass_error" class="error"></div>
                    </div>
                    
                    <div class="signup-input-box">
                        <div class="signuplabel">비밀번호 재확인</div>
                        <span class="input-box-detail">
                        	<input type="password" name="password_check" id="password_check">
                        </span>
                        <div id="pass_check_error" class="error"></div>
                    </div>
                    
                    <div class="signup-input-box">
                        <div class="signuplabel">휴대전화</div>
                        <span class="input-box-detail">
                        	<input type="text" name="phone_num" id="phone_num">
                        </span>
                        <div id="phone_num_error" class="error"></div>
                    </div>
                    
                    <input type="submit" id="submit_btn" value="회원가입" class="submit_btn">
                    
                </form>
            </div>
        </div>
    </div>
</body>
</html>