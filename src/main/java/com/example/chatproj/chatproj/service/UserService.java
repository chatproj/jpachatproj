package com.example.chatproj.chatproj.service;

import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.chatproj.chatproj.domain.User;
import com.example.chatproj.chatproj.repository.JpaUserRepository;
import com.example.chatproj.chatproj.repository.UserRepository;

@Transactional
public class UserService {
	private final UserRepository memberRepository;
	
	public UserService(UserRepository memberRepository) {
		this.memberRepository = memberRepository;
	}
	
	// 회원가입
	public int join(User member) {
		validateDuplicateMember(member);
		memberRepository.save(member);
		return member.getUnum();
	}
	
	private void validateDuplicateMember(User member) {
		System.out.println("22222222222" + member.getUid());
		memberRepository.findById(member.getUid())
		.ifPresent(m -> {
			throw new IllegalStateException("이미 존재하는 회원입니다.");
		});
	}
	
}
