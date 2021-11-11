package com.example.chatproj.chatproj.repository;

import java.util.List;
import java.util.Optional;

import com.example.chatproj.chatproj.domain.Chatroom_Table;
import com.example.chatproj.chatproj.domain.User;
import com.example.chatproj.chatproj.domain.User_Profileimg;

public interface UserRepository {
	User save(User user);
	Optional<User> findByNum(int unum);
	Optional<User> findById(String uid);
	List<User> getIdbyUid(String sessionName, String inviteuser);
	Optional<User> findUser(String uname, String email);
	User_Profileimg imgsave(User_Profileimg userimg);
	Optional<User_Profileimg> findimage(int filenum);
	Optional<User_Profileimg> getUnumbyFilenum(int sessionNum);
}
