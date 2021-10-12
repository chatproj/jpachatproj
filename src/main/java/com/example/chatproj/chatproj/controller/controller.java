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
	
	private final UserService userService;
	
	@Autowired
	public controller(UserService userService) {
		this.userService = userService;
	}
	
	// 회원가입
	@GetMapping("/signup")
	public String signup() {
		return "signup";
	}
	
	@PostMapping("/signup")
	public String create_user(SignupForm form) {
		User user = new User();
		user.setUid(form.getUid());
		user.setUpw(form.getUpw());
		user.setUname(form.getUname());
		user.setEmail(form.getEmail());
		user.setPhone_num(form.getPhone_num());
		
		userService.join(user);
		
		return "redirect:/";
	}
	
	// 로그인
	@RequestMapping("/signin")
	public String signin() {
		return "signin";
	}
	
	@PostMapping("/signin")
	public String login_user(SigninForm form) {
		User user = new User();
		user.setUid(form.getUid());
		user.setUpw(form.getUpw());
		
		String result = userService.login(user);
		
		System.out.println("result : " + result );
		
		if(result.equals("matchX")) {
			return "signin";
		}else if(result.equals("noid")) {
			return "signin";
		}else {
			return "redirect:/";
		}	
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

