package com.example.chatproj.chatproj.repository;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;

import com.example.chatproj.chatproj.domain.Chatroom_Table;
import com.example.chatproj.chatproj.domain.User;

public class JpaUserRepository implements UserRepository{

	private final EntityManager em;
	
	public JpaUserRepository(EntityManager em) {
		this.em = em;
	}
	
	@Override
	public User save(User user) {
		em.persist(user);
		return user;
	}

	@Override
	public Optional<User> findByNum(int unum) {
		User user = em.find(User.class, unum);
		return Optional.ofNullable(user);
	}

	@Override
	public Optional<User> findById(String uid) {
		List<User> result = em.createQuery("select m from User m where m.uid = :uid", User.class).setParameter("uid", uid).getResultList();
		return result.stream().findAny();
	}

	@Override
	public List<User> getIdbyUid(String sessionName, String inviteuser) {
		List<User> result = em.createQuery("select m from User m where m.uid in (:sessionName, :inviteuser)", User.class)
				.setParameter("sessionName", sessionName)
				.setParameter("inviteuser", inviteuser)
				.getResultList();
		return result;
	}

}