package com.example.chatproj.chatproj.repository;

import java.util.List;
import java.util.Optional;

import com.example.chatproj.chatproj.domain.Chatroom_Table;
import com.example.chatproj.chatproj.domain.User;
import com.example.chatproj.chatproj.domain.User_Profileimg;

public interface UserRepository {
	User save(User user);
	Optional<User> findById(String uid);
	Optional<User> findByEmail(String email);
	List<User> getIdbyUid(String sessionName, String inviteuser);
	Optional<User> findUser(String uname, String email);
	User_Profileimg imgsave(User_Profileimg userimg);
	Optional<User_Profileimg> findimage(int filenum);
	Optional<User_Profileimg> getUnumbyFilenum(int sessionNum);
	Optional<User> findByNum(int unum);
	void deleteuser(int sessionNum);
	Optional<User_Profileimg> deleteprofileimg(int sessionNum);
	Optional<User> getUserinfo(int sessionNum);
	void modifyUser(String uid, String upw, String uname, String email, String phone);
	void userimgupdate(int unum, String filename, String original_filename, String file_url);
	void chatuserimgupdate(int unum, String filename);
}
