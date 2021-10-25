package com.example.chatproj.chatproj.repository;

import java.util.List;
import java.util.Optional;

import com.example.chatproj.chatproj.domain.Chatroom_Table;
import com.example.chatproj.chatproj.domain.User;

public interface UserRepository {
	User save(User user);
	Optional<User> findByNum(int unum);
	Optional<User> findById(String uid);
	List<User> getIdbyUid(String sessionName, String inviteuser);
	Optional<User> findUser(String uname, String email);
}
