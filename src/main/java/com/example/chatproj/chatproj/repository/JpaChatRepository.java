package com.example.chatproj.chatproj.repository;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;

import com.example.chatproj.chatproj.domain.Chatlog_Table;
import com.example.chatproj.chatproj.domain.Chatroom_Table;
import com.example.chatproj.chatproj.domain.Fileupload_Table;
import com.example.chatproj.chatproj.domain.UC_Table;
import com.example.chatproj.chatproj.domain.User_Profileimg;

public class JpaChatRepository implements ChatRepository{
	
	private final EntityManager em;
	
	public JpaChatRepository(EntityManager em) {
		this.em = em;
	}

	@Override
	public Chatroom_Table save(Chatroom_Table user1) {
		em.persist(user1);
		return user1;
	}

	@Override
	public Optional<Chatroom_Table> findByUNum(int unum) {
		List<Chatroom_Table> result = em.createQuery("select m from Chatroom_Table m where m.unum = :unum", Chatroom_Table.class).setParameter("unum", unum).getResultList();
		return result.stream().findAny();
	}

	@Override
    public Optional<Chatroom_Table> findByCNum() {
        List<Chatroom_Table> result = em.createQuery("select m from Chatroom_Table m Order By cnum desc", Chatroom_Table.class).getResultList();
        return result.stream().findAny();
    }
    
    @Override
    public UC_Table insUCTable(UC_Table user2) {
    	em.persist(user2);
    	return user2;
    }
    
    @Override
    public List<UC_Table> getChatList(int sessionNum){
    	List<UC_Table> result = em.createQuery("select m from UC_Table m where m.unum = :sessionNum", UC_Table.class)
    			.setParameter("sessionNum", sessionNum).getResultList();

		return result;
    }
    
    @Override
    public List<UC_Table> getstringToinfo(int submitListPK, String submitListName){
    	List<UC_Table> result = em.createQuery("select m from UC_Table m where m.cnum = :submitListPK and m.cname = :submitListName", UC_Table.class)
    			.setParameter("submitListPK", submitListPK)
    			.setParameter("submitListName", submitListName)
    			.getResultList();
    	
    	return result;
    }
    
    @Override
    public List<UC_Table> getUserInfo(int cnumPK){
    	List<UC_Table> result = em.createQuery("select m from UC_Table m where m.cnum = :cnumPK", UC_Table.class)
    			.setParameter("cnumPK", cnumPK).getResultList();
    	
    	return result;
    }

	@Override
	public void save(Chatlog_Table chatlog_table) {
		em.persist(chatlog_table);	
	}
	
	@Override
	public List<Chatlog_Table> getChatLog(int cnumPK){
		List<Chatlog_Table> result = em.createQuery("select m from Chatlog_Table m where m.cnum = :cnumPK Order By id asc", Chatlog_Table.class)
				.setParameter("cnumPK", cnumPK).getResultList();
		return result;
	}
	
	@Override
	public Optional<Chatroom_Table> getChatName(int cnumPK){
		List<Chatroom_Table> result = em.createQuery("select m from Chatroom_Table m where m.cnum = :cnumPK", Chatroom_Table.class)
				.setParameter("cnumPK", cnumPK).getResultList();
		return result.stream().findAny();
	}
	
	@Override
	public void exitUser(int cnumPK, int sessionNum) {
		em.createQuery("delete from UC_Table m where m.cnum = :cnumPK and m.unum = :sessionNum")
				.setParameter("cnumPK", cnumPK)
				.setParameter("sessionNum", sessionNum)
				.executeUpdate();
	}
	
	@Override
	public void deleteChatRoom(int cnumPK) {
		em.createQuery("delete from Chatroom_Table m where m.cnum = :cnumPK")
				.setParameter("cnumPK", cnumPK)
				.executeUpdate();
	}

	@Override
	public Fileupload_Table uploadfile(Fileupload_Table file_save){
		em.persist(file_save);
		return file_save;		
	}

	@Override
	public List<Fileupload_Table> downloadfile(int downloadfile) {
		List<Fileupload_Table> result = em.createQuery("select m from Fileupload_Table m where m.cnum = :downloadfile", Fileupload_Table.class)
				.setParameter("downloadfile", downloadfile).getResultList();
		return result;
	}
}
