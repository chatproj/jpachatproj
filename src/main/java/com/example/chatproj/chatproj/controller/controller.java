package com.example.chatproj.chatproj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class controller {
	
	// 회원가입
	@RequestMapping("/signup")
	public String signup() {
		return "signup";
	}
	
	// 로그인
	@RequestMapping("/signin")
	public String signin() {
		return "signin";
	}
	
	// 아이디 찾기
	@RequestMapping("/findid")
	public String findid() {
		return "find_id";
	}
	
	// 비밀번호 찾기
	@RequestMapping("/findpw")
	public String findpass() {
		return "find_password";
	}
	
	// 채팅방
	@RequestMapping("/chatpg")
	public String chatpg() {
		return "ChatPg";
	}
	
}

