package com.example.chatproj.chatproj.service;

import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.chatproj.chatproj.domain.User;
import com.example.chatproj.chatproj.repository.JpaUserRepository;
import com.example.chatproj.chatproj.repository.UserRepository;

@Transactional
public class UserService {
	private final UserRepository userRepository;
	
	public UserService(UserRepository userRepository) {
		this.userRepository = userRepository;
	}
	
	// 회원가입
	public int join(User user) {
		validateDuplicateuser(user);
		userRepository.save(user);
		return user.getUnum();
	}
	
	private void validateDuplicateuser(User user) {
		System.out.println("22222222222" + user.getUid());
		userRepository.findById(user.getUid())
		.ifPresent(m -> {
			throw new IllegalStateException("이미 존재하는 회원입니다.");
		});
	}
	
}
