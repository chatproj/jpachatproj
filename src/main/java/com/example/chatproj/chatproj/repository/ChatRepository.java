package com.example.chatproj.chatproj.repository;

import java.util.List;
import java.util.Optional;

import com.example.chatproj.chatproj.domain.Chatlog_Table;
import com.example.chatproj.chatproj.domain.Chatroom_Table;
import com.example.chatproj.chatproj.domain.Fileupload_Table;
import com.example.chatproj.chatproj.domain.UC_Table;
import com.example.chatproj.chatproj.domain.User;

public interface ChatRepository {
	Chatroom_Table save(Chatroom_Table user1);
	Optional<Chatroom_Table> findByUNum(int unum);
	Optional<Chatroom_Table> findByCNum();
	UC_Table insUCTable(UC_Table user2);
	List<UC_Table> getChatList(int sessionNum);
	List<UC_Table> getstringToinfo(int submitListPK, String submitListName);
	List<UC_Table> getUserInfo(int cnumPK);
	void save(Chatlog_Table chatlog_table);
	List<Chatlog_Table> getChatLog(int cnumPK);
	Optional<Chatroom_Table> getChatName(int cnumPK);
	void exitUser(int cnumPK, int sessionNum);
	void deleteChatRoom(int cnumPK);
	Fileupload_Table uploadfile(Fileupload_Table fileinfo);
	List<Fileupload_Table> downloadfile(int downloadfile);
	void filedelete(String filename);
	List<UC_Table> validunum();
	UC_Table addUCTable(UC_Table uc_table);
	Optional<UC_Table> ucfindbyid(int unum, int cnum);
}
