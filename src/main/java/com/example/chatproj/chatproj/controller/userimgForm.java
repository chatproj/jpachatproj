package com.example.chatproj.chatproj.controller;

import org.springframework.web.multipart.MultipartFile;

public class userimgForm {
	MultipartFile userimg;

	public MultipartFile getUserimg() {
		return userimg;
	}

	public void setUserimg(MultipartFile userimg) {
		this.userimg = userimg;
	}
	
}
