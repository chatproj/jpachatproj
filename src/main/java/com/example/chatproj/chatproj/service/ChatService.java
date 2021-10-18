package com.example.chatproj.chatproj.service;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

import org.springframework.transaction.annotation.Transactional;

import com.example.chatproj.chatproj.domain.Chatroom_Table;
import com.example.chatproj.chatproj.domain.UC_Table;
import com.example.chatproj.chatproj.domain.User;
import com.example.chatproj.chatproj.repository.ChatRepository;
import com.example.chatproj.chatproj.repository.UserRepository;

@Transactional
public class ChatService {
	
		private ChatRepository chatRepository;

		public ChatService(ChatRepository chatRepository) {
			this.chatRepository = chatRepository;
		}

		// chat table 등록
		public Optional<Chatroom_Table> join() {
            return chatRepository.findByCNum();
        }
		
		public void insChatTable(Chatroom_Table user1) {
			chatRepository.save(user1);
			
		}
		
		public void insUCTable(UC_Table user2) {
			chatRepository.insUCTable(user2);
		}
		
}
