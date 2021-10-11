package com.example.chatproj.chatproj.repository;

import java.util.Optional;

import com.example.chatproj.chatproj.domain.User;

public interface UserRepository {
	User save(User member);
	Optional<User> findByNum(int unum);
	Optional<User> findById(String uid);
}
