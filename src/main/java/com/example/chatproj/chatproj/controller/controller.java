package com.example.chatproj.chatproj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.chatproj.chatproj.domain.User;
import com.example.chatproj.chatproj.service.UserService;

@Controller
public class controller {
	
	private final UserService memberService;
	
	@Autowired
	public controller(UserService memberService) {
		this.memberService = memberService;
	}
	
	// 회원가입
	@GetMapping("/signup")
	public String signup() {
		return "signup";
	}
	
	@PostMapping("/signup")
	public String create(UserForm form) {
		User member = new User();
		member.setUid(form.getUid());
		member.setUpw(form.getUpw());
		member.setUname(form.getUname());
		member.setEmail(form.getEmail());
		member.setPhone_num(form.getPhone_num());
		
		memberService.join(member);
		
		return "redirect:/";
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

