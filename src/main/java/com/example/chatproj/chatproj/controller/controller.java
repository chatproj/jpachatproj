package com.example.chatproj.chatproj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class controller {
	
	@RequestMapping("/signup")
	public String signup() {
		return "signup";
	}
	
	@RequestMapping("/test1")
	public String test1() {
		return "test1";
	}
	
	@GetMapping("/hello")
	public String hello() {
		return "hello";
		
	}
}

