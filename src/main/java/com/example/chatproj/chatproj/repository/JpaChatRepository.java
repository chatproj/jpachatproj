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
	public Chatroom_Table save(Chatroom_Table user) {
		em.persist(user);
		return user;
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


}
