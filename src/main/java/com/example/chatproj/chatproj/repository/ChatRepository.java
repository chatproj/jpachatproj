package com.example.chatproj.chatproj.repository;

import java.util.Optional;

import com.example.chatproj.chatproj.domain.Chatroom_Table;
import com.example.chatproj.chatproj.domain.UC_Table;
import com.example.chatproj.chatproj.domain.User;

public interface ChatRepository {
	Chatroom_Table save(Chatroom_Table user);
	Optional<Chatroom_Table> findByUNum(int unum);
	int find();
	
	
}
