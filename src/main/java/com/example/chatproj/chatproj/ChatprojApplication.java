package com.example.chatproj.chatproj;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class ChatprojApplication extends SpringBootServletInitializer{
	
	//외장 톰캣 war 배포
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(ChatprojApplication.class);
	}
	
	public static void main(String[] args) {
		SpringApplication.run(ChatprojApplication.class, args);
	}

}
