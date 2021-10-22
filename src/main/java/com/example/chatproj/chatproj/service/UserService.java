package com.example.chatproj.chatproj.service;

import java.util.List;
import java.util.NoSuchElementException;
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
		userRepository.findById(user.getUid())
		.ifPresent(m -> {
			throw new IllegalStateException("이미 존재하는 회원입니다.");
		});
	}
	
	// 로그인
	public String login(User user) {
		String uid = user.getUid();
		String upw = user.getUpw();
		String result = unmatch(uid, upw, user);
		
		return result;
	}
	
	public String unmatch(String uid, String upw, User user) {
		Optional<User> DBUid = userRepository.findById(user.getUid());
		
		String result = null;
		
		try {
			if(uid.equals(DBUid.get().getUid()) && upw.equals(DBUid.get().getUpw())){
				result = "matchO";
			}else {
				result = "matchX";
			}
		}catch(NoSuchElementException e) {
			result = "noid";
		}
		
		return result;
		
	}
	
	//초대 중복체크
	public String duplicateMatch(User user) {
		String uid = user.getUid();
		String result = StringDuplicateMatch(uid, user);
		
		return result;
	}
	
	public String StringDuplicateMatch(String uid, User user) {
		Optional<User> DBUid = userRepository.findById(user.getUid());
		
		String result = null;
		
		try {
			if(uid.equals(DBUid.get().getUid())){
				result = "matchO";
			}else {
				result = "matchX";
			}
		}catch(NoSuchElementException e) {
			result = "noid";
		}
		
		return result;
		
	}
	
	public List<User> getIdbyUid(String sessionName, String inviteuser) {
		List<User> result = userRepository.getIdbyUid(sessionName, inviteuser);
		return result;
	}
	
}