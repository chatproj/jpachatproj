package com.example.chatproj.chatproj.repository;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;

import com.example.chatproj.chatproj.domain.Chatlog_Table;
import com.example.chatproj.chatproj.domain.Chatroom_Table;
import com.example.chatproj.chatproj.domain.Fileupload_Table;
import com.example.chatproj.chatproj.domain.UC_Table;
import com.example.chatproj.chatproj.domain.User;
import com.example.chatproj.chatproj.domain.User_Profileimg;

public class JpaChatRepository implements ChatRepository{
	
	private final EntityManager em;
	
	public JpaChatRepository(EntityManager em) {
		this.em = em;
	}

	// chatroom_table insert
	@Override
	public Chatroom_Table save(Chatroom_Table user1) {
		em.persist(user1);
		return user1;
	}

	// cnum 기반 chatroom_table 조회
	@Override
    public Optional<Chatroom_Table> findByCNum() {
        List<Chatroom_Table> result = em.createQuery("select m from Chatroom_Table m Order By cnum desc", Chatroom_Table.class).getResultList();
        return result.stream().findAny();
    }
    
    // insert uc_table
    @Override
    public UC_Table insUCTable(UC_Table user2) {
    	em.persist(user2);
    	return user2;
    }
    
    // 나의 채팅방 리스트 select
    @Override
    public List<UC_Table> getChatList(int sessionNum){
    	List<UC_Table> result = em.createQuery("select m from UC_Table m where m.unum = :sessionNum", UC_Table.class)
    			.setParameter("sessionNum", sessionNum).getResultList();

		return result;
    }
    
    // 채팅방 클릭 시 채팅방pk 및 이름으로 select하여 채팅방 이동
    @Override
    public List<UC_Table> getstringToinfo(int submitListPK, String submitListName){
    	List<UC_Table> result = em.createQuery("select m from UC_Table m where m.cnum = :submitListPK and m.cname = :submitListName", UC_Table.class)
    			.setParameter("submitListPK", submitListPK)
    			.setParameter("submitListName", submitListName)
    			.getResultList();
    	
    	return result;
    }
    
    // cnum 기반 uc_table의 userinfo
    @Override
    public List<UC_Table> getCnumToUserInfo(int cnumPK){
    	List<UC_Table> result = em.createQuery("select m from UC_Table m where m.cnum = :cnumPK", UC_Table.class)
    			.setParameter("cnumPK", cnumPK).getResultList();
    	
    	return result;
    }

	@Override
	public void save(Chatlog_Table chatlog_table) {
		em.persist(chatlog_table);	
	}
	
	// cnumpk 기반 로그 조회
	@Override
	public List<Chatlog_Table> getChatLog(int cnumPK){
		List<Chatlog_Table> result = em.createQuery("select m from Chatlog_Table m where m.cnum = :cnumPK Order By id asc", Chatlog_Table.class)
				.setParameter("cnumPK", cnumPK).getResultList();
		return result;
	}
	
	// cnumpk 기반 chatroom 이름 조회
	@Override
	public Optional<Chatroom_Table> getChatName(int cnumPK){
		List<Chatroom_Table> result = em.createQuery("select m from Chatroom_Table m where m.cnum = :cnumPK", Chatroom_Table.class)
				.setParameter("cnumPK", cnumPK).getResultList();
		return result.stream().findAny();
	}
	
	// 채팅방 나가기
	@Override
	public void exitUser(int cnumPK, int sessionNum) {
		em.createQuery("delete from UC_Table m where m.cnum = :cnumPK and m.unum = :sessionNum")
				.setParameter("cnumPK", cnumPK)
				.setParameter("sessionNum", sessionNum)
				.executeUpdate();
	}
	
	// 채팅방 인원이 모두 나갈 경우 채팅방 삭제
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
	// 파일 다운로드
	@Override
	public List<Fileupload_Table> gettotalinfo(int cnum) {
		List<Fileupload_Table> result = em.createQuery("select m from Fileupload_Table m where m.cnum = :cnum", Fileupload_Table.class)
				.setParameter("cnum", cnum).getResultList();
		return result;
	}
	
	// limit 5개씩 조회
	@Override
	public List<Fileupload_Table> getfileinfo(int cnum, int startPage, int onePageCnt) {
		List<Fileupload_Table> result = em.createQuery("select m from Fileupload_Table m where m.cnum = :cnum order by id desc", Fileupload_Table.class)
				.setParameter("cnum", cnum)
				.setFirstResult(startPage)
				.setMaxResults(onePageCnt)
				.getResultList();
		return result;
	}
	
	// 파일 삭제
	@Override
	public void filedelete(String filename) {
		em.createQuery("delete from Fileupload_Table m where m.filename = :filename")
				.setParameter("filename", filename)
				.executeUpdate();
	}

	// 채팅방에서 유저 초대
	@Override
	public UC_Table addUCTable(UC_Table uc_table) {
		em.persist(uc_table);
		return uc_table;
	}

	// 채팅방 초대 시 이미 있는 멤버인지 체크
	@Override
	public Optional<UC_Table> ucfindbyid(int unum, int cnum) {
		List<UC_Table> result = em.createQuery("select m from UC_Table m where m.unum = :unum and m.cnum = :cnum", UC_Table.class)
				.setParameter("unum", unum)
				.setParameter("cnum", cnum)
				.getResultList();
		return result.stream().findAny();
	}
}
