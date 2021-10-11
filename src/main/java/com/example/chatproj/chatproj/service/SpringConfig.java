package com.example.chatproj.chatproj.service;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.example.chatproj.chatproj.repository.JpaUserRepository;
import com.example.chatproj.chatproj.repository.UserRepository;

@Configuration
public class SpringConfig {
	
	private EntityManager em;
	
	@Autowired
	public SpringConfig(EntityManager em) {
		this.em = em;
	}
	
	@Bean
	public UserService userService() {
		return new UserService(userRepository());
	}
	
	@Bean
	public UserRepository userRepository() {
		return new JpaUserRepository(em);
	}
}
