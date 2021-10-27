package com.example.chatproj.chatproj.repository;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import org.springframework.data.jpa.repository.Query;

import com.example.chatproj.chatproj.domain.Chatroom_Table;
import com.example.chatproj.chatproj.domain.UC_Table;
import com.example.chatproj.chatproj.domain.User;

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
    public List<UC_Table> getstringToinfo(String submitList){
    	List<UC_Table> result = em.createQuery("select m from UC_Table m where m.cname = :submitList", UC_Table.class)
    			.setParameter("submitList", submitList).getResultList();
    	
    	return result;
    }
    
    @Override
    public List<UC_Table> getUserInfo(int cnumPK){
    	List<UC_Table> result = em.createQuery("select m from UC_Table m where m.cnum = :cnumPK", UC_Table.class)
    			.setParameter("cnumPK", cnumPK).getResultList();
    	
    	return result;
    }

}
